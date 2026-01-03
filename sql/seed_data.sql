USE savory_whisper;

-- Clear existing data (optional, to avoid duplicates if run multiple times)
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE order_item;
TRUNCATE TABLE `order`;
TRUNCATE TABLE product;
TRUNCATE TABLE category;
SET FOREIGN_KEY_CHECKS = 1;

-- Thêm dữ liệu mẫu cho danh mục (Category)
INSERT INTO category (name, description, status) VALUES 
('Appetizers', 'Delicious starters to kick off your meal.', 'active'),
('Main Courses', 'Hearty and satisfying primary dishes.', 'active'),
('Desserts', 'Sweet treats to end your dining experience.', 'active'),
('Beverages', 'Refreshing drinks and cocktails.', 'active');

-- Thêm dữ liệu mẫu cho sản phẩm (Product)
INSERT INTO product (category_id, name, description, price, image, status) VALUES 
(1, 'Spring Rolls', 'Crispy rolls filled with vegetables and shrimp.', 12.50, 'https://images.unsplash.com/photo-1544025162-d76694265947', 'active'),
(1, 'Garlic Bread', 'Toasted baguette with garlic butter and herbs.', 8.00, 'https://images.unsplash.com/photo-1573140247632-f8fd74997d5c', 'active'),
(2, 'Grilled Salmon', 'Fresh Atlantic salmon served with roasted asparagus.', 24.99, 'https://images.unsplash.com/photo-1485921325833-c519f76c4927', 'active'),
(2, 'Beef Steak', 'Premium ribeye steak with mashed potatoes and red wine sauce.', 32.00, 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c', 'active'),
(3, 'Chocolate Lava Cake', 'Warm chocolate cake with a gooey center.', 9.50, 'https://images.unsplash.com/photo-1563805042-7684c019e1cb', 'active'),
(3, 'Fruit Tart', 'Seasonal fruits on a creamy custard base.', 7.00, 'https://images.unsplash.com/photo-1519915028121-7d3463d20b13', 'active'),
(4, 'Iced Matcha Latte', 'Creamy green tea latte served over ice.', 5.50, 'https://images.unsplash.com/photo-1515823064-d6e0c04616a7', 'active');
