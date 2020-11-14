--create table about info of guest
CREATE TABLE guest( 
guest_id INT,
fname VARCHAR(66), 
lname VARCHAR(66),
document_id DECIMAL(30),
phoneNum VARCHAR(30),
booking_id INT,
payment_id int,
PRIMARY KEY (guest_id)  
);

CREATE TABLE payment(
payment_id int,
payment_size int,
guest_id int,
PRIMARY KEY (payment_id),
foreign key(guest_id) references guest(guest_id) --the payment table is directly linked to the guest table using a foreign key constraint
);
alter table guest add foreign key(payment_id) references payment(payment_id); --specifed the foreign key constraint for the guest after the created payment table where  payment_id was specified as PK
--
CREATE TABLE booking(
booking_id INT,
dateFrom DATE,
dateTo DATE,
guest_id INT,
room_id INT,
adults INT,
kids INT,
PRIMARY KEY (booking_id),
FOREIGN KEY(guest_id) REFERENCES guest(guest_id) --specified FK(guest_id) for booking	
);

ALTER TABLE guest
ADD FOREIGN KEY (booking_id) REFERENCES booking(booking_id);--we created booking table, and now we can specified FK booking_id for guest table.

ALTER TABLE booking
ADD FOREIGN KEY (guest_id) REFERENCES guest(guest_id); 
--

CREATE TABLE room(
room_id INT,
category_id INT, --will be FK but we specify it later 
booking_id INT,
primary key(room_id),
foreign key(booking_id) references booking(booking_id)
);
alter table booking 
add foreign key(room_id) references room(room_id);
--
CREATE TABLE room_category(
category_id INT,
c_name varchar(66),
cost DECIMAL(30),
number_seats INT,
description TEXT,
PRIMARY KEY(category_id)
	);
ALTER TABLE room
ADD FOREIGN KEY (category_id) REFERENCES room_category(category_id);

--
 CREATE TABLE menu(
 product_id int,
 mname varchar(66),
 cost decimal(30),
PRIMARY KEY(product_id)
 );
 
 CREATE TABLE orders(
 order_id int,
 product_id int,
 order_amount int,
 room_id int,
PRIMARY KEY(order_id),
FOREIGN KEY (product_id) REFERENCES menu(product_id),
FOREIGN KEY (room_id) REFERENCES room(room_id)
 );

--
CREATE TABLE serving(
room_id int,
maidservant_id int, --future FK
FOREIGN KEY (room_id) REFERENCES room(room_id)
);
--
create table shift(
shift_id int,
shift_header VARCHAR(66),
PRIMARY KEY(shift_id)
);

create table maidservant(
maidservant_id int,
fname varchar(66),
lname varchar(66),
document_id decimal(30),
phoneNum VARCHAR(30),
shift_id int,
room_id int,
PRIMARY KEY(maidservant_id),
FOREIGN KEY (room_id) REFERENCES room(room_id),
FOREIGN KEY (shift_id) REFERENCES shift(shift_id)
);

ALTER TABLE serving
ADD FOREIGN KEY (maidservant_id) REFERENCES maidservant(maidservant_id);--after the created table, we boldly specify  foreign key constraint for serving

--
create table duty_schedule(
duty_date date,
shift_id int,
foreign key(shift_id) references shift(shift_id)
);

