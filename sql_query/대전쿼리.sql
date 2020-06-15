use ios_project;

#cid : cid cname
insert into city values(3, "대전");

#line : lid cid

insert into line values(3, 1, "1호선"); 	


#station : cid lid sname time

insert into station values(3,1,0,'반석',0);
insert into station values(3,1,1,'지족',2);
insert into station values(3,1,2,'노은',4);
insert into station values(3,1,3,'월드컵경기장',5);
insert into station values(3,1,4,'현충원',7);
insert into station values(3,1,5,'구암',9);
insert into station values(3,1,6,'유성온천',11);
insert into station values(3,1,7,'갑천',13);
insert into station values(3,1,8,'월평',15);
insert into station values(3,1,9,'갈마',16);
insert into station values(3,1,10,'정부청사',18);
insert into station values(3,1,11,'시청',20);
insert into station values(3,1,12,'탄방',22);
insert into station values(3,1,13,'용문',24);
insert into station values(3,1,14,'오룡',26);
insert into station values(3,1,15,'서대전네거리',28);
insert into station values(3,1,16,'중구청',30);
insert into station values(3,1,17,'중앙로',32);
insert into station values(3,1,18,'대전역',34);
insert into station values(3,1,19,'대동',36);
insert into station values(3,1,20,'신흥',38);
insert into station values(3,1,21,'판암',40);

select * from city;
select * from line;
select * from station;