# 📘 Silicosis and TB Risk in UK Coal Miners

This project investigates whether silicosis increases the risk of tuberculosis (TB) and whether this association varies by years spent working in coal mining. Using data from a fixed-length cohort study conducted in Great Britain in the 1960s, we estimate crude and adjusted odds ratios (ORs) and assess potential effect modification by duration of mining exposure.

---

## 📂 Dataset Overview

The study followed 3,206 male coal miners from Wales, England, and Scotland for two years. Silicosis status was determined from chest radiographs, and incident TB was defined as the initiation of treatment during follow-up. Data were collected from occupational health records and baseline interviews.

> **Note**: The dataset is not publicly available due to data protection agreements. Only the analysis code and summary findings are shared in this repository.

---

## 🔑 Key Variables

| Variable     | Description                                  |
|--------------|----------------------------------------------|
| `idnum`      | Participant ID                               |
| `silicosis`  | Probable silicosis on radiograph (0 = no, 1 = yes) |
| `tb`         | Started TB treatment during 2-year follow-up (0 = no, 1 = yes) |
| `yrsindcat`  | Years in mining (<15 or ≥15)                 |
| `jobtype`    | Job location (0 = surface, 1 = underground)  |
| `grade`      | Job grade (0 = unskilled, 1 = skilled)       |
| `dwelling`   | Place of residence (0 = non-hostel, 1 = hostel) |
| `country`    | Country (1 = Wales, 2 = England, 3 = Scotland) |
| `agecat`     | Age category (0 = <35, 1 = 35–44, 2 = 45–54, 3 = ≥55) |
| `previoustb` | Self-reported TB history at baseline         |

---

## 📈 Analysis Overview

- **Crude associations** were assessed using odds ratios and chi-square tests.
- **Confounding** was evaluated through Mantel-Haenszel stratified analysis and multivariable logistic regression.
- **Effect modification** by years in mining was assessed through stratum-specific odds ratios (SSORs) and likelihood ratio tests.
- **Final model** adjusted for a priori confounders (age, country) and identified confounders (job type).

See [`analysis.md`](./analysis.md) for full methodology and model comparisons.

---

## 📁 Repository Structure
tb-risk-uk/
├── README.md             # This overview file
├── analysis.md           # Full analytical report with code & interpretation
├── do_files/             # STATA .do files 
└── outputs/              # Tables or figures (if any)

---

## 🔍 Key Findings & Interpretation

- **Crude analysis**: Probable silicosis was associated with twice the odds of TB (OR = 2.00; 95% CI: 1.30, 3.08).
- **Adjusted model** (age, country, job type): OR = 1.57 (95% CI: 1.002, 2.47); p = 0.05.
- **Effect modification**: Weak evidence of variation by years in mining (LRT p = 0.1).
- **Interpretation**: Although the association attenuated after adjustment, silicosis remained a significant predictor of TB risk. Sparse data in some strata reduced precision.
- **Limitations**: Non-differential misclassification, possible selection bias, reliance on treatment as proxy for TB diagnosis.

---

## ⚙️ Tools & License

- Analysis conducted using **Stata 17**.
- Repository licensed under the **MIT License**.

---

🧑‍💼 Author: *Min Kang* (2025 MSc Public Health Candidate)
