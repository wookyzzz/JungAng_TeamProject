

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

