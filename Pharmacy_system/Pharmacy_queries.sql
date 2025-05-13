
-- What's the most expensive product?
WITH maximum_price AS (
  SELECT MAX(Medication_price) AS max_price
  FROM medication
)
SELECT m.Medication_id, m.Medication_compund, m.Medication_price
FROM medication m
JOIN maximum_price mp ON m.Medication_price = mp.max_price;

-- What's the cheapest product?

WITH minimal_price AS (
  SELECT MIN(Medication_price) AS min_price
  FROM medication
)
SELECT m.Medication_id, m.Medication_compund, m.Medication_price
FROM medication m
JOIN minimal_price mip ON m.Medication_price = mip.min_price;

-- What's the most popular medication among clients?

WITH medication_sales AS (
  SELECT Medication_id, COUNT(*) AS total_sales
  FROM sell
  GROUP BY Medication_id
),
most_popular_medication AS (
  SELECT Medication_id, total_sales
  FROM medication_sales
  WHERE total_sales = (SELECT MAX(total_sales) FROM medication_sales)
)
SELECT m.Medication_id, m.Medication_compund, mp.total_sales
FROM medication m
JOIN most_popular_medication mp ON m.Medication_id = mp.Medication_id;

                        
-- Who's the client that bought more medication?
WITH client_sales AS (
  SELECT s.Client_id, COUNT(*) AS total_sales
  FROM sell s
  GROUP BY s.Client_id
),
top_client AS (
  SELECT Client_id, total_sales
  FROM client_sales
  WHERE total_sales = (SELECT MAX(total_sales) FROM client_sales)
)
SELECT c.Client_id, c.Client_name, c.Client_surname, 
       c.Client_location, c.Client_sex, t.total_sales
FROM client c
JOIN top_client t ON c.Client_id = t.Client_id;
  
-- What's the most sold medications (by number of sales) among male population?

WITH male_sales AS (
  SELECT s.Medication_id, COUNT(*) AS total_sales
  FROM sell s
  INNER JOIN client c ON c.Client_id = s.Client_id
  WHERE c.Client_sex = 'M'
  GROUP BY s.Medication_id
),
most_popular_male_med AS (
  SELECT Medication_id, total_sales
  FROM male_sales
  WHERE total_sales = (SELECT MAX(total_sales) FROM male_sales)
)
SELECT m.Medication_compund, m.Medication_administration_method, 
       m.Medication_indication, m.Medication_price,
       p.total_sales
FROM medication m
JOIN most_popular_male_med p ON m.Medication_id = p.Medication_id;

-- What's the most sold medications (by number of sales) among female population?

WITH female_sales AS (
  SELECT s.Medication_id, COUNT(*) AS total_sales
  FROM sell s
  INNER JOIN client c ON c.Client_id = s.Client_id
  WHERE c.Client_sex = 'F'
  GROUP BY s.Medication_id
),
most_popular_female_med AS (
  SELECT Medication_id, total_sales
  FROM female_sales
  WHERE total_sales = (SELECT MAX(total_sales) FROM female_sales)
)
SELECT m.Medication_compund, m.Medication_administration_method, 
       m.Medication_indication, m.Medication_price,
       p.total_sales
FROM medication m
JOIN most_popular_female_med p ON m.Medication_id = p.Medication_id;


-- What's the most popular medication?

WITH sales AS (
  SELECT s.Medication_id, COUNT(*) AS total_sales
  FROM sell s
  GROUP BY s.Medication_id
),
most_sold_medication AS (
  SELECT Medication_id, total_sales
  FROM sales
  WHERE total_sales = (SELECT MAX(total_sales) FROM sales)
)
SELECT m.Medication_compund, m.Medication_administration_method, 
       m.Medication_indication, m.Medication_price,
       ms.total_sales
FROM medication m
JOIN most_sold_medication ms ON m.Medication_id = ms.Medication_id;

-- What´s the pharmacy that bought more medication?

WITH transactions AS(
SELECT Pharmacy_id, COUNT(*) AS total_number_of_transactions
FROM supplies
GROUP BY Pharmacy_id
)
SELECT p.Pharmacy_id, p.Pharmacy_name, p.Pharmacy_location, p.Pharmacy_acreditation, p.Pharmacy_phone, t.total_number_of_transactions
FROM pharmacy p
JOIN transactions t ON t.Pharmacy_id = p.Pharmacy_id
WHERE t.total_number_of_transactions = (SELECT MAX(total_number_of_transactions)
										FROM transactions
                                        );
-- What's the most popular medication among pharmacy

-- What's the most popular medication among pharmacies?

WITH medication_count AS (
  SELECT medication_id, COUNT(*) AS total_supplied
  FROM supplies
  GROUP BY medication_id
),
most_supplied_medication AS (
  SELECT medication_id, total_supplied
  FROM medication_count
  WHERE total_supplied = (SELECT MAX(total_supplied) FROM medication_count)
)
SELECT m.Medication_id, m.Medication_compund, m.Medication_price, msm.total_supplied
FROM medication m
JOIN most_supplied_medication msm ON m.Medication_id = msm.medication_id;

-- What's the state with more registred pharmacys?

-- What's the state with more registered pharmacies?

WITH pharmacy_counts AS (
  SELECT Pharmacy_location, COUNT(*) AS pharmacy_count
  FROM pharmacy
  GROUP BY Pharmacy_location
)
SELECT Pharmacy_location, pharmacy_count
FROM pharmacy_counts
WHERE pharmacy_count = (
  SELECT MAX(pharmacy_count) FROM pharmacy_counts
);


-- What's the most popular provider among pharmacies?

WITH provider_count AS(
SELECT provider_id, COUNT(*) AS provider_count
FROM supplies
GROUP BY provider_id
),
most_popular_provider AS(
SELECT  pc. provider_id, pc.provider_count
FROM provider_count pc
WHERE pc.provider_count = (SELECT MAX(provider_count)
                           FROM provider_count)
)
SELECT p.Provider_id, p.Provider_name, p.Provider_location, mpp.provider_count
FROM provider p
JOIN most_popular_provider mpp ON mpp.provider_id = p.Provider_id;

-- What's the state with more registered providers?

WITH provider_count AS (
  SELECT Provider_location, COUNT(*) AS provider_count
  FROM provider
  GROUP BY Provider_location
)
SELECT Provider_location, provider_count
FROM provider_count
WHERE provider_count = (
  SELECT MAX(provider_count) FROM provider_count
);

