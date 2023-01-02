# Correlating Inflammation and Disease Incidence Between Race and Ethnicity 

Professor Thomas McDade, Jesus Serrano, Stacy Caeiro, and Randy Truong 

# Code Behind Project 
CVD_Diabetes_by_Race.Rmd: Data cleaning and visualization of inflammation and disease correlation by race. 

CVD_by_female.Rmd: Data cleaning and visualization of inflammation and disease correlation of females by race. 

CVD_by_male.Rmd: Data cleaning and visualization of inflammation and disease correlation of males by race. 

# Abstract 
Acute inflammation is an innate immune response that protects the human body from
damage caused by pathogens, stressors and injuries, and typically subsides once the
biological threat has been managed. Chronic, low-grade inflammation is non-resolving
and can increase an individual’s susceptibility for cardiovascular disease (CVD) and/or
diabetes. 

However, this association is based on data collected from European and EuropeanAmerican 
populations, and has not been established among other race/ethnic 
demographic groups. As such, we sought out to investigate CRP as a predictor of
disease incidence across different race/ethnic groups. 

We hypothesized that CRP would be a stronger predictor of disease in Hispanics and African-Americans than in Whites and Asian-Americans. Using data from a large, nationally representative sample of adults in
the US (AddHealth), we evaluated statistical models using baseline CRP as a predictor of
disease 8 to 10 years later for all races/ethnicities, and then stratified by race/ethnicity. 

We found that within the AddHealth dataset, log-transformed CRP values are a stronger
predictor of CVD among Asian-Americans and log-transformed CRP values are a
stronger predictor of diabetes among Whites and Hispanics. Results from this analysis
could promote a more nuanced understanding of why disease incidence varies between
racial and ethnic groups and with more support could be used to identify high risk
populations at earlier stages of disease progression.

# Introduction
In this study, we seek to analyze the relationships between disease incidence and
rates of hsCRP (C-Reactive Protein) among individuals of different races. More specifically, we 
will be analyzing datasets from Asians, Hispanics, (Non-Hispanic) Whites, and
(Non-Hispanic) Blacks. All of these datasets have been sourced from the 
**AddHealth** database.

## Preliminary Information 
### Inflammation 
Inflammation occurs in the human body in two different forms. <br> 

**Acute inflammation** occurs as an innate response to pathoegens, stressors, 
and injuries as a protective mechanism. Typically, symptoms of inflammation 
include fever, chills, and fatigue/loss of energy. Acute inflammation typically 
resolves in a timeframe of a few hours up to a few weeks. <br> 

**Chronic inflammation**, however, results from acute 
inflammation that has has not been completely eliminated
from the immune system as well as frequent exposure to low
magnitude stressors. The symptoms of chronic inflammation are similar
to that of acute inflammation, except that they persist as opposed to 
being temporary. <br>

Immune cells will undergo a process called cytokinesis which results 
in the secretion and creation of C-Reactive Protein from the liver. <br>

### C-Reactive Protein 
**C-Reactive Protein** (also known as CRP) is a non-volatile protein that is synthesized in response to the presence of cytokines. 
Measurement of CRP is conducted with **highly-sensitive assays**, 
which is why CRP is more commonly denoted as **hsCRP** (mg/L). <br> 

### C-Reactive Protein as an Indicator of Disease 
A CRP level of 3.0 mg/L is associated with a high risk for cardiovascular disease among white demographics; however, the association between CRP levels and Cardiovascular Disease has not been evaluated among other demographics. 

Instead, CRP levels have just been assumed to be associated with a greater risk of developing diabetes.

### Measuring C-Reactive Protein as a Predictor of Disease Incidence

## Motivation 
From this possible relationship between CRP and CVD, as well as the lack of
statistical research of CRP and CVD and disease among other demographics, we
have decided to analyze the relationship between CRP and disease, especially
considering that statistics show that Black and Hispanic groups tend to 
possess higher levels of CRP compared to Whites, while Asians exhibit the 
lowest levels of CRP out of all ethnic demographics. 

## Hypothesis 
In this study, we hypothesize that Blacks and Hispanics would have the greatest
levels of CRP, and thus, would have higher rates of CVD and diabetes diagnoses.
Therefore, CRP is a strong predictor of CVD and diabetes among these 
demographics. 

## Methodology 
For our analysis, we have chosen datasets of CRP levels and diagnoses of CVD
and Diabetes that have been collected over a period of 10 years, in which
the CRP levels were collected between individuals of ages 24-32 years, 
while their diagnoses of CVD and Diabetes were eventually collected among
those same individuals when they were between 33-43 years old.

All of these datasets come from AddHealth, where the baseline CRP levels 
were measured in 2008 and their diabetes diagnoses were collected between
2016-2018. 

Individuals in this study were grouped based on their racial/ethnic origins 
(which were self-reported by the individuals). Among the variables measured 
in the datasets, we looked at CVD and Diabetes Diagnoses, hsCRP levels, 
and whether or not these hsCRP levels were abnormally high.

Important excluded individuals include pregnant individuals as well as any
individuals with confirmed CVD or Diabetes diagnoses during the 2008 
collection of CRP levels. 

# Datasets 

# Hypotheses 
- Hispanics and Blacks will have the highest levels of CRP. 
- CRP levels will be a strong predictor of CVD and Diabetes in Hispanic and Black populations. 

# Visualizations
![CVD_Diabetes_Race_Barplot](https://user-images.githubusercontent.com/120422997/210270008-9bc61896-df01-40cf-bae4-02f1dcb3bedb.png)
This chart visualizes the proportion of the sample diagnosed with CVD or Diabetes categorized by race. As seen here, both CVD and diabetes are most diagnosed within the Black population. Additionally, there is a similar presence of CVD between Asian, White, and Hispanic populations. Furthermore, there is a similar proportion of diabetes diagnosis within Asian and Hispanic populations, with the White population having the lowest proportion of diagnosis. 

![CVD_Male_Barplot](./imgs/Male/CVD_Male.png)
![CVD_Female_Barplot](./imgs/Female/CVD_Female.png)

# Conclusions 
Overall, the relationship between inflammation and CVD and diabetes presence differs between ethnic groups. CRP levels are highest in Hispanic and Black populations. Additionally, CVD and diabetes is most diagnosed within the Black population. Moreever, the relationship between log(hsCRP) and CVD is strongest within the Asian population. Finally, log(hsCRP) is the strongest predictor of diabetes within White and Hispanic populations. 

We suggest that future studies can examine different factors that may account for these differences in relationships by race. 

# Citations 
Harvard Health. *Understanding acute and chronic inflammation.*
Pahwa R, et al. *Chronic Inflammation.* <br>
Shrivastava, AK., et al. (2015). *C-reactive protein, inflammation and coronary heart disease.* <br> 
Pearson, TA, et al. (2003). *Markers of Inflammation and Cardiovascular Disease.* <br>
McDade, TW. (2012). *Early environments and the ecology of inflammation.* <br>
Saijo, Y. (2004). *Relationship between C-reactive protein and visceral adipose tissue in healthy Japanese subjects.* <br>
Pradhan AD, et al. (2001). *C-reactive protein, Interleukin 6, and risk of developing type 2 diabetes mellitus* <br>
Nazmi, A and Victora, CG. (2007). *Socioeconomic and racial/ethnic differentials of C-reactive protein levels: a systematic review of population-based studies* <br>
Nazmi, A and Victora, CG. (2007). *Socioeconomic and racial/ethnic differentials of C-reactive protein levels: a systematic review of population-based studies* <br>


# Acknowledgements
Special thanks to (in no order of importance): 


**Dr. Thomas McDade** for the original research and project idea


**Jesus Serrano** for the original data analysis and parsing, as well as the creation and presentation of the data findings at a research conference. 


**Keegan Krause**, **Dr. Koning**, and **Dr. Miller** for providing in lab training 


