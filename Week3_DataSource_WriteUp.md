### Data Source

The data used in our project is collected from Kaggle [https://www.kaggle.com/datasets/jackogozaly/data-science-and-stem-salaries?resource=download]. The Kaggle data itself, consists of 62,00 salary records from top companies. This data was scraped off levels.fyi. This dataset consists of useful information such as education level. compensation (comprised of base salary, bonus, stock grants), race and more. It contains information from the US and other countries. The cleaning process included removing columns that are not necessary for our analysis as well as removing the lines that include data not from the US.

Original data set : Levels_Fyi_Salary_Data.csv

There are 22 columns in the data:

Columns:

timestamp: datetime when the data was recorded.
company: company.
level: what level the observation is at.
title: Role title.
totalyearlycompensation: total yearly compensation.
location: Job location.
yearsofexperience: years of experience.
yearsatcompany: years of experience at said company.
basesalary: base salary.
stockgrantvalue: stock grant value.
bonus: Bonus.
rowNumber: row number.
Masters_Degree: boolean 1 for yes, 0 for no.
Bachelors_Degree: boolean 1 for yes, 0 for no.
Doctorate_Degree: boolean 1 for yes, 0 for no.
Highschool: boolean 1 for yes, 0 for no.
Some_College: boolean 1 for yes, 0 for no.
Race_Asian: boolean 1 for yes, 0 for no.
Race_White: boolean 1 for yes, 0 for no.
Race_Two_Or_More: boolean 1 for yes, 0 for no.
Race_Black: boolean 1 for yes, 0 for no.
Race_Hispanic: boolean 1 for yes, 0 for no.

This columns we divided into two different data sets: salary_data.csv and participant_data.csv

## Data Cleanup

# Cleaning Salary_Data

During the cleanup of the data we were able to load first the salary_data.csv file obtained from kaggle and do an exploration of the information. Reviewed the columns included and discussed which columns were usefull for our project and which were not, as well as any other new columns/clean columns that we would need to generate for easier use of Dasboards and the Machine Learning Model.

First step was to view the data types and verify they were all in the format we needed, as well as counting all the rows of each column that were not null. By doing this we noticed that there were several null values as well as the timestamp column was not in datetime type. We proceeded to clean this buy first adding up all the null values on each column and review if we could replace with "unknown" value or remove that row completely.

![...](/Resources/Images/clean_salary_data.png)

We decided to remove the columns 'tag', 'otherdetails', 'cityid', 'dmaid' and drop the rest of the NA values. This way we ended up with a total of 62,518 values in the clean_salary_data_df. Afterward, we changed the type of the timestamp column to datetime using the .to_datetime module from pandas.

![...](/Resources/Images/clean_salary_datatypes.png)

# Cleaning 'location' column

Next step was to clean up the location column. From the original data set the 'location' column was in the format city,state,country,other and it included cities from different countries in the world. Since we are only looking to use cities from the USA we had to clean the column. To do that we started by using the .split method dividing all the items in the column by the comma "," divisor. This generated four different columns 'city', 'state', 'country', 'extra'. Then we got the unique values from the 'country' column and removed all that were not 'United States'. Did the same with the states, and then droped 'location', 'country', 'extra' columns and were left only with 'city' and 'state' columns. This reduced our data set to 52,746 values.

![...](/Resources/Images/clean_salary_data_country.png)

# Cleaning 'company' column

The company column includes 1000+ different companies but there are some that are written in different formats or names misspelled. First, to clean the format we changede them all to be in upper case. Also remove extra spaces at the beggining, end and between words. After this clean up we ended up with 927 unique companies. 

![...](/Resources/Images/clean_salary_data_company.png)

After cleanup, we exported the clean_salary_data_df to a new csv file called clean_salary_data.csv

# Cleaning Participants_Data

Doing the same import process as for salary_data as well as column review we actually didn't remove the columns that had  a lot of null values instead we changed the null values to say 'unknown' this way that value can actually be used for the Machine Learning Model. None of the other columns needed to be changed, so with that we completed the cleanup of Participants Data and exported to clean_participants_data.csv


