use ios_project;

#cid : cid cname
insert into city values(3, "����");

#line : lid cid

insert into line values(3, 1, "1ȣ��"); 	


#station : cid lid sname time

insert into station values(3,1,0,'�ݼ�',0);
insert into station values(3,1,1,'����',2);
insert into station values(3,1,2,'����',4);
insert into station values(3,1,3,'�����Ű����',5);
insert into station values(3,1,4,'�����',7);
insert into station values(3,1,5,'����',9);
insert into station values(3,1,6,'������õ',11);
insert into station values(3,1,7,'��õ',13);
insert into station values(3,1,8,'����',15);
insert into station values(3,1,9,'����',16);
insert into station values(3,1,10,'����û��',18);
insert into station values(3,1,11,'��û',20);
insert into station values(3,1,12,'ź��',22);
insert into station values(3,1,13,'�빮',24);
insert into station values(3,1,14,'����',26);
insert into station values(3,1,15,'�������װŸ�',28);
insert into station values(3,1,16,'�߱�û',30);
insert into station values(3,1,17,'�߾ӷ�',32);
insert into station values(3,1,18,'������',34);
insert into station values(3,1,19,'�뵿',36);
insert into station values(3,1,20,'����',38);
insert into station values(3,1,21,'�Ǿ�',40);

select * from city;
select * from line;
select * from station;