use ios_project;

#cid : cid cname
insert into city values(0, "대구");

#line : lid cid
insert into line values(0, 1, "1호선");
insert into line values(0, 2, "2호선");
insert into line values(0, 3, "3호선");

#station : cid lid sname time

insert into station values(0, 1, 0, '설화명곡',-26);
insert into station values(0, 1, 1, '화원',-24);
insert into station values(0, 1, 2, '대곡',-22);
insert into station values(0, 1, 3, '진천',-20);
insert into station values(0, 1, 4, '월배',-18);
insert into station values(0, 1, 5, '상인',-17);
insert into station values(0, 1, 6, '월촌',-15);
insert into station values(0, 1, 7, '송현',-13);
insert into station values(0, 1, 8, '서부정류장',-11);
insert into station values(0, 1, 9, '대명',-10);
insert into station values(0, 1, 10, '안지랑',-8);
insert into station values(0, 1, 11, '현충로',-6);
insert into station values(0, 1, 12, '영대병원',-5);
insert into station values(0, 1, 13, '교대',-3);
insert into station values(0, 1, 14, '명덕',-1);
insert into station values(0, 1, 15, '반월당',0);
insert into station values(0, 1, 16, '중앙로',2);
insert into station values(0, 1, 17, '대구역',3);
insert into station values(0, 1, 18, '칠성시장',5);
insert into station values(0, 1, 19, '신천',7);
insert into station values(0, 1, 20, '동대구역',9);
insert into station values(0, 1, 21, '동구청',10);
insert into station values(0, 1, 22, '아양교',12);
insert into station values(0, 1, 23, '동촌',14);
insert into station values(0, 1, 24, '해안',16);
insert into station values(0, 1, 25, '방촌',18);
insert into station values(0, 1, 26, '용계',20);
insert into station values(0, 1, 27, '율하',22);
insert into station values(0, 1, 28, '신기',24);
insert into station values(0, 1, 29, '반야월',25);
insert into station values(0, 1, 30, '각산',27);
insert into station values(0, 1, 31, '안심',29);

insert into station values(0, 2, 0, '문양',	-28);
insert into station values(0, 2, 1, '다사',	-24);
insert into station values(0, 2, 2, '대실',	-22);
insert into station values(0, 2, 3, '강창',	-20);
insert into station values(0, 2, 4, '계명대',	-18);
insert into station values(0, 2, 5, '성서산업단지',	-16);
insert into station values(0, 2, 6, '이곡',	-14);
insert into station values(0, 2, 7, '용산',	-12);
insert into station values(0, 2, 8, '죽전',	-10);
insert into station values(0, 2, 9, '감삼',	-9);
insert into station values(0, 2, 10, '두류',	-7);
insert into station values(0, 2, 11, '내당',	-5);
insert into station values(0, 2, 12, '반고개',	-3);
insert into station values(0, 2, 13, '신남',	-2);
insert into station values(0, 2, 14, '반월당',	0);
insert into station values(0, 2, 15, '경대병원',	2);
insert into station values(0, 2, 16, '대구은행',	4);
insert into station values(0, 2, 17, '범어',	6);
insert into station values(0, 2, 18, '수성구청',	8);
insert into station values(0, 2, 19, '만촌',	9);
insert into station values(0, 2, 21, '담티',	11);
insert into station values(0, 2, 22, '연호',	14);
insert into station values(0, 2, 23, '대공원',	16);
insert into station values(0, 2, 24, '고산',	18);
insert into station values(0, 2, 25, '신매',	20);
insert into station values(0, 2, 26, '사월',	22);
insert into station values(0, 2, 27, '정평',	24);
insert into station values(0, 2, 28, '임당',	26);
insert into station values(0, 2, 29, '영남대',	28);

insert into station values(0, 3, 0, '칠곡경대병원',	-28);
insert into station values(0, 3, 1, '학정',	-26);
insert into station values(0, 3, 2, '팔거',	-24);
insert into station values(0, 3, 3, '동천',	-23);
insert into station values(0, 3, 4, '칠곡운암',	-21);
insert into station values(0, 3, 5, '구암',	-20);
insert into station values(0, 3, 6, '태전',	-18);
insert into station values(0, 3, 7, '매천',	-17);
insert into station values(0, 3, 8, '매천시장',	-15);
insert into station values(0, 3, 9, '팔달',	-13);
insert into station values(0, 3, 10, '공당',	-11);
insert into station values(0, 3, 11, '만평',	-10);
insert into station values(0, 3, 12, '팔달시장',	-8);
insert into station values(0, 3, 13, '원대',	-7);
insert into station values(0, 3, 14, '북구청',	-5);
insert into station values(0, 3, 15, '달성공원',	-3);
insert into station values(0, 3, 16, '서문시장',	-1);
insert into station values(0, 3, 17, '신남',	0);
insert into station values(0, 3, 18, '남산',	2);
insert into station values(0, 3, 19, '명덕',	4);
insert into station values(0, 3, 20, '건들바위',	6);
insert into station values(0, 3, 21, '대봉교',	7);
insert into station values(0, 3, 22, '수성시장',	9);
insert into station values(0, 3, 23, '수성구민운동장',	11);
insert into station values(0, 3, 24, '어린이회관',	13);
insert into station values(0, 3, 25, '황금',	14);
insert into station values(0, 3, 26, '수성못',	16);
insert into station values(0, 3, 27, '지산',	18);
insert into station values(0, 3, 28, '범물',	19);
insert into station values(0, 3, 29, '용지',	21);



select * from city;
select * from line;
select * from station;