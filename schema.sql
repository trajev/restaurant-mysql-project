-- --------------------------------------------------
-- Table: CUSTOMER
-- --------------------------------------------------

CREATE TABLE CUSTOMER (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10) DEFAULT 'Male',
    mobile_no VARCHAR(50),
    address VARCHAR(200),
    email_id VARCHAR(50),
    signup_date DATE,
    date_of_birth DATE,
    food_preference VARCHAR(20),
    CHECK (food_preference IN (
        'Veg', 'Non-Veg', 'Vegan', 'Jain', 'Lactose-Free',
        'Gluten-Free', 'Low-Calorie', 'High-Protein'
    ))
);

-- --------------------------------------------------
-- Table: RESTAURANT
-- --------------------------------------------------

CREATE TABLE RESTAURANT (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    location VARCHAR(300),
    restaurant_type VARCHAR(20),
    gst_no VARCHAR(50),
    established_date DATE,
    CONSTRAINT chk_restaurant_type CHECK (
        restaurant_type IN (
            'Pure Veg', 'Multi Cusine', 'Non Veg', 'Veg & Non Veg',
            'Fast Food', 'Italian', 'Mexican', 'Chinese', 'Japanese',
            'Thai', 'Mediterranean', 'French', 'American', 'Indian'
        )
    )
);

-- --------------------------------------------------
-- Table: MENU
-- --------------------------------------------------

CREATE TABLE MENU (
    menu_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    description VARCHAR(500),
    category VARCHAR(30),
    price DECIMAL(10,2),
    image_url VARCHAR(300),
    preparation_time TIME,
    spice_level VARCHAR(20),
    restaurant_id INT,
    FOREIGN KEY (restaurant_id) REFERENCES RESTAURANT(restaurant_id),
    CHECK (spice_level IN ('None', 'Low', 'Mild', 'Medium', 'Spicy', 'Hot'))
);

-- --------------------------------------------------
-- Table: ORDERS
-- --------------------------------------------------

CREATE TABLE ORDERS (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    restaurant_id INT,
    menu_item_id INT,
    order_type VARCHAR(20),
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2),
    order_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES RESTAURANT(restaurant_id),
    FOREIGN KEY (menu_item_id) REFERENCES MENU(menu_id),
    CHECK (order_type IN ('Take Away', 'Dine in')),
    CHECK (order_status IN ('Cancelled', 'Completed', 'Pending', 'Delivered'))
);

-- --------------------------------------------------
-- Table: EMPLOYEE
-- --------------------------------------------------

CREATE TABLE EMPLOYEE (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    designation VARCHAR(50),
    restaurant_id INT,
    email_id VARCHAR(100),
    mobile_no VARCHAR(20),
    gender VARCHAR(10),
    salary DECIMAL(12,2),
    shift_time VARCHAR(10),
    years_of_experience INT,
    employment_type VARCHAR(20),
    FOREIGN KEY (restaurant_id) REFERENCES RESTAURANT(restaurant_id)
);

-- --------------------------------------------------
-- Table: PAYMENT_TRANSACTION
-- --------------------------------------------------

CREATE TABLE PAYMENT_TRANSACTION (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    reference_no VARCHAR(20) UNIQUE,
    customer_id INT,
    order_id INT,
    payment_type VARCHAR(20),
    transaction_status VARCHAR(20) DEFAULT 'Pending',
    payment_status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
    CHECK (transaction_status IN ('Success', 'Pending', 'Failed'))
);

-- --------------------------------------------------
-- Table: CUSTOMER_REVIEW
-- --------------------------------------------------

CREATE TABLE CUSTOMER_REVIEW (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_id INT,
    restaurant_id INT,
    review VARCHAR(300),
    rating INT CHECK (rating BETWEEN 1 AND 5),
    feedback_date DATE,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
    FOREIGN KEY (restaurant_id) REFERENCES RESTAURANT(restaurant_id)
);
