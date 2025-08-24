-- 1. Add a new column to track feedback given date
ALTER TABLE customer_review ADD COLUMN feedback_date DATE;


-- 2. Change max length of phone number in customer table
ALTER TABLE customer MODIFY COLUMN mobile_no VARCHAR(50);


-- 3. Add unique constraint on email in restaurant table
-- Note: Restaurant table does not have an email column, so this is skipped


-- 4. Add new column in payment_transaction to track status
ALTER TABLE payment_transaction ADD COLUMN payment_status VARCHAR(30);


-- 5. Add check constraint on payment_status column in payment_transaction
-- with accepted values: 'Success', 'Pending', 'Failed'
ALTER TABLE payment_transaction
ADD CONSTRAINT chk_payment_status
CHECK (payment_status IN ('Success', 'Pending', 'Failed'));


-- 6. Give default value to gender column in customer table as 'Male'
ALTER TABLE customer MODIFY COLUMN gender VARCHAR(10) DEFAULT 'Male';


-- 7. Update the customer's first name to 'Raju' whose last name is 'Sekhar'
UPDATE customer SET first_name = 'Raju' WHERE last_name = 'Sekhar';


-- 8. Delete the feedback whose customer_id is 3
DELETE cr
FROM customer_review cr
JOIN customer c ON cr.customer_id = c.customer_id
WHERE c.customer_id = 3;


-- 9. Add new food menu item 'Pizza'
INSERT INTO menu (name, description, category, price, image_url, preparation_time, spice_level, restaurant_id)
VALUES ('Pizza', 'Simple Classic Pizza', 'Main Course', 300.00, 'http://example.com/pizza.jpg', '00:25:00', 'Mild', 3);


-- 10. Get order details with customer name and restaurant name
SELECT
    o.order_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    r.name AS restaurant_name
FROM orders o
JOIN customer c ON c.customer_id = o.customer_id
JOIN restaurant r ON o.restaurant_id = r.restaurant_id;


-- 11. Get restaurant name with number of menu items
SELECT
    r.name,
    COUNT(m.menu_id) AS number_of_menu_items
FROM restaurant r
JOIN menu m ON m.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_id;


-- 12. Get the customers who have food preference as 'Non-Veg'
SELECT
    customer_id,
    CONCAT(first_name, ' ', last_name) AS customer_name,
    food_preference
FROM customer
WHERE food_preference = 'Non-Veg';


-- 13. Create new column 'created_date' in restaurant table
ALTER TABLE restaurant ADD COLUMN created_date DATE;


-- 14. Drop column 'created_date' in restaurant table
ALTER TABLE restaurant DROP COLUMN created_date;


-- 15. Update order status to 'Delivered' whose customer name is 'Anjali'
UPDATE orders
SET order_status = 'Delivered'
WHERE customer_id IN (SELECT customer_id FROM customer WHERE first_name = 'Anjali');


-- 16. Show all orders of customer 'Rajeev'
SELECT
    o.order_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    o.order_type,
    o.order_date,
    o.total_amount,
    o.order_status
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
WHERE c.first_name = 'Rajeev';


-- 17. Get total revenue of restaurant named 'Udupi'
SELECT
    r.name AS restaurant_name,
    SUM(o.total_amount) AS total_revenue
FROM orders o
JOIN restaurant r ON r.restaurant_id = o.restaurant_id
WHERE r.name = 'Udupi'
GROUP BY r.restaurant_id;


-- 18. New restaurant joined 'Santhosh Dhaba'
INSERT INTO restaurant (name, location, restaurant_type, gst_no, established_date)
VALUES ('Santhosh Dhaba', 'Your Location', 'Dhaba', 'GST12345', '2025-01-01');


-- 19. Find restaurants who have more than 5 menu items
SELECT
    r.name,
    COUNT(m.menu_id) AS number_of_menu_items
FROM restaurant r
JOIN menu m ON m.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_id
HAVING number_of_menu_items > 5;


-- 20. Insert multiple rows in restaurant menu: Idly, Dosa, Apple Juice
INSERT INTO menu (name, description, category, price, image_url, preparation_time, spice_level, restaurant_id)
VALUES
('Idly', 'Steamed rice cakes', 'Breakfast', 50.00, 'http://example.com/idly.jpg', '00:15:00', 'None', 1),
('Dosa', 'Crispy rice crepe', 'Breakfast', 70.00, 'http://example.com/dosa.jpg', '00:20:00', 'Mild', 1),
('Apple Juice', 'Fresh apple juice', 'Beverages', 80.00, 'http://example.com/applejuice.jpg', '00:05:00', 'None', 1);


-- 21. Search the customer who has given the highest feedback rating
SELECT
    customer_id,
    CONCAT(first_name, ' ', last_name) AS customer_name,
    rating
FROM customer_review cr
JOIN customer c ON cr.customer_id = c.customer_id
WHERE rating = (SELECT MAX(rating) FROM customer_review);


-- 22. Fetch 5 feedback rows after the 10th feedback (pagination)
SELECT * FROM customer_review
LIMIT 5 OFFSET 10;


-- 23. Find restaurants whose GST is not specified
SELECT * FROM restaurant
WHERE gst_no IS NULL OR gst_no = '';


-- 24. Find orders whose payment failed
SELECT
    o.order_id,
    o.customer_id,
    pt.payment_status
FROM orders o
JOIN payment_transaction pt ON o.order_id = pt.order_id
WHERE pt.payment_status = 'Failed';


-- 25. Classify restaurants as High, Medium, Low based on average feedback rating
SELECT
    a.restaurant_name,
    a.average_rating,
    CASE
        WHEN a.average_rating > 3 THEN 'High'
        WHEN a.average_rating = 3 THEN 'Medium'
        ELSE 'Low'
    END AS category
FROM (
    SELECT
        r.name AS restaurant_name,
        AVG(cr.rating) AS average_rating
    FROM customer_review cr
    JOIN restaurant r ON r.restaurant_id = cr.restaurant_id
    GROUP BY cr.restaurant_id
) AS a;


-- 26. Find top menu items based on the number of orders
SELECT
    m.menu_id,
    m.name,
    COUNT(oi.order_id) AS number_of_orders
FROM menu m
JOIN order_items oi ON m.menu_id = oi.menu_id
GROUP BY m.menu_id
ORDER BY number_of_orders DESC
LIMIT 10;


-- 27. Delete customers who never placed an order
DELETE FROM customer
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);


-- 28. Increase the price of all items in 'The Pasta Corner' restaurant by 10%
UPDATE menu m
JOIN restaurant r ON m.restaurant_id = r.restaurant_id
SET m.price = m.price * 1.10
WHERE r.name = 'The Pasta Corner';


-- Check updated prices
SELECT m.menu_id, m.name, r.name AS restaurant_name, m.price
FROM menu m
JOIN restaurant r ON m.restaurant_id = r.restaurant_id
WHERE r.name = 'The Pasta Corner';


-- 29. Create a view that gives customer and order details
CREATE OR REPLACE VIEW customer_order_view AS
SELECT
    o.order_id,
    o.order_date,
    o.order_status,
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    r.restaurant_id,
    r.name AS restaurant_name
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
JOIN restaurant r ON o.restaurant_id = r.restaurant_id;


-- 30. Using INSERT SELECT, give feedback after order is moved to completed status
INSERT INTO customer_review (customer_id, order_id, restaurant_id, review, rating, feedback_date)
SELECT
    customer_id,
    order_id,
    restaurant_id,
    'Showing insert select demo',
    4,
    order_date
FROM orders
WHERE order_status = 'Completed'
AND order_date > '2025-06-23';

-- Check inserted reviews
SELECT * FROM customer_review;
