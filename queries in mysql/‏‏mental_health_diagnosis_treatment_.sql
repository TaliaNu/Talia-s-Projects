SELECT DATABASE();
USE c;
SHOW TABLES;
SELECT * FROM ‏‏mental_health_diagnosis_treatment_;

SELECT `Patient ID`, Age, `Symptom Severity (1-10)`
FROM ‏‏mental_health_diagnosis_treatment_
WHERE `Symptom Severity (1-10)` >= 8
ORDER BY Age;

SELECT Age, AVG(`Symptom Severity (1-10)`) AS Avg_Severity
FROM ‏‏mental_health_diagnosis_treatment_
GROUP BY Age
ORDER BY Age;

SELECT 
    CASE 
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 35 THEN '18-35'
        WHEN Age BETWEEN 36 AND 50 THEN '36-50'
        WHEN Age > 50 THEN 'Above 50'
    END AS Age_Group,
    AVG(`Symptom Severity (1-10)`) AS Avg_Severity,
    COUNT(*) AS Patient_Count
FROM ‏‏mental_health_diagnosis_treatment_
GROUP BY Age_Group
ORDER BY Age_Group;

SELECT 
    CASE 
        WHEN `Symptom Severity (1-10)` BETWEEN 1 AND 3 THEN 'Mild (1-3)'
        WHEN `Symptom Severity (1-10)` BETWEEN 4 AND 7 THEN 'Moderate (4-7)'
        WHEN `Symptom Severity (1-10)` BETWEEN 8 AND 10 THEN 'Severe (8-10)'
    END AS Severity_Level,
    CASE 
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 35 THEN '18-35'
        WHEN Age BETWEEN 36 AND 50 THEN '36-50'
        WHEN Age > 50 THEN 'Above 50'
    END AS Age_Group,
    COUNT(*) AS Patient_Count
FROM ‏‏mental_health_diagnosis_treatment_
GROUP BY Severity_Level, Age_Group
ORDER BY Severity_Level, Age_Group;