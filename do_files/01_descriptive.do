******************************************************
* 01_descriptive.do
* Descriptive statistics and crude ORs for TB study
******************************************************

use "data/ukminers_tbstudy.dta", clear

* --- Step 1: Basic checks ---
codebook tb silicosis agecat yrsindcat dwelling jobtype country grade previoustb
misstable summarize

* --- Step 2: Confirm variable structure ---
tab agecat, missing
tab yrsindcat, missing

* --- Step 3: Cross-tabulation with TB outcome ---
tab tb silicosis, row chi2
tab tb agecat, row chi2
tab tb yrsindcat, row chi2
tab tb dwelling, row chi2
tab tb jobtype, row chi2
tab tb country, row chi2
tab tb grade, row chi2
tab tb previoustb, row chi2

* --- Step 4: Crude ORs for binary variables ---
logit tb yrsindcat, or
logit tb dwelling, or
logit tb jobtype, or
logit tb grade, or
logit tb previoustb, or

* --- Step 5: Crude ORs for categorical variables ---
logit tb i.agecat, or
logit tb i.country, or

* --- Step 6: Test for trend in age (ordinal vs. categorical) ---
logit tb agecat
est store A
logit tb i.agecat
est store B
lrtest A B

*******************************************************
* End of file
*******************************************************
