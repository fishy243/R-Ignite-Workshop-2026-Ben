# Session 4: Workshop on Causal Inference

:: Y. Cui, Michigan State University

1. Causal inference basics
Motivation: RCT vs observational data.
Potential outcomes, ATE and ATT
Propensity scores, overlap, and balance
IPW estimator and practical diagnostics

2. IV, MR, and extensions.
Unmeasured confounding and instrumental variable regression.
IV assumptions.
2SLS, weak instruments and testing
Mendelian randomizatinos
Brief research over view

---

Session 1 : Basics causal inference concepts and propensity-score/IPW estimation

Define causal estimands, recognize confouding and overlap problems, use PSI/IPW when confounders are measured.
Main takeaway: Create a pseudo

- Why we study causal inference?
Science is largely interested in isolating causal effects and is not satisfied with merely observing correlations, i.e, correlation is not causation.

Causal effects describe the expected change in outcome in response to
    A new treatment, a prevention program, a new policy, a new exposure.

When compared with some baseline, or referent condition typically taken to be the absence of an exposure or the commonly accepted practice in treatment.

Example: Coronary Heart Disease (CHD) risk according to duration of current Vitamin E supplement use compared to no use
RR | Stampfer 1993, Rimm 1993, RCTs
-> Vitamin C, Vitamin A, ...

-> Lots of confounding risk factors: Childhood SES, Manual social class, no car access State, pension only, smoker, obese, daily alcohol, Exercise, Low fat diet, Height, Leg length.

Some of these confounding factors are observable, but some are unobservable.
cite Women's Heart and Health Study, Lawlor et al., lancet 2004

Limitations to Observational studies: confounding

- RCTs: The Gold Standard in Inferring Causality.
Randomization makes causal inference possible.

The need for observational studies:
    i) Not always ethical or practically feasible, eg anything toxic.
    ii) Expenseive, requires experimentation in humans.
    iii) Impractical for long follow-up times
    iv) Should only be conducted on interventions that show very strong observational evidence in humans.

New-user cohort design,

- Need for observational studies
Fundamental challenges:
Objective: Estimate the effect of a (non-randomized) exposure on an outcome.
A Key source of bias in observational studies comes from selection bias, i.e, when exposure status is correlated with baseline covariate.
    e.g, individuals with more severe substance use tend to enroll in more intensive treatment programs than those with less severe substance use.
    e.g, environmental lead exposure is related to SES
    e.g, indivudals with PTSD are at greater risk for other mental health problems than those without PTSD.

The selection process often means that treated individuals and control individuals look quite different on baseline characteristics, referred to as potential confounders.

"Correlation does not imply causation".
Propensity score matching
The promise of instrumental variables: unbiased estimation of causal effect without enumerating confounders.

- Potential Outcomes framework
Let A be the exposure of interest( A=0 or A=1)
Let X represent pre-exposure covariates
Ideal experiment= observe each indivdual under both (each individual is their own control)

Two potential outcomes for each study participant i:
    Outcome after receiving treament = Y1
    Outcome after receiving comparison treatment = Y0

Potential outcomes Y1 and Y0 exist for all individuals, regardless of which treatment the individual actually received.

The ideal estimand of interest is: Y1-Y0, the treatment effect for the individual person.

Unfortunately, only observe one of these outcomes for each participant.

So average treatment effects are typically estimands in some populations, e.g, E[Y1-Y0]

- Causal Estimands: ATE
Average treatment effect in the entire population (ATE)
ATE estimand defined as E(Y1-Y0)
    E(Y1) = E(Y1 | A=1) pi + E(Y1|A=0)(1-pi); pi = Pr(A=1)
    E(Y0) = E(Y0 | A=1) pi + E(Y0|A=0)(1-pi)

Aims to answer the question:
How effective is the treatment in the population? (If you have a control condition)
What is the relative effectiveness of two treatments on average in the population? (If you have 2 treatment conditions)
For ex, what is the relative effectiveness of drug A versus drug B on average in the treatment group..

Causal Estimand AAT: Average treatment effect in the treated population.
ATT estimand defined as: E(Y1-Y0|A=1)
Aims to answer:
How would those who received treatment have done had they received the comparison condition?
For ex, how would those who had received drug A have done had they received drug B?

Challenge of Causal Effect Estimation.
We observe potential outcomes under treatment only for individuals who receive treatment and under control only for individuals who do not receive treatment
Y1 when A=1 and Y0 when A=0
We do not observe Y0 when A=1 or Y1 when A = 0

We can directly estimate E(Y1 | A=1) pi + E(Y0|A=0)
Need to extrapolate to estimate E(Y1|A=0) and E(Y0|A=0)

- Solving the Fundamental Problem of Causal Inference

Key challenge: estimating the means for the unobserved counterfactuals, E(Y1|A =0) and E(Y0|A =1)

Solution: find or create groups where the distributions of the expected values of Y1 are the same for individuals who receive treatment (A=1) and individuals who receive control (A=0), i.e, E(Y_1|A=1) E(Y_1|A=0)
    Similarly, the distributions or expected values of Y0 are the same for individuals who receive treatment and individuals who receive control,

Within the groups potential outcomes are unrelated to treatment assignment
This is known as strong ignorability
    Condition 1: The distribution of potential outcomes, (Y0, Y1), is the same for individuals with A=1 and A=0, given a value of X, i.e (Y0,Y1), is the same for individuals with A=1 and A=0 given a value of X, i.e (Y0, Y1)

Propensity score (PS)
The propensity score is the probability of receiving the treatment, A, conditional on a set of baseline characteristics.
e(x) = P(A=1 | X) = f(B0, ...)

- The Propensity Score and Sttrong Ignorability
If distribution of (Y0, Y1) is hte same for individuals with A=1 and A=0 at each value of X, then it is the same for individuals with A=1 and A=0 at each value of e(x)
If (Y0,Y1), A | X, then (Y0,Y1), A | e(x)

if treatment is strongly ignorable with respect to X (i.e, distribution..)

Graph:
Bipodal distribution, baseline characteristics, e.g treatment for reduced Obesity, Treatment assignment,

Using the PS
Triming, PS Matching, Stratification, Inverse probability weighting (Weighting subjects by inverse of propensity score)

IPW Weighting (a toy example)
X is a confounder of the effect of A on Y

X (severe baseline depression = y/n) -> A (met with health specialist or not =y/n) -> Y (end of study depression) [X is also a factor that goes here]

Pr(A=yes | X=yes) = 60/90 = 2/3
Pr(A=yes | X=no) = 30/90 = 1/3
P_i = P_i (A=yes | Xi) = 2/3 X_1 + 1/3 (1-X_1) = propensity score
Assign the following weights Wi = Ai / Pi + (1-Ai) / (1-Pi)

The basic idea behind IPW weighting is to use the information in the propensity score.

Pi = 2/3 Xi + 1/3 (1-Xi) = propensity score
Assign the weights
Wi = Ai / Pi + (1-Ai) / (1-Pi)
Does this really work? Yes. Take a look at the "weight table":

1: 90, 2: 90, 3: 60, 4: 60

The final step is to model the effect of A on Y. Just as you would (e.g, linear regression), but using the weighted sample.
One way to do this is weighted ordinary least squares.
No need to adjust for X in the actual regression model.

For ATE:
    - weight treatment group by 1/e^(Xi)
    - weight comparison group by 1/(1-e^(Xi))

For ATT:
    - weight comparison group by e^(Xi)/(1-e^(Xi))

Steps: 1) Fit logistic regression: A~X, to get PS. 2) Weight. 3) Test for differences in the mean of each covariate. 4) Add interactions, quadratic terms, or strata until all covariate balance.

Rational: Conditional on. the PS, the distribution of covariates will be the same for

- Estimation of the Treatment Effects
After balancing, the only observed difference between

---

Session 2: Instrumental Variable confounding.
What if there are unmeasured Confounders? - IV regression.
IV assumptions:

- Relevance: Z is associated with the exposure (X).
- Effect random assignment: Z is independent of the unmeasured confounder(C)
- Exclusion restriction: Z cannot have any direct effect on the outcome(Y)

Control for observed as well as unobserved confounding

Istrument Z -> Exposure X - > Outcome Y
                    \Confounder C/

Linear structure model (LSM)
The most commonly used IV estimators are based on the following linear structure model:
Y = XBeta + u
X = Zgamma + v

Use two-stage least squares (2SLS): The 1st stage is to fit X = Zgamma + v to select IVs, then get the predicted value X_hat
In the 2nd stage, do regression Y= X_hat beta + u to estimate beta

Challenges: IVs are not always available or not easy to find in real applications.
MR analysis: using SNPs as IVs to infer causality

Wide applicability of MR:

Mnedel's Laws of Inheritance

1. Segreation: alleles separate at meiosis and a randomly selected allele is transmitted to offspring.
2. Independent assortment: alleles for separate traits are trasmitted independently of one another.

Mendelian randomization and RCTs
e.g, Heavy smokers: C/C; Light/Non Smokers: C/CT

SNPs are the genetic "handles used in Mendelian randomization
Key idea: inherited variation creates natural contact in exposure

SNP (genetic instrument) -> Exposure (e.g, LDL, BMI) -> Outcome (disease trait) |
                V Confounders (lifestyle, SES) -> Blocked by design

1) Relevance, SNP is strongly associated with the exposure. 2) Independence, SNP is not associated with exposure-outcome confounders. 3) Exclusion restriction, SNP affects the outcome only through the exposure. * Difficult to meet

Assumptions:

1.2.3.

Catuion: Randomization is approx. at best(untestable)
    Deviation from "a natural RCT" can be introduced by pop. stratification,

Ratio of coefficients method: If the coeff. of the IV in the reg of the exposure on the IV is written as B_hat_ X|Z and the coeff. of the IV in the regression of the outcome on the IV is written as B_hat Y|Z

Common Mendelian Randomization Methods:
Two-stage methods (2SLS): x_i = alpha_0 = sumn (a_k * Z_ik + epsilon_)

Inverse-variance weighting (IVW) method
Likelihood-based methods. E.g,

- Non-conventional challenges in MR
Weak instruments: Many genetic variants are only weakly associated
Summary-data MR: Most GWAS data come in summary-statistics format due to privacy. Solution: Develop statistical methods that can be applied to summary statistics.

Pleiotropy: Exclusion restriciton is likely violated for many genetic IVs. Solution

Bias issues in one-sample MR analysis
The same data are used for both IV selection and causal effect estimate, leading to
    - IV selection bias or the winner's curse problem.
    - Solution: sample split

Graph: Boxplot, split at selection bias.

2nd bias issue: weak IVs lead to the weak instrument bias issue.
    Staiger and Stock (1994) showed that when IVs are weak, 2SLS est. is biased and unreliable.
    Bekker (1994) showed that 2SLS est. is not consistent with many IVs even these IVs are valid.

One solutino: combine all IVs to form one IV, also called allele score.
    More IVs -> large bias but small variance.
    Less IVs -> small bias, but large variance.

MR-SPLIT is proposed to address both types of bias issues.

doi.org/10.1093/ije/dyq151
Causal diagram for: 1) single IV. b) multiple, independent instrument variables. c) a single combined instrumental variable. d) a major gene and polygene IV.

Simulations showed that single-IV MR studies

MR-SPLIT: Mendelian Randomization with adaptive Sampel-sPLitting with cross-fitting InstrumenTs/ Shi et al. 2024, PioS Genetics

Criteria for deciding major vs weak IVS
i) Partial F(F>r for major IV)
...
Simulation Study: Compare with 2SLS an LIML

Multiple splitting to improve robustness

- Due to uncertainty of single splitting, esp when the sample size is not large enough

Sample Figre 5: Type 1 error under different sample sizes: N= 500(left), 1000()

Case Study: The CRIC study
Data: Chronic Renal Insufficiency Cohort (CRIC) data.
CKD function is measured by the estimated glomerular filtration rate (eGFR) and the urine albumin/creatinine (uACR)
Low eGFR and high uACR values indicate impaired kidney function
histograph graphs(). Figure 8

- Causal inference methods for longitudinal (panel) data

Granger causality: the effect does not precede its cause in time. The causal series contains unique information about the series being caused that is not available otherwise.

Methods assuming Gaussian noise: Vector auto-regressive (VAR) model. Structural equation model (SEM)

Methods assuming non-Gaussian noise: Additive

A Motivating Example - eating behavior study: data from a collaboration with MSU Psychology dept. Causal effect of hormone level on emotional eating behavior in teen girls? Hormonal effects.

Real Data: n=...

The model: Time-delayed causal effect.
Assume: not only current but also recent past exposures affect the current response.
The model: X(t_j) = alpha(tj)G + epsilon_1(t_j)
Y(t_j) = beta_0(t_j) + sumn r=1 p (Beta_r(t_j)X(t_j-q-r-1))

Graphs: a) Estimator of Beta_O(t), b) Estimator of beta_11(t). c) Estimator of beta_2(t)

Data analysis:
Study the causal effect of two hormone (estrogen and progesterone) on emotional eating in teen girls (DEBQ and PANAS).
n = 225; ...
166,063

## Assignment submission links

1st assignment submission email: [Email](aswanaeugene43@gmail.com)
