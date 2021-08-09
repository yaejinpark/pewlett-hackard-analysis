# Pewlett Hackard Analysis - Berkeley DA
Yae Jin Park\
Module 7: Employee Database with SQL

## Assignment Overview

Becoming familiar with relational databases and how to write queries to combine/separate data in tables was the main purpose of this project.
By filtering and joining multiple tables I created via pgAdmin, my goal is to find employee data in Pewlett Hackard's database in order to find soon-to-retire employees and to find a solution for this 'silver tsunami.'

## Retirement Titles and Unique Titles - Deliverable 1
The following screenshots show the queries written to obtain three csv tables - retirement_titles, unique_titles and retiring_titles.
NOTE: The screenshots of the tables do not show the entire table. Please refer to the csv files located in the 'Data' folder of this project.

* ![Queries](https://github.com/yaejinpark/pewlett-hackard-analysis/blob/main/Resources/deliverable%201%20queries.png)

* ![Retirement Titles](https://github.com/yaejinpark/pewlett-hackard-analysis/blob/main/Resources/retirement_titles.png)

* ![Unique Titles](https://github.com/yaejinpark/pewlett-hackard-analysis/blob/main/Resources/unique_titles.png)

* ![Retiring Titles](https://github.com/yaejinpark/pewlett-hackard-analysis/blob/main/Resources/retiring_titles.png)

These three tables were created in this order to first find the employees of retirement age (retirement titles), filter out repeating employees due to change in title (unique titles) and find the final count of each retirees in each unique title.

## Mentorship Eligibility - Deliverable 2

The following screenshots show the query written to obtain the table of employees that are eligible for mentorship and the table itself exported as a csv file. Please refer to the mentorship_eligibility.csv for full data as the screenshot does not show the full table.

* ![D2 Query](https://github.com/yaejinpark/pewlett-hackard-analysis/blob/main/Resources/deliverable%202%20queries.png)

* ![Mentorship Eligibility](https://github.com/yaejinpark/pewlett-hackard-analysis/blob/main/Resources/mentorship%20eligibility.png)

## Summary

### How many roles will need to be filled as the "silver tsunami" begins to make an impact?
This question can be answered by looking at the count of retirees in each title from retiring_titles.csv. The title with the largest number of retirees is 'Senior Engineer' with 29,414 employees soon to retire, and the smallest is 'Manager' with 2 soon-to-retire employees. The total count of the retirees came to a whopping 90,398 in total. This is the same number of roles that need to be filled by either existing employees or with by new hires. The next step is to find out first how many current employees can be mentored to take these roles and see if new hires are needed.

### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
Looking at the mentorship eligibility table, there are quite a few employees though it's uncertain if there are enough. Counting those who were born between January 1, 1965 and December 31, 1965 and grouping the counts into their titles, I was able to obtain the following result:

![Not Enough People](https://github.com/yaejinpark/pewlett-hackard-analysis/blob/main/Resources/not_enough_people.png)

Unfortunately, the number of currently eligible employees are not even close to fill the empty roles to be left by the 'silver tsunami.' It looks like Pewlett Hackard will have to go through a major hiring season.