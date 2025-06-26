use "data/ukminers_tbstudy.dta", clear

* -------------------------------
* Step 1: Crude model
* -------------------------------
logit tb silicosis
est store crude

* -------------------------------
* Step 2: Adjust for a priori confounders
* Age (ordinal) and Country
* -------------------------------
logit tb silicosis c.agecat i.country
est store apriori

* -------------------------------
* Step 3: Assess additional confounders
* Test one at a time after adjusting for a priori
* -------------------------------

* --- Add job type ---
logit tb silicosis c.agecat i.country i.jobtype
est store +jobtype

* --- Add dwelling ---
logit tb silicosis c.agecat i.country i.dwelling
est store +dwelling

* --- Add years in mining ---
logit tb silicosis c.agecat i.country i.yrsindcat
est store +yrs

* -------------------------------
* Step 4: Combine confounders
* Build most parsimonious model
* -------------------------------

* Final model: a priori + job type (as identified confounder)
logit tb silicosis c.agecat i.country i.jobtype
est store final

* -------------------------------
* Step 5: Assess age linearity assumption
* Is treating age as continuous reasonable?
* -------------------------------
logit tb silicosis i.agecat i.country i.jobtype
est store agecat_model

lrtest final agecat_model  // Compare continuous vs categorical age

* -------------------------------
* Step 6: Test interaction (Effect Modification)
* Years in mining × Silicosis
* -------------------------------

* Interaction model
logit tb i.silicosis##i.yrsindcat c.agecat i.country i.jobtype
est store interaction

* Main-effects model
logit tb i.silicosis i.yrsindcat c.agecat i.country i.jobtype
est store main_effects
lrtest main_effects interaction

* -------------------------------
* Step 7: Get stratum-specific ORs (SSORs)
* -------------------------------
lincom 1.silicosis, eform           // SSOR for yrsindcat = 0
lincom 1.silicosis + 1.silicosis#1.yrsindcat, eform   // SSOR for yrsindcat = 1


*******************************************************
* End of file
*******************************************************

