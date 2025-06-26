use "data/ukminers_tbstudy.dta", clear

* -------------------------------
* Step 1: Crude OR (reference)
* -------------------------------
logit tb silicosis
est store crude

* -------------------------------
* Step 2: Mantel-Haenszel-style stratified models
* Compare crude vs. stratified (adjusted) ORs
* -------------------------------

* --- Stratify by AGE group ---
logit tb silicosis i.agecat
est store age_adj

* --- Stratify by YEARS in mining ---
logit tb silicosis i.yrsindcat
est store yrs_adj

* --- Stratify by JOB TYPE ---
logit tb silicosis i.jobtype
est store job_adj

* --- Stratify by DWELLING ---
logit tb silicosis i.dwelling
est store dwell_adj

* --- Stratify by COUNTRY ---
logit tb silicosis i.country
est store country_adj

* --- Stratify by JOB GRADE ---
logit tb silicosis i.grade
est store grade_adj

* -------------------------------
* Step 3: Compare models
* Check how much OR changes
* -------------------------------
estimates table crude age_adj yrs_adj job_adj dwell_adj country_adj grade_adj, b(%9.2f) se stats(p r2)

* -------------------------------
* Step 4: Test for effect modification
* Likelihood ratio test: Interaction models vs. main effects
* -------------------------------

* --- AGE as modifier ---
logit tb silicosis i.agecat c.silicosis#i.agecat
est store int_age
logit tb silicosis i.agecat
est store main_age
lrtest main_age int_age

* --- YEARS IN MINING as modifier ---
logit tb silicosis i.yrsindcat c.silicosis#i.yrsindcat
est store int_yrs
logit tb silicosis i.yrsindcat
est store main_yrs
lrtest main_yrs int_yrs

*******************************************************
* End of file
*******************************************************
