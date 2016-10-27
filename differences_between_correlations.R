install.packages("cocor")

library(tidyverse)
library(apaTables)
library(haven)
library(cocor)


# Question 1.1

??cocor.dep.groups.overlap

# Comparing the difference between the correlations (rating,complaint) and (rating,critical)

r.jk <- .83 # Correlation (rating,complaint)
r.jh <- .16 # Correlation (rating,critical)
r.kh <- .19 # Correlation (complaint,critical)
n <- 30

cocor.dep.groups.overlap(r.jk, r.jh, r.kh, n, alternative = "two.sided",test = "all", alpha = 0.05, conf.level = 0.95, null.value = 0,data.name = NULL, var.labels = NULL, return.htest = FALSE)

# Analyses say null hypothesis is rejected
# delta (r) = .67
# 95% CI for r.jk - r.jh [.3199,1.0418]

# Question 1.2

??cocor.dep.groups.nonoverlap

r.hm <- .38 # Correlation (critical,raises)

r.km <- .67 # Correlation (complaint,raises)

cocor.dep.groups.nonoverlap(r.jk, r.hm, r.jh, r.jm, r.kh, r.km, n,alternative = "two.sided", test = "all", alpha = 0.05,conf.level = 0.95, null.value = 0, data.name = NULL,var.labels = NULL, return.htest = FALSE)

# Analyses say null hypothesis is rejected
# delta (r) = .45
# 95% CI for r.jk - r.hm [.1448,.8116]

# Question 2.1

library(predictionInterval)
??predictionInterval


pi.r(.43, 30, rep.n = 100, prob.level = 0.95)

# Original study: r = 0.43, N = 30, 95% CI[0.08, 0.68]
# Replication study: N = 100
# Prediction interval: 95% PI[0.05,0.74].

# Interpretation: The original correlation is 0.43 - with a prediction interval 95% PI[0.05, 0.74]
# based a replication sample size of N = 100.
# If the replication correlation differs from the original correlation only due to sampling error, 
# there is a 95% chance the replication result will fall in this interval.
# If the replication correlation falls outside of this range, factors beyond sampling error are
# likely also responsible for the difference.

# Question 2.2

pi.r(.43, 30, rep.n = 100000, prob.level = 0.95)
# Maxes out at rep.n = 10000
# Problematic because if original study had small n, and replication had large n
# but the original study had a narrow prediction interval, this might suggest that
# the replication will???
# Ask on Monday

# Question 2.3

??cocor.indep.groups

r1.jk <- .43
r2.hm <- .10

n1 <- 30
n2 <- 1000

cocor.indep.groups(r1.jk, r2.hm, n1, n2, alternative = "two.sided",test = "all", alpha = 0.05, conf.level = 0.95, null.value = 0,data.name = NULL, var.labels = NULL, return.htest = FALSE)


# zou2007: Zou's (2007) confidence interval
# 95% confidence interval for r1.jk - r2.hm: [-0.0228 0.5917]
# Null hypothesis retained (Interval includes 0)


# Question 2.4

# There is likely a positive correlation of rating-privileges; it could be as low as -.02, or as high as .59

