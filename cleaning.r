install.packages('stringr')
install.packages('dplyr')


data <- df.otrodf
colnames(data)

# Caps
data$ESTABLECIMIENTO <- apply(data$ESTABLECIMIENTO,2,toupper)
# ascii
data$ESTABLECIMIENTO <- iconv(data$ESTABLECIMIENTO, from='UTF-8', to="ASCII//TRANSLIT")
str_rep
# special characters
data$ESTABLECIMIENTO <- gsub("[[:punct:]]", "", data$ESTABLECIMIENTO)
# Spaces
data$ESTABLECIMIENTO <- gsub('\\s+', '_', data$ESTABLECIMIENTO)

# ------------------------------------------------------------------------
# Caps
data$STATUS <- apply(data$STATUS,2,toupper)
# ascii
data$STATUS <- iconv(data$STATUS, from='UTF-8', to="ASCII//TRANSLIT")
str_rep
# special characters
data$STATUS <- gsub("[[:punct:]]", "", data$STATUS)
# Spaces
data$STATUS <- gsub('\\s+', '_', data$STATUS)

# ------------------------------------------------------------------------
# Caps
data$PLAN <- apply(data$PLAN,2,toupper)
# ascii
data$PLAN <- iconv(data$PLAN, from='UTF-8', to="ASCII//TRANSLIT")
str_rep
# special characters
data$PLAN <- gsub("[[:punct:]]", "", data$PLAN)
# Spaces
data$PLAN <- gsub('\\s+', '_', data$PLAN)

# ------------------------------------------------------------------------
# Caps
data$MODALIDAD <- apply(data$MODALIDAD,2,toupper)
# ascii
data$MODALIDAD <- iconv(data$MODALIDAD, from='UTF-8', to="ASCII//TRANSLIT")
str_rep
# special characters
data$MODALIDAD <- gsub("[[:punct:]]", "", data$MODALIDAD)
# Spaces
data$MODALIDAD <- gsub('\\s+', '_', data$MODALIDAD)

# ------------------------------------------------------------------------
# Caps
data$JORNADA <- apply(data$JORNADA,2,toupper)
# ascii
data$JORNADA <- iconv(data$JORNADA, from='UTF-8', to="ASCII//TRANSLIT")
str_rep
# special characters
data$JORNADA <- gsub("[[:punct:]]", "", data$JORNADA)
# Spaces
data$JORNADA <- gsub('\\s+', '_', data$JORNADA)

# ------------------------------------------------------------------------
# Caps
data$DEPARTAMENTO <- apply(data$DEPARTAMENTO,2,toupper)
# ascii
data$DEPARTAMENTO <- iconv(data$DEPARTAMENTO, from='UTF-8', to="ASCII//TRANSLIT")
str_rep
# special characters
data$DEPARTAMENTO <- gsub("[[:punct:]]", "", data$DEPARTAMENTO)
# Spaces
data$DEPARTAMENTO <- gsub('\\s+', '_', data$DEPARTAMENTO)


# STATUS, PLAN, MODALIDAD, JORNADA, ESTABLECIMIENTO, DEPARTAMENTO
# new column
data$IDENTIFIER <- paste(data$ESTABLECIMIENTO, '|', data$STATUS, '|', data$PLAN, 
                         data$MODALIDAD, '|', data$JORNADA, '|', data$ESTABLECIMIENTO,
                         '|', data$DEPARTAMENTO)

# order
data <- data[order(data$IDENTIFIER)]


data$ESTABLECIMIENTO

write.csv(data, file = "establecimiento.csv")

