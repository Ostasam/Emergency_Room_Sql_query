You task is to build dashboard for Hospitals in order to monitor their patient traffic in Emergency Room

Here are some questions to answer

Select * from [Hospital ER]

-----1. Total no of people visiting the emergency room--

Select Count(*) As Totalvisit From [Hospital ER]


-----2. No of patients by gender-------

Select Patient_gender As gender,
Count(*) AS number_of_patient 
From [Hospital ER]
Group by patient_gender


----3. Average waiting time by month-----
Select DATEPART (Year, Date) As Year,
DATEPART (Month, Date) As Month,
AVG(patient_waittime) As Average_Waittime
From [Hospital ER]
Group By DATEPART(Year,Date), DATEPART (Month,Date) 
Order By Year,Month;


----4. Average patient satisfaction by month-----
Select DATEPART (Year, Date) As Year,
DATEPART (Month, Date) As Month,
AVG(patient_sat_score) As Average_Satisfaction
From [Hospital ER]
Group By DATEPART(Year,Date), DATEPART (Month,Date) 
Order By Year,Month;



-----5. No of Patients by Age in ER-----
Select AgeGroup,
Count(distinct patient_id)
From [Hospital ER]
group by AgeGroup
Order by AgeGroup;

----6. No of patients by department referral-----
Select department_referral,
count (distinct patient_id) As no_of_patient
From [Hospital ER]
group by department_referral
order by department_referral;

----7. No of patients by race----
select patient_race,
count(*) As no_of_patient 
From [Hospital ER]
group by patient_race;


---6. No of patients by week day----

select 
DATENAME(WEEKDAY, [date]) As Weekday,
Count(*) As no_of_patients
From [Hospital ER] 
group by DATENAME(WEEKDAY, [date])
order by MIN(date);


----7.No of patients by time----
Select 
Datepart(Hour, [date]) As hour,
Datepart(minute,[date]) As minute,
Count(*) As no_of_patients
From [Hospital ER]
group by datepart(hour, [date]), datepart(minute, [date])
order by hour,minute;