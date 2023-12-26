-- Хаб Клиенты
CREATE TABLE hub_clients (
    client_hub_id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT UNIQUE,
    load_date DATETIME,
    record_source VARCHAR(100)
);

-- Хаб Инвентарь
CREATE TABLE hub_inventory (
    inventory_hub_id INT AUTO_INCREMENT PRIMARY KEY,
    inventory_id INT UNIQUE,
    load_date DATETIME,
    record_source VARCHAR(100)
);

-- Хаб Сотрудники
CREATE TABLE hub_employees (
    employee_hub_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT UNIQUE,
    load_date DATETIME,
    record_source VARCHAR(100)
);

-- Хаб Прокат
CREATE TABLE hub_rentals (
    rental_hub_id INT AUTO_INCREMENT PRIMARY KEY,
    rental_id INT UNIQUE,
    load_date DATETIME,
    record_source VARCHAR(100)
);
-- Линк Прокат-Клиент-Инвентарь-Сотрудник
CREATE TABLE link_rental_client_inventory_employee (
    link_id INT AUTO_INCREMENT PRIMARY KEY,
    client_hub_id INT,
    inventory_hub_id INT,
    employee_hub_id INT,
    rental_hub_id INT,
    load_date DATETIME,
    record_source VARCHAR(100),
    FOREIGN KEY (client_hub_id) REFERENCES hub_clients(client_hub_id),
    FOREIGN KEY (inventory_hub_id) REFERENCES hub_inventory(inventory_hub_id),
    FOREIGN KEY (employee_hub_id) REFERENCES hub_employees(employee_hub_id),
    FOREIGN KEY (rental_hub_id) REFERENCES hub_rentals(rental_hub_id)
);
-- Сателлит для Клиентов
CREATE TABLE satellite_client (
    client_hub_id INT,
    name VARCHAR(255),
    contact_info VARCHAR(255),
    load_date DATETIME,
    record_source VARCHAR(100),
    FOREIGN KEY (client_hub_id) REFERENCES hub_clients(client_hub_id)
);

-- Сателлит для Инвентаря
CREATE TABLE satellite_inventory (
    inventory_hub_id INT,
    type VARCHAR(50),
    size VARCHAR(50),
    status VARCHAR(50),
    load_date DATETIME,
    record_source VARCHAR(100),
    FOREIGN KEY (inventory_hub_id) REFERENCES hub_inventory(inventory_hub_id)
);

-- Сателлит для Сотрудников
CREATE TABLE satellite_employee (
    employee_hub_id INT,
    name VARCHAR(255),
    position VARCHAR(100),
    load_date DATETIME,
    record_source VARCHAR(100),
    FOREIGN KEY (employee_hub_id) REFERENCES hub_employees(employee_hub_id)
);

-- Сателлит для Проката
CREATE TABLE satellite_rental (
    rental_hub_id INT,
    start_time DATETIME,
    end_time DATETIME,
    cost DECIMAL(10, 2),
    load_date DATETIME,
    record_source VARCHAR(100),
    FOREIGN KEY (rental_hub_id) REFERENCES hub_rentals(rental_hub_id)
);
