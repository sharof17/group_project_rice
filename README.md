# Salary Prediction Tool for U.S-Based Data Science Roles
## Presentation 
The presentation of the project (Goolge Slides) may be viewed [_HERE_](https://docs.google.com/presentation/d/1o7syC-JQvpaDmpmmhXB38SU9FxZwpta29gZYVwcWoh4/edit?usp=sharing).

## Project Overview

### Team
- Cristian Llanes (Square Role)
- Maria Sevillano (Triangle Role)
- Alejandra Villarreal (Circle Role)
- Sharof Abdoollayev (X Role)

### Objective
The purpose of this project is to build a resource for job-seekers to predict the salary of a given career field, Data Science, based on set variables. By doing so, we hope to help potential job-seekers:
- Answer the  **"What Are Your Salary Expectations?"** question that a hiring manager might pose during an interview process.
- Determine if they should accept or decline a job offer.

Moreover, this tool could also:
- Help current data scientist practicioners understand if their salary is within the expected range and, therefore, help them negotiate for better total compensation.
- Aide those who are thinking about joining the Data Science field by shinning a light into the potential and expected salaries for entry-level jobs.
- Understand salary expectation differences based on different factors including: location, company size, skill set, etc.

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

### Cleaning Salary_Data

During the cleanup of the data we were able to load first the salary_data.csv file obtained from kaggle and do an exploration of the information. Reviewed the columns included and discussed which columns were usefull for our project and which were not, as well as any other new columns/clean columns that we would need to generate for easier use of Dasboards and the Machine Learning Model.

First step was to view the data types and verify they were all in the format we needed, as well as counting all the rows of each column that were not null. By doing this we noticed that there were several null values as well as the timestamp column was not in datetime type. We proceeded to clean this buy first adding up all the null values on each column and review if we could replace with "unknown" value or remove that row completely.

![...](/Resources/Images/clean_salary_data.png)

We decided to remove the columns 'tag', 'otherdetails', 'cityid', 'dmaid' and drop the rest of the NA values. This way we ended up with a total of 62,518 values in the clean_salary_data_df. Afterward, we changed the type of the timestamp column to datetime using the .to_datetime module from pandas.

![...](/Resources/Images/clean_salary_datatypes.png)

#### Cleaning 'location' column

Next step was to clean up the location column. From the original data set the 'location' column was in the format city,state,country,other and it included cities from different countries in the world. Since we are only looking to use cities from the USA we had to clean the column. To do that we started by using the .split method dividing all the items in the column by the comma "," divisor. This generated four different columns 'city', 'state', 'country', 'extra'. Then we got the unique values from the 'country' column and removed all that were not 'United States'. Did the same with the states, and then droped 'location', 'country', 'extra' columns and were left only with 'city' and 'state' columns. This reduced our data set to 52,746 values.

![...](/Resources/Images/clean_salary_data_country.png)

#### Cleaning 'company' column

The company column includes 1000+ different companies but there are some that are written in different formats or names misspelled. First, to clean the format we changede them all to be in upper case. Also remove extra spaces at the beggining, end and between words. After this clean up we ended up with 927 unique companies. 

![...](/Resources/Images/clean_salary_data_company.png)

After cleanup, we exported the clean_salary_data_df to a new csv file called clean_salary_data.csv

### Cleaning Participants_Data

Doing the same import process as for salary_data as well as column review we actually didn't remove the columns that had  a lot of null values instead we changed the null values to say 'unknown' this way that value can actually be used for the Machine Learning Model. None of the other columns needed to be changed, so with that we completed the cleanup of Participants Data and exported to clean_participants_data.csv

## Technologies Used
#### Data Cleaning and Analysis
Pandas will be used to clean the data and perform an exploratory analysis. Further analysis will be completed using other native Python tools. 
#### Database Storage
Postgres will be used as a database via Amazon AWS for its reliability in data integrity and visualization tools. 
#### Machine Learning
SciKitLearn will be the ML library we will be using for classification, regression, and clustering. 
#### Dashboard
As an interactive dashboard, we intend to use Tableau to visualize our results.

## Dashboard
- Use of Tableau charts to represent data.
- Interactable options to manipulate data such as filters actions, highlight actions, etc. 
- There will be a Tableau story that will outline the purpose of the project through visualized data.
- ML data will be provided as part of the dashboard presentation.

Dashboard Link: [_Click Here_](https://public.tableau.com/views/SalaryPredictionToolCharts/Story1?:language=en-US&:display_count=n&:origin=viz_share_link)

### Questions Data Set Will Answer
1. Will salary for Data Science jobs continue to experience growth in the future?
2. Based on the selected set of variables, what is the expected salary range?
3. Determine salary trends based on specific factors.

## Machine Learning Model
### Data Preprocessing
For the initial data preprocessing, we took the cleaned version of the excel datasets from Kaggle and joined them into one dataframe titled 'salary_df.

![Initial Data](https://github.com/cllanesgit/GroupProject/blob/main/Resources/Images/Initial%20Dataset.png)

As seen above, the initial dataset contains several numerical and categorical columns, some of which are not beneficiary to the analysis. Therefore, we proceeded to complete the following:
- Checked for imbalanced datasets. There was a minor difference between non-null value counts (52,756 vs. 52,746). No actions were taken since there is still some more data preprocessing to complete.
- Created a data frame with only relevant columns to the analysis. The final dataframe included the ''timestamp','company', 'title','totalyearlycompensation', 'yearsofexperience','basesalary','stockgrantvalue','bonus', 'gender', 'Race', and 'Education' columns.
- Removed rows where the value of base salary was equal to $0 since that is something unlikely to be true. Furthermore, we filtered the dataframe to only show information for jobs related to Data Scientist and Analyst, which were relevant to our analysis.
- Developed scatter plots to analyze trends in the data and boxplots to remove outliers that would affect the machine learning model's performance. Below is an example of the boxplot analysis before and after removing the outliers.

Before:

![BeforeOutliers](https://github.com/cllanesgit/GroupProject/blob/main/Resources/Images/Outliers.png)

After:

![AfterOutliers](https://github.com/cllanesgit/GroupProject/blob/main/Resources/Images/Outliers%20Removed.png)

- Performed a correlation analysis to look for columns with significant correlation and manage them in a way that would reduce the chances of prediction leakage.

![Correlation](https://github.com/cllanesgit/GroupProject/blob/main/Resources/Images/Final%20Correlation%20Graph.png)

- Lastly, we removed other non-beneficiary columns before splitting the columns into the target and independent variables.

![Final Dataset](https://github.com/cllanesgit/GroupProject/blob/main/Resources/Images/Final%20Dataset.png)

### Model Target and Features
- **Target**: 'totalyearlycompensation' column.
- **Features**: 'yearsofexperience','base salary, 'yearsposted', 'title'. Since the 'title' column is categorial, we converted it using the one-hot encoding scheme and added dummy data.
### Splitting the dataset
We split the dataset into training and testing sets using the 80/20 Pareto principle resulting in a test size of 20%. Since we had a large dataset of over 2,700  for our model, we felt comfortable with this approach. Additionally, we scaled the data using the StandardScaler model.
### Supervised Machine Learning Model
We used a supervised machine learning model since we were looking to predict the salary value based on a combination of variables. For the analysis, we utilized two models a MultiLinear Regression and a Random Forest Regression. Although the Random Forest is usually used for classification problems, we used it for our salary prediction model to discover the connection between the target and independent variables to determine a continuous value.

### Model Evaluation
We evaluated the models based on the following:

**Explained Variance Score**:
- MultiLinear Regression: 60%
- RandomForest: 73%

**Model Score**:
- MultiLinear Regression: 74%
- RandomForest: 74%

**Residual Plots**:
-MultiLinear Regression

![MultiLinear](https://github.com/cllanesgit/GroupProject/blob/main/Resources/Images/MLR_Residual.png)

-RandomForest:

![RandomForest](https://github.com/cllanesgit/GroupProject/blob/main/Resources/Images/RandomForest_Residual.png)

### Limitations of the Model and other considerations
Because we were trying to predict the salary value for data science-related positions, we were pretty limited in the supervised machine learning models we could use. In addition, because of the high correlation between the target and features and the presence of multiple categorical variables, we had to tailor the data for the model to work significantly.
**Limitations and Benefits:**
The Multiliner Regression was simple to set up and implement. However, this model is susceptible to overfitting. We used different reduction techniques to eliminate the chances of prediction leakage. However, we couldn't use more independent variables in our analysis.
The Random Forest Regressor was flexible enough for this analysis and helped us avoid overfitting. The advantage is visible when comparing the score of both models. However, the model is susceptible to data trends. So it is unclear if the model's performance will decrease as we expand our initial dataset.
