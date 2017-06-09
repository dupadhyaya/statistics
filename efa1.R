#efa
ability.cov$cov
ability
str(ability)
?ability
?ability.cov
str(ability.cov)
#Dataset : ability.cov
#       general picture  blocks   maze reading   vocab general  24.641   5.991  33.520  6.023  20.755  29.701 picture   5.991   6.700  18.137  1.782   4.936   7.204 blocks   33.520  18.137 149.831 19.424  31.430  50.753 maze      6.023   1.782  19.424 12.711   4.757   9.075 reading  20.755   4.936  31.430  4.757  52.604  66.762 vocab    29.701   7.204  50.753  9.075  66.762 135.292
options(digits=2)
covariance = ability.cov$cov
correlations = cov2cor(covariance)
correlations

# Factors to Extract
library(psych)
covariances = ability.cov$cov
correlations = cov2cor(covariances)
fa.parallel (correlations, n.obs = 112, fa='both', n.iter=100, main='Scree plots with parallel analysis')
?fa
fa = fa(correlations, nfactors=2, rotate='none', fm='pa')
fa

fa.varimax = fa(correlations, nfactors=2, rotate = 'varimax',  fm='pa')
fa.varimax

fa.promax = fa(correlations, nfactors=2, rotate = 'promax',  fm='pa')
fa.promax


fsm <- function(oblique) {
  if (class(oblique)[2]=="fa" & is.null(oblique$Phi)) {
    warning("Object doesn't look like oblique EFA")
  } else {
    P <- unclass(oblique$loading)
    F <- P %*% oblique$Phi
    colnames(F) <- c("PA1", "PA2")
    return(F)
  }
}
fsm(fa.promax)

factor.plot(fa.varimax, labels=rownames(fa.promax$loadings))
fa.diagram(fa.varimax, labels=rownames(fa.promax$loadings) )

factor.plot(fa.promax, labels=rownames(fa.promax$loadings))
fa.diagram(fa.promax,  simple=F )

fa.24tests = fa(Harman74.cor$cov, nfactors=4, rotate='promax')
fa.24tests

fa.promax$weights
