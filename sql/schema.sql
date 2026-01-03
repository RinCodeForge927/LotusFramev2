-- Database: savory_whisper
CREATE DATABASE IF NOT EXISTS savory_whisper;
USE savory_whisper;

-- Tables structure
CREATE TABLE IF NOT EXISTS user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    status VARCHAR(50) DEFAULT 'active'
);

CREATE TABLE IF NOT EXISTS product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    image VARCHAR(255),
    price DOUBLE NOT NULL,
    status VARCHAR(50) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS `order` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    full_name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20),
    address TEXT,
    note TEXT,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS order_item (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `order`(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS contact (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    subject VARCHAR(255),
    message TEXT,
    status VARCHAR(50) DEFAULT 'unread',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS blog (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    image VARCHAR(255),
    author VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Seed Data
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE product;
TRUNCATE TABLE category;
TRUNCATE TABLE user;
TRUNCATE TABLE blog;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO user (full_name, email, password, role) VALUES 
('Admin', 'admin@lotus.com', '123', 'admin'),
('Demo Guest', 'guest@lotus.com', '123', 'user');

INSERT INTO category (id, name, description) VALUES 
(1, 'Breakfast & Starters', 'Light and energetic meals to start your day.'),
(2, 'Gourmet Lunch', 'Delicious specialties crafted for a perfect noon.'),
(3, 'Elegant Dinner', 'Exquisite dishes for a memorable evening.'),
(4, 'Beverages & Sweets', 'Refreshing drinks and delightful desserts.');

-- Mapping 30 products based on actual image content
INSERT INTO product (category_id, name, description, price, image) VALUES 
(1, 'Veggie Omelette', 'Fluffy omelette with fresh avocado and tomatoes.', 8.50, 'assets/img/menu-1 copy.jpg'),
(1, 'Hanoi Beef Pho', 'Signature beef noodle soup with 24-hour slow-cooked broth.', 12.00, 'assets/img/menu-2 copy.jpg'),
(1, 'Garden Fresh Salad', 'Crispy seasonal greens with balsamic vinaigrette.', 7.50, 'assets/img/menu-3 copy.jpg'),
(1, 'Coconut Pineapple Toast', 'Sweet tropical toast with shredded coconut.', 6.00, 'assets/img/menu-4 copy.jpg'),
(1, 'Strawberry Pancakes', 'Soufflé style pancakes with fresh strawberries and cream.', 9.50, 'assets/img/menu-5 copy.jpg'),
(1, 'Saigon Banh Mi', 'Traditional baguette with crispy pork and pickled veggies.', 5.50, 'assets/img/menu-6 copy.jpg'),
(2, 'Classic Cheeseburger', 'Juicy beef patty with melted cheddar and fresh greens.', 13.50, 'assets/img/menu-7 copy.jpg'),
(2, 'Creamy Pasta', 'Al dente pasta with rich white sauce and herbs.', 14.00, 'assets/img/menu-8 copy.jpg'),
(2, 'Roasted Chicken', 'Tender roasted chicken with seasonal vegetables.', 15.50, 'assets/img/menu-9 copy.jpg'),
(2, 'Club Sandwich', 'Multi-layered sandwich with ham, cheese, and lettuce.', 10.50, 'assets/img/menu-10 copy.jpg'),
(2, 'Grilled Sea Bass', 'Fresh sea bass fillet with lemon butter sauce.', 21.00, 'assets/img/menu-11 copy.jpg'),
(3, 'Premium Ribeye Steak', 'Prime cut steak served with garlic mash and red wine jus.', 32.00, 'assets/img/menu-12 copy.jpg'),
(3, 'Tuna Tataki', 'Lightly seared tuna with ginger and soy dressing.', 19.50, 'assets/img/menu-13 copy.jpg'),
(3, 'Lamb Chops', 'Grilled lamb chops with rosemary and roasted potatoes.', 28.00, 'assets/img/menu-14 copy.jpg'),
(3, 'Pan-Seared Salmon', 'Crispy skin salmon with asparagus and hollandaise.', 24.50, 'assets/img/menu-15 copy.jpg'),
(4, 'Iced Milk Coffee', 'Traditional Vietnamese coffee with condensed milk.', 4.50, 'assets/img/menu-16 copy.jpg'),
(4, 'Berry Infusion Tea', 'Refreshing cold brew tea with forest berries.', 5.00, 'assets/img/menu-17 copy.jpg'),
(4, 'Green Smoothie', 'Healthy blend of kale, apple, and kiwi.', 6.50, 'assets/img/menu-18 copy.jpg'),
(4, 'Passion Fruit Juice', 'Freshly squeezed passion fruit with a hint of honey.', 4.00, 'assets/img/menu-19 copy.jpg'),
(4, 'Classic Mojito', 'Fresh mint, lime, and soda - the perfect refresher.', 7.00, 'assets/img/menu-20 copy.jpg'),
(2, 'Shrimp Dumplings', 'Hand-crafted dumplings with savory shrimp filling.', 9.00, 'assets/img/menu-21 copy.jpg'),
(2, 'Pesto Pasta', 'Classic linguine tossed in homemade basil pesto.', 13.50, 'assets/img/menu-22 copy.jpg'),
(3, 'Seafood Hotpot', 'Rich seafood broth with fresh catch of the day.', 38.00, 'assets/img/menu-23 copy.jpg'),
(1, 'Summer Rolls', 'Fresh rice paper rolls with shrimp and herbs.', 8.00, 'assets/img/menu-24 copy.jpg'),
(4, 'Chocolate Mousse', 'Velvety smooth dark chocolate mousse.', 7.50, 'assets/img/menu-25 copy.jpg'),
(2, 'Chicken Curry', 'Authentic yellow curry with coconut milk and potatoes.', 14.50, 'assets/img/menu-26 copy.jpg'),
(4, 'Lemonade', 'Classic homemade lemonade with fresh mint.', 3.50, 'assets/img/menu-27 copy.jpg'),
(3, 'Pork Ribs', 'BBQ glazed pork ribs with apple coleslaw.', 22.50, 'assets/img/menu-28 copy.jpg'),
(1, 'Chicken Pho', 'Delicate chicken noodle soup with ginger and scallions.', 11.50, 'assets/img/menu-29 copy.jpg'),
(4, 'Tiramisu', 'Classic Italian dessert with coffee-soaked ladyfingers.', 8.50, 'assets/img/menu-30 copy.jpg');

INSERT INTO blog (title, content, image, author) VALUES 
('Vietnamese Street Food Secrets', 'A journey through Saigon best street food stalls...', 'assets/img/blog-1.jpg', 'Admin'),
('The Art of Slow Drip Coffee', 'Why Vietnamese coffee is becoming a global trend...', 'assets/img/blog-2.jpg', 'Admin'),
('Farm to Table: Our Promise', 'How we ensure the freshest ingredients for our kitchen...', 'assets/img/blog-3.jpg', 'Admin'),
('Healthy Eating in 2026', 'Simple tips to balance your diet with Asian flavors...', 'assets/img/blog-4.jpg', 'Admin');