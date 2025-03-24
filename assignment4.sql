use basics;
insert into employee values(1,"Moksh","vnrewn",98445,75,"nibru",4541,458742), (1,"Moksh","vnrewn",98445,14,"nibrjefu",4541,48742),(74,"fhjvf","dchvj",4748893,25,"vjfhbj",26526,4652);
select * from employee;
create table dept(dept_no int,dept_name varchar(50));
insert into dept values(23,"jvnefj"),(75,"uinviefuie"),(43,"jeievn");
select * from dept;
select dept_no from dept except select Dept_no from employee;
 select Dept_no from employee except select dept_no from dept ;