# SAS Extension: Baseline Predictors of Dementia Conversion

## Objective

This analysis extends the existing OASIS-2 longitudinal Alzheimer's disease project using SAS.

The aim was to investigate whether baseline demographic, cognitive and neuroimaging measurements were associated with subsequent conversion to dementia.

## Dataset

The OASIS-2 longitudinal dataset contained:

- 373 longitudinal records
- 150 unique participants in the original longitudinal cohort
- 86 participants included in the baseline conversion analysis
- 14 participants who subsequently converted to dementia
- 72 participants who remained nondemented

Participants who were already classified as demented at baseline were excluded from the conversion analysis.

## SAS Workflow

SAS was used to:

- construct a baseline analytical cohort using `PROC SQL`
- transform longitudinal records into a subject-level baseline dataset
- create a binary dementia-conversion outcome
- calculate group-level descriptive statistics using `PROC MEANS`
- automate repeated predictor analyses using a SAS macro
- evaluate age, MMSE and normalized whole-brain volume (nWBV) using `PROC LOGISTIC`
- assess model discrimination using ROC analysis

## Predictors

Three baseline variables were investigated:

- Age
- Mini-Mental State Examination (MMSE) score
- Normalized whole-brain volume (nWBV)

For easier interpretation of the logistic-regression coefficient, nWBV was rescaled so that one unit represented a 0.01-unit change in the original measure.

## Results

At baseline:

| Measure | Converted | Nondemented |
|---|---:|---:|
| Participants | 14 | 72 |
| Mean age | 77.071 | 75.431 |
| Mean MMSE | 29.357 | 29.194 |
| Mean nWBV | 0.738 | 0.746 |

The final exploratory logistic-regression model included baseline MMSE and nWBV.

- MMSE: p = 0.478
- nWBV: p = 0.423
- Overall likelihood-ratio test: p = 0.576
- ROC AUC = 0.614

The model showed limited ability to distinguish future converters from persistently nondemented participants. These findings should be interpreted as exploratory because only 14 participants converted to dementia.

## Tools Demonstrated

- SAS
- PROC SQL
- DATA steps
- SAS macro programming
- PROC MEANS
- PROC LOGISTIC
- Logistic regression
- ROC analysis

## Files

- `oasis_conversion_analysis.sas` — complete SAS analysis
- `oasis_conversion_roc.pdf` — ROC curve from the final model

## Note

This analysis is a portfolio extension intended to demonstrate SAS programming and statistical-analysis skills. It is not a clinically validated dementia prediction model.
