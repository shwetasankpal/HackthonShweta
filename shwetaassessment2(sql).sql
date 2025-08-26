use FNFTraining


 create table Employees1(Emp_Id int primary key,
 name varchar(50) not null,
 salary decimal(10,2),
 Manager_Id int,
 foreign Key(Manager_Id) References Employees1(Emp_Id)
 );





 Insert into Employees1(Emp_Id, name, salary, Manager_Id)values
 (1, 'Rohit', 20000, 3),
 (2, 'Sangeeta', 12000,  5),
 (3, 'Sanjay', 10000, 5),
 (4, 'Arun', 25000, 3),
 (5, 'Zaheer', 30000, null);



 select e.Name as emp_Name,
m.Name as mgr_Name
from Employees1 e
Left Join Employees1 M
ON E.Manager_Id=m.Emp_Id
order by e.Name;