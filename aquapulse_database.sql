CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE comments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  content TEXT NOT NULL,
  stars INT NOT NULL,
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

CREATE TABLE faq (
  id INT AUTO_INCREMENT PRIMARY KEY,
  content TEXT NOT NULL,
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  description TEXT,
  price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  total_price DECIMAL(10, 2) NOT NULL,
  order_date DATE DEFAULT(CURRENT_DATE),
  delivery_date DATE,
  status VARCHAR(20), -- Pendente, Em Andamento, Concluído
  is_paid BOOL DEFAULT FALSE,
  user_id INT,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE NO ACTION
);

CREATE TABLE products_orders (
  product_id INT,
  order_id INT,
  PRIMARY KEY(product_id, order_id),
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE NO ACTION,
  FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE NO ACTION
);