
-- --------------------------------------------------
-- Insert Statements for CUSTOMER table
-- --------------------------------------------------

INSERT INTO CUSTOMER (first_name,last_name,mobile_no,address,email_id,signup_date,date_of_birth,gender,food_preference) VALUES
	 ('Anjali','Sharma','+919876543210','123 MG Road, Bengaluru, India','anjali.sharma@example.in','2022-03-15', '1995-06-20','Female','Veg'),
	 ('Arjun','Patel','+919812345678','456 Park Street, Kolkata, India','arjun.patel@example.in','2023-01-10','1992-11-05','Male','Non-Veg'),
	 ('Emma','Johnson','+447700900123','Flat 5, King’s Road, London, UK','emma.johnson@example.co.uk','2021-11-25','1988-04-12','Female','Vegan'),
	 ('Raju','Kumar','+919123456789','Sector 22, Noida, India','ravi.kumar@example.in','2024-02-01','1990-09-17','Male','Veg'),
	 ('Aisha','Begum','+971501234567','Deira, Dubai, UAE','aisha.begum@example.ae','2023-09-15','1994-03-30','Female','Non-Veg'),
	 ('John','Doe','+11234567890','123 Main St, New York, USA','john.doe@example.com','2020-08-05','1985-07-25','Male','Vegan'),
	 ('Meera','Iyer','+919876123456','T. Nagar, Chennai, India','meera.iyer@example.in','2022-06-20','1991-12-11','Female','Veg'),
	 ('Carlos','Rodriguez','+34961234567','Gran Via, Madrid, Spain','carlos.rod@example.es','2023-03-14','1993-01-22','Male','Non-Veg'),
	 ('Harpreet','Singh','+919865432109','Model Town, Ludhiana, India','harpreet.singh@example.in','2024-04-10','1996-08-02','Male','Veg'),
	 ('Sophia','Lee','+821012345678','Gangnam, Seoul, South Korea','sophia.lee@example.kr','2021-07-19','1992-02-14','Female','Vegan');


-- --------------------------------------------------
-- Insert Statements for RESTAURANT table
-- --------------------------------------------------

INSERT INTO RESTAURANT (name,location,restaurant_type,gst_no,established_date) VALUES
	 ('Spice Villa','Indiranagar, Bengaluru, India','Indian','GSTIN1234567890IN','2015-05-10'),
	 ('Curry House','Park Street, Kolkata, India','Indian','GSTIN0987654321IN','2018-09-01'),
	 ('The Pasta Corner','Soho, London, UK','Italian','UKGST111222333','2017-03-20'),
	 ('Sushi World','Shibuya, Tokyo, Japan','Japanese','JPGST444555666','2020-06-15'),
	 ('Tandoori Nights','Karol Bagh, New Delhi, India','Indian','GSTIN2468101214IN','2013-11-22'),
	 ('Le Baguette','Champs-Élysées, Paris, France','French','FRGST987654321','2016-04-30'),
	 ('The Kebab Factory','Connaught Place, Delhi, India','Non Veg','GSTIN2233445566IN','2019-07-10'),
	 ('Dragon Garden','Orchard Road, Singapore','Chinese','SGGST1029384756','2014-12-01'),
	 ('The Greek Table','Plaka, Athens, Greece','Multi Cusine','GRGST567891234','2012-10-18'),
	 ('Bombay Bistro','Downtown Dubai, UAE','Multi Cusine','AEGST1324354657','2021-01-12');


-- --------------------------------------------------
-- Insert Statements for MENU table
-- --------------------------------------------------

INSERT INTO MENU (name, description, category, price, image_url, preparation_time, spice_level, restaurant_id) VALUES
    ('Paneer Butter Masala', 'Creamy tomato-based gravy with paneer cubes', 'Main Course', 250.0, 'http://example.com/paneer.jpg', '00:25:00', 'Medium', 1),
    ('Chicken Biryani', 'Fragrant basmati rice with marinated chicken', 'Main Course', 300.0, 'http://example.com/biryani.jpg', '00:40:00', 'Spicy', 2),
    ('Margherita Pizza', 'Classic Italian pizza with fresh basil and cheese', 'Main Course', 350.0, 'http://example.com/pizza.jpg', '00:20:00', 'Mild', 3),
    ('Salmon Sushi', 'Fresh salmon on vinegared rice', 'Appetizer', 450.0, 'http://example.com/sushi.jpg', '00:15:00', 'Mild', 2),
    ('Tandoori Chicken', 'Spiced roasted chicken cooked in a tandoor', 'Main Course', 320.0, 'http://example.com/tandoori.jpg', '00:30:00', 'Spicy', 5),
    ('Croissant', 'Flaky buttery French pastry', 'Bakery', 150.0, 'http://example.com/croissant.jpg', '00:15:00', 'None', 6),
    ('Seekh Kebab', 'Minced meat skewers with spices', 'Appetizer', 200.0, 'http://example.com/kebab.jpg', '00:20:00', 'Spicy', 7),
    ('Kung Pao Chicken', 'Spicy stir-fried chicken with peanuts', 'Main Course', 280.0, 'http://example.com/kungpao.jpg', '00:25:00', 'Hot', 2),
    ('Greek Salad', 'Fresh vegetables with feta cheese and olives', 'Salad', 220.0, 'http://example.com/greeksalad.jpg', '00:10:00', 'Mild', 9),
    ('Pav Bhaji', 'Spiced mashed vegetable curry served with bread rolls', 'Street Food', 180.0, 'http://example.com/pavbhaji.jpg', '00:20:00', 'Medium', 10);


-- --------------------------------------------------
-- Insert Statements for ORDERS table
-- --------------------------------------------------

INSERT INTO ORDERS (customer_id, restaurant_id, order_type, order_date, total_amount, order_status, menu_item_id) VALUES
    (1, 3, 'Take Away', '2025-06-20 18:30:00', 350.0, 'Completed', 3),
    (2, 1, 'Take Away', '2025-06-21 12:00:00', 250.0, 'Pending', 1),
    (1, 2, 'Dine in',   '2025-06-22 13:00:00', 300.0, 'Completed', 2),
    (3, 3, 'Dine in',   '2025-06-23 19:45:00', 350.0, 'Cancelled', 3),
    (4, 5, 'Take Away', '2025-06-18 09:30:00', 320.0, 'Completed', 5),
    (5, 1, 'Dine in',   '2025-06-19 20:15:00', 250.0, 'Completed', 1),
    (2, 4, 'Take Away', '2025-06-20 21:00:00', 450.0, 'Pending',   4),
    (3, 5, 'Take Away', '2025-06-21 18:00:00', 320.0, 'Completed', 5),
    (4, 2, 'Dine in',   '2025-06-22 12:00:00', 300.0, 'Completed', 2),
    (1, 1, 'Take Away', '2025-06-23 17:30:00', 250.0, 'Completed', 1);


-- --------------------------------------------------
-- Insert Statements for EMPLOYEE table
-- --------------------------------------------------

INSERT INTO EMPLOYEE (name,designation,restaurant_id,email_id,mobile_no,gender,salary,shift_time,years_of_experience,employment_type) VALUES
	 ('Rahul Sharma','Chef',1,'rahul.sharma@spicevilla.in','919876543210','Male',45000.0,'Morning',8,'Full-Time'),
	 ('Anita Verma','Manager',2,'anita.verma@greenbowl.in','919812345678','Female',60000.0,'Evening',10,'Full-Time'),
	 ('John Doe','Waiter',3,'john.doe@tasteofitaly.com','14155552671','Male',25000.0,'Night',3,'Part-Time'),
	 ('Yuki Tanaka','Chef',4,'yuki.tanaka@sushiworld.jp','81312345678','Female',50000.0,'Morning',7,'Full-Time'),
	 ('Deepak Singh','Cashier',1,'deepak.singh@spicevilla.in','919812233445','Male',20000.0,'Evening',2,'Part-Time'),
	 ('Emily Clark','Manager',6,'emily.clark@burgerhub.co.uk','447911123456','Female',62000.0,'Morning',12,'Full-Time'),
	 ('Nikos Papadopoulos','Chef',7,'nikos@mediterraneo.gr','302103456789','Male',47000.0,'Evening',9,'Full-Time'),
	 ('Maria Gonzalez','Waiter',8,'maria.gonzalez@tacofiesta.mx','525512345678','Female',23000.0,'Night',1,'Part-Time'),
	 ('Jean Dupont','Chef',9,'jean.dupont@lepetitbistro.fr','33123456789','Male',49000.0,'Morning',10,'Full-Time'),
	 ('Li Wei','Cashier',10,'li.wei@dragonexpress.cn','861012345678','Female',21000.0,'Evening',3,'Part-Time');


-- --------------------------------------------------
-- Insert Statements for PAYMENT_TRANSACTION table
-- --------------------------------------------------

INSERT INTO PAYMENT_TRANSACTION (reference_no, customer_id, order_id, payment_type, transaction_status) VALUES
    ('REF1001', 1, 1, 'Credit Card', 'Completed'),
    ('REF1002', 2, 2, 'Debit Card', 'Completed'),
    ('REF1003', 1, 3, 'UPI', 'Completed'),
    ('REF1004', 3, 4, 'Cash', 'Failed'),
    ('REF1005', 4, 5, 'Credit Card', 'Completed'),
    ('REF1006', 5, 6, 'Wallet', 'Pending'),
    ('REF1007', 2, 7, 'UPI', 'Completed'),
    ('REF1008', 3, 8, 'Debit Card', 'Completed'),
    ('REF1009', 4, 9, 'Credit Card', 'Completed'),
    ('REF1010', 1, 10, 'Cash', 'Completed');


-- --------------------------------------------------
-- Insert Statements for CUSTOMER_REVIEW table
-- --------------------------------------------------

INSERT INTO CUSTOMER_REVIEW (customer_id,order_id,restaurant_id,review,rating) VALUES
	 (1,1,3,'Delicious food and quick delivery.',5.0),
	 (2,2,1,'Good taste but packaging was poor.',3.0),
	 (1,3,2,'Loved the ambiance and food.',4.0),
	 (3,4,3,'Order was late and cold.',2.0),
	 (4,5,5,'Highly recommend their lamb rogan josh.',5.0),
	 (5,6,1,'Great burger, will order again.',4.0),
	 (2,7,4,'Spice level perfect and fresh.',5.0),
	 (3,8,5,'Food was average.',3.0),
	 (4,9,2,'Excellent service.',5.0),
	 (1,10,1,'Good value for money.',4.0);

