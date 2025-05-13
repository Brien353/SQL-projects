# SQL Pharmacy System

This project contains SQL scripts for the creation and management of a database for a **pharmacy system**. It includes functionality for managing pharmacies, providers, medications, clients, supplies, and sales.

## Tables in the Database:

1. **Pharmacy**: Stores information about pharmacies.
   - `Pharmacy_id`: Unique identifier for each pharmacy.
   - `Pharmacy_name`: Name of the pharmacy.
   - `Pharmacy_location`: Location of the pharmacy.
   - `Pharmacy_phone`: Phone number of the pharmacy.
   - `Pharmacy_acreditation`: Accreditation type.

2. **Provider**: Contains details about the providers that supply medications to pharmacies.
   - `Provider_id`: Unique identifier for each provider.
   - `Provider_name`: Name of the provider.
   - `Provider_location`: Location of the provider.

3. **Client**: Holds client information for sales transactions.
   - `Client_id`: Unique identifier for each client.
   - `Client_name`: Client's first name.
   - `Client_surname`: Client's last name.
   - `Client_location`: Client's location.
   - `Client_sex`: Gender of the client.

4. **Medication**: Stores details about medications.
   - `Medication_id`: Unique identifier for each medication.
   - `Medication_compund`: The compound of the medication (e.g., Paracetamol).
   - `Medication_is_generic`: Indicates if the medication is generic.
   - `Medication_price`: Price of the medication.
   - `Medication_group`: The category or group of the medication.
   - `Medication_administration_method`: Method of administration (e.g., Oral).
   - `Medication_indication`: Purpose of the medication.
   - `Medication_owner`: Owner or manufacturer of the medication.

5. **Supplies**: Tracks which provider supplied which medications to which pharmacy.
   - `Provider_id`: The provider that supplied the medication.
   - `Pharmacy_id`: The pharmacy that received the medication.
   - `Supply_date`: The date the medication was supplied.
   - `Medication_id`: The medication supplied.

6. **Sell**: Records sales transactions between pharmacies and clients.
   - `Pharmacy_id`: The pharmacy that made the sale.
   - `Client_id`: The client who made the purchase.
   - `Sale_date`: The date of the sale.
   - `Medication_id`: The medication sold.
   - `Total_amount`: The quantity of the medication sold.

## Usage Instructions

1. **Database Setup**:
   - To begin using the database, execute the `CREATE TABLE` scripts in `schema.sql` to create all necessary tables.
   - Use the `data_inserts.sql` to populate the tables with initial data.

2. **Querying the Database**:
   - The `queries.sql` file contains various queries for interacting with the database, such as finding the most popular medications, identifying the client who bought the most medication, and more.

3. **Example Queries**:
   - **What’s the most expensive medication?**
   - **What’s the most popular medication among pharmacies?**
   - **What’s the state with the most registered pharmacies?**
   - **Who’s the client that bought the most medication?**

## Structure

- `schema.sql`: Database schema (table creation and structure).
- `data_inserts.sql`: SQL statements to insert sample data into the tables.
- `queries.sql`: Common queries used to interact with the database.

## Contributing

Feel free to fork this project and submit pull requests. You can contribute by:
- Fixing bugs.
- Adding new features or queries.
- Writing tests for queries and operations.

## License

This project is open source.
