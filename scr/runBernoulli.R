library(ramify)
library(e1071)
library(stats)
library(naiveBayes)

main <- function() {
  args = commandArgs(trailingOnly=TRUE)
  if (length(args) != 1) {
  	cat("Please provide one required parameter (no more)")
  	return(-1)
  }

  load(paste0("../data/", args))

  cat("Testing BERNOULLI naive bayes\n\n")

  cat("e1071 naive bayes:\n")
  startTime <- Sys.time()
  naiveBayesModel=e1071::naiveBayes(Y ~., data=bagOfWordsBinary, laplace = 1)
  NBPredictions=predict(naiveBayesModel,bagOfWordsBinary)
  endTime <- Sys.time()
  cat(paste("Accuracy:", accuracyScore(NBPredictions, bagOfWordsBinary$Y), "\n"))
  cat(paste("Duration:", endTime - startTime, "\n"))

  cat("\n")

  cat("custom naive bayes:\n")
  startTime <- Sys.time()
  bnb <- bernoulliNaiveBayes(Y ~., bagOfWordsBinary)
  bnbPredictions = predict(bnb, bagOfWordsBinary)
  endTime <- Sys.time()
  cat(paste("Accuracy:", accuracyScore(bnbPredictions, bagOfWordsBinary$Y), "\n"))
  cat(paste("Duration:", endTime - startTime, "\n"))
}

main()