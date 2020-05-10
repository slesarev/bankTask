# bankTask
task№1
---
![tomcat](https://sun9-62.userapi.com/c855720/v855720889/139719/plbt-FD8PoM.jpg)

data base
-----------------------------------
Я использовал mysql, настройки подключения в файле datasource-cfg.properties

Скрипт для создания таблиц и вноса небольшого количества информации
-----------------------------------
```
create table USERS
(
    ID smallint not null,
    USERNAME VARCHAR(36) not null,
    PASSWORD VARCHAR(36) not null
) ;

alter table USERS
    add constraint USER_PK primary key (ID);

insert into users (ID, USERNAME, PASSWORD)
values (1,'user1', '12345');

insert into users (ID, USERNAME, PASSWORD)
values (2,'admin1', '12345');

create table USER_ROLES
(
    ROLE_ID   smallint not null,
    USERNAME  VARCHAR(36) not null,
    USER_ROLE VARCHAR(30) not null
) ;

alter table USER_ROLES
    add constraint USER_ROLE_PK primary key (ROLE_ID);

alter table USER_ROLES
    add constraint USER_ROLE_UK unique (USERNAME, USER_ROLE);

insert into User_Roles (ROLE_ID, USERNAME, USER_ROLE)
values (1, 'user1', 'USER');

insert into User_Roles (ROLE_ID, USERNAME, USER_ROLE)
values (2, 'admin1', 'ADMIN');

insert into User_Roles (ROLE_ID, USERNAME, USER_ROLE)
values (3, 'admin1', 'USER');

create table CLIENTS
(
    ID   smallint not null PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME VARCHAR(30),
    LAST_NAME  VARCHAR(30),
    PATRONYMIC VARCHAR(30),
    DATE_OF_BIRTH DATE
) ;
create table ACCOUNTS
(
    ID   smallint not null PRIMARY KEY AUTO_INCREMENT,
    CLIENT_ID smallint not null,
    ACCOUNT_NUMBER VARCHAR(30),
    OPEN_DATE DATE DEFAULT (CURRENT_DATE),
    BALANCE double,
    FOREIGN KEY (CLIENT_ID) REFERENCES clients (Id)
) ;
create table TRANSACTIONS
(
    ID   smallint not null PRIMARY KEY AUTO_INCREMENT,
    INACCOUNT_ID smallint not null,
    OUTACCOUNT_ID smallint not null,
    SUM double,
    DATE DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (INACCOUNT_ID) REFERENCES ACCOUNTS (Id),
    FOREIGN KEY (OUTACCOUNT_ID) REFERENCES ACCOUNTS (Id)
);

insert into clients (ID, FIRST_NAME, LAST_NAME, PATRONYMIC, DATE_OF_BIRTH)
values (1, 'ivan', 'ivanov','ivanovich','2000-10-25');
insert into clients (ID, FIRST_NAME, LAST_NAME, PATRONYMIC, DATE_OF_BIRTH)
values (2, 'petr', 'petrov','petrovich','2000-10-25');
insert into accounts (ID,CLIENT_ID,ACCOUNT_NUMBER,BALANCE)
values (1,1, '1231', 152.12);
insert into accounts (ID,CLIENT_ID,ACCOUNT_NUMBER,BALANCE)
values (2,2, '1232', -1152.12);
insert into transactions (ID, INACCOUNT_ID, OUTACCOUNT_ID, SUM)
values (1,2,1,100);
insert into transactions (ID, INACCOUNT_ID, OUTACCOUNT_ID, SUM)
values (2,1,2,300);
```
