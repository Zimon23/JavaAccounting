DROP TABLE  USERS ;
DROP TABLE  RECURRING_TRANSACTIONS ;
DROP TABLE  BUDGETS ;
DROP TABLE  TRANSACTIONS ;
DROP TABLE  ACCOUNTS ;
DROP TABLE  CATEGORIES ;
DROP TABLE  SAVING_GOALS ;

CREATE TABLE  USERS  (
	 user_id 	NUMBER		NULL,
	 username 	VARCHAR2(50)		NOT NULL,
	 password 	VARCHAR2(100)		NOT NULL,
	 email 	VARCHAR2(100)		NOT NULL,
	 full_name 	VARCHAR2(100)		NOT NULL,
	 created_date 	TIMESTAMP		NULL,
	 last_login_date 	TIMESTAMP		NULL
);



CREATE TABLE  RECURRING_TRANSACTIONS  (
	 recurring_id 	NUMBER		NULL,
	 user_id 	NUMBER		NOT NULL,
	 account_id 	NUMBER		NOT NULL,
	 category_id 	NUMBER		NULL,
	 amount 	NUMBER(15,2)		NOT NULL,
	 transaction_type 	VARCHAR2(10)		NOT NULL,
	 frequency 	VARCHAR2(20)		NOT NULL,
	 start_date 	DATE		NOT NULL,
	 end_date 	DATE		NULL,
	 next_date 	DATE		NULL,
	 description 	VARCHAR2(200)		NULL,
	 is_active 	NUMBER(1)		NULL
);



CREATE TABLE  BUDGETS  (
	 budget_id 	NUMBER		NULL,
	 user_id 	NUMBER		NOT NULL,
	 category_id 	NUMBER		NULL,
	 amount 	NUMBER(15,2)		NOT NULL,
	 period_type 	VARCHAR2(10)		NOT NULL,
	 start_date 	DATE		NOT NULL,
	 end_date 	DATE		NULL,
	 notification_threshold 	NUMBER(3)		NULL,
	 created_date 	TIMESTAMP		NULL,
	 last_updated 	TIMESTAMP		NULL
);



CREATE TABLE  TRANSACTIONS  (
	 transaction_id 	NUMBER		NULL,
	 user_id 	NUMBER		NULL,
	 category_id2 	NUMBER		NULL,
	 amount 	NUMBER(15,2)		NOT NULL,
	 transaction_date 	TIMESTAMP		NULL,
	 description 	VARCHAR2(500)		NULL,
	 location 	VARCHAR2(200)		NULL
);



CREATE TABLE  ACCOUNTS  (
	 account_id 	NUMBER		NULL,
	 user_id 	NUMBER		NOT NULL,
	 account_name 	VARCHAR2(100)		NOT NULL,
	 account_type 	VARCHAR2(20)		NOT NULL,
	 currency 	VARCHAR2(3)	DEFAULT 'KRW'	NULL,
	 initial_balance 	NUMBER(15,2)		NULL,
	 current_balance 	NUMBER(15,2)		NULL,
	 is_active 	NUMBER(1)		NULL,
	 created_date 	TIMESTAMP		NULL,
	 last_updated 	TIMESTAMP		NULL,
	 description 	VARCHAR2(200)		NULL
);



CREATE TABLE  CATEGORIES  (
	 category_id 	NUMBER		NULL,
	 user_id 	NUMBER		NULL,
	 category_name 	VARCHAR2(50)		NOT NULL,
	 category_type 	VARCHAR2(10)		NOT NULL,
	 parent_category_id 	NUMBER		NULL,
	 icon_name 	VARCHAR2(50)		NULL,
	 display_order 	NUMBER		NULL,
	 is_active 	NUMBER(1)		NULL
);



CREATE TABLE  SAVING_GOALS  (
	 goal_id 	NUMBER		NULL,
	 user_id 	NUMBER		NOT NULL,
	 account_id 	NUMBER		NULL,
	 goal_name 	VARCHAR2(100)		NOT NULL,
	 target_amount 	NUMBER(15,2)		NOT NULL,
	 current_amount 	NUMBER(15,2)		NULL,
	 start_date 	DATE		NULL,
	 target_date 	DATE		NULL,
	 priority 	NUMBER(1)		NULL,
	 status 	VARCHAR2(20)	DEFAULT 'ACTIVE'	NULL
);

ALTER TABLE  USERS  ADD CONSTRAINT  PK_USERS  PRIMARY KEY (
	 user_id 
);

ALTER TABLE  TRANSACTIONS  ADD CONSTRAINT  PK_TRANSACTIONS  PRIMARY KEY (
	 transaction_id 
);

ALTER TABLE  CATEGORIES  ADD CONSTRAINT  PK_CATEGORIES  PRIMARY KEY (
	 category_id 
);

ALTER TABLE  TRANSACTIONS  ADD CONSTRAINT  FK_USERS_TO_TRANSACTIONS_1  FOREIGN KEY (
	 user_id 
)
REFERENCES  USERS  (
	 user_id 
);

ALTER TABLE  TRANSACTIONS  ADD CONSTRAINT  FK_CATEGORIES_TO_TRANSACTIONS_1  FOREIGN KEY (
	 category_id2 
)
REFERENCES  CATEGORIES  (
	 category_id 
);

ALTER TABLE  CATEGORIES  ADD CONSTRAINT  FK_USERS_TO_CATEGORIES_1  FOREIGN KEY (
	 user_id 
)
REFERENCES  USERS  (
	 user_id 
);

