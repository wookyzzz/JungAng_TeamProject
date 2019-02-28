DROP TABLE members CASCADE CONSTRAINTS;
create table members(
        idx number primary key,
        id varchar2(20) unique,
        passwd varchar2(20) not null,
        passwd2 varchar2(20) ,
        name nvarchar2(30) not null,
        tel varchar2(20) null,   
        hp varchar2(20) not null,  
        nick nvarchar2(30),      
        email varchar2(40),
        postcode1 varchar2(20),      
        address1 nvarchar2(50),      
        detailaddress1 nvarchar2(30),   
        postcode2 varchar2(20),      
        address2 nvarchar2(50),      
        detailaddress2 nvarchar2(30),   
        salesauthority nvarchar2(30),  
        cash number,
        point number,
        birthdayyeardate varchar2(20),
      birthdaymonth varchar2(20),
      birthdaydate varchar2(20),
        memlevel varchar2(15)
    );


commit ;

col idx for a4
col id for a6
col passwd for a10
col name for a8
col tel for a15
col hp for a15
col nick for a6
col email for a15
col postcode1 for a8
col address1 for a20
col detail_address1 for a30
col postcode2 for a8
col address2 for a20
col detail_address2 for a30
col cash for a8
col point for a8
col birthday for a10
col mem_level for a8

    drop table mem_report;
    create table mem_report(
    idx number primary key not null,
    memNum number not null,
    subject nvarchar2(50) not null,
    contents nvarchar2(200) not null,
    foreign key (memNum) references members(idx)
    )
    
    drop table categories cascade CONSTRAINTS;
    create table categories(
        idx number primary key not null,
        name varchar(30) not null unique
    );
    
 drop table categories_detail cascade CONSTRAINTS;
    create table categories_detail(
        idx number primary key not null,
        catNum number not null,
        name varchar(30) unique,
        url varchar2(50),
        foreign key(catNum) references categories(idx)
    );
    
    drop table products CASCADE CONSTRAINTS;
     create table products(
        idx number primary key not null,
        catNum_detail number not null,
        memId varchar2(20) not null,
        name nvarchar2(50) not null,
        contents nvarchar2(1000),
        price number not null,
        point number default 0,
        quantity number,
        image varchar2(50),
        inputdate date default sysdate,
        delivery_charge nvarchar2(10),
        foreign key (catNum_detail) references categories_detail(idx)
    );
    
        drop table prdQnA cascade CONSTRAINTS; 
        create table prdQnA(
        idx number primary key not null,
        prdNum number not null,
        memId varchar2(20) not null,
        contents nvarchar2(200) not null,
        passwd varchar2(20),
        ref number,
        re_step number,
        re_level number,
        inputdate date default sysdate,
        foreign key(prdNum) references products(idx)
        );   
        
    drop table review cascade CONSTRAINTS;
    create table review(
    idx number primary key,
    memId varchar2(20) not null,
    prdNum number not null,
    subject nvarchar2(50) not null,
    contents nvarchar2(1000) not null,
    grade number,
    inputdate date default sysdate,
     foreign key(prdNum) references products(idx)
    );

    drop table prdOrders cascade CONSTRAINTS;
    create table prdOrders(
       idx number not null primary key,
        memId varchar(20) not null,
        prdNum number not null,
        quantity number,
        totalPrice number,
        memo nvarchar2(100),
        postcode1 varchar2(20),      
        address1 nvarchar2(50), 
        detailaddress1 nvarchar2(30),
        inputdate date default sysdate,
        foreign key (prdNum) references products(idx)
    );

drop table shoppingcart;
create table shoppingcart(
    idx number primary key,
    prdNum number,
    memId varchar(20),
    quantity number,
    totalPrice number,
    inputdate date default sysdate,
    FOREIGN key(prdNum) REFERENCES products(idx)
);

    drop table bbs cascade CONSTRAINTS;
    create table bbs(
     idx number not null primary key,
     memNum number not null,
     sortNum number not null,
    subject nvarchar2(50) not null,
    contents nvarchar2(2000) not null,
    image varchar2(50),
     ref number,
     re_step number,
     re_level number,
    readCount number,
    inputdate date default sysdate,
    best_letter number default 0, 
      foreign key(memNum) references members(idx),
      foreign key(sortNum) references categories_detail(idx)
);
   drop table bbs_bad_good cascade CONSTRAINTS;
   drop table bbs_good;
   create table bbs_good(
       bbs_ref number not null,
       bbs_good_member number not null,
       checkdate date default sysdate,
       foreign key(bbs_ref) references bbs(idx),
       foreign key(bbs_good_member) references members(idx)
   );

    drop table bbs_re cascade CONSTRAINTS;
    create table bbs_re(
        idx number not null primary key,
        re_bbs_ref number not null, 
        memNum number not null, 
        re_ref number,
        re_re_step number,
        re_re_level number,
        inputdate date default sysdate,
        contents nvarchar2(200) not null,
        foreign key(re_bbs_ref) references bbs(idx),
         foreign key(memNum) references members(idx)
    );
    select * from bbs_re;
    commit;

    drop sequence menu_num_seq;
    create sequence menu_num_seq
        minvalue 1000
        start with 1000
        maxvalue 20000
        increment by 1000
        nocache;
        
        create sequence cat_detail_seq
        minvalue 1001
        start with 1001
        increment by 1
        nocache;
    
    drop sequence mem_seq;
    create sequence mem_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
    
    drop sequence prd_seq;
    create sequence prd_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
    
    drop sequence prd_qna_seq;
    create sequence prd_qna_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
        commit;
        
    drop sequence review_seq;
    create sequence review_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
        commit;
        
    drop sequence bbs_seq;
    create sequence bbs_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
        commit;
        
    drop sequence bbs_sort_seq;
    create sequence bbs_sort_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
        commit;
        
         create sequence cart_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
        
  drop sequence bbs_re_seq;
    create sequence bbs_re_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
        commit;
        
         create sequence order_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
        
        
 --insert data--
 insert into categories (idx, name) values (menu_num_seq.nextval, '커뮤니티');
insert into categories (idx, name) values (menu_num_seq.nextval, '장터');
insert into members (idx, id, passwd, name, hp,tel) values(0, 0, 0, 0,0,0);
insert into members (idx, id, passwd, name, hp,tel) values(mem_seq.nextval, 'admin', 'admin', '관리자','010-0000-0000','010-0000-0000');
insert into members values(mem_seq.nextval, 'test1', '1234','1234','김테스트1', '000-0000-0000', '000-0000-0000'
, '테스터', 'abc@abc', '000-000', '서울','1층','000-000', '서울','2층','일반',0,15000,'1990','01','01','0' );
insert into members values(mem_seq.nextval, 'test2', '1234','1234','김테스트2', '000-0000-0000', '000-0000-0000'
, '테스터', 'abc@abc', '000-000', '서울','1층','000-000', '서울','2층','일반',0,15000,'1990','01','01','0' );
insert into members values(mem_seq.nextval, 'test3', '1234','1234','김테스트3', '000-0000-0000', '000-0000-0000'
, '테스터', 'abc@abc', '000-000', '서울','1층','000-000', '서울','2층','일반',0,15000,'1990','01','01','0' );
insert into members values(mem_seq.nextval, 'test4', '1234','1234','김테스트4', '000-0000-0000', '000-0000-0000'
, '테스터', 'abc@abc', '000-000', '서울','1층','000-000', '서울','2층','일반',0,15000,'1990','01','01','0' );
insert into members values(mem_seq.nextval, 'test5', '1234','1234','김테스트5', '000-0000-0000', '000-0000-0000'
, '테스터', 'abc@abc', '000-000', '서울','1층','000-000', '서울','2층','일반',0,15000,'1990','01','01','0' );
insert into members values(mem_seq.nextval, 'test6', '1234','1234','김테스트6', '000-0000-0000', '000-0000-0000'
, '테스터', 'abc@abc', '000-000', '서울','1층','000-000', '서울','2층','일반',0,15000,'1990','01','01','0' );
insert into members values(mem_seq.nextval, 'test7', '1234','1234','김테스트7', '000-0000-0000', '000-0000-0000'
, '테스터', 'abc@abc', '000-000', '서울','1층','000-000', '서울','2층','일반',0,15000,'1990','01','01','0' );
insert into members values(mem_seq.nextval, 'test8', '1234','1234','김테스트8', '000-0000-0000', '000-0000-0000'
, '테스터', 'abc@abc', '000-000', '서울','1층','000-000', '서울','2층','일반',0,15000,'1990','01','01','0' );
insert into members values(mem_seq.nextval, 'test9', '1234','1234','김테스트9', '000-0000-0000', '000-0000-0000'
, '테스터', 'abc@abc', '000-000', '서울','1층','000-000', '서울','2층','일반',0,15000,'1990','01','01','0' );
insert into members values(mem_seq.nextval, 'test10', '1234','1234','김테스트10', '000-0000-0000', '000-0000-0000'
, '테스터', 'abc@abc', '000-000', '서울','1층','000-000', '서울','2층','일반',0,15000,'1990','01','01','0' );
insert into categories (idx, name) values (99999, '홈페이지 관리');
select * from categories;
commit;
insert into categories_detail (idx, catNum, name, url) values (100, 2000, '가전제품', 'list.prd');
insert into categories_detail (idx, catNum, name, url) values (200, 2000, '생활용품', 'list.prd');
insert into categories_detail (idx, catNum, name, url) values (300, 99999, '카테고리관리', 'manage.ct');
insert into categories_detail (idx, catNum, name, url) values (400, 99999, '회원관리', 'list.mem');
insert into categories_detail  (idx, catNum, name, url) values (500, 1000, '전체게시판', 'list.bbs');
insert into categories_detail  (idx, catNum, name, url) values (600, 1000, '베스트게시판', 'best.bbs');
insert into categories_detail  (idx, catNum, name, url) values (700, 1000, '자유게시판', 'list.bbs');
insert into categories_detail  (idx, catNum, name, url) values (800, 1000, '유머게시판', 'list.bbs');
select * from categories_detail;
commit;
select * from categories;
select * from categories_detail;
select * from members;