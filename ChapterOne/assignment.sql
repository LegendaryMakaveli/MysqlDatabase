CREATE DATABASE e_commerce;
use e_commerce;

CREATE TABLE users(
	users_id int,
    PRIMARY KEY(users_id),
    name VARCHAR(100),
    address VARCHAR(100),
    phoneNumber VARCHAR(100),
    DateOfBirth VARCHAR(100),
    email VARCHAR(100) UNIQUE
    );
    
CREATE TABLE products (
    productName VARCHAR(100),
    size VARCHAR(100),
    color VARCHAR(100),
    status VARCHAR(100),
    products_id int,
	PRIMARY KEY(products_id)
);


CREATE TABLE orders (
    orders_id int,
    PRIMARY KEY (orders_id),
    users_id int,
    products_id int,
    orderDate datetime,
    
    foreign key (users_id) references users(users_id),
    foreign key (products_id) references products(products_id)
);