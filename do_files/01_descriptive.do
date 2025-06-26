******************************************************
* 01_descriptive_tables_tb.do
* Descriptive statistics and crude ORs for TB study
* Dataset: ukminers_tbstudy.dta
******************************************************

clear all
set more off

use "data/ukminers_tbstudy.dta", clear

* Checks for missing data and coding structure
codebook tb silicosis agecat yrsindcat dwelling jobtype country grade previoustb
misstable summarize
tab agecat, missing
tab yrsindcat, missing

* Table 1: Cross-tabulate TB status by all explanatory variables
tab tb silicosis, row col chi2
tab tb agecat, row col chi2
tab tb yrsindcat, row col chi2
tab tb dwelling, row col chi2
tab tb jobtype, row col chi2
tab tb country, row col chi2
tab tb grade, row col chi2
tab tb previoustb, row col chi2

* Score test for trend (ordinal age)
scoretest tb agecat

* Crude odds ratios using logistic regression
logit tb silicosis
logit tb i.agecat
logit tb i.yrsindcat
logit tb i.dwelling
logit tb i.jobtype
logit tb i.country
logit tb i.grade
logit tb i.previoustb

* ORs with 95% CIs
logit tb i.silicosis, or
