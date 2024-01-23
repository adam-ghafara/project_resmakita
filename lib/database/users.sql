CREATE TABLE users (
    user_id INTEGER(15) PRIMARY KEY AUTO_INCREMENT,
    user_fullname VARCHAR(100) NOT NULL,
    user_username VARCHAR(100) NOT NULL UNIQUE,
    user_password VARCHAR(100) NOT NULL,
);