-- Создание таблицы Клиенты
CREATE TABLE clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    contact_info VARCHAR(255)
);

-- Создание таблицы Инвентарь
CREATE TABLE inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    size VARCHAR(50),
    status VARCHAR(50) NOT NULL
);

-- Создание таблицы Прокат
CREATE TABLE rentals (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    inventory_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id)
);

-- Создание таблицы Оплата
CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    rental_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    FOREIGN KEY (rental_id) REFERENCES rentals(rental_id)
);

-- Создание таблицы Сотрудники
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    position VARCHAR(100) NOT NULL
);
