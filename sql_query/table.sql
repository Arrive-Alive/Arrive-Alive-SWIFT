use ios_project;

#drop table station;
#drop table line;
#drop table city;

create table city(
	cid int(2) not null primary key,
	cname varchar(20),
	index index_cid (cid, cname)
);

create table line(
	cid int(2) not null,
	lid int(2) not null,
	lname varchar(30) not null,
	foreign key(cid) references city(cid) on update cascade,
	primary key(cid, lid),
	index index_lid (cid, lid, lname)
);

create table station(
	cid int(2) not null,
	lid int(2) not null,
	sid int(2) not null,
	sname varchar(20) not null,
	time int(4),
	foreign key(cid, lid) references line(cid, lid) on update cascade,
	primary key(cid, lid, sid),
	index index_lid (cid, lid, sid, sname)
);


select * from city;
select * from line;
select * from station;