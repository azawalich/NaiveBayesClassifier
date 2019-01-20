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

  cat("Testing MULTINOMIAL naive bayes\n\n")

  cat("e1071 naive bayes:\n")
  startTime <- Sys.time()
  naiveBayesModel=naiveBayes(Y ~., data=bagOfWords, laplace = 1)
  NBPredictions=predict(naiveBayesModel,bagOfWords)
  endTime <- Sys.time()
  cat(paste("Accuracy:", accuracyScore(NBPredictions, bagOfWords$Y), "\n"))
  cat(paste("Duration:", endTime - startTime, "\n"))

  cat("\n")

  cat("custom naive bayes:\n")
  startTime <- Sys.time()
  mnb <- multinomialNaiveBayes(Y ~., bagOfWords)
  mnbPredictions = predict(mnb, bagOfWords)
  endTime <- Sys.time()
  cat(paste("Accuracy:", accuracyScore(mnbPredictions, bagOfWords$Y), "\n"))
  cat(paste("Duration:", endTime - startTime, "\n"))
}

main()