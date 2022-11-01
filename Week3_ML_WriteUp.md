## Machine Learning Model
### Data Preprocessing
For the initial data preprocessing, we took the combined dataframe titled 'salary_df, and procedeed to complete the following:
- Checked for imbalanced datasets. There were some imbalance (52,746 vs 62,645) between the two datasets that were merged, these imbalances were later handled on by removing rows and columns that were not beneficial for the analysis.
- Created a dataframe with only columns that were relevant to the analysis. The final dataframe included the ''timestamp','company', 'title','totalyearlycompensation', 'yearsofexperience','basesalary','stockgrantvalue','bonus', 'gender', 'Race', and 'Education' columns.
- Initial exploratory analysis by checking and handling missing values.
- Performed a correlation analysis to look for columns with significant correlation and manage them in a way that would reduce changes of prediction leakage.
- Developed scatter plots to analyze trends in the data and boxplot to remove outliers that would affect the performance of the machine learning model.
- Lastly, we further removed other non-beneficiary columns prior to splitting the columns into target and independent variables.
### Model Target and Features
-**Traget**: 'totalyearlycompensation' column.
- **Features**: 'yearsofexperience','basesalary', 'yearsposted', 'title'. Since the 'title' column is categorial, we converted it by using the one-hot encoding scheme and adding dummy data.
### Splitting the dataset
We splitted the dataset into training and testing sets using the 80/20 Pareto principle resulting in a test size of 20%. Additionally, we scaled the data using the StandardScaler model.
### Supervised Machine Learning Model
We used a supervised machine learning model since we are looking to predict the salary value based on a combination of variables. For the analysis we utilized two models a MultiLinear Regression and a Random Forest Regression. Althought the Random Forest Regression is usually used for classification problems, we were able to use it for our salary prediction model to discover the connection between the target and independent variables to determine a continous value.

### Model Evaluation
We evaluated the models based on:
**Explained Variance Score**:
- MuliLinear Regression: 60%
- RandomForest: 73%

**Model Score**:
- MuliLinear Regression: 74%
- RandomForest: 74%

### Limitations of the Model and other considerations
Becasue we were trying to predict the salary value for data science related positions, we were quite limited about the supervised machine leaning models we could used. In addition, because of high correlation between target and features, as well as the presence of multiple vategorical variables, we had to significantly tailor the data for the model to work.
In hindsight, we believe that we could have taken a different approach or included additional analysis by leveraging unsupervised machine learning model to discover different patterns in that data that could have helped us predict if, for example, data science job salaries would increase from the current average. 
