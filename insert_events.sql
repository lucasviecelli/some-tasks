create table if not exists events (
	event_type integer not null,
	value integer not null,
	time timestamp not null,
	unique (event_type, time)
);

delete from events;

insert into events values 
	(2, 5,   '2015-05-09 12:42:00'), 
    (2, 7,   '2015-05-09 12:54:39'),
	(2, 2,   '2015-05-09 14:48:30'),
	(3, 16,  '2015-05-09 13:19:57'),
	(3, 20,  '2015-05-09 15:01:09'),
    (4, -42, '2015-05-09 13:19:57'); 						  
