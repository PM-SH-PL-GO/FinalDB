CREATE USER shallwe identified by kosta;        
GRANT CREATE TABLE to shallwe;             
GRANT DROP ANY TABLE to shallwe;          
GRANT CREATE SEQUENCE to shallwe;          
GRANT CREATE VIEW to shallwe;              
GRANT CREATE PROCEDURE to shallwe;          

GRANT INSERT ANY TABLE to shallwe;
GRANT ALTER ANY TABLE to shallwe;

GRANT UNLIMITED TABLESPACE to shallwe;
GRANT CONNECT, RESOURCE to shallwe;