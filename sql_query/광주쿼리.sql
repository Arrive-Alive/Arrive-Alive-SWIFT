use ios_project;

#cid : cid cname
insert into city values(2, "����");

#line : lid cid

insert into line values(2, 1, "1ȣ��"); 	


#station : cid lid sname time

insert into station values(2,1,0,'��',0);
insert into station values(2,1,1,'����',2);
insert into station values(2,1,2,'���ּ�����',4);
insert into station values(2,1,3,'��������',6);
insert into station values(2,1,4,'����',7);
insert into station values(2,1,5,'����������Ǽ���',11);
insert into station values(2,1,6,'��',12);
insert into station values(2,1,7,'��õ',14);
insert into station values(2,1,8,'����',16);
insert into station values(2,1,9,'ȭ��',17);
insert into station values(2,1,10,'��',19);
insert into station values(2,1,11,'����',21);
insert into station values(2,1,12,'�絿����',22);
insert into station values(2,1,13,'�ݳ���5��',24);
insert into station values(2,1,14,'�ݳ���4��',26);
insert into station values(2,1,15,'��ȭ����',27);
insert into station values(2,1,16,'������',29);
insert into station values(2,1,17,'�е�.���ɻ��Ա�',31);
insert into station values(2,1,18,'����',33);
insert into station values(2,1,19,'�쵿',38);




select * from city;
select * from line;
select * from station;