create table Programmer (name varchar(8) not null,
dob date not null,doj date not null,
sex varchar(1) not null,prof1 varchar(8),prof2 varchar(8),
salary int(4) not null );

select * from Programmer;

insert into programmer values('somdutt','1966-04-21','1992-04-21','M','pascal','basic',3200);
insert into programmer values('devdutt','1986-01-11','1992-06-21','M','pascal','cobol',3200);
insert into programmer values('Ramesh','1986-03-21','1992-05-21','M','C','basic',4500);
insert into programmer values('Shradha','1956-01-21','1972-05-21','F','clipper','basic',3000);
insert into programmer values('Jyoti','1986-04-26','1982-05-21','F','dbase','cobol',3000);
insert into programmer values('dhmo','1986-05-26','1982-06-21','M','C','pascal',5000);
create table Software(name varchar(8) not null,
title varchar(20) not null,
Dev_in varchar(8) not null,
Scost float(7,2), Dcost int(5),Sold int(3) );

insert into Software values('somdutt','parachutes','basic',399.95,6000,14);
insert into Software values('Devdutt','parachute2','pascal',499.95,6500,53);
insert into Software values('Ramesh','parachute3','C',599.95,7000,63);
insert into Software values('Shradha','parachute4','basic',349.95,6300,15);
insert into Software values('Jyoti','parachute5','dbase',465.95,4600,56);

create table Studies(name varchar(8) not null,
splace varchar(9) not null,
course varchar(5) not null, ccost varchar(5) not null);

insert into studies values('somdutt','sabhari','pgdca',4500);
insert into studies values('devdutt','bdps','dcs',5000);
insert into studies values('Ramesh','pragathi','dcs',6500);
insert into studies values('Shradha','sabhari','dcs',3500);
insert into studies values('Jyoti','bdps','pgdca',5200);
set sql_safe_updates=0;

alter table programmer
add primary key (name);

alter table studies
add Foreign key (name) references programmer(name);

ALTER TABLE studies
add constraint Foreign key(name) references programer(name);

/*q1*/
select programmer.name , (current_date-programmer.dob) as age from studies 
inner join programmer on programmer.name = studies.name
where course = "dcs";

/*q2*/
select Studies.name ,(year(current_date)-year(Programmer.dob)) as age from Studies 
inner join Programmer on Studies.name=Programmer.name where course="dcs";

/*q3*/
select max(sold) as max_sold from software;

/*q4*/
select name, dob from programmer where month(dob) = 01;

/*q5*/
select min(studies.ccost) from studies;

/*q6*/
 select count(*) as count from studies where course = "pgdca";
 
 /*q7*/
 select scost*sold as revenue from software where Dev_in = "C";

/*q8*/
select * from software where name = "Ramesh";

/*q9*/
select * from studies where splace =  "Sabhari";

/*q10*/
select * from software where Scost*sold > 20000;

/*q11*/
select Dev_in,round(dcost/scost) as sold from software group by Dev_in;

/*q12*/
select max(scost) as costlier from software where Dev_in = "Basic";

/*q13*/
select * from software where scost*sold >=dcost;

/*q14*/
select count(*) from software where Dev_in = "dbase";

/*q15*/
select count(*) from studies where splace = "paragathi";

/*q16*/
select count(*) from studies where ccost  between 5000 and 10000 ;

/*q17*/
select avg(ccost) from studies ;

/*q18*/
select * from programmer where prof1 ="c" or prof2 = "c";

/*q19*/
select count(*) from programmer where prof1 in ("cobal","pascal") or prof2 in ("cobal","pascal");

/*q20*/
select count(*) from programmer where prof1 in ("C","pascal") and prof2 not in ("C","pascal");

/*q21*/
select name,max(current_date() - year(dob)) as date from programmer where sex = "M";

select * from programmer;
insert into programmer values("aarthi","1975-07-31","2008-09-23","F","basic","C",2000);
/*q22*/
select count(*) from programmer where prof1 not in ("C","pascal") and prof2 not in ("C","pascal");

/*q23*/
select avg(year(current_date()) - year(dob)) as date from programmer where sex = "F";

/*q24*/
select name,(year(current_date()) - year(doj)) as date from programmer order by name desc;

/*q25*/
select name from programmer where month(current_date())= month(dob);

/*q26*/
select count(*) from programmer where sex="F";
/*q27*/
select distinct(prof1) from programmer where sex="M";

/*q29*/
create or replace view langueges_male as 
select distinct(prof1) from programmer where sex="M"
union 
select distinct(prof2) from programmer where sex="M";


create or replace view langueges_male as 
select distinct(prof1) from programmer where sex="M"
union all
select distinct(prof2) from programmer where sex="M";


select * from langueges_male;

/*q28*/
select avg(salary) from programmer;

/*q29*/
select name,salary from programmer where salary between 2000 and 4000;

/*q30*/
select * from programmer where prof1 not in ("cliper","cobel","pascal") and prof2 not in ("cliper","cobel","pascal");

/*q31*/
select count(name) from programmer where sex="F" and year(current_date())-year(dob)>24 and (prof1 ="C" or prof2="C");

/*q32*/
select name from programmer where week(current_date())= week(dob);

/*q33*/
select * from programmer where year(current_date()) - year(doj)<1 ;

/*q34*/
select * from programmer where year(current_date()) - year(doj)=2 ;

/*q35*/
select name,(dcost-(scost*sold)) as amount from software where dcost>(scost*sold);

/*q36*/
select * from software where sold=0;

/*q37*/
select * from software where name ="Shradha";

/*q38*/
select distinct(splace) from studies;

/*q39*/

select count(distinct(course)) as course from studies;
/*q40*/
select name from programmer where name like "%a%%a%";

/*q41*/
select name from programmer where length(name)=5;

/*q42*/
select count(*) from programmer where sex="F" and  (year(current_date()) - year(doj))>2  
and (prof1 ="cobol" or prof2="cobol");

SELECT * FROM edubrige.programmer;

SELECT * FROM edubrige.software;

SELECT * FROM edubrige.studies;

/*q43*/
select min(length(name)) from programmer;

/*q44*/
select avg(Dcost) from software where Dev_in="basic";

/*q45*/
select name,sex,concat(day(dob),"/",month(dob),"/",subString(year(dob),3)) as 
dob,concat(day(doj),"/",month(doj),"/",subString(year(doj),3)) as doj from  programmer ;

/*q46*/
select name from programmer where  day(dob)=28 or day(dob)=29 or day(dob)=30 or day(dob)=31 ;
/*or*/
select name from programmer where LAST_DAY(dob)= dob;
/*q47*/
select name,salary from programmer where sex="M" and (prof1 not in ("cobel") or prof2 not in ("cobel"));

/*q48*/
select title,Scost,Dcost,Scost-Dcost from software order by Scost-Dcost DESC;

/*q49*/
select name,dob,doj from programmer where month(dob)=month(doj);

/*q50*/
select title from software where length(title)>1;

/*q51*/
select count(distinct(title)) from software group by Dev_in;

/*q52*/
select name,count(distinct(title)) from software group by name;

/*q53*/
select count(*) from programmer where sex="M" ;
select count(*) from programmer where sex="F";

/*q45*/
select Dev_in,max(Scost) from software group by Dev_in;
select Dev_in,max(Sold) from software group by Dev_in;

/*q55*/
select year(dob),count(*) from programmer group by year(dob);

/*q56*/
select year(doj),count(*) from programmer group by year(doj);

/*q57*/
select month(dob),count(*) from programmer group by month(dob);

/*q58*/
select month(doj),count(*) from programmer group by month(doj);

/*q59*/
select prof1,count(prof1) from programmer group by prof1;

/*q70*/
select prof2,count(prof2) from programmer group by prof2;


SELECT * FROM edubrige.programmer;

SELECT * FROM edubrige.software;

SELECT * FROM edubrige.studies;

/*q71*/
select salary,count(name) from programmer group by salary;

/*q72*/
select splace,count(name) from studies group by splace;

/*q73*/
select course,count(name) from studies group by course;

/*q74*/
select distinct(Dev_in),sum(Dcost) from software group by Dev_in;

/*q75*/
select distinct(Dev_in),sum(Scost) from software group by Dev_in;

SELECT * FROM edubrige.programmer;

SELECT * FROM edubrige.software;

SELECT * FROM edubrige.studies;

/*q76*/
select distinct(name), sum(Dcost) from software group by name;

/*q77*/
select distinct(name), sum(Scost*Sold) from software group by name;

/*q78*/
select distinct(name), sum(Sold) from software group by name;

/*q79*/
select distinct(Dev_in), sum(Dcost) from software group by Dev_in;

/*q80*/
select distinct(name) ,min(Dcost),max(Dcost) from software group by name;

/*q81*/
select distinct(Dev_in) ,avg(Dcost),avg(Scost),Scost,avg(Dcost/sold) from software group by Dev_in;

/*q82*/
select distinct(splace),count(course),avg(ccost) from studies group by splace;

/*q83*/
select distinct(splace),count(name) from studies group by splace;
SELECT * FROM edubrige.studies;

/*q84  Display names of male and female programmers.*/
select name from programmer where sex="M" ;
select name from programmer where sex="F";

/*q285 Display the programmer's name and their packages. */
select name , title from software;

/*q86  Display the NUMBER of packages in EACH language.*/
select distinct(Dev_in),count(title) from software group by Dev_in;

/*q87 Display the NUMBER of packages in EACH language for which development cost is less than 1000. */
select distinct(Dev_in),count(title) from software where dcost<1000 group by Dev_in ;

/*q88  Display the AVERAGE difference BETWEEN scost and dcost for EACH language.*/
select  distinct(Dev_in),avg(scost-dcost) from software group by Dev_in;

/*q89  Display the TOTAL scost, dcsot and amount TOBE recovered for EACH 
programmer for whose dcost HAS NOT YET BEEN recovered.*/
select  distinct(name),sum(scost),sum(dcost), sum(dcost-(scost*sold)) as amount_recovered from software group by name;

/*q90 Display highest, lowest and average salaries for THOSE earning MORE than 2000.   */
select max(salary), min(salary), avg(salary) from  programmer where salary>2000;


/*q91-Who is the highest paid C programmer?*/
select max(salary),name from programmer where (prof1 = "C" or prof2 = "C") ;

/*q92-Who is the highest paid female cobol programmer?*/
select max(salary),name from programmer where (prof1 = "cobol" or prof2 = "cobol") ;

/*q93-Display the name of the HIGEST paid programmer for EACH language (prof1)*/
select distinct(prof1),(salary),name from programmer;

/*q94-Who is the LEAST experienced programmer?*/
select min(year(current_date())-year(doj)),name from programmer;

/*q95- Who is the MOST experienced programmer?*/
select max(year(current_date())-year(doj)),name from programmer;

/*q96- Which language is known by ONLY ONE programmer?*/
select prof1  from programmer   group by prof1 having count(name)=1;


/*q97-Who is the YONGEST programmer knowing DBASE?*/
select min(year(curdate())-year(dob)),name from programmer where (prof1 = "dbase" or prof2 = "dbase");

/*q98 - Which institute has MOST NUMBER of students?*/
select max(splace) from studies;

/*q99-Which is the COSTLIEST course*/
select max(ccost),course from studies;




/*q100-Which female programmer earns MORE than 3000/- but DOES NOT know C, C++, Oracle or 
Dbase?*/

select name from programmer where sex = "F" and salary > 3000 and (prof1 not in ("c","c++","oracle","dbase") or prof2 not in ("c","c++","oracle","dbase"));


SELECT * FROM programmer;

SELECT * FROM software;

SELECT * FROM studies;

