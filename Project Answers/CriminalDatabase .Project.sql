-----------------------------------------------------------------------
--South Africa Criminal Database - 30 SQL Questions (Questions Only)
-----------------------------------------------------------------------

/*1. Display all records from the CriminalCases table.*/
SELECT * fROM south_africa_criminal_database;


/*2. Count the total number of cases in the table.*/
select Count(CaseNumber) AS total_number_of_Cases
From south_africa_criminal_database;

/*3. Count the number of cases in each province.*/
Select Province,
      Count(CaseNumber)AS Number_of_cases_per_province
From south_africa_criminal_database
Group By Province
Order by  Number_of_cases_per_province DESC;


/*4. Retrieve all cases where the crime type is Fraud.*/
Select CaseNumber
From south_africa_criminal_database
where CrimeType = 'Fraud';

/*5. Count the number of cases for each crime type.*/
SELECT CrimeType, COUNT(CaseNumber) AS CASE_COUNT
FROM south_africa_criminal_database
GROUP BY CrimeType;

/*6. Display all cases classified as High or Critical risk.*/
Select CrimeType, RiskLevel
From south_africa_criminal_database
Where RiskLevel = 'High'
OR RiskLevel ='Critical risk';


/*7. Calculate the average Financial Score of all suspects.*/
Select AVG(FinancialScore) AS Avg_Financial_Score
From south_africa_criminal_database;


/*8. Find the highest Estimated Fraud Amount recorded.*/
Select Max(EstimatedFraudAmount_ZAR) AS highest_estimated_fraud_amount
From south_africa_criminal_database;


/*9. Retrieve the top 10 cases with the highest Estimated Fraud Amount.*/

SELECT TOP 10 *
FROM south_africa_criminal_database
ORDER BY EstimatedFraudAmount_ZAR DESC;


/*10. Display all cases where the suspect was arrested.*/
Select *
From south_africa_criminal_database
Where Arrested = 1;


/*11. Count how many suspects were arrested versus not arrested.*/

SELECT 
    SUM(CASE WHEN Arrested = 1 THEN 1 ELSE 0 END) AS suspect_arrested,
    SUM(CASE WHEN Arrested = 0 THEN 1 ELSE 0 END) AS suspect_not_arrested
FROM south_africa_criminal_database;


/*12. Count the number of cases associated with each bank.*/
Select Count(CaseNumber) ,
       BankInvolved
From south_africa_criminal_database
Group by BankInvolved;

/*13. Calculate the total Estimated Fraud Amount per province.*/
Select Province,
      Sum(EstimatedFraudAmount_ZAR) Total_fraud_Amount_per_province
From south_africa_criminal_database
Group By Province;

/*14. Retrieve all suspects older than 50 years.*/
Select FirstName, LastName
From south_africa_criminal_database
Where Age > 50;

/*15. Calculate the average age of suspects per province.*/
Select Province,
       AVG(Age) AS average_age_of_suspect
From south_africa_criminal_database
Group by Province;


/*16. Display all cases recorded from 2020 onwards.*/
Select *
From south_africa_criminal_database
Where CrimeDate >= '2020-01-01';


/*17. Count how many cases resulted in a Convicted status.*/

Select Count(RecordID) AS Case_Convicted
from south_africa_criminal_database
Where CaseStatus = 'Convicted';

/*18. Retrieve all suspects with more than three previous offenses.*/
SELECT FullName,PreviousOffenses
FROM south_africa_criminal_database
Where PreviousOffenses >3;

/*19. Show the distribution of cases by Risk Level.*/
SELECT RiskLevel,
       COUNT(*) AS total_cases
FROM south_africa_criminal_database
GROUP BY RiskLevel
ORDER BY total_cases DESC;


/*20. Calculate the total Estimated Fraud Amount across all cases.*/
 Select Sum(Cast(EstimatedFraudAmount_ZAR AS bigint)) AS total_estimated_fraud_Amount
 From south_africa_criminal_database


/*21. Identify the province with the highest number of cases.*/
Select Top 1 Province,
  Count(*) AS Record_Count
From south_africa_criminal_database
Group By Province
Order By Record_count DESC;

/*22. Retrieve the youngest suspect in the dataset.*/
Select Top 1 Age
From south_africa_criminal_database
Order By Age ASC;


/*23. Retrieve the oldest suspect in the dataset.*/
Select top 1 Age
From south_africa_criminal_database
Order  By Age DESC;



/*24. Count the number of cases handled by each investigating officer.*/
Select Count(*) As total_Case_handled,
       InvestigatingOfficer
From south_africa_criminal_database
Group By InvestigatingOfficer;


/*25. Calculate the average Estimated Fraud Amount per crime type.*/
Select CrimeType,
     AVG(EstimatedFraudAmount_ZAR) AS average_Estimated_fraud_amount
From south_africa_criminal_database
Group By CrimeType;


/*26. Display all cases occurring in Gauteng province.*/
Select *
From south_africa_criminal_database
Where Province = 'Gauteng';


/*27. Retrieve all Fraud cases classified as High risk.*/
Select *
From south_africa_criminal_database
Where CrimeType = 'Fraud' 
  And Risklevel = 'High Risk';



/*28. Count the number of cases per year based on CrimeDate.*/

SELECT YEAR(CrimeDate) AS Crime_Year,
       COUNT(*) AS Cases_Count
FROM south_africa_criminal_database
GROUP BY YEAR(CrimeDate)
ORDER BY Crime_Year ASC;


/*29. Display all suspects with a Financial Score below 500.*/
Select FullName, FinancialScore
From south_africa_criminal_database
Where FinancialScore < 500;


/*30. Identify the most common Crime Type in the dataset.*/

SELECT TOP 1 CrimeType,
       COUNT(*) AS TotalCases
FROM south_africa_criminal_database
GROUP BY CrimeType
ORDER BY TotalCases DESC;