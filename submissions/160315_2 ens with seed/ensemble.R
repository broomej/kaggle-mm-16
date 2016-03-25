#from: 1 and 2
require(data.table)
setwd("submissions/160315_2")
det <- fread("../160314_1/submission.csv")
comp <- fread("../160314_2/submission.csv")
seed <- read.csv("../160315_1 seed/seed.csv")

newPred <- 0.3 * det$Pred + 0.25 * comp$Pred + 0.45 * seed$Pred

submission <- data.frame(Id = det$Id, Pred = newPred)
write.csv(submission, "submission.csv", row.names = FALSE)
setwd("../../")
