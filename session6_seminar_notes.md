# Bayesian Modeling & MCMC

formula -> prior -> stan_gim() -> diagnose -> interpret
using rstanarm::stan_glm()

## Cont'd Session 3.. Bayesian foundations

:: PROF DR. Leonard

- Bayesian inference: the mathematical core

p(theata | y) = p(y|theta)*p(theta)/p(y) OR P(A | B) = P(B|A)*P(A)/P(B)
theta = unknown parameter(s)
gamma(y) = observed data
p(theta): prior distribution
p(gamma | theta): likelihood
p(theta | y): posterior distribution

Prior: What was plausible before thes data?
Likelihood: How compatible are parameter values with observed data?
Posterior: What remains plausible after combining both? Posterior = Likelihood x Prior / Evidence

Law of total probability: {\displaystyle P(B)=P(B\mid A_{1})P(A_{1})+P(B\mid A_{2})P(A_{2})+\dots +P(B\mid A_{n})P(A_{n})=\sum _{i}P(B\mid A_{i})P(A_{i})}

Beta-Binomial updating

Prior: Beta(a,b) + Data: Binomial (n,p) ->

- Likelihood
For Binomial data: L(p) est.(=) p^x(1-p)^n-x

- Same hypertension data
x = 30 of n=120 adults

Frequentist: p_hat = 0.25; estimate + CI; optional H_0; p=0.20

Bayesian: Prior Beta(2,8) -> posterior Beta(32,98); summarize posterior and P(p>0.20)
    i) two shaped parameters

p_hat = 30/120 = 1/4 = 0.25

- Beta-Binomial updating
Prior: beta(a,b) + Data: Binomial(n,p) -> Posterior: Beta(a+x, b+n-x)

Intuition: Successes add to
NB: When you havea congugate prior, you have a posterior

Beta(2,8) -> Beta(32,98)

- Why Computation becomes necessary
Complex posterior -> numerical approximation -> MCMC

Easy: Beta-Binomial: algebra gives the posterior directly.
Realistic: Regression and multilevel models usually require numerical integration.
Goal: Approximate posterior expections, intervals, probabilities, and predictions.

- Bridge to MCMC
Target: Define posterior through likelihood + priors.
Sample: Generate dependent draws that explore the posterior.
Diagnose: Check that simulation is trustworthy before interpreting.

- Framework selection
Calibration: DO we need long-run error control?
Direct Probability: Do we need P(effect > clinically meaningful threshold | data)?
Context: What assumptions

- Checkpoint before computation
A. What are prior, likelihood, and posterior?
B. Why is a credible interval not a confidence interval?
C. Why might we need MCMC?

2.0 Why Monte Carlo?

- Approximation and estimation
Posterior expectation: E(g(theta)|y) = integral(p(theata|y) * d(theta))

Monte Carlo approximation approx(=) (1/S) sumn(g(theta^s))

Translation: If we can obtain representative draws from the posterior, averages and quantities of those draws approximate posterior summaries.

- What makes it a Markov chain?
Start: Initialize theta^0 -> Move: Generate a new candidate/state -> Explore:

- What does rstanarm use underneath?

- The key bridge: familiar R formula syntax
glm(Diabetes01 ~ Age10 + BMIS + PhysActive,
    data = dat, family = binomial)

stan_glm(Diabetes01 ~ Age10 + BMIS + PhysActive,
    data = dat, family = binomial,
    prior = normal(0,1))

Same idea, new ingredients: prior + posterior simulation + diagnostics

install.packages(c("rstanarm", bayesplot", "posterior"))

options(mc.cores = parallel)
