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
