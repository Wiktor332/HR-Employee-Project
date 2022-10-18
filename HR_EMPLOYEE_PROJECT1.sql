select * from hr_employee
where Department = 'Research & Development'


--Research&Development--

--How many females and males are employed in R&D?
select gender, count(gender) as number_of_employees 
from hr_employee
where Department = 'Research & Development'
group by Gender;

--How many females and males are employed in R&D in %?
 select 
    100*sum(case when gender = 'male' then 1 else 0 end)/count(gender) as male_percentage,
    100*sum(case when gender = 'female' then 1 else 0 end)/count(gender) as female_percentage
from hr_employee
 where Department = 'Research & Development'
 
--Who makes on average more money in R&D department males or females? 
select gender, avg(monthlyincome) as average_income
from hr_employee
where Department = 'Research & Development'
group by Gender

--Does education level correlates with average income?
--education levels (1-Below Collage, 2-Collage, 3-Bachelor, 4-Master, 5-Doctor)
select education, avg(monthlyincome) as average_income, 
case 
    when education = 1 then 'Below Collage'
    when Education = 2 then 'Collage'
    when Education = 3 then 'Bachelor'
    when Education = 4 then 'Master'
    when Education = 5 then 'Doctor'
    else null end as level_of_education
from hr_employee
where Department = 'Research & Development'
group by education 
order by education desc;
--COMMENT--
--It seems that there is a correlation between education level and average income. highest salary receive people who finished Master studies and are Doctors

--Does years of experience correlate with average income?
with cte1 as (select hr.monthlyincome, 
case 
    when hr.totalworkingyears < 10 then 'very little experience'
    when hr.totalworkingyears >= 10 and hr.totalworkingyears <= 20 then 'small experience'
    when hr.totalworkingyears > 20 and hr.totalworkingyears < 30 then 'medium experience'
    when hr.totalworkingyears >= 30 and hr.totalworkingyears <= 40 then 'high experience'
        else null end as level_of_experience
from hr_employee as hr
WHERE Department = 'Research & Development'
group by totalworkingyears, hr.MonthlyIncome)

select c1.level_of_experience, avg(c1.monthlyincome) as average_income
from cte1 as c1
group by c1.level_of_experience
order by c1.level_of_experience desc
--COMMENT--
--It seems that people with medium experience receive on average higher salary than those with high experience


--Depending on the R&D department, what is the job role that makes on average the most money?
select jobrole, avg(monthlyincome) as average_income
from hr_employee
where Department = 'Research & Development'
group by JobRole
order by average_income DESC

--What is the number of males and females working in specified role and how much money do they make on average?
select jobrole, gender, count(gender) as gender_count, avg(monthlyincome) as average_income
from hr_employee
where Department = 'Research & Development'
group by JobRole, gender
order by JobRole
--COMMENT--
--It seems that males receive higher salaries than females on average in fields such as: Healthcare Representative, Manager and Research Director
--On the other hand females receive higher salaries than males on average in fields such as: Laboratory Technician, Manufacturing Director and Research Scientist


select * from hr_employee
where Department = 'Human Resources'


--HUMAN RESOURCES--

--How many females and males are employed in HR?
select gender, count(gender) as number_of_employees 
from hr_employee
where Department = 'Human Resources'
group by Gender;

--How many females and males are employed in HR in %?
select 
    100*sum(case when gender = 'male' then 1 else 0 end)/count(gender) as male_percentage,
    100*sum(case when gender = 'female' then 1 else 0 end)/count(gender) as female_percentage
from hr_employee
 where Department = 'Human Resources'

--Who makes on average more money in HR department males or females? 
select gender, avg(monthlyincome) as average_income
from hr_employee
where Department = 'Human Resources'
group by Gender

--Does education level correlates with average income?
--education levels (1-Below Collage, 2-Collage, 3-Bachelor, 4-Master, 5-Doctor)
select education, avg(monthlyincome) as average_income, 
case 
    when education = 1 then 'Below Collage'
    when Education = 2 then 'Collage'
    when Education = 3 then 'Bachelor'
    when Education = 4 then 'Master'
    when Education = 5 then 'Doctor'
    else null end as level_of_education
from hr_employee
where Department = 'Human Resources'
group by education 
order by education desc;
--COMMENT--
--It seems that people with Master studies finished earn much more money on average than people with different levels of education

--Does years of experience correlate with average income?
with cte1 as (select hr.monthlyincome, 
case 
    when hr.totalworkingyears < 10 then 'very little experience'
    when hr.totalworkingyears >= 10 and hr.totalworkingyears <= 20 then 'small experience'
    when hr.totalworkingyears > 20 and hr.totalworkingyears < 30 then 'medium experience'
    when hr.totalworkingyears >= 30 and hr.totalworkingyears <= 40 then 'high experience'
        else null end as level_of_experience
from hr_employee as hr
WHERE Department = 'Human Resources'
group by totalworkingyears, hr.MonthlyIncome)

select c1.level_of_experience, avg(c1.monthlyincome) as average_income
from cte1 as c1
group by c1.level_of_experience
order by c1.level_of_experience desc
--COMMENT--
--It seems that people with medium and high experience receive much more money on average than people with small and very little experience


--Depending on the HR department, what is the job role that makes on average the most money?
select jobrole, avg(monthlyincome) as average_income
from hr_employee
where Department = 'Human Resources'
group by JobRole
order by average_income DESC
--COMMENT--
--It is not a suprise that people working in a role of Manager have much higher salary on average than people working in HR

--What is the number of males and females working in specified role and how much money do they make on average?
select jobrole, gender, count(gender) as gender_count, avg(monthlyincome) as average_income
from hr_employee
where Department = 'Human Resources'
group by JobRole, gender
order by JobRole
--COMMENT--
--Both on the Manager and HR positions, females receive on average higher salary than males

select * from hr_employee
where Department = 'Sales'

--SALES--

--How many females and males are employed in Sales?
select gender, count(gender) as number_of_employees 
from hr_employee
where Department = 'Sales'
group by Gender;

--How many females and males are employed in Sales in %?
select 
    100*sum(case when gender = 'male' then 1 else 0 end)/count(gender) as male_percentage,
    100*sum(case when gender = 'female' then 1 else 0 end)/count(gender) as female_percentage
from hr_employee
 where Department = 'Sales'

--Who makes on average more money in Sales department males or females? 
select gender, avg(monthlyincome) as average_income
from hr_employee
where Department = 'Sales'
group by Gender

--Does education level correlates with average income?
--education levels (1-Below Collage, 2-Collage, 3-Bachelor, 4-Master, 5-Doctor)
select education, avg(monthlyincome) as average_income, 
case 
    when education = 1 then 'Below Collage'
    when Education = 2 then 'Collage'
    when Education = 3 then 'Bachelor'
    when Education = 4 then 'Master'
    when Education = 5 then 'Doctor'
    else null end as level_of_education
from hr_employee
where Department = 'Sales'
group by education 
order by education desc;
--COMMET--
--Doctors and Masters receive highest salaries on average than people with other levels of education

--Does years of experience correlate with average income?
with cte1 as (select hr.monthlyincome, 
case 
    when hr.totalworkingyears < 10 then 'very little experience'
    when hr.totalworkingyears >= 10 and hr.totalworkingyears <= 20 then 'small experience'
    when hr.totalworkingyears > 20 and hr.totalworkingyears < 30 then 'medium experience'
    when hr.totalworkingyears >= 30 and hr.totalworkingyears <= 40 then 'high experience'
        else null end as level_of_experience
from hr_employee as hr
WHERE Department = 'Sales'
group by totalworkingyears, hr.MonthlyIncome)

select c1.level_of_experience, avg(c1.monthlyincome) as average_income
from cte1 as c1
group by c1.level_of_experience
order by c1.level_of_experience desc
--COMMENT--
--People with high experience receive the highest salary on average

--Depending on the Sales department, what is the job role that makes on average the most money?
select jobrole, avg(monthlyincome) as average_income
from hr_employee
where Department = 'Sales'
group by JobRole
order by average_income DESC
--COMMENT--
--People working as Managers happen to receive much more money on average than Sales Executives and Sales Representatives

--What is the number of males and females working in specified role and how much money do they make on average?
select jobrole, gender, count(gender) as gender_count, avg(monthlyincome) as average_income
from hr_employee
where Department = 'Sales'
group by JobRole, gender
order by JobRole
--COMMENT--
--It seems that males receive more money on average in fields such as: Sales Executive
--On the other hand females receive more money on average in fields such as: Manager and Sales Representative


--ALL--
select * from hr_employee;

--What is the number of males and females working in this copany?
select gender, count(gender) as number_of_employees 
from hr_employee
group by Gender;

--What is the percentage of males and females working for the company?
select 
    100*sum(case when gender = 'male' then 1 else 0 end)/count(gender) as male_percentage,
    100*sum(case when gender = 'female' then 1 else 0 end)/count(gender) as female_percentage
from hr_employee


--What is the most common education background for employees working in different departments?
select department,
    100*sum(case when educationfield = 'Human Resources' then 1 else 0 end)/count(educationfield) as hr_edu_percentage,
    100*sum(case when educationfield = 'Life Sciences' then 1 else 0 end)/count(educationfield) as life_sciences_edu_percentage,
    100*sum(case when educationfield = 'Medical' then 1 else 0 end)/count(educationfield) as medical_edu_percentage,
    100*sum(case when educationfield = 'Technical Degree' then 1 else 0 end)/count(educationfield) as tech_degree_edu_percentage,
    100*sum(case when educationfield = 'Marketing' then 1 else 0 end)/count(educationfield) as marketing_edu_percentage,
    100*sum(case when educationfield = 'Other' then 1 else 0 end)/count(educationfield) as other_edu_percentage
from hr_employee
group by department;

--People from which department happen to be the most/least satisfied with their job and what is their job role?
select hr.department, hr.jobrole, count(hr.jobsatisfaction) as satisfaction_points, hr.jobsatisfaction, 
CASE
    when hr.jobsatisfaction = 1 then 'Low'
    when hr.jobsatisfaction = 2 then 'Medium'
    when hr.jobsatisfaction = 3 then 'High'
    when hr.jobsatisfaction = 4 then 'Very High'
else null end as level_of_satisfaction
from hr_employee as hr
group by hr.department, hr.jobrole, hr.jobsatisfaction

select * from hr_employee;

--Whats the average age of employees working in this company ?
select gender, avg(age) as avg_age 
from hr_employee
group by gender;


--What are the age groups in the company and how many employees are in each group?
with cte1 as (select count(age) as age_count,
CASE
    when age <20 and age >=18 then '18-20years'
    when age <30 and age >=20 then '20-30years'
    when age <40 and age >=30 then '30-40years'
    when age <50 and age >=40 then '40-50years'
    when age >=50 then '50+years'
    else null end as age_groups 
from hr_employee
group by age)

select sum(c1.age_count) as age_count1, c1.age_groups 
from cte1 as c1
group by c1.age_groups 
order by c1.age_groups

--People from which department have to travel the most/least?
select department,
    100*sum(case when businesstravel = 'Travel_Rarely' then 1 else 0 end)/count(businesstravel) as Travel_Rarely_percentage,
    100*sum(case when businesstravel = 'Travel_Frequently' then 1 else 0 end)/count(businesstravel) as Travel_Frequently_percentage,
    100*sum(case when businesstravel = 'Non-Travel' then 1 else 0 end)/count(businesstravel) as Non_Travel_percentage
from hr_employee
group by department;










