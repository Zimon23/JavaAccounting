DROP TABLE  USERS ;
DROP TABLE  TRANSACTIONS ;
DROP TABLE  CATEGORIES ;

CREATE TABLE  USERS  (
	 user_id 	NUMBER		NULL,
	 username 	VARCHAR2(50)		NOT NULL,
	 password 	VARCHAR2(100)		NOT NULL,
	 email 	VARCHAR2(100)		NOT NULL,
	 full_name 	VARCHAR2(100)		NOT NULL,
	 created_date 	TIMESTAMP		NULL,
	 last_login_date 	TIMESTAMP		NULL
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



ALTER TABLE  USERS  ADD CONSTRAINT  PK_USERS  PRIMARY KEY (
	 user_id 
);

ALTER TABLE  TRANSACTIONS  ADD CONSTRAINT  PK_TRANSACTIONS  PRIMARY KEY (
	 transaction_id 
);

ALTER TABLE  CATEGORIES  ADD CONSTRAINT  PK_CATEGORIES  PRIMARY KEY (
	 category_id 
);

REFERENCES  USERS  (
	 user_id 
);

REFERENCES  CATEGORIES  (
	 category_id 
);

ALTER TABLE  CATEGORIES  ADD CONSTRAINT  FK_USERS_TO_CATEGORIES_1  FOREIGN KEY (
	 user_id 
)
REFERENCES  USERS  (
	 user_id 
);

