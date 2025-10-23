election <- read.csv("Election2017_Tour1.csv", sep = ";", dec = ".", header = TRUE)
head(election)
summary(election)
str(election)

election$Code.du.departement = as.factor(election$Code.du.departement)


library(dplyr)

data_dep <- election %>%
  group_by(Code.du.departement, Libelle.du.departement) %>%
  summarise(
    Inscrits = sum(Inscrits, na.rm = TRUE),
    Abstentions = sum(Abstentions, na.rm = TRUE),
    Votants = sum(Votants, na.rm = TRUE),
    Blancs = sum(Blancs, na.rm = TRUE),
    Nuls = sum(Nuls, na.rm = TRUE),
    Exprimes = sum(Exprimes, na.rm = TRUE),
    across(starts_with("X."), ~ mean(.x, na.rm = TRUE), .names = "Moy_{.col}")
  )

head(data_dep)