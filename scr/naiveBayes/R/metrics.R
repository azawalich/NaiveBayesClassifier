accuracyScore <- function(predLabels, trueLabels) {
  #' @title accuracyScore
  #' @description Calculates accuracy for the given set of predicted labels and ground truth labels.
  #' @param predLabels predicted labels
  #' @param trueLabels true labels
  #' @return Accuracy score value
  #' @export accuracyScore

  # TODO (tbochenski): popraw definicje argumentow bo na czuja napisalem (azawalich)
  labTable <- table(predLabels, trueLabels)
  diagTable <- diag(nrow(labTable)) * labTable
  
  return(sum(diagTable) / sum(labTable))
}