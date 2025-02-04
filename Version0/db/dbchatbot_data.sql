-- Author: Ankit Kumar
-- Date: 04/02/2025

-- Database Creation
CREATE DATABASE IF NOT EXISTS DBChatBot;
USE DBChatBot;

-- Table Schema for Suppliers
CREATE TABLE suppliers (
	id INT AUTO_INCREMENT PRIMARY KEY,
    suppliers_name VARCHAR(255) NOT NULL,
    suppliers_contact_info VARCHAR(255) NOT NULL,
    product_category VARCHAR(100) NOT NULL
);

-- Table Schema for Products
CREATE TABLE products (
	id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    brand VARCHAR(100),
    price DECIMAL(10, 2),
    category VARCHAR(100),
    description TEXT,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

-- Sample Data - Suppliers
INSERT INTO suppliers (suppliers_name, suppliers_contact_info, product_category) VALUES
	("ABL Imports", "ablimports@gmail.com", "Grocery"),
    ("Sachin Machinery", "sachin_machinary@yahoo.com", "Machinery"),
    ("Sai Suppliers", "sai_suppliers@gmail.com", "Textile"),
    ("Guru Kripa Suppliers", "guru_kripa1@gmail.com", "Textile"),
    ("SR Infotech", "sr_infotech@gmail.com", "Electronics"),
    ("Shilpa Computers", "shilpa_computers@gmail.com", "Electronics"),
    ("Dutta Hardware", "dutta_hardware@gmail.com", "Machinery"),
    ("Emrati Traders", "emrati_uae@gmail.com", "Grocery");

-- Sample Data - Products
INSERT INTO products (product_name, brand, price, category, description, supplier_id) VALUES
    ("Basmati Rice", "India Gate", 1200.00, "Grocery", "Premium quality long grain basmati rice.", 1),
    ("Olive Oil", "Borges", 800.00, "Grocery", "Extra virgin olive oil for cooking and salads.", 1),
    ("Whole Wheat Flour", "Aashirvaad", 450.00, "Grocery", "High fiber wheat flour for soft chapatis.", 1),
    ("Welding Machine", "Bosch", 7500.00, "Machinery", "Industrial grade welding machine.", 2),
    ("Drilling Machine", "Black & Decker", 5500.00, "Machinery", "High power drill machine for industrial use.", 2),
    ("Textile Roll", "Raymond", 1500.00, "Textile", "Pure cotton fabric for clothing.", 3),
    ("Silk Fabric", "FabIndia", 3500.00, "Textile", "Premium silk fabric for designer wear.", 3),
    ("Cotton Saree", "Sambalpuri", 2500.00, "Textile", "Handwoven pure cotton saree.", 4),
    ("Laptop", "Dell", 45000.00, "Electronics", "Dell Inspiron 15 with Intel i5 processor.", 5),
    ("Smartphone", "Samsung", 25000.00, "Electronics", "Samsung Galaxy M32 with AMOLED display.", 5),
    ("Mechanical Keyboard", "Logitech", 4500.00, "Electronics", "RGB backlit mechanical keyboard.", 6),
    ("Gaming Mouse", "Razer", 3200.00, "Electronics", "High precision gaming mouse with RGB.", 6),
    ("Electric Drill", "Makita", 6200.00, "Machinery", "Cordless electric drill with battery pack.", 7),
    ("Angle Grinder", "Bosch", 4800.00, "Machinery", "Heavy duty angle grinder for industrial use.", 7),
    ("Almonds", "California Gold", 1500.00, "Grocery", "Premium quality almonds from California.", 8),
    ("Cashews", "Goan Delight", 1200.00, "Grocery", "Whole cashew nuts, vacuum packed.", 8),
    ("Laptop RAM", "Corsair", 7800.00, "Electronics", "16GB DDR4 RAM for laptops.", 6),
    ("External Hard Drive", "Seagate", 5500.00, "Electronics", "1TB external hard drive with USB 3.0.", 6),
    ("Hydraulic Pump", "HydroMax", 18000.00, "Machinery", "Industrial grade hydraulic pump.", 2),
    ("Textile Printing Machine", "Brother", 50000.00, "Machinery", "High-speed textile printing machine.", 2),
    ("Digital Weighing Scale", "Omron", 3000.00, "Electronics", "Accurate electronic weighing scale.", 5),
    ("LED Monitor", "LG", 12000.00, "Electronics", "24-inch LED monitor with 75Hz refresh rate.", 5),
    ("UPS", "APC", 5500.00, "Electronics", "1kVA UPS for uninterrupted power supply.", 6),
    ("Water Purifier", "Kent", 12000.00, "Electronics", "RO+UV water purifier for home use.", 6),
    ("Solar Panel", "Luminous", 25000.00, "Electronics", "200W solar panel for renewable energy.", 6),
    ("Cement Mixer", "UltraTech", 28000.00, "Machinery", "Industrial grade cement mixer machine.", 7),
    ("Refrigerator", "Samsung", 32000.00, "Electronics", "Double door refrigerator with digital inverter.", 5),
    ("Microwave Oven", "IFB", 12000.00, "Electronics", "Convection microwave oven with grill function.", 5),
    ("Nut Bolts", "Tata", 1500.00, "Machinery", "Set of industrial-grade stainless steel nuts and bolts.", 7),
    ("Men's Shirt", "Peter England", 2200.00, "Textile", "Formal full-sleeve men's shirt.", 3),
    ("Trousers", "Raymond", 2800.00, "Textile", "Premium cotton trousers for office wear.", 4),
    ("LED Tube Light", "Philips", 700.00, "Electronics", "20W LED tube light with 5-year warranty.", 6),
    ("Security Camera", "Hikvision", 3500.00, "Electronics", "HD night vision security camera.", 5),
    ("Smart TV", "Sony", 48000.00, "Electronics", "55-inch 4K Smart TV with Android OS.", 5),
    ("Desktop PC", "HP", 55000.00, "Electronics", "HP desktop with Intel i7 and 16GB RAM.", 6),
    ("Graphics Card", "NVIDIA", 45000.00, "Electronics", "RTX 3060 12GB graphics card.", 6),
    ("CNC Machine", "Mazak", 1500000.00, "Machinery", "Advanced CNC machine for industrial cutting.", 7),
    ("Jacket", "Woodland", 3200.00, "Textile", "Winter jacket with fleece lining.", 4),
    ("Electric Kettle", "Prestige", 1800.00, "Electronics", "1.5L electric kettle with auto cut-off.", 6),
    ("Induction Cooktop", "Philips", 3200.00, "Electronics", "2000W induction cooktop for fast cooking.", 6),
    ("Water Bottle", "Milton", 600.00, "Grocery", "Stainless steel insulated water bottle.", 8),
    ("Face Wash", "Himalaya", 250.00, "Grocery", "Herbal face wash for all skin types.", 8),
    ("Digital Thermometer", "Dr. Morepen", 500.00, "Electronics", "Fast and accurate digital thermometer.", 5),
    ("Fitness Band", "Mi", 2500.00, "Electronics", "Smart fitness band with heart rate monitor.", 6),
    ("Sofa Set", "Godrej", 48000.00, "Electronics", "Premium 5-seater sofa set with wooden frame.", 5);

