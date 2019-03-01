data fullnest;
input Temp Plant Operator Shift Batch;
datalines;
477      1      1      1      1
472      1      1      1      2
481      1      1      1      3
478      1      1      2      1
475      1      1      2      2
474      1      1      2      3
472      1      1      3      1
475      1      1      3      2
468      1      1      3      3
482      1      1      4      1
477      1      1      4      2
474      1      1      4      3
471      1      2      1      1
474      1      2      1      2
470      1      2      1      3
479      1      2      2      1
482      1      2      2      2
477      1      2      2      3
470      1      2      3      1
477      1      2      3      2
483      1      2      3      3
480      1      2      4      1
473      1      2      4      2
478      1      2      4      3
475      1      3      1      1
472      1      3      1      2
470      1      3      1      3
460      1      3      2      1
469      1      3      2      2
472      1      3      2      3
477      1      3      3      1
483      1      3      3      2
475      1      3      3      3
476      1      3      4      1
480      1      3      4      2
471      1      3      4      3
465      1      4      1      1
464      1      4      1      2
471      1      4      1      3
477      1      4      2      1
475      1      4      2      2
471      1      4      2      3
481      1      4      3      1
477      1      4      3      2
475      1      4      3      3
470      1      4      4      1
475      1      4      4      2
474      1      4      4      3
484      2      1      1      1
477      2      1      1      2
481      2      1      1      3
477      2      1      2      1
482      2      1      2      2
481      2      1      2      3
479      2      1      3      1
477      2      1      3      2
482      2      1      3      3
477      2      1      4      1
470      2      1      4      2
479      2      1      4      3
472      2      2      1      1
475      2      2      1      2
475      2      2      1      3
472      2      2      2      1
475      2      2      2      2
470      2      2      2      3
472      2      2      3      1
477      2      2      3      2
475      2      2      3      3
482      2      2      4      1
477      2      2      4      2
483      2      2      4      3
485      2      3      1      1
481      2      3      1      2
477      2      3      1      3
482      2      3      2      1
483      2      3      2      2
485      2      3      2      3
477      2      3      3      1
476      2      3      3      2
481      2      3      3      3
479      2      3      4      1
476      2      3      4      2
485      2      3      4      3
477      2      4      1      1
475      2      4      1      2
476      2      4      1      3
476      2      4      2      1
471      2      4      2      2
472      2      4      2      3
475      2      4      3      1
475      2      4      3      2
472      2      4      3      3
481      2      4      4      1
470      2      4      4      2
472      2      4      4      3
475      3      1      1      1
470      3      1      1      2
469      3      1      1      3
477      3      1      2      1
471      3      1      2      2
474      3      1      2      3
469      3      1      3      1
473      3      1      3      2
468      3      1      3      3
477      3      1      4      1
475      3      1      4      2
473      3      1      4      3
470      3      2      1      1
466      3      2      1      2
468      3      2      1      3
471      3      2      2      1
473      3      2      2      2
476      3      2      2      3
478      3      2      3      1
480      3      2      3      2
474      3      2      3      3
477      3      2      4      1
471      3      2      4      2
469      3      2      4      3
466      3      3      1      1
465      3      3      1      2
471      3      3      1      3
473      3      3      2      1
475      3      3      2      2
478      3      3      2      3
471      3      3      3      1
469      3      3      3      2
471      3      3      3      3
475      3      3      4      1
477      3      3      4      2
472      3      3      4      3
469      3      4      1      1
471      3      4      1      2
468      3      4      1      3
473      3      4      2      1
475      3      4      2      2
473      3      4      2      3
477      3      4      3      1
470      3      4      3      2
469      3      4      3      3
463      3      4      4      1
471      3      4      4      2
469      3      4      4      3
484      4      1      1      1
477      4      1      1      2
480      4      1      1      3
476      4      1      2      1
475      4      1      2      2
474      4      1      2      3
475      4      1      3      1
470      4      1      3      2
469      4      1      3      3
481      4      1      4      1
476      4      1      4      2
472      4      1      4      3
469      4      2      1      1
475      4      2      1      2
479      4      2      1      3
482      4      2      2      1
483      4      2      2      2
479      4      2      2      3
477      4      2      3      1
479      4      2      3      2
475      4      2      3      3
472      4      2      4      1
476      4      2      4      2
479      4      2      4      3
470      4      3      1      1
481      4      3      1      2
481      4      3      1      3
475      4      3      2      1
470      4      3      2      2
475      4      3      2      3
469      4      3      3      1
477      4      3      3      2
482      4      3      3      3
485      4      3      4      1
479      4      3      4      2
474      4      3      4      3
469      4      4      1      1
473      4      4      1      2
475      4      4      1      3
477      4      4      2      1
473      4      4      2      2
471      4      4      2      3
470      4      4      3      1
468      4      4      3      2
474      4      4      3      3
483      4      4      4      1
477      4      4      4      2
476      4      4      4      3
;
run;

proc print data=fullnest;
run;

proc mixed data=fullnest covtest method=type3;
class Plant Operator Shift Batch;
model temp=;
random plant operator(plant) shift(plant operator) ;
run;

proc varcomp data=fullnest;
class  Plant Operator Shift Batch;
model temp= plant operator(plant) shift(plant operator);
run;

proc nested data=fullnest;
class plant operator shift;
var temp;
run;
