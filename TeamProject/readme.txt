

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
    -- ��� 
    create table members(
        idx number primary key,
        id varchar2(20) unique,
        passwd varchar2(20) not null,
        name nvarchar2(30) not null,
        hp varchar2(20) not null,
        nick nvarchar2(30),
        email varchar2(40),
        address_home nvarchar2(50),
        addres_company nvarchar2(50),
        detail_address nvarchar2(30),
        sales_authority number default 0, -- ����� ��� ���� 0(false) / 1(true)  
        cash number,
        point number,
        birthday date,
        mem_level varchar2(15)
    );
    --��� �Ű�
    create table mem_report(
    idx number primary key not null,
    memNum number not null,
    subject nvarchar2(50) not null,
    contents nvarchar2(200) not null,
    foreign key (memNum) references members(idx)
    )
    
    --ī�װ�
    create table categories(
        idx number primary key not null,
        name varchar(30) unique
    );
    
    --��ǰ
     create table products(
        idx number primary key not null,
        catNum number not null,
        memNum number not null,
        name nvarchar2(50) not null,
        contents nvarchar2(200) not null,
        price number not null,
        quantity number,
        image varchar2(50),
        foreign key (catNum) references categories(idx)
        foreign key (memNum) references member(idx)
    );
    
    --��ǰQnA
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
    drop table prdQnA;
    --�ı�
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
    create table shoppingCart(
        memNum number not null,
        prdNum number not null,
        quantity number,
        totalPrice number,
        foreign key (memNum) references members(idx),
        foreign key (prdNum) references products(idx)
    );

    --�Խ���(�з�)
    create table bbs_sort(
        idx number not null primary key,
        categoriesNum not null,
        name nvarchar2(15) unique,
        foreign key(categoriesNum) references categories(idx)
    );

    --�Խ���
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
      foreign key(sortNum) references bbs_sort(idx)
);
   --�Խ��� (���ƿ�/�Ⱦ��)
   create table bbs_bad_good(
       bbs_ref number,
       bbs_good_member number,
       bbs_bad_member number,
       foreign key(bbs_ref) references bbs(idx),
       foreign key(bbs_good_member) references members(idx),
       foreign key(bbs_bad_member) references members(idx)
);

--���
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
    
    commit;

    --ī�װ� �޴� ������ 
    create sequence menu_num_seq
        minvalue 1000
        start with 1000
        maxvalue 1999
        increment by 1
        nocache;
    -- ī�װ� ��ǰ ��ȣ ������    
    create sequence prd_num_seq
        minvalue 2000
        start with 2000
        maxvalue 2999
        increment by 1
        nocache;
        drop sequence mem_seq;
    
    --��� ������
    create sequence mem_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
    
    --��ǰ ������
    create sequence prd_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
    
    --��ǰ QnA ������
    create sequence prd_qna_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
        commit;
        
    --���� ������
    create sequence review_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
        commit;
        
    --�Խ��� ������
    create sequence bbs_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
        commit;
        
    --�Խ��� �з� ������
    create sequence bbs_sort_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
        commit;
        
  --�Խ��� ��� ������      
    create sequence bbs_re_seq
        minvalue 1
        start with 1
        increment by 1
        nocache;
        commit;