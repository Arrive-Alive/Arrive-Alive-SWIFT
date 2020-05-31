use ios_project;

create table city(
	cid int(2) not null primary key,
	cname varchar(20),
    	index index_cid (cid)
);

create table line(
	cid int(2) not null,
	lid int(2) not null primary key,
	foreign key(cid) references city(cid) on update cascade,
    	index index_lid (cid, lid)
);

create table station(
	cid int(2) not null,
	lid int(2) not null,
	sname varchar(20),
	time int(4),
	foreign key(cid, lid) references line(cid, lid) on update cascade,
    	index index_lid (cid, lid)
);


select * from city;
select * from line;
select * from station;
