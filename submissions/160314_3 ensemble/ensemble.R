#from: 1 and 2
setwd("submissions/160314_3 ensemble")
det <- fread("../160314_1/submission.csv")
comp <- fread("../160314_2/submission.csv")

newPred <- 0.6 * det$Pred + 0.4 * comp$Pred

submission <- data.frame(Id = det$Id, Pred = newPred)
write.csv(submission, "submission.csv", row.names = FALSE)
setwd("../../")
