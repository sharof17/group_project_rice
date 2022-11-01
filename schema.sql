--Drop table salary_data
--Drop table participants_data

-- Create Salary Data table
CREATE TABLE salary_data (
  responseid TEXT PRIMARY KEY NOT NULL,
  _c0 TEXT,
  timestamp DATE,
  company TEXT,
  level TEXT,
  title TEXT,
  totalyearlycompensation INT,
  yearsofexperience FLOAT,
  yearsatcompany FLOAT,
  basesalary INT,
  stockgrantvalue FLOAT,
  bonus FLOAT,
  rowNumber INT,
  city TEXT,
  state TEXT
);


CREATE TABLE participants_data (
  responseid TEXT PRIMARY KEY NOT NULL,
  _c0 TEXT,
  timestamp TEXT,
  gender TEXT,
  otherdetails TEXT,
  Masters_Degree TEXT,
  Bachelors_Degree TEXT,
  Doctorate_Degree TEXT,
  Highschool TEXT,
  Some_College TEXT,
  Race_Asian TEXT,
  Race_White TEXT,
  Race_Two_Or_More TEXT,
  Race_Black INT,
  Race_Hispanic TEXT,
  Race TEXT,
  Education TEXT,
  rowNumber TEXT
);
  
  
  
  
  