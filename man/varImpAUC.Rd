% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/varImpAUC.R
\name{varImpAUC}
\alias{varImpAUC}
\title{varImpAUC}
\usage{
varImpAUC(
  object,
  mincriterion = 0,
  conditional = FALSE,
  threshold = 0.2,
  nperm = 1,
  OOB = TRUE,
  pre1.0_0 = conditional
)
}
\arguments{
\item{object}{An object as returned by cforest.}

\item{mincriterion}{The value of the test statistic or 1 - p-value that must be exceeded in order to include a 
split in the computation of the importance. The default mincriterion = 0 guarantees that all splits are included.}

\item{conditional}{The value of the test statistic or 1 - p-value that must be exceeded in order to include a split 
in the computation of the importance. The default mincriterion = 0 guarantees that all splits are included.}

\item{threshold}{The threshold value for (1 - p-value) of the association between the variable of interest and a 
covariate, which must be exceeded inorder to include the covariate in the conditioning scheme for the variable of 
interest (only relevant if conditional = TRUE). A threshold value of zero includes all covariates.}

\item{nperm}{The number of permutations performed.}

\item{OOB}{A logical determining whether the importance is computed from the out-of-bag sample or the learning 
sample (not suggested).}

\item{pre1.0_0}{Prior to party version 1.0-0, the actual data values were permuted according to the original 
permutation importance suggested by Breiman (2001). Now the assignments to child nodes of splits in the variable 
of interest are permuted as described by Hapfelmeier et al. (2012), which allows for missing values in the 
explanatory variables and is more efficient wrt memory consumption and computing time. This method does not 
apply to conditional variable importances.}
}
\value{
Vector with computed permutation importance for each variable
}
\description{
Computes the variable importance regarding the AUC. Bindings are not taken into account in the AUC definition as they did 
not provide as good results as the version without bindings in the paper of Janitza et. al (2013) (see References section).
}
\details{
For using the original AUC definition and multiclass AUC you can use the varImp function and specify the particular measure.
}
\examples{
 
# multiclass case
data(iris)
iris2 = iris
iris2$Species = factor(iris$Species == "versicolor")
iris.cf = cforest(Species ~ ., data = iris2,control = cforest_unbiased(mtry = 2, ntree = 50))
set.seed(123)
varImpAUC(object = iris.cf)
}
\references{
https://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-14-119
}
