
start.time <- proc.time()

test <- data.frame()
# r <- games.to.predict[1,]
for(i in 1:nrow(games.to.predict)){
    r <- games.to.predict[i, ]
    teams <- c(r$team.1, r$team.2)
    t1 <- min(teams)
    t2 <- max(teams)
    

    
    seed.1 <- filter(TourneySeeds, Season==r$Season, Team==t1)$SeedNum
    seed.2 <- filter(TourneySeeds, Season==r$Season, Team==t2)$SeedNum
    match.summary <- data.frame(Id = r$Id, seed.1 = seed.1, seed.2 = seed.2, team.1 = t1, team.2 = t2)
    test <- rbind(test, match.summary)
}
proc.time() - start.time

test$r.diff <- test$seed.2 - test$seed.1

test$Pred <- 0.5 + test$r.diff * 0.028 # slightly more conservative estimate from optimized seed benchmark
test <- select(test, Id, Pred)
