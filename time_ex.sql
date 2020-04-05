select curtime();

select curdate();

select dayofweek(curdate());

select date_format (now(), '%w'); -- sunday is 0

select dayname(now());

select date_format(now(), '%W');

select date_format(now(), '%m/%d/%Y');

select date_format(now(), '%M %D at %h : %i');

create table tweets(
	content varchar(140),
	username varchar(20),
	created_at TIMESTAMP default now());
	
insert into tweets( contents, username) values
	('this is my first tweet', 'cici')
	('this is my second tweet', 'cici');
	
select * from tweets;

	

	

	