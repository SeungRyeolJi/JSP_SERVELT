-- DB 연결 및 table 삭제
conn system/oracle as sysdba;

-- 테이블 생성 전 권한부여
grant create table, create sequence to system;

-- 회원정보 테이블 생성
create table member_tbl_02 (
  custno number(6),		-- 회원 번호
  custname varchar2(20),	-- 이름
  phone varchar2(13),		-- 연락처
  address varchar2(60),		-- 주소
  joindate date,		-- 등록일
  grade char(1), city char(2),	-- 등급, 거주지
  primary key(custno)		-- 기본키
);

-- 생성 후 CRUD 권한부여
grant insert,update,delete,select on member_tbl_02 to system;

-- 회원정보 테이블에 대한 시퀀스 추가
create sequence member_seq
start with 10001
increment by 1
minvalue 10001
cache 10;

-- 시퀀스 권한 추가
grant alter, select on member_seq to system;

-- 커밋
commit;

-- 회원 매출 정보 명세서
create table money_tbl_02 (
  custno number(6),    -- 고객번호
  salenol number(8),   -- 판매번호
  pcost number(8),     -- 단가
  amount number(4),    -- 수량
  price number(8),     -- 가격
  pcode varchar2(4),   -- 상품코드
  sdate date,          -- 판매일자
  primary key(custno, salenol)	--기본키
);

-- 권한 부여
grant insert, update, delete, select on money_tbl_02 to system;

commit;

-- 회원 정보 추가
insert into sys.member_tbl_02 values(10001, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A', '01');
insert into sys.member_tbl_02 values(10002, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '20151206', 'B', '01');
insert into sys.member_tbl_02 values(10003, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '20151001', 'B', '30');
insert into sys.member_tbl_02 values(10004, '최사랑', '010-1111-5555', '울릉군 울릉읍 독도2리', '20151113', 'A', '30');
insert into sys.member_tbl_02 values(10005, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '20151225', 'B', '60');
insert into sys.member_tbl_02 values(10006, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'C', '60') ;

-- 매출 정보 추가
insert into sys.money_tbl_02 values(10001, 20160001, 500, 5, 2500, 'A001', '20160101');
insert into sys.money_tbl_02 values(10001, 20160002, 1000, 4, 4000, 'A002', '20160101');
insert into sys.money_tbl_02 values(10001, 20160003, 500, 3, 1500, 'A008', '20160101');
insert into sys.money_tbl_02 values(10002, 20160004, 2000, 1, 2000, 'A004', '20160102');
insert into sys.money_tbl_02 values(10002, 20160005, 500, 1, 500, 'A001', '20160103');
insert into sys.money_tbl_02 values(10003, 20160006, 1500, 2, 3000, 'A003', '20160103');
insert into sys.money_tbl_02 values(10004, 20160007, 500, 2, 1000, 'A001', '20160104');
insert into sys.money_tbl_02 values(10004, 20160008, 300, 1, 300, 'A005', '20160104');
insert into sys.money_tbl_02 values(10004, 20160009, 600, 1, 600, 'A006', '20160104');
insert into sys.money_tbl_02 values(10004, 20160010, 3000, 1, 3000, 'A007', '20160106');

commit;

-- table 비우기 
truncate table member_tbl_02;

--값 넣기
 insert into sys.member_tbl_02 values(10001, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A', '01');
			   insert into sys.member_tbl_02 values(10002, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '20151206', 'B', '01');
			   insert into sys.member_tbl_02 values(10003, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '20151001', 'B', '30');
			   insert into sys.member_tbl_02 values(10004, '최사랑', '010-1111-5555', '울릉군 울릉읍 독도2리', '20151113', 'A', '30');
			   insert into sys.member_tbl_02 values(10005, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '20151225', 'B', '60');
			   insert into sys.member_tbl_02 values(10006, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'C', '60');

insert into sys.money_tbl_02 values(10001, 20160001, 500, 5, 2500, 'A001', '20160101');
			   insert into sys.money_tbl_02 values(10001, 20160002, 1000, 4, 4000, 'A002', '20160101');
			   insert into sys.money_tbl_02 values(10001, 20160003, 500, 3, 1500, 'A008', '20160101');
			   insert into sys.money_tbl_02 values(10002, 20160004, 2000, 1, 2000, 'A004', '20160102');
			   insert into sys.money_tbl_02 values(10002, 20160005, 500, 1, 500, 'A001', '20160103');
			   insert into sys.money_tbl_02 values(10003, 20160006, 1500, 2, 3000, 'A003', '20160103');
			   insert into sys.money_tbl_02 values(10004, 20160007, 500, 2, 1000, 'A001', '20160104');
			   insert into sys.money_tbl_02 values(10004, 20160008, 300, 1, 300, 'A005', '20160104');
			   insert into sys.money_tbl_02 values(10004, 20160009, 600, 1, 600, 'A006', '20160104');
			   insert into sys.money_tbl_02 values(10004, 20160010, 3000, 1, 3000, 'A007', '20160106');

-- 매출 정보와 회원 정보 JOIN
SELECT mb.custno, mb.custname, mb.grade, sum(mn.price) as total 
FROM sys.member_tbl_02 mb 
JOIN sys.money_tbl_02 mn on mb.custno = mn.custno 
group by (mb.custno, mb.custname, mb.grade) 
order by total desc;

--join 모든 db에서 가능
SELECT   member.custno,
 	member.custname,
	member.grade,
	SUM(money.price) as total
FROM money_tbl_02 money
JOIN   member_tbl_02 member
on     money.custno = member.custno --매출기록의 회원번호 = 회원정보의 회원번호 인 것을 가져온다
group by (member.custno, member.custname, member.grade)
order by total desc;

--이래 쓰면 전체 
SELECT sum(price) from money_tbl_02;

-- 전체의 합 
SELECT sum(price) from money_tbl_02;

-- 각각의 합
SELECT sum(price) from money_tbl_02 group by custno;

--  그룹을 custno로 묶고 그것의 price의 합계를 출력
SELECT custno, sum(price) from money_tbl_02 group by custno;

-- custno로 묶고 그것의 합계를 TOTAL이라는 alias으로 출력 TOTAL의 내림차로 정렬
SELECT custno ,
	sum(price) total 
from money_tbl_02 
group by custno
order by total desc;


SELECT member.custno,
 	member.custname,
	member.grade,
	SUM(money.price) as total
FROM money_tbl_02 money
JOIN   member_tbl_02 member 
on     money.custno = member.custno --매출기록의 회원번호 = 회원정보의 회원번호 인 것을 가져온다
group by (member.custno, member.custname, member.grade)
order by total desc;-