drop table board;

create table board(
	idx int auto_increment, -- 자동증가
	memId varchar(30) not null, -- 회원아이디 추가 //로그인한 회원의 아이디값을 글쓸때 넣어줌
	title varchar(100) not null,
	content varchar(2000) not null,
	writer varchar(20) not null,
	indate datetime default now(), -- now -> 현재 년월일 시분초
	count int default 0,
	primary key(idx)
);

select * from board;

insert into board(title, content, writer)
values('게시판 연습', '게시판 연습', '관리자');

insert into board(title, content, writer)
values('게시판 연습', '게시판 연습', '김수훈');

insert into board(title, content, writer)
values('게시판 연습', '게시판 연습', '관리자바보');

create table member(
	memId varchar(30) not null,
	memPwd varchar(30) not null,
	memName varchar(30) not null,
	memMail varchar(30) not null,
	memAddress varchar(50),
	primary key(memId)
);


insert into member values('smhrd01', 'smhrd01','종민이바보','123@123','똠양꿍');
insert into member values('smhrd02', 'smhrd02','재민이바보','456@456','센프란시스코');
insert into member values('smhrd03', 'smhrd03','효원이바보','789@789','장흥사람');

select * from member;

create table reply(
	idx int auto_increment, -- 자동증가
	memId varchar(30) not null, -- 회원아이디 추가 //로그인한 회원의 아이디값을 글쓸때 넣어줌
	title varchar(100) not null,
	content varchar(2000) not null,
	writer varchar(20) not null,
	indate datetime default now(), -- now -> 현재 년월일 시분초
	count int default 0,
	-- 답글에 관련된 컬럼 추가(4)
	boardGroup int,
	boardSequence int,
	boardLevel int,
	boardAvailable int default 0, -- 0(정상), 1(삭제)
	primary key(idx)
);

select * from reply;
select IFNULL(max(boardGroup)+1,0) from reply




