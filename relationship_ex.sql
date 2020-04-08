create table STUDENTS(
    id INT auto_increment primary key,
    first_name VARCHAR(100));

create table PAPERS(
	title varchar(100),
	grade int,
	student_id int,
	foreign key(student_id) references STUDENTS(id)
	on delete cascade);
	
INSERT INTO STUDENTS (first_name) VALUES 
('Caleb'), 
('Samantha'), 
('Raj'), 
('Carlos'), 
('Lisa');
 
INSERT INTO PAPERS (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

select first_name, title, grade
from STUDENTS
right join PAPERS 
	on STUDENTS.id = PAPERS.student_id
order by first_name DESC;


select first_name, title, ifnull(grade, 0) as grade 
from STUDENTS
left join PAPERS 
	on STUDENTS.id = PAPERS.student_id;
	
select first_name, ifnull(avg(grade),0) as average
from STUDENTS
left join PAPERS
	on STUDENTS.id = PAPERS.student_id
group by id
order by average DESC;


select 
	first_name, 
	ifnull(avg(grade),0) as average,
	case 
		when avg(grade) > 75 then 'PASSING' -- have to use 'avg(grade)' instead of 'average'
		else 'FAILING'
	 end as passing_status
from STUDENTS
left join PAPERS
	on STUDENTS.id = PAPERS.student_id
group by id
order by average DESC;