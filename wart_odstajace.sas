data train;
set 'C:\Users\domi\Desktop\studia_sgh\sem1\SAS\projekt\abt_sam_beh_train.sas7bdat';
run;

data valid;
set 'C:\Users\domi\Desktop\studia_sgh\sem1\SAS\projekt\abt_sam_beh_valid.sas7bdat';
run;

/* podgl¹d zmiennych tekstowych w zbiorze Train */
proc freq data=train;
title 'Zmienne tekstowe w zbiorze Train';
table app_char: /nocum;
run;

/* podgl¹d zmiennych tekstowych w zbiorze Valid */
proc freq data=valid;
title 'Zmienne tekstowe w zbiorze Valid';
table app_char: /nocum;
run;

/* funkcje celu w zbiorze Train */
proc freq data=train;
title 'Funkcje celu w zbiorze Train';
table default: /nocum;
run;

/* funkcje celu w zbiorze Valid */
proc freq data=valid;
title 'Funkcje celu w zbiorze Valid';
table default: /nocum;
run;

/* rozk³ad zmiennych app ze zbioru train */
proc means data =  train qrange skewness kurtosis cv maxdec=2;
title 'Rozk³ad zmiennych z grupy APP ze zbioru Train';
var app_income app_number_of_children app_spendings;
run;

/* rozk³ad zmiennych app ze zbioru valid */
proc means data =  valid qrange skewness kurtosis cv maxdec=2;
title 'Rozk³ad zmiennych z grupy APP ze zbioru Valid';
var app_income app_number_of_children app_spendings;
run;

/* rozk³ad zmiennych act w train: */
ods exclude all;
proc means data =  train skewness kurtosis cv STACKODSOUTPUT;
var act: ;
ods output summary = train_stat_act;
run;
ods exclude none;

data train_stat_act2;
set train_stat_act;
if cv > 150 then zmiennosc = 'skrajnie du¿a zmiennoœæ';
else if cv < 150 & cv > 100 then zmiennosc = 'bardzo du¿a zmiennoœæ';
else if cv < 100 & cv > 40 then zmiennosc = 'du¿a zmiennoœæ';
else if cv < 40 & cv > 20 then zmiennosc = 'przeciêtna zmiennoœæ';
else if cv < 20 then cv = 'ma³a zmiennoœæ';
if skew > 0 then skosnosc = 'prawostronnie skoœny';
else if skew = 0 then skosnosc = 'brak asymetrii';
else skosnosc = 'lewostronnie skoœny';
run;

proc freq data =  train_stat_act2;
title 'Zmiennoœæ i skoœnoœæ zmiennych z grupy ACT w zbiorze Train';
table zmiennosc  skosnosc /nocum;
run;

/* rozk³ad zmiennych act w valid: */
ods exclude all;
proc means data =  valid skewness kurtosis cv STACKODSOUTPUT;
var act: ;
ods output summary = valid_stat_act;
run;
ods exclude none;

data valid_stat_act2;
set valid_stat_act;
if cv > 150 then zmiennosc = 'skrajnie du¿a zmiennoœæ';
else if cv < 150 & cv > 100 then zmiennosc = 'bardzo du¿a zmiennoœæ';
else if cv < 100 & cv > 40 then zmiennosc = 'du¿a zmiennoœæ';
else if cv < 40 & cv > 20 then zmiennosc = 'przeciêtna zmiennoœæ';
else if cv < 20 then cv = 'ma³a zmiennoœæ';
if skew > 0 then skosnosc = 'prawostronnie skoœny';
else if skew = 0 then skosnosc = 'brak asymetrii';
else skosnosc = 'lewostronnie skoœny';
run;

proc freq data =  valid_stat_act2;
title 'Zmiennoœæ i skoœnoœæ zmiennych z grupy ACT w zbiorze Valid';
table zmiennosc  skosnosc /nocum;
run;

/* rozk³ad zmiennych ags w train: */
ods exclude all;
proc means data =  train skewness kurtosis cv STACKODSOUTPUT;
var ags: ;
ods output summary = train_stat_ags;
run;
ods exclude none;

data train_stat_ags2;
set train_stat_ags;
if cv > 150 then zmiennosc = 'skrajnie du¿a zmiennoœæ';
else if cv < 150 & cv > 100 then zmiennosc = 'bardzo du¿a zmiennoœæ';
else if cv < 100 & cv > 40 then zmiennosc = 'du¿a zmiennoœæ';
else if cv < 40 & cv > 20 then zmiennosc = 'przeciêtna zmiennoœæ';
else if cv < 20 then cv = 'ma³a zmiennoœæ';
if skew > 0 then skosnosc = 'prawostronnie skoœny';
else if skew = 0 then skosnosc = 'brak asymetrii';
else skosnosc = 'lewostronnie skoœny';
run;

proc freq data =  train_stat_ags2;
title 'Zmiennoœæ i skoœnoœæ zmiennych z grupy AGS w zbiorze Train';
table zmiennosc  skosnosc /nocum;
run;

/* rozk³ad zmiennych ags w valid: */
ods exclude all;
proc means data =  valid skewness kurtosis cv STACKODSOUTPUT;
var ags: ;
ods output summary = valid_stat_ags;
run;
ods exclude none;

data valid_stat_ags2;
set valid_stat_ags;
if cv > 150 then zmiennosc = 'skrajnie du¿a zmiennoœæ';
else if cv < 150 & cv > 100 then zmiennosc = 'bardzo du¿a zmiennoœæ';
else if cv < 100 & cv > 40 then zmiennosc = 'du¿a zmiennoœæ';
else if cv < 40 & cv > 20 then zmiennosc = 'przeciêtna zmiennoœæ';
else if cv < 20 then cv = 'ma³a zmiennoœæ';
if skew > 0 then skosnosc = 'prawostronnie skoœny';
else if skew = 0 then skosnosc = 'brak asymetrii';
else skosnosc = 'lewostronnie skoœny';
run;

proc freq data =  valid_stat_ags2;
title 'Zmiennoœæ i skoœnoœæ zmiennych z grupy AGS w zbiorze Valid';
table zmiennosc  skosnosc /nocum;
run;

/* rozk³ad zmiennych agr w train: */
ods exclude all;
proc means data =  train skewness kurtosis cv STACKODSOUTPUT;
var agr: ;
ods output summary = train_stat_agr;
run;
ods exclude none;

data train_stat_agr2;
set train_stat_agr;
if cv > 150 then zmiennosc = 'skrajnie du¿a zmiennoœæ';
else if cv < 150 & cv > 100 then zmiennosc = 'bardzo du¿a zmiennoœæ';
else if cv < 100 & cv > 40 then zmiennosc = 'du¿a zmiennoœæ';
else if cv < 40 & cv > 20 then zmiennosc = 'przeciêtna zmiennoœæ';
else if cv < 20 then cv = 'ma³a zmiennoœæ';
if skew > 0 then skosnosc = 'prawostronnie skoœny';
else if skew = 0 then skosnosc = 'brak asymetrii';
else skosnosc = 'lewostronnie skoœny';
run;

proc freq data =  train_stat_agr2;
title 'Zmiennoœæ i skoœnoœæ zmiennych z grupy AGR w zbiorze Train';
table zmiennosc  skosnosc /nocum;
run;

/* rozk³ad zmiennych agr w valid: */
ods exclude all;
proc means data =  valid skewness kurtosis cv STACKODSOUTPUT;
var agr: ;
ods output summary = valid_stat_agr;
run;
ods exclude none;

data valid_stat_agr2;
set valid_stat_agr;
if cv > 150 then zmiennosc = 'skrajnie du¿a zmiennoœæ';
else if cv < 150 & cv > 100 then zmiennosc = 'bardzo du¿a zmiennoœæ';
else if cv < 100 & cv > 40 then zmiennosc = 'du¿a zmiennoœæ';
else if cv < 40 & cv > 20 then zmiennosc = 'przeciêtna zmiennoœæ';
else if cv < 20 then cv = 'ma³a zmiennoœæ';
if skew > 0 then skosnosc = 'prawostronnie skoœny';
else if skew = 0 then skosnosc = 'brak asymetrii';
else skosnosc = 'lewostronnie skoœny';
run;

proc freq data =  valid_stat_agr2;
title 'Zmiennoœæ i skoœnoœæ zmiennych z grupy AGR w zbiorze Valid';
table zmiennosc  skosnosc /nocum;
run;

/* WARTOŒCI ODSTAJ¥CE */
%macro outliers(input=, vars=, output= );

%let MEAN=;
%let STD=;
%let varL=;
%let varH=;

%let n=%sysfunc(countw(&vars));
%do i= 1 %to &n;
%let val = %scan(&vars,&i);
%let MEAN = &MEAN &val._MEAN;
%let STD = &STD &val._STDDEV;
%let varL = &varL &val.L;
%let varH = &varH &val.H;
%end;

proc means data=&input nway noprint;
var &vars;
output out=temp MEAN= STD= / autoname;
run;


data temp;
set temp;
ID = 1;
array varb(&n) &MEAN;
array varc(&n) &STD;
array lower(&n) &varL;
array upper(&n) &varH;
do i = 1 to dim(varb);
lower(i) = varb(i)-3*varc(i);
upper(i) = varb(i)+3*varc(i);
end;
drop i _type_ _freq_;
run;

data temp1;
set &input;
ID = 1;
run;

data &output;
merge temp1 temp;
by ID;
array vars(&n) &vars;
array lower(&n) &varL;
array upper(&n) &varH;
do i = 1 to dim(vars);
if not missing(vars(i)) then do;
if vars(i) >= lower(i) and vars(i) <= upper(i) then vars(i) = 0;
else vars(i) = 1;
end;
end;
drop &MEAN &STD &varL &varH ID i;
run;

%mend;

/*zmienne numeryczne w train*/
data train_num;
set train;
drop cid period app_char_cars app_char_city app_char_home_status app_char_job_code app_char_marital_status;
run;

/*transpozycja */
proc transpose data =  train_num out = train_num_t;
run;

/*wybieramy nazwy tych zmiennych w train*/
proc sql;
select _NAME_ into :train_num_names separated by ' '
from train_num_t;
quit;

%outliers(input=train_num, vars= &train_num_names, output= outliers_train);

/* APP z Train */

ods exclude all;
proc summary data = outliers_train sum n print max_dec = 0 STACKODSOUTPUT;
var app: ;
ods output summary = train_out_app;
run;
ods exclude none;

proc sql outobs=10;
title 'Wartoœci odstaj¹ce z grupy APP w zbiorze Train';
select Variable, Sum 'Liczba wartoœci odstaj¹cych', N 'Liczba wszystkich wartoœci', Sum/N*100 'Procent odstaj¹cych'
from train_out_app
group by -Sum/N*100 ;

/* ACT z Train */


ods exclude all;
proc summary data = outliers_train sum n print max_dec = 0 STACKODSOUTPUT;
var act: ;
ods output summary = train_out_act;
run;
ods exclude none;

proc sql outobs=10;
title 'Wartoœci odstaj¹ce z grupy ACT w zbiorze Train';
select Variable, Sum 'Liczba wartoœci odstaj¹cych', N 'Liczba wszystkich wartoœci', Sum/N*100 'Procent odstaj¹cych'
from train_out_act
group by -Sum/N*100 ;

/* AGS z Train */

ods exclude all;
proc summary data = outliers_train sum n print max_dec = 0 STACKODSOUTPUT;
var ags: ;
ods output summary = train_out_ags;
run;
ods exclude none;

proc sql outobs=10;
title 'Wartoœci odstaj¹ce z grupy AGS w zbiorze Train';
select Variable, Sum 'Liczba wartoœci odstaj¹cych', N 'Liczba wszystkich wartoœci', Sum/N*100 'Procent odstaj¹cych'
from train_out_ags
where not missing(Sum) and Sum < N 
group by -Sum/N*100 ;

/* AGR z Train */

ods exclude all;
proc summary data = outliers_train sum n print max_dec = 0 STACKODSOUTPUT;
var agr: ;
ods output summary = train_out_agr;
run;
ods exclude none;

proc sql outobs=10;
title 'Wartoœci odstaj¹ce z grupy AGR w zbiorze Train';
select Variable, Sum 'Liczba wartoœci odstaj¹cych', N 'Liczba wszystkich wartoœci', Sum/N*100 'Procent odstaj¹cych'
from train_out_agr
where not missing(Sum) and Sum < N
group by -Sum/N*100 ;

/*zmienne numeryczne w valid*/
data valid_num;
set valid;
drop cid period app_char_cars app_char_city app_char_home_status app_char_job_code app_char_marital_status;
run;

/*transpozycja */
proc transpose data =  valid_num out = valid_num_t;
run;

/*wybieramy nazwy tych zmiennych w train*/
proc sql;
select _NAME_ into :valid_num_names separated by ' '
from valid_num_t;
quit;

%outliers(input=valid_num, vars= &valid_num_names, output= outliers_valid);

/* APP z Valid */

ods exclude all;
proc summary data = outliers_valid sum n print max_dec = 0 STACKODSOUTPUT;
var app: ;
ods output summary = valid_out_app;
run;
ods exclude none;

proc sql outobs=10;
title 'Wartoœci odstaj¹ce z grupy APP w zbiorze Valid';
select Variable, Sum 'Liczba wartoœci odstaj¹cych', N 'Liczba wszystkich wartoœci', Sum/N*100 'Procent odstaj¹cych'
from valid_out_app
group by -Sum/N*100 ;

/* ACT z Valid */

ods exclude all;
proc summary data = outliers_valid sum n print max_dec = 0 STACKODSOUTPUT;
var act: ;
ods output summary = valid_out_act;
run;
ods exclude none;

proc sql outobs=10;
title 'Wartoœci odstaj¹ce z grupy ACT w zbiorze Valid';
select Variable, Sum 'Liczba wartoœci odstaj¹cych', N 'Liczba wszystkich wartoœci', Sum/N*100 'Procent odstaj¹cych'
from valid_out_act
group by -Sum/N*100 ;


/* AGS z Valid */

ods exclude all;
proc summary data = outliers_valid sum n print max_dec = 0 STACKODSOUTPUT;
var ags: ;
ods output summary = valid_out_ags;
run;
ods exclude none;

proc sql outobs=10;
title 'Wartoœci odstaj¹ce z grupy AGS w zbiorze Valid';
select Variable, Sum 'Liczba wartoœci odstaj¹cych', N 'Liczba wszystkich wartoœci', Sum/N*100 'Procent odstaj¹cych'
from valid_out_ags
where not missing(Sum) and Sum < N 
group by -Sum/N*100 ;

/* AGR z Valid */

ods exclude all;
proc summary data = outliers_valid sum n print max_dec = 0 STACKODSOUTPUT;
var agr: ;
ods output summary = valid_out_agr;
run;
ods exclude none;

proc sql outobs=10;
title 'Wartoœci odstaj¹ce z grupy AGR w zbiorze Valid';
select Variable, Sum 'Liczba wartoœci odstaj¹cych', N 'Liczba wszystkich wartoœci', Sum/N*100 'Procent odstaj¹cych'
from valid_out_agr
where not missing(Sum) and Sum < N 
group by -Sum/N*100 ;