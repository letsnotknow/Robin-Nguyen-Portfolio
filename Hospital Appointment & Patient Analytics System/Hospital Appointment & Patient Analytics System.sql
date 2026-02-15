# 1. Show all doctors and the departments they work in
SELECT d.name, dept.name
FROM doctor d LEFT JOIN doctor_in_department did ON d.id = did.doctor_id
			  LEFT JOIN department dept ON dept.id = did.department_id;

# 2. Show all bookings with doctor name, patient name, and booking price
SELECT b.id, c.name as customer_name, d.name as doctor_name, b.price
FROM booking b JOIN doctor d ON d.id = b.doctor_id
			   JOIN customer c ON c.id = b.customer_id;

# 3. Show bookings where the price is greater than or equal to 100
SELECT b.id, b.date_time, b.status, b.price
FROM booking b
WHERE price >= 100;

# 4. Show all doctors who are currently involved in at least one booking
SELECT  DISTINCT d.name
FROM booking b RIGHT JOIN doctor d ON d.id = b.doctor_id
WHERE b.id is not null;

# 5. Show total number of bookings per doctor
SELECT d.name, COUNT(b.id) as booking_count
FROM booking b RIGHT JOIN doctor d ON d.id = b.doctor_id
GROUP BY d.id;


# 6. Which doctors work in more than 2 different departments?
SELECT d.name, COUNT(dept.name) as department_count
FROM doctor d LEFT JOIN doctor_in_department did ON d.id = did.doctor_id
			  LEFT JOIN department dept ON dept.id = did.department_id
GROUP BY d.id
HAVING department_count >= 2;
              
# 7. Which doctors have never had any bookings?
SELECT d.name, COUNT(b.id) as booking_count
FROM booking b RIGHT JOIN doctor d ON d.id = b.doctor_id
GROUP BY d.id
HAVING booking_count = 0;

# 8. Which department has the highest and lowest number of doctors?
WITH department_doctor_count_cte AS (
	SELECT dept.name, COUNT(d.id) as doctor_count
	FROM doctor d  JOIN doctor_in_department did ON d.id = did.doctor_id
				   JOIN department dept ON dept.id = did.department_id
	GROUP BY dept.id),
ranking_cte AS (
	SELECT *, DENSE_RANK () OVER (ORDER BY doctor_count) as ranking
    FROM department_doctor_count_cte)
SELECT * 
FROM ranking_cte 
WHERE ranking = (SELECT MAX(ranking) FROm ranking_cte) 
	 OR ranking = (SELECT MIN(ranking) FROM ranking_cte);

# 9. Which doctors have total booking revenue higher than the average total revenue of all doctors?
SELECT doctor_id, d.name, SUM(price) as total_revenue
FROM booking b JOIN doctor d ON d.id = b.doctor_id 
GROUP BY b.doctor_id
HAVING total_revenue >= (SELECT AVG(price) FROM booking b);

SELECT AVG(total_revenue)
FROM (SELECT SUM(price) AS total_revenue
    FROM booking
    GROUP BY doctor_id) as t;
    
    SELECT AVG(price) FROM booking b;

# 10. Show top 3 doctors with the highest total booking revenue
SELECT doctor_id, d.name, SUM(price) as total_revenue
FROM booking b JOIN doctor d ON d.id = b.doctor_id 
GROUP BY b.doctor_id
ORDER BY total_revenue DESC
LIMIT 3;

# 11. Show top 2 departments with the least number of patients treated
SELECT d.name, COUNT(d.id) as customer_count
FROM appointment a JOIN department d ON d.id = a.department_id
WHERE status = 'DONE'
GROUP BY department_id;

# 12. Show total number of bookings and total revenue per month
SELECT MONTH(date_time) as month, COUNT(b.id) as total_no_booking, SUM(price) as total_revenue 
FROM booking b
WHERE status = 'PAID'
GROUP BY month;

# 13. How many distinct patients visited in the most recent month?


# 14. Show doctors and patients involved in the latest booking(s)
# 15. Find the top 2 months that have the highest number of bookings

# 16. Which doctors have the highest and lowest average booking price?
