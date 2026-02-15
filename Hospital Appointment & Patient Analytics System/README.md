# Hospital Operational & Financial Analytics System

## Project Overview

This project simulates a real-world Hospital Business Intelligence system built using SQL.

The objective was to analyze hospital operational data — including patients, doctors, departments, appointments, payments, and cards — to generate actionable insights for management decision-making.

The analysis focuses on:

- Revenue performance
- Doctor productivity
- Department efficiency
- Customer retention
- Payment behavior

This project demonstrates advanced SQL analytics skills aligned with Data Analyst roles.

---

## Database Structure

The relational database consists of the following key entities:

- `customers`
- `doctors`
- `departments`
- `appointments`
- `payments`
- `cards`

Relationships include:

- One-to-many (Department → Doctors)
- One-to-many (Doctor → Appointments)
- One-to-many (Customer → Appointments)
- One-to-many (Card → Payments)

The schema is normalized to ensure data integrity and eliminate redundancy.

---

## Business Questions Addressed

### Financial Performance

- What is the total hospital revenue?
- How has revenue changed over time?
- What is the average revenue per appointment?
- Which departments generate the highest revenue?
- What is revenue per doctor?

---

### Doctor Performance

- Which doctors handle the most appointments?
- Are doctors evenly utilized?
- Which department has the highest patient volume?
- Which departments are potentially understaffed?
- How does doctor productivity compare across departments?

---

### Customer Insights

- What percentage of customers are inactive?
- Who are the top revenue-generating customers?
- Does revenue follow the 80/20 Pareto principle?
- What is the estimated Customer Lifetime Value (CLV)?
- How many appointments does the average customer book?

---

### Payment & Card Analysis

- How many cards are unused or non-paying?
- What is the revenue distribution across payment methods?
- What percentage of total revenue comes from card payments?
- Are there high-risk payment concentration patterns?

---

## Key Insights (Example Findings)

- A small percentage of customers contribute a disproportionate share of revenue.
- Revenue is concentrated within specific high-performing departments.
- Certain departments show high appointment demand but lower doctor allocation.
- A segment of issued cards remains inactive, representing monetization opportunity.

---

## SQL Techniques Demonstrated

This project applies advanced SQL concepts including:

- INNER JOIN, LEFT JOIN
- GROUP BY & HAVING
- Aggregate Functions (SUM, COUNT, AVG)
- Common Table Expressions (CTEs)
- Window Functions (RANK, DENSE_RANK)
- COALESCE & NULL handling
- Conditional logic using CASE
- Performance-based ranking

---

## Example Analytical Query

```sql
WITH revenue_per_doctor AS (
    SELECT 
        d.name AS doctor_name,
        SUM(p.amount) AS total_revenue
    FROM doctors d
    JOIN appointments a ON d.id = a.doctor_id
    JOIN payments p ON a.id = p.appointment_id
    WHERE a.status = 'COMPLETED'
    GROUP BY d.name
)
SELECT *,
       DENSE_RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM revenue_per_doctor;
