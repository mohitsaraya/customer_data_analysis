create table customer
(
	customer_Number int,
	prefix	char(5),
	firstName varchar(20),
	lastName	varchar(20),
	birthDate	date,
	maritalStatus char(1),
	gender char(3),
	emailAddress	varchar(50),
	income	int,totalChildren	int,
	educationLevel	varchar(25),
	occupation	varchar(25),
	homeOwner char(3)
);

select * from customer;

-- drop unwanted column like email

alter table customer drop column emailaddress;

-- -------------------------------------------------------------------------------------------------------------------------------------
--  Basic Descriptive Analysis

-- 1. How many unique customers are in the dataset?  

select count(distinct customer_number) as Customers from customer;

-- 2. What is the average income of the customers?  

select avg(income) as AVG_Income from customer;

-- 3. What is the gender distribution in the dataset?  

select gender, count(gender) as Customer_count from customer group by 1; -- More male customer

-- 4. What is the most common marital status among the customers?  

select maritalStatus, count(maritalStatus) as customers from customer group by 1 order by 2 desc ; --  55 % customer are married

-- 5. How many customers own a home versus rent?  

select homeowner,count(distinct customer_number) as Customers from customer group by 1; --more than 60% customer have ther own home

-- -----------------------------------------------------------------------------------------------------------------------------------------
--  Demographic Analysis
-- 6. What is the average age of customers (using `BirthDate`)?  

select round(avg((current_date - birthdate )/365)) as Avg_Age from customer; -- most of the customer age is aroud 60

-- 7. What is the distribution of education levels among the customers?  

select educationlevel, count(*) as Customers from customer group by 1 order by 2 desc;  -- bachelors,partial collere,high school, graduate and partial high school

-- 8. How does the average income vary by gender?  

select distinct gender, round(avg(income)) as avg_income from customer group by 1;-- avg income of female is higher than avg income of male

-- 9. What is the most common occupation in the dataset?  

select occupation ,count(*) as occupation_count from customer group by 1 order by 2 desc limit 1; -- professiona, occupation is most common

-- 10. How does marital status correlate with the total number of children?  

select maritalstatus,avg(totalchildren) as avg_childrens from customer group by 1;


-- -----------------------------------------------------------------------------------------------------------------------------------------
--  Customer Segmentation

-- 11. What is the average number of children for customers grouped by income levels (e.g., low, medium, high)?  
select 
	case 
		when income <30000 then   'low income'
		when income between  30000 and 70000 then   'medium income'
		else 'high income' 
	end as Income_Bracket,
avg(totalchildren)
from customer 
group by Income_Bracket; 

-- 12. Can customers be segmented into income brackets, and what are the characteristics of each bracket?  

select 
	case 
		when income <30000 then   'low income'
		when income between  30000 and 70000 then   'medium income'
		else 'high income' 
	end as Income_Bracket,
count(*) as Customers
from customer 
group by Income_Bracket; -- maximum customer are from middle income group and lowest from high incomw group

-- 13. Which education level corresponds to the highest average income?  

select 
educationlevel, avg(income) as avg_income
from customer  group by 1 order by 2 desc  limit 1; -- graduate degree


-- 14. Are married customers more likely to own homes than single customers?  

select maritalstatus,homeowner, count(homeowner) as Home_count from customer group by 1,2 order by 2 desc; 
-- "M"	"Y  "	7763
-- "S"	"Y  "	4144
-- "M"	"N  "	1775
-- "S"	"N  "	3967


-- -----------------------------------------------------------------------------------------------------------------------------------------
--  Behavioral Patterns

-- 15. How does the number of children influence income levels?  
select  totalchildren, avg(income) as Average_Income from customer group by  totalchildren;  
-- 0	51436.967977300365
-- 1	51516.369902354968
-- 3	60679.334916864608
-- 5	72257.352941176471
-- 2	55367.626502655857
-- 4	68772.250114103149

-- 16. What is the average income of customers with advanced education levels?  
select avg(income) as Avg_income from customer where educationlevel ='professional'; -- zero

-- 17. Are male or female customers more likely to own homes?  

select gender, homeowner,count(homeowner) from customer where homeowner='Y' group by 1,2; --male customer own more home

-- 18. Which occupations have the highest percentage of homeowners?  

select occupation,(count(case when homeowner = 'Y' then 1 else 0 end)/count(*))*100 as Perc from customer group by 1;


-- 19. What is the distribution of birth years in the dataset?  

select date_part('year', birthdate) as Year,count(*) as Customers  from customer group by 1;


-- --------------------------------------------------------------------------------------------------------------------------------------------------
--  Data Quality and Completeness

-- 20. How many records have incomplete or null values for `Income` or `TotalChildren`?  

select count(*) from customer where income is null or totalchildren is null ; -- no null vlaue

-- 21. Are there any duplicate entries in the dataset?  
select count(*) as Duplicate_entry from(
select customer_number,
row_number() over(partition by customer_number order by customer_number) as rk from customer ) as d where rk>1;

-- --------------------------------------------------------------------------------------------------------------------------------------------------
--  Correlations and Insights
-- 22. How does age affect income levels across different education groups?  

select educationlevel,
(date_part('year',current_date) - date_part('year',birthdate)) as Age_group , avg(income) as avg_incomew from customer group by 1,2;
--  Advanced Analysis

-- 23. Which customer profiles (gender, education, income) are most likely to have multiple children?
SELECT gender, educationlevel, 
    CASE 
        WHEN totalchildren > 2 THEN 'Many Children'
        ELSE 'Few Children'
    END AS Child_Group,
    AVG(income) AS Average_Income
FROM customer
GROUP BY gender, educationLevel, Child_Group;
