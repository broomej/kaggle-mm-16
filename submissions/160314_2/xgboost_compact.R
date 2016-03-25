require(xgboost)
require(Metrics)
dtrain <- xgb.DMatrix(data = data.matrix(train), label = train$outcome)

param <- list( ## from https://www.kaggle.com/anokas/march-machine-learning-mania-2016/xgboost-optimised-forest-0-590466/code
  eta = 0.007,
  max_depth = 10,
  objective = "binary:logistic", 
  eval_metric = "logloss",
  colsample_bytree = 0.21,
  min_child_weight = 8,
  max_delta_step = 1,
  lambda = 0.9,
  alpha = 0.05,
  gamma = 1,
  base_score = 0.37, # Bias for final score
  subsample = 0.8
)


# set.seed(209)
# xgb.model.cv <- xgb.cv(
#     params = param,
#     data = dtrain,
#     nrounds = 889, # Optimum n. of rounds
#     nfold = 10,    # CV folds - ****increase when doing local testing****
#     verbose = 1,
#     maximize = FALSE,
#     prediction = TRUE
#   )


dtest <- xgb.DMatrix(data=data.matrix(select(test, -outcome))) 

set.seed(209)
xgb.model.test <- xgb.train(
  params = param,
  data = dtrain,
  nrounds = 450, #490 yields 629
  verbose = 1,
  maximize = TRUE
)

set.seed(209)
test$outcome <- predict(xgb.model.test, dtest)

submission <- data.frame(Id = paste(test$Season, test$team.1, test$team.2, sep = "_"), Pred = test$outcome)

today <- Sys.Date()
y <- format(today, format="%y")
m <- format(today, format="%m")
d <- format(today, format="%d")

path <- paste("submissions/", y, m, d, "_", n, "/submission.csv", sep = "")

write.csv(submission, path, row.names=FALSE)
n <- n+1
