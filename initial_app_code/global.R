#Code to start from


# global.R file is run only once when the app is initially opened
# This is a good place to put any libraries needed or objects that won't change based on user inputs

#loading packages
library(shiny)
library(dplyr)
library(ggplot2)
library(RColorBrewer)
library(shinythemes)
library(kableExtra)
library(lubridate)

#reading in csv files
march2022 = read.csv("march2022_clean.csv")
april2022 = read.csv("april2022_clean.csv")
may2022 = read.csv("may2022_clean.csv")
june2022 = read.csv("june2022_clean.csv")

#adding month column to data frames being used
march2022$Month = "March"
april2022$Month = "April"
may2022$Month = "May"
june2022$Month = "June"

#binding all months into one data frame
spring2022 = rbind(march2022, april2022, may2022, june2022)

#Combining 'Other' categories & removing 'Credit' Column
spring2022 = subset(spring2022, select = -c(Credit)) %>%
  mutate(Category = ifelse(Category == "Other Services","Other",Category)) %>%
  mutate(Category = ifelse(Category == "Other Travel","Other",Category))

#Cleaning up column names
colnames(spring2022) = c("Transaction Date","Posted Date", "Card No.", "Description", "Category",
                         "Debit", "Month")

#pie chart without filtering data
piechart = ggplot(spring2022, aes(x="", y=Debit, fill=Category)) +
  geom_bar(stat="identity", width=1, color="white") +
  scale_fill_manual(values = c("#f38444","#1c3464","#dedde0","#8c9cb4", "#6d6b7c", "#445c84")) +
  coord_polar("y", start=0) +
  theme_void()

#spend chart over time without average line
spend_chart = spring2022 %>%
  mutate(`Transaction Date` = as.Date(`Transaction Date`)) %>%
  select(`Transaction Date`, Debit) %>%
  group_by(`Transaction Date`) %>%
  summarise(Spent = sum(Debit)) %>%
  ungroup() %>%
  filter(!is.na(Spent)) %>%
  ggplot() +
  geom_line(aes(x = `Transaction Date`, y = Spent), color = "#f38444", size=1) +
  geom_point(aes(x = `Transaction Date`, y = Spent), color = "#f38444", size=1) +
  ylab("Money Spent ($)") +
  xlab("Transaction Date") +
  theme_classic() +
  theme(panel.background = element_rect(fill = "#fcfcfc"),
        plot.background = element_rect(fill = "#fcfcfc"),
        axis.text = element_text(size = 18),
        axis.title.x = element_text(size = 18, margin = margin(t = 20, r = 0, b = 0, l = 0)),
        axis.title.y = element_text(size = 18, margin = margin(t = 0, r = 20, b = 0, l = 0)))

#spend chart over time with average line
spend_chart_avg = spring2022 %>%
  mutate(`Transaction Date` = as.Date(`Transaction Date`)) %>%
  select(`Transaction Date`, Debit) %>%
  group_by(`Transaction Date`) %>%
  summarise(Spent = sum(Debit)) %>%
  ungroup() %>%
  filter(!is.na(Spent)) %>%
  ggplot() +
  geom_line(aes(x = `Transaction Date`, y = Spent), color = "#f38444", size=1) +
  geom_point(aes(x = `Transaction Date`, y = Spent), color = "#f38444", size=1) +
  ylab("Money Spent ($)") +
  xlab("Transaction Date") +
  theme_classic() +
  theme(panel.background = element_rect(fill = "#fcfcfc"),
        plot.background = element_rect(fill = "#fcfcfc"),
        axis.text = element_text(size = 18),
        axis.title.x = element_text(size = 18, margin = margin(t = 20, r = 0, b = 0, l = 0)),
        axis.title.y = element_text(size = 18, margin = margin(t = 0, r = 20, b = 0, l = 0))) +
  geom_hline(yintercept = sum(spring2022$Debit)/(sum(days_in_month(match(unique(spring2022$Month), month.name)))), color = "#1c3464", size = 1)

