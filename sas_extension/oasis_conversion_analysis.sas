proc import datafile="/home/u64614716/EPG1V2/oasis2_longitudinal.csv"
    out=oasis
    dbms=csv
    replace;
    guessingrows=max;
run;

proc contents data=oasis;
run;

/* =========================================================
   OASIS-2 SAS Extension:
   Baseline predictors of dementia conversion
   ========================================================= */


/* 1. Create baseline cohort:
      Keep only first visits for Converted and Nondemented subjects */

proc sql;
    create table baseline as
    select patient_id,
           group,
           age,
           mmse,
           nwbv,
           case
               when group = "Converted" then 1
               when group = "Nondemented" then 0
           end as converted
    from oasis
    where visit = 1
      and group in ("Converted", "Nondemented");
quit;


/* 2. Get the numbers we can potentially use on the CV */

proc sql;

    select count(*) as Total_OASIS_Records
    from oasis;

    select count(*) as Baseline_Cohort
    from baseline;

    select group,
           count(*) as Participants
    from baseline
    group by group;

quit;


/* 3. Compare baseline Age, MMSE and nWBV between groups */

proc means data=baseline n mean std maxdec=3;
    class group;
    var age mmse nwbv;
run;


/* 4. Simple SAS macro:
      automatically test each predictor separately */

%macro test_predictor(variable);

    proc logistic data=baseline;
        model converted(event='1') = &variable;
    run;

%mend;

%test_predictor(age);
%test_predictor(mmse);
%test_predictor(nwbv);


/* 5. Final exploratory model and ROC curve */
/* Rescale nWBV so odds ratio represents a 0.01-unit increase */
data baseline;
    set baseline;
    nwbv_01 = nwbv * 100;
run;

ods graphics on;

proc logistic data=baseline plots(only)=roc;
    model converted(event='1') = mmse nwbv_01;
run;

ods graphics off;

