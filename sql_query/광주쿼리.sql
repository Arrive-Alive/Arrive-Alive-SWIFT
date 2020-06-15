use ios_project;

#cid : cid cname
insert into city values(2, "광주");

#line : lid cid

insert into line values(2, 1, "1호선"); 	


#station : cid lid sname time

insert into station values(2,1,0,'평동',0);
insert into station values(2,1,1,'도산',2);
insert into station values(2,1,2,'광주송정역',4);
insert into station values(2,1,3,'송정공원',6);
insert into station values(2,1,4,'공항',7);
insert into station values(2,1,5,'김대중컨벤션센터',11);
insert into station values(2,1,6,'상무',12);
insert into station values(2,1,7,'운천',14);
insert into station values(2,1,8,'쌍촌',16);
insert into station values(2,1,9,'화정',17);
insert into station values(2,1,10,'농성',19);
insert into station values(2,1,11,'돌고개',21);
insert into station values(2,1,12,'양동시장',22);
insert into station values(2,1,13,'금남로5가',24);
insert into station values(2,1,14,'금남로4가',26);
insert into station values(2,1,15,'문화전당',27);
insert into station values(2,1,16,'남광주',29);
insert into station values(2,1,17,'학동.증심사입구',31);
insert into station values(2,1,18,'소태',33);
insert into station values(2,1,19,'녹동',38);




select * from city;
select * from line;
select * from station;