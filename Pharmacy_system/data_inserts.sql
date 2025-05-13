-- Create the Pharmacy table
CREATE TABLE Pharmacy (
  Pharmacy_id INT PRIMARY KEY,
  Pharmacy_name VARCHAR(50),
  Pharmacy_location VARCHAR(50),
  Pharmacy_phone VARCHAR(10),
  Pharmacy_acreditation VARCHAR(50)
);

-- Create the Provider table
CREATE TABLE Provider (
  Provider_id INT PRIMARY KEY,
  Provider_name VARCHAR(50),
  Provider_location VARCHAR(50)
);

-- Create the Client table
CREATE TABLE Client (
  Client_id INT PRIMARY KEY,
  Client_name VARCHAR(50),
  Client_surname VARCHAR(50),
  Client_location VARCHAR(50),
  Client_sex VARCHAR(10)
);

-- Create the Medication table
CREATE TABLE Medication (
  Medication_id INT PRIMARY KEY,
  Medication_compund VARCHAR(30),
  Medication_is_generic VARCHAR(30),
  Medication_price INT,
  Medication_group VARCHAR(50),
  Medication_administration_method VARCHAR(50),
  Medication_indication VARCHAR(229),
  Medication_owner VARCHAR(229)
);

-- Create the Supplies table
CREATE TABLE Supplies (
  Provider_id INT,
  Pharmacy_id INT,
  Supply_date DATE,
  Medication_id VARCHAR(50),
  PRIMARY KEY (Provider_id, Pharmacy_id, Medication_id),
  FOREIGN KEY (Provider_id) REFERENCES Provider(Provider_id),
  FOREIGN KEY (Pharmacy_id) REFERENCES Pharmacy(Pharmacy_id),
  FOREIGN KEY (Medication_id) REFERENCES Medication(Medication_id)
);

-- Create the Sell table
CREATE TABLE Sell (
  Pharmacy_id INT,
  Client_id INT,
  Sale_date DATE,
  Medication_id VARCHAR(50),
  Total_amount INT,
  PRIMARY KEY (Pharmacy_id, Client_id, Medication_id),
  FOREIGN KEY (Pharmacy_id) REFERENCES Pharmacy(Pharmacy_id),
  FOREIGN KEY (Client_id) REFERENCES Client(Client_id),
  FOREIGN KEY (Medication_id) REFERENCES Medication(Medication_id)
);

-- Insert data into Pharmacy
INSERT INTO Pharmacy (Pharmacy_id, Pharmacy_name, Pharmacy_location, Pharmacy_phone, Pharmacy_acreditation)
VALUES
(1, 'Farmacia del Sol', 'México City', '5551010101', 'ISO 9001'),
(2, 'Farmacia Cruz Roja', 'Guadalajara', '5552020202', 'ISO 14001'),
(3, 'Farmacia del Valle', 'Monterrey', '5553030303', 'ISO 9001'),
(4, 'Farmacia Santa Teresa', 'Cancún', '5554040404', 'ISO 27001'),
(5, 'Farmacia La Salud', 'Puebla', '5555050505', 'ISO 9001'),
(6, 'Farmacia Salud y Vida', 'Tijuana', '5556060606', 'ISO 14001'),
(7, 'Farmacia el Águila', 'Querétaro', '5557070707', 'ISO 9001'),
(8, 'Farmacia Azul', 'Toluca', '5558080808', 'ISO 27001'),
(9, 'Farmacia Los Andes', 'Chihuahua', '5559090909', 'ISO 9001'),
(10, 'Farmacia La Esperanza', 'Veracruz', '5560101010', 'ISO 14001'),
(11, 'Farmacia del Pueblo', 'Oaxaca', '5561111111', 'ISO 27001'),
(12, 'Farmacia San José', 'Puebla', '5562121212', 'ISO 9001'),
(13, 'Farmacia Los Ángeles', 'Monterrey', '5563131313', 'ISO 14001'),
(14, 'Farmacia de la Sierra', 'Durango', '5564141414', 'ISO 9001'),
(15, 'Farmacia El Buen Samaritano', 'Mazatlán', '5565151515', 'ISO 27001');

-- Insert data into Provider
INSERT INTO Provider (Provider_id, Provider_name, Provider_location)
VALUES
(1, 'Proveedor A', 'México City'),
(2, 'Proveedor B', 'Guadalajara'),
(3, 'Proveedor C', 'Monterrey'),
(4, 'Proveedor D', 'Cancún'),
(5, 'Proveedor E', 'Puebla'),
(6, 'Proveedor F', 'Tijuana'),
(7, 'Proveedor G', 'Querétaro'),
(8, 'Proveedor H', 'Toluca'),
(9, 'Proveedor I', 'Chihuahua'),
(10, 'Proveedor J', 'Veracruz'),
(11, 'Proveedor K', 'Oaxaca'),
(12, 'Proveedor L', 'Puebla'),
(13, 'Proveedor M', 'Monterrey'),
(14, 'Proveedor N', 'Durango'),
(15, 'Proveedor O', 'Mazatlán');

-- Insert data into Client
INSERT INTO Client (Client_id, Client_name, Client_surname, Client_location, Client_sex)
VALUES
(1, 'Juan', 'Pérez', 'México City', 'M'),
(2, 'Ana', 'González', 'Guadalajara', 'F'),
(3, 'Carlos', 'Sánchez', 'Monterrey', 'M'),
(4, 'Luisa', 'Martínez', 'Cancún', 'F'),
(5, 'José', 'Ramírez', 'Puebla', 'M'),
(6, 'Sofía', 'López', 'Tijuana', 'F'),
(7, 'David', 'Torres', 'Querétaro', 'M'),
(8, 'María', 'Díaz', 'Toluca', 'F'),
(9, 'Luis', 'Morales', 'Chihuahua', 'M'),
(10, 'Gabriela', 'Fernández', 'Veracruz', 'F'),
(11, 'Rodrigo', 'Gutiérrez', 'Oaxaca', 'M'),
(12, 'Patricia', 'Jiménez', 'Puebla', 'F'),
(13, 'Ricardo', 'Vázquez', 'Monterrey', 'M'),
(14, 'Verónica', 'Ponce', 'Durango', 'F'),
(15, 'Martín', 'Rodríguez', 'Mazatlán', 'M');

-- Insert data into Medication
INSERT INTO Medication (Medication_id, Medication_compund, Medication_is_generic, Medication_price, Medication_group, Medication_administration_method, Medication_indication, Medication_owner)
VALUES
(1, 'Paracetamol', 'YES', 50, 'Analgesics', 'Oral', 'Used to relieve mild to moderate pain, such as headaches, toothaches, and muscle pain.', 'Company A'),
(2, 'Ibuprofen', 'YES', 100, 'Anti-inflammatory', 'Oral', 'Used to reduce fever, pain, and inflammation.', 'Company B'),
(3, 'Amoxicillin', 'NO', 150, 'Antibiotics', 'Oral', 'Used to treat various bacterial infections.', 'Company C'),
(4, 'Aspirin', 'YES', 70, 'Analgesics', 'Oral', 'Used to treat pain, inflammation, and fever.', 'Company D'),
(5, 'Metformin', 'NO', 200, 'Antidiabetic', 'Oral', 'Used to control blood sugar in type 2 diabetes.', 'Company E'),
(6, 'Omeprazole', 'YES', 120, 'Antacids', 'Oral', 'Used to treat acid reflux and stomach ulcers.', 'Company F'),
(7, 'Simvastatin', 'NO', 250, 'Cholesterol-lowering', 'Oral', 'Used to reduce cholesterol and prevent heart disease.', 'Company G'),
(8, 'Loratadine', 'YES', 80, 'Antihistamines', 'Oral', 'Used to treat allergies and hay fever.', 'Company H'),
(9, 'Azithromycin', 'NO', 180, 'Antibiotics', 'Oral', 'Used to treat bacterial infections like pneumonia.', 'Company I'),
(10, 'Furosemide', 'NO', 130, 'Diuretics', 'Oral', 'Used to treat fluid retention and high blood pressure.', 'Company J'),
(11, 'Losartan', 'NO', 220, 'Antihypertensive', 'Oral', 'Used to treat high blood pressure and heart failure.', 'Company K'),
(12, 'Ciprofloxacin', 'NO', 160, 'Antibiotics', 'Oral', 'Used to treat various bacterial infections.', 'Company L'),
(13, 'Prednisone', 'NO', 250, 'Steroids', 'Oral', 'Used to treat inflammation and immune system disorders.', 'Company M'),
(14, 'Gabapentin', 'YES', 200, 'Anticonvulsants', 'Oral', 'Used to treat nerve pain and seizures.', 'Company N'),
(15, 'Hydrochlorothiazide', 'NO', 90, 'Diuretics', 'Oral', 'Used to treat high blood pressure and edema.', 'Company O');

-- Insert data into Supplies
INSERT INTO Supplies (Provider_id, Pharmacy_id, Supply_date, Medication_id)
VALUES
(1, 1, '2025-04-01', 1),
(2, 2, '2025-04-02', 2),
(3, 3, '2025-04-03', 3),
(4, 4, '2025-04-04', 4),
(5, 5, '2025-04-05', 5),
(6, 6, '2025-04-06', 6),
(7, 7, '2025-04-07', 7),
(8, 8, '2025-04-08', 8),
(9, 9, '2025-04-09', 9),
(10, 10, '2025-04-10', 10),
(11, 11, '2025-04-11', 11),
(12, 12, '2025-04-12', 12),
(13, 13, '2025-04-13', 13),
(14, 14, '2025-04-14', 14),
(15, 15, '2025-04-15', 15);

-- Insert data into Sell
INSERT INTO Sell (Pharmacy_id, Client_id, Sale_date, Medication_id, Total_amount)
VALUES
(1, 1, '2025-04-01', 1, 3),
(2, 2, '2025-04-02', 2, 2),
(3, 3, '2025-04-03', 3, 1),
(4, 4, '2025-04-04', 4, 2),
(5, 5, '2025-04-05', 5, 4),
(6, 6, '2025-04-06', 6, 1),
(7, 7, '2025-04-07', 7, 3),
(8, 8, '2025-04-08', 8, 2),
(9, 9, '2025-04-09', 9, 5),
(10, 10, '2025-04-10', 10, 4),
(11, 11, '2025-04-11', 11, 3),
(12, 12, '2025-04-12', 12, 2),
(13, 13, '2025-04-13', 13, 1),
(14, 14, '2025-04-14', 14, 4),
(15, 15, '2025-04-15', 15, 5);
