-- ==========================================================
-- HR Analytics Project - Employee Attrition Analysis
-- File Name: analysis_queries.sql
-- ==========================================================

-- ==========================================================
-- Query 1: Overall Employee Attrition Rate
-- ==========================================================
SELECT
    ROUND(SUM(AttritionFlag) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM employees;


-- ==========================================================
-- Query 2: Attrition by Department
-- ==========================================================
SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(AttritionFlag) AS attrited,
    ROUND(SUM(AttritionFlag) * 100.0 / COUNT(*), 2) AS attrition_pct
FROM employees
GROUP BY Department
ORDER BY attrition_pct DESC;


-- ==========================================================
-- Query 3: Attrition by OverTime
-- ==========================================================
SELECT
    OverTime,
    COUNT(*) AS total_employees,
    SUM(AttritionFlag) AS attrited,
    ROUND(SUM(AttritionFlag) * 100.0 / COUNT(*), 2) AS attrition_pct
FROM employees
GROUP BY OverTime;


-- ==========================================================
-- Query 4: Attrition by Tenure Group
-- ==========================================================
SELECT
    TenureGroup,
    COUNT(*) AS total_employees,
    ROUND(SUM(AttritionFlag) * 100.0 / COUNT(*), 2) AS attrition_pct
FROM employees
GROUP BY TenureGroup
ORDER BY attrition_pct DESC;


-- ==========================================================
-- Query 5: Average Monthly Income (Stayed vs Left)
-- ==========================================================
SELECT
    Attrition,
    ROUND(AVG(MonthlyIncome), 0) AS avg_income
FROM employees
GROUP BY Attrition;


-- ==========================================================
-- Query 6: Attrition by Job Satisfaction
-- ==========================================================
SELECT
    JobSatisfaction,
    COUNT(*) AS total_employees,
    SUM(AttritionFlag) AS attrited,
    ROUND(SUM(AttritionFlag) * 100.0 / COUNT(*), 2) AS attrition_pct
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


-- ==========================================================
-- Query 7: Top 3 Job Roles with Highest Attrition
-- ==========================================================
SELECT
    JobRole,
    COUNT(*) AS total_employees,
    SUM(AttritionFlag) AS attrited,
    ROUND(SUM(AttritionFlag) * 100.0 / COUNT(*), 2) AS attrition_pct
FROM employees
GROUP BY JobRole
ORDER BY attrition_pct DESC
LIMIT 3;