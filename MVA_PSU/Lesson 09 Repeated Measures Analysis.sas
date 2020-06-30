/* Lesson 9: Repeated Measures Analysis */
/* example 9-2 */
options ls=78;
title "Split-Plot Analysis - Dog Data";
data dogs;
  infile "Documents\My SAS Files\STAT505_SAS\MVA_PSU\Data\dog1.txt";
  input treat dog p1 p2 p3 p4;
  time=1;  k=p1; output;
  time=5;  k=p2; output;
  time=9;  k=p3; output;
  time=13; k=p4; output;
  drop p1 p2 p3 p4;
  run;
proc print;
run;
proc glm;
  class treat dog time;
  model k=treat dog(treat) time treat*time;
  test h=treat e=dog(treat);
  run;

* This approach and these results assume a constant correlation ;
*between any two observations from the same dog;

options ls=78;
title "Repeated Measures - Coronary Sinus Potassium in Dogs";
data dogs;
  infile "Documents\My SAS Files\STAT505_SAS\MVA_PSU\Data\dog1.txt";
  input treat dog p1 p2 p3 p4;
  run;
proc print;
  run;
proc glm;
  class treat;
  model p1 p2 p3 p4=treat;
  manova h=treat / printe;
  manova h=treat m=p1+p2+p3+p4;
  manova h=treat m=p2-p1,p3-p2,p4-p3;
  run;

options ls=78;
title "Profile Plot - Dog Data";
data dogs;
  infile "Documents\My SAS Files\STAT505_SAS\MVA_PSU\Data\dog1.txt";
  input treat dog p1 p2 p3 p4;
  time=1;  k=p1; output;
  time=5;  k=p2; output;
  time=9;  k=p3; output;
  time=13; k=p4; output;
  drop p1 p2 p3 p4;
  run;
proc sort;
  by treat time;
  run;
proc means;
  by treat time;
  var k;
  output out=a mean=mean;
filename t1 "dog.ps";
goptions device=ps300 gsfname=t1 gsfmode=replace;
proc gplot;
  axis1 length=4 in;
  axis2 length=6 in;
  plot mean*time=treat / vaxis=axis1 haxis=axis2;
  symbol1 v=J f=special h=2 i=join color=black;
  symbol2 v=K f=special h=2 i=join color=black;
  symbol3 v=L f=special h=2 i=join color=black;
  symbol4 v=M f=special h=2 i=join color=black;
  run;

options ls=78;
title "Mixed Model Analysis - Dog Data";
data dogs;
  infile "Documents\My SAS Files\STAT505_SAS\MVA_PSU\Data\dog1.txt";
  input treat dog p1 p2 p3 p4;
  time=1;  k=p1; output;
  time=5;  k=p2; output;
  time=9;  k=p3; output;
  time=13; k=p4; output;
  drop p1 p2 p3 p4;
  run;
proc mixed;
  class treat dog time;
  model k=treat|time;
  random dog(treat);
  lsmeans treat|time;
  run;
proc mixed;
  class treat dog time;
  model k=treat|time;
  random dog(treat);
  repeated / subject=dog(treat) type=ar(1);
  run;
proc mixed;
  class treat dog time;
  model k=treat|time;
  random dog(treat);
  repeated / subject=dog(treat) type=arma(1,1);
  run;
proc mixed;
  class treat dog time;
  model k=treat|time;
  random dog(treat);
  repeated / subject=dog(treat) type=toep;
  run;
