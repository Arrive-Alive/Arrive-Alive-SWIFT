use ios_project;

#cid : cid cname
insert into city values(0, "대구");

#line : lid cid
insert into line values(0, 1);
insert into line values(0, 2);
insert into line values(0, 3);

#station : cid lid sname time

insert into station values(0, 1, '설화명곡',-26);
insert into station values(0, 1, '화원',-24);
insert into station values(0, 1, '대곡',-22);
insert into station values(0, 1, '진천',-20);
insert into station values(0, 1, '월배',-18);
insert into station values(0, 1, '상인',-17);
insert into station values(0, 1, '월촌',-15);
insert into station values(0, 1, '송현',-13);
insert into station values(0, 1, '서부정류장',-11);
insert into station values(0, 1, '대명',-10);
insert into station values(0, 1, '안지랑',-8);
insert into station values(0, 1, '현충로',-6);
insert into station values(0, 1, '영대병원',-5);
insert into station values(0, 1, '교대',-3);
insert into station values(0, 1, '명덕',-1);
insert into station values(0, 1, '반월당',0);
insert into station values(0, 1, '중앙로',2);
insert into station values(0, 1, '대구역',3);
insert into station values(0, 1, '칠성시장',5);
insert into station values(0, 1, '신천',7);
insert into station values(0, 1, '동대구역',9);
insert into station values(0, 1, '동구청',10);
insert into station values(0, 1, '아양교',12);
insert into station values(0, 1, '동촌',14);
insert into station values(0, 1, '해안',16);
insert into station values(0, 1, '방촌',18);
insert into station values(0, 1, '용계',20);
insert into station values(0, 1, '율하',22);
insert into station values(0, 1, '신기',24);
insert into station values(0, 1, '반야월',25);
insert into station values(0, 1, '각산',27);
insert into station values(0, 1, '안심',29);

insert into station values(0, 2, '문양',	-28);
insert into station values(0, 2, '다사',	-24);
insert into station values(0, 2, '대실',	-22);
insert into station values(0, 2, '강창',	-20);
insert into station values(0, 2, '계명대',	-18);
insert into station values(0, 2, '성서산업단지',	-16);
insert into station values(0, 2, '이곡',	-14);
insert into station values(0, 2, '용산',	-12);
insert into station values(0, 2, '죽전',	-10);
insert into station values(0, 2, '감삼',	-9);
insert into station values(0, 2, '두류',	-7);
insert into station values(0, 2, '내당',	-5);
insert into station values(0, 2, '반고개',	-3);
insert into station values(0, 2, '신남',	-2);
insert into station values(0, 2, '반월당',	0);
insert into station values(0, 2, '경대병원',	2);
insert into station values(0, 2, '대구은행',	4);
insert into station values(0, 2, '범어',	6);
insert into station values(0, 2, '수성구청',	8);
insert into station values(0, 2, '만촌',	9);
insert into station values(0, 2, '담티',	11);
insert into station values(0, 2, '연호',	14);
insert into station values(0, 2, '대공원',	16);
insert into station values(0, 2, '고산',	18);
insert into station values(0, 2, '신매',	20);
insert into station values(0, 2, '사월',	22);
insert into station values(0, 2, '정평',	24);
insert into station values(0, 2, '임당',	26);
insert into station values(0, 2, '영남대',	28);

insert into station values(0, 3, '칠곡경대병원',	-28);
insert into station values(0, 3, '학정',	-26);
insert into station values(0, 3, '팔거',	-24);
insert into station values(0, 3, '동천',	-23);
insert into station values(0, 3, '칠곡운암',	-21);
insert into station values(0, 3, '구암',	-20);
insert into station values(0, 3, '태전',	-18);
insert into station values(0, 3, '매천',	-17);
insert into station values(0, 3, '매천시장',	-15);
insert into station values(0, 3, '팔달',	-13);
insert into station values(0, 3, '공당',	-11);
insert into station values(0, 3, '만평',	-10);
insert into station values(0, 3, '팔달시장',	-8);
insert into station values(0, 3, '원대',	-7);
insert into station values(0, 3, '북구청',	-5);
insert into station values(0, 3, '달성공원',	-3);
insert into station values(0, 3, '서문시장',	-1);
insert into station values(0, 3, '신남',	0);
insert into station values(0, 3, '남산',	2);
insert into station values(0, 3, '명덕',	4);
insert into station values(0, 3, '건들바위',	6);
insert into station values(0, 3, '대봉교',	7);
insert into station values(0, 3, '수성시장',	9);
insert into station values(0, 3, '수성구민운동장',	11);
insert into station values(0, 3, '어린이회관',	13);
insert into station values(0, 3, '황금',	14);
insert into station values(0, 3, '수성못',	16);
insert into station values(0, 3, '지산',	18);
insert into station values(0, 3, '범물',	19);
insert into station values(0, 3, '용지',	21);



select * from city;
select * from line;
select * from station;
