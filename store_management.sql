------------------------ first question ----------------------

CREATE DATABASE `store_management` COLLATE utf8mb4_unicode_ci;

CREATE TABLE `government` (
    `id` int PRIMARY KEY AUTO_INCREMENT,
	`location` varchar(40) not null 
);

CREATE TABLE `store` (
    `id` int PRIMARY KEY AUTO_INCREMENT,
	`government_id` int ,
    `name` varchar(25) not null ,
    `address` varchar(40) not null,
    FOREIGN KEY (`government_id`) REFERENCES government(id)
);

CREATE TABLE `suppliers` (
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(25) not null ,
    `email` varchar(30) not null UNIQUE,
    `phone` varchar(15) not null,
    `brief_data` text
);

CREATE TABLE `product` (
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(25) not null ,
    `code` int not null UNIQUE,
    `price` int not null,
    `description` text,
    `supplier_id` int not null ,
    FOREIGN KEY (`supplier_id`) REFERENCES suppliers(id)
);
CREATE TABLE store_product (
    `store_id` int PRIMARY KEY,
    `product_id` int PRIMARY KEY,
    `quantity` int,
    FOREIGN KEY (store_id) REFERENCES store(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);


