## 📊 Analysis Log: TB Risk and Silicosis in UK Coal Miners (1960s Cohort Study)

## 🧭 Study Objective

To assess whether silicosis increases the risk of tuberculosis (TB) among male coal miners in Great Britain, and whether this association varies by years spent working in mining.

⸻

## 📦 Data Overview
	•	Study Design: Fixed cohort (2-year follow-up)
	•	Population: 3,206 male miners (Wales, England, Scotland)
	•	Outcome: Started TB treatment during follow-up (proxy for TB)
	•	Exposure: Probable silicosis vs. no silicosis (from chest radiograph)
	•	Effect Modifier of Interest: Years in mining (<15 vs. 15+)
	•	Potential Confounders: Age, country, job type, dwelling, job grade, previous TB

⸻

## 🔧 Step 1: Data Cleaning and Preparation
	•	Excluded 109 men with missing chest radiographs (final N = 3,206)
	•	Grouped age into 3 categories: <35, 35–44, 45+ (55+ merged into 45+)
	•	Created binary indicators for:
	•	Job type: Surface vs. Underground
	•	Dwelling: Hostel vs. Non-hostel
	•	Years in mining: <15 vs. 15+
	•	Job grade: Unskilled vs. Skilled
	•	Country: Wales, England, Scotland

See 01_data_prep.do

⸻

## 📊 Step 2: Descriptive Analysis
	•	Tabulated TB rates by exposure and covariates
	•	Estimated crude odds ratios (ORs) for TB by silicosis status and all other variables
	•	Used Pearson chi-square tests for binary variables
	•	Performed score test for trend (ordinal age)

See 02_descriptive_tables.do

⸻

## 📉 Step 3: Univariable and Stratified Analysis
	•	Estimated crude OR for silicosis and TB
	•	Performed Mantel-Haenszel stratified analysis by key covariates:
	•	Age group
	•	Years in mining
	•	Job type
	•	Country
	•	Dwelling
	•	Compared stratified ORs (MHORs) with crude OR to assess confounding
	•	Assessed effect modification by years in mining and age using test for homogeneity

See 03_stratified_analysis.do

⸻

## 📈 Step 4: Multivariable Logistic Regression
	•	Adjusted for a priori confounders: age (ordinal), country
	•	Sequentially added other confounders:
	•	Job type
	•	Dwelling
	•	Years in mining
	•	Final model included age, country, and job type (most parsimonious set explaining confounding)

See 04_multivariable_models.do

⸻

## 🔀 Step 5: Interaction Analysis
	•	Added interaction term between silicosis and years in mining
	•	Compared interaction model with main-effects model using likelihood ratio test (LRT)
	•	Estimated stratum-specific ORs (SSORs) for <15 vs. 15+ years in mining

See 05_effect_modification.do

⸻

## 📁 Outputs
	•	Clean summary tables exported to outputs/
	•	Table 1: Baseline characteristics, TB risk, crude ORs
	•	Table 2: Adjusted ORs for TB by model
	•	Table 3: Stratum-specific ORs by years in mining

⸻

## 📝 Notes
	•	No imputation performed; <7% missingness in previoustb
	•	tb outcome was binary: treatment initiation (no time-to-event analysis)
	•	Crude and adjusted models interpreted using ORs with 95% CIs and Wald p-values


