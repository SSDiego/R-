cces <- read_csv("cces_sample_coursera.csv.csv")
class(cess)
vignette("tibble")

## switching back

# as.data.frame
# as_tibble

cces <- drop_na(cces)

woman <- filter(cess, gender == 2)

dim(cces)
dim(women)

table(cces$gender)

women$gender

republican_women <- filter(cces, gender==2 & pid7>4)

dim(republican_women)

table(republican_women$pid7)

republican_women$gender
republican_women$pid7

head(republican_women)


select(republican_women, "educ", "employ")

women_republicans_educ_employ <- cces %>% filter(gender==2 & pid7>4) %>% select("educ", "employ")


##recode

party <- recode(cces$pid7, '1' = "Democrat", '2' = "Democrat", '3' = "Democrat", '4' = "Independent", '5' = "Republican", '6' = "Republican", '7' = "Republican")

