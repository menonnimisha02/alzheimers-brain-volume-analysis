# Alzheimer's Disease Brain Volume Analysis

## Overview

This project explores whether changes in **normalised whole brain volume (nWBV)** measured from MRI scans are associated with Alzheimer's disease and cognitive decline.

Using the **OASIS-1 cross-sectional dataset** and the **OASIS-2 longitudinal dataset**, I built an end-to-end data analysis workflow combining:

- Python data cleaning
- Exploratory data analysis
- SQL querying with SQLite
- Cross-sectional patient comparisons
- Longitudinal patient tracking
- Data visualisation with Matplotlib and Seaborn

The project was designed around a clinical question rather than simply exploring variables:

> **Do patients with dementia or those who later convert to dementia show lower brain volume or greater brain-volume decline than patients who remain cognitively healthy?**

---

## Project Objectives

The analysis focused on four main questions:

1. Do demented patients have lower normalised whole brain volume than nondemented patients?
2. Are cognitive scores such as MMSE also different between diagnostic groups?
3. Do patients who convert to dementia show greater brain-volume decline over time?
4. Can changes in brain volume be observed before or around changes in clinical dementia rating?

---

# Data

The project uses data from the **Open Access Series of Imaging Studies (OASIS)**.

## Why I Used Both OASIS-1 and OASIS-2

The two datasets were used because they answer different parts of the research question.

**OASIS-1** is cross-sectional, so it was used to compare demented and nondemented participants at a single point in time. This helped assess whether brain volume and cognitive scores differed between diagnostic groups.

**OASIS-2** is longitudinal, meaning the same participants were followed across multiple visits. This made it possible to investigate how brain volume and cognitive scores changed over time, particularly in patients who later converted to dementia.

Rather than combining the datasets, they were analysed separately because they have different study designs. Using each dataset for its intended purpose allowed the project to examine both:

- differences between patient groups at one time point, and
- changes within patients over time.

### OASIS-1
Cross-sectional MRI data were used to compare characteristics of demented and nondemented participants at a single point in time.

Variables analysed included:

- Age
- Gender
- Education
- Socioeconomic status
- MMSE score
- Clinical Dementia Rating (CDR)
- Estimated Total Intracranial Volume (eTIV)
- Normalised Whole Brain Volume (nWBV)
- Atlas Scaling Factor (ASF)

### OASIS-2
Longitudinal MRI data were used to follow participants across multiple clinical visits.

This made it possible to investigate changes in:

- Brain volume
- MMSE score
- Clinical dementia rating
- Diagnostic group
- Patient progression over time

The raw OASIS datasets are **not included in this repository**. They must be obtained separately from the OASIS data source.

---

# Analysis Workflow

The project follows a structured data pipeline:

Raw OASIS Data
      │
      ▼
Data Cleaning with Pandas
      │
      ▼
Cleaned CSV Files
      │
      ▼
SQLite Database
      │
      ▼
 SQL Analysis 
      │
      ▼
Exploratory Data Analysis
      │
      ▼
Cross-sectional + Longitudinal Analysis
      │
      ▼
Visualisation and Interpretation

## Key Visualisations

### Brain Volume by Diagnostic Group

![Brain Volume by Diagnostic Group](figures/brain_volume_by_group.png)

### Longitudinal Brain Volume Changes

![Brain Volume Across Visits](figures/brain_volume_over_visits.png)

### Converted Patient Trajectories

![Converted Patient Trajectories](figures/converted_patient_trajectories.png)