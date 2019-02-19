

ȸ������ ��� 
	--> url-mapping : *.mem
	--> member.model // member.controller package�� class ����.
	-->/WEB-INF/member ������ jsp ���� ����

�Խ��� ���� ���
	--> url-mapping : *.bbs
	--> board.model // board.controller package�� class����
	-->/WEB-INF/board ������ jsp ���� ����

��ǰ ���� ���
	--> url-mapping : *.prd
	--> product.model // product.controller package�� class ����
	-->/WEB-INF/product ������ jsp ���� ����

ī�װ� ���� ���
	--> url-mapping : *.ct
	--> category.model // category.controller package�� class ����
	-->/WEB-INF/category ������ jsp ���� ����

**

util.paging package  --> ����¡ class
util.mybatis --> mybatis ���� config && mapper xml file

**

����� session 

�α��� ���� 

session.setAttribute("loginfo") --> ȸ�� ������ ��� session ��ü
				--> �α��� �� �� �����ؾ���.



------ database ------
-- -- ��� 
DROP TABLE members CASCADE CONSTRAINTS;

drop sequence seqmember;
create sequence seqmember start with 1 increment by 1 nocache ;

create table members(
        idx number primary key,
        id varchar2(20) unique,
        passwd varchar2(20) not null,
        passwd2 varchar2(20) not null,
        name nvarchar2(30) not null,
        tel varchar2(20) null,   --�Ϲ���ȭ
        hp varchar2(20) not null,   --�ڵ�����ȣ
        nick nvarchar2(30),      
        email varchar2(40),
        postcode1 varchar2(20),      --�����ȣ1
        address1 nvarchar2(50),      --�⺻�ּ�1 (����)
        detailaddress1 nvarchar2(30),   --(����)���ּ�
        postcode2 varchar2(20),      --�����ȣ2
        address2 nvarchar2(50),      --�߰��ּ�2 (ȸ��)
        detailaddress2 nvarchar2(30),   --(ȸ��)���ּ�
        salesauthority nvarchar2(30), -- ����� ��� ���� 0(false) / 1(true)  
        cash number,
        point number,
        birthdayyeardate varchar2(20),
		birthdaymonth varchar2(20),
		birthdaydate varchar2(20),
        memlevel varchar2(15)
    );

insert into members(idx, id, passwd,passwd2, name, tel, hp, nick, email, postcode1, address1, detailaddress1, postcode2, address2, detailaddress2,salesauthority, cash, point, birthdayyeardate,birthdaymonth,birthdaydate, memlevel)
values(seqmember.nextval, 'kim', 1234,1234, '��ö��', '02-1111-1111', '010-1111-1111','ö��','aaa@gmail.com','111-222','����� ������','��̾���Ʈ','222-111','����� ����','����Ÿ��','�Ϲ�', 0, 100, 1994, 04, 08, '�Ϲ�');


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

    --��� �Ű�
    drop table mem_report;
    create table mem_report(
    idx number primary key not null,
    memNum number not null,
    subject nvarchar2(50) not null,
    contents nvarchar2(200) not null,
    foreign key (memNum) references members(idx)
    )
    
    --ī�װ�
    drop table categories cascade constrains;
    create table categories(
        idx number primary key not null,
        name varchar(30) not null unique
    );
    
    create table categories_detail(
        idx number primary key not null,
        catNum number not null,
        name varchar(30) unique,
        url varchar2(50),
        foreign key(catNum) references categories(idx)
    );
    
    --��ǰ
    drop table products CASCADE CONSTRAINTS;
     create table products(
        idx number primary key not null,
        catNum number not null,
        memNum number not null,
        name nvarchar2(50) not null,
        contents nvarchar2(200) not null,
        price number not null,
        quantity number,
        image varchar2(50),
        foreign key (catNum) references categories(idx),
        foreign key (memNum) references members(idx)
    );
    
    --��ǰQnA
        drop table prdQnA; 
        create table prdQnA(
        idx number primary key not null,
        prdNum number not null,
        memNum number not null,
        subject nvarchar2(50) not null,
        contents nvarchar2(200) not null,
        image varchar2(50),
        passwd varchar2(20),
        ref number,
        re_step number,
        re_level number,
        readCount number,
        inputdate date default sysdate,
        foreign key(prdNum) references products(idx),
        foreign key(memNum) references members(idx)
    );    
    --�ı�
    drop table review;
    create table review(
    idx number primary key,
    memNum number not null,
    prdNum number not null,
    subject nvarchar2(50) not null,
    contents nvarchar2(200) not null,
    grade number,
     foreign key(prdNum) references products(idx),
     foreign key(memNum) references members(idx)
    );

    --��ٱ���
    drop table shoppingCart;
    create table shoppingCart(
        memNum number not null,
        prdNum number not null,
        quantity number,
        totalPrice number,
        foreign key (memNum) references members(idx),
        foreign key (prdNum) references products(idx)
    );


    --�Խ���
    drop table bbs cascade CONSTRAINTS;
    create table bbs(
     idx number not null primary key,
     memNum number not null,
     sortNum number not null,
    subject nvarchar2(50) not null,
    contents nvarchar2(200) not null,
    image varchar2(50),
     ref number,
     re_step number,
     re_level number,
    readCount number,
    inputdate date default sysdate,
    best_letter number, --��õ��?
      foreign key(memNum) references members(idx),
      foreign key(sortNum) references categories_detail(idx)
);
   --�Խ��� (���ƿ�/�Ⱦ��)
   drop table bbs_bad_good;
   create table bbs_bad_good(
       bbs_ref number,
       bbs_good_member number,
       bbs_bad_member number,
       foreign key(bbs_ref) references bbs(idx),
       foreign key(bbs_good_member) references members(idx),
       foreign key(bbs_bad_member) references members(idx)
);

--���
    drop table bbs_re;
    create table bbs_re(
        idx number not null primary key,
        re_bbs_ref number not null, --> reference �Խ���(bbs_number)
        memNum number not null, --> reference ȸ��(member_number)
        re_ref number,
        re_re_step number,
        re_re_level number,
        readCount number,
        inputdate date default sysdate,
         subject nvarchar2(50) not null,
        contents nvarchar2(200) not null,
        foreign key(re_bbs_ref) references bbs(idx),
         foreign key(memNum) references members(idx)
    );
    select * from bbs_re;
    commit;

    --ī�װ� �޴� ������ 
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
    
    --��� ������
    drop sequence mem_seq;
    create sequence mem_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
    
    --��ǰ ������
    drop sequence prd_seq;
    create sequence prd_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
    
    --��ǰ QnA ������
    drop sequence prd_qna_seq;
    create sequence prd_qna_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
        commit;
        
    --���� ������
    drop sequence review_seq;
    create sequence review_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
        commit;
        
    --�Խ��� ������
    drop sequence bbs_seq;
    create sequence bbs_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
        commit;
        
    --�Խ��� �з� ������
    drop sequence bbs_sort_seq;
    create sequence bbs_sort_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
        commit;
        
  --�Խ��� ��� ������
  drop sequence bbs_re_seq;
    create sequence bbs_re_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
        commit;
        
        
 --insert data--
 insert into categories (idx, name) values (menu_num_seq.nextval, 'Ŀ�´�Ƽ');
insert into categories (idx, name) values (menu_num_seq.nextval, '����');
insert into categories_detail(idx, catNum, name, url) values(cat_detail_seq.nextval, 1000, '��ü�Խ���', 'list.bbs');

insert into categories (idx, name) values (9999, 'Ȩ������ ����');
select * from categories;
commit;
insert into categories_detail (idx, catNum, name, url) values (cat_detail_seq.nextval, 9999, 'ī�װ� ����', 'manage.ct');
select * from categories_detail;
commit;