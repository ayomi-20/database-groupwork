CREATE DATABASE Property_Management_System;
USE Property_Management_System;
CREATE TABLE property_landlords (  landlord_id int auto_increment, name varchar(255), email varchar (255) NOT NULL , phone bigint NOT NULL, UNIQUE (email), PRIMARY KEY (landlord_id));
CREATE TABLE property_tenants (  tenant_id int auto_increment, name varchar(255), email varchar (255) NOT NULL, phone bigint NOT NULL, UNIQUE (email), PRIMARY KEY (tenant_id));
CREATE TABLE properties (  property_id int auto_increment, landlord_id int, tenant_id int NOT NULL, location text NOT NULL, price int NOT NULL, status ENUM ('vacant', 'occupied') DEFAULT 'vacant' NOT NULL, PRIMARY KEY (property_id), FOREIGN KEY (landlord_id) references property_landlords(landlord_id),FOREIGN KEY (tenant_id) references property_tenants(tenant_id));
CREATE TABLE property_complaints (  complaint_id int auto_increment, tenant_id int NOT NULL, complaint_text text, date_submitted DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL, resolved BOOLEAN DEFAULT FALSE NOT NULL, PRIMARY KEY (complaint_id), FOREIGN KEY (tenant_id) references property_tenants(tenant_id));
CREATE TABLE rent_statuses (  rent_status_id int auto_increment, tenant_id int NOT NULL, rent_due_date DATE, rent_paid BOOLEAN DEFAULT FALSE, PRIMARY KEY (rent_status_id), FOREIGN KEY (tenant_id) references property_tenants(tenant_id));


-- inserting values into the database
USE Property_Management_System;
insert into property_landlords( name, email, phone)
values ( "Ayomi", "ayomi2@gmail.com", 0786543214);
insert into property_landlords( name, email, phone)
values ( "Ali", "ali2@gmail.com", 0776545224);
insert into property_tenants( name, email, phone)
values ( "Amina", "amina2@gmail.com", 0785953201);
insert into property_tenants( name, email, phone)
values ( "Sarafina", "sarafina34@gmail.com", 0754678930);
insert into properties( landlord_id, tenant_id, location, price, status)
values ( 1, 2 , "Nakawa", 5000, "vacant");
insert into property_complaints( tenant_id, complaint_text)
values ( 1,"The no access to a proper drainage channel causing stagnation of water around the compound when it rains");
