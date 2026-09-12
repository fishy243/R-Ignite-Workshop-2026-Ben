# AI Fundamentals

Prof. George Okello

- Artificial Intelligence, Machine Learning, Deep Learning, Data Sceince

1. The 5 Vs of Big Data Analytics - to Health Data
    i) Volume: amount of data generated and stored (i.e scale)
    ii) Velocity: speed at which data is generated, collected, and processed
    iii) Variety: different types and formats of data
    iv) Veracity: quality, accuracy, and trustworthiness of the data
    v) Value: actual usefulness or insight that can be extracted from the data

    Challenges unique to health data: class imbalance (rare diseases), censoring (survival data), privacy (HIPAA/GDPR) etc.

Data Characteristics Unique to Healthcare
    i) Heterogeneity: structured (lab values) + unstructured (clinical notes, images) coexist constantly.
    ii) Missingness: rarely random - data often missing because of clinical decisions (informative missingness)
    iii) Class imbalance: rare diseases/adverse events are, by definition, rare in the data.
    iv) Temporal complexity: irregular visit intervals, long follow-up periods, censoring (patients lost to follow-up)
    v) High dimensionality: genomics and imaging data can have far more features than observations
    vi) small-N, high stakes: many clinical studies have limited sample sizes but require high-confidence conclusions

Model Families
    i) Statistical models - logistic/Cox regression, Bayesian networks (interpretable, hypothesis-driven)
    ii) Classical ML - Random Forest, XGBoost, SVM, Naive Bayes, k-NN (flexible, moderate interpretability)
    iii) Deep Learning - CNNs, RNNs/LSTMs, Transformers, GANs, GNNs (high capacity, low native interpretability)
    iv) Applied IV systems - NLP/LLMs, forecasting models, reinforcement learning agents

- AI, ML & Statistics in Clinical Decision-Making
Descriptive: What happened, Summary stats, dashboards, EDA on patient cohorts.

Predictive: What's likely to happen?, Risk scores, survival curves, Logistic regression, Random Forest

Prescriptive: What should we do? Treatment/dosing recommendations, Reinforcement learning, optimization

- Key Application Domains Summary
Diagnostics: CNNs (imaging), SVM/Random Forest (lab-based diagnosis)
Prognosis/Risk Prediction: Cox models, XGBoost, DeepSurv
Drug Discovery: GNNs,
Public Health/Epidemiology:
Clincal NLP:
Personalized Medicine:

- The model Building Cycle
Problem framing
Data preparation
Model training
Evaluation
Explainability
Deployment & monitoring

- R in Action
Setup & loading Clinical Data
Exploratory Data Analysis on Patient Data
Predictive Modelling
Model Evaluation & Explainability

Raw Big Data -> EDA -> Model -> Evaluation -> Explainability pipeline

R packages for health analytics: survival, MASS, randomForest, pROC, tidyverse, caret/tidymodels (unified ML workflow), survival (t-e outcomes), forecast/deSolve
