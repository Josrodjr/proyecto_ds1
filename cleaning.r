install.packages('stringr')
install.packages('dplyr')


data <- df.otrodf
colnames(data)

# Caps
data$ESTABLECIMIENTO <- apply(data$ESTABLECIMIENTO,2,toupper)
# Spaces
data$ESTABLECIMIENTO <- gsub('\\s+', '', data$ESTABLECIMIENTO)
# ascii
data$ESTABLECIMIENTO <- iconv(data$ESTABLECIMIENTO, from='UTF-8', to="ASCII//TRANSLIT")
str_rep
# special characters
data$ESTABLECIMIENTO <- gsub("[[:punct:]]", "", data$ESTABLECIMIENTO)

# order
data <- data[order(data$ESTABLECIMIENTO)]

# detonate the dashes

data$DIRECTOR <- gsub("-", "", data$DIRECTOR)

filter(data$ESTABLECIMIENTO == "COLEGIOELEMILIO")

data$ESTABLECIMIENTO

write.csv(data, file = "establecimiento.csv")