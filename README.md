# kaggle-mm-16
My submission to the (Kaggle March Machine Learning Mania 2016 contest)[https://www.kaggle.com/c/march-machine-learning-mania-2016]

I used regular season statistic summaries to predict tournament performance. Kaggle provides detailed regular season results from 2003 to present, and compact results from 1985 to present. I used xgboost to train on previous years; "bracket1.csv" is predictions from averaging the detailed model and compact model with 60/40 weights; and "bracket2.csv" is predictions from averaging those predictions with a simple model that picks the higher seeded team (see /submission/160315_1 seed/seed.R for the formula)

Part way through the Sweet 16, my 2nd model has a logloss score of about 0.59