-- ===========================================
-- Customer Churn Analysis Queries
-- ===========================================

-- 1. Total Customers
SELECT COUNT(DISTINCT Customer_ID) AS Number_of_Customers
FROM online_retail;

-- 2. Overall Churn Rate
SELECT 
    ROUND(SUM(CASE WHEN Target_Churn = 'True' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS ChurnRate
FROM online_retail;

-- 3. Age Group Distribution + Churn
SELECT 
    CASE 
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 45 THEN '25 to 45'
        ELSE 'Above 45'
    END AS Age_Group,
    COUNT(*) AS TotalCount,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM online_retail), 2) AS Percentage,
    ROUND(SUM(CASE WHEN Target_Churn = 'True' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS ChurnRate
FROM online_retail
GROUP BY CASE 
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 45 THEN '25 to 45'
        ELSE 'Above 45'
    END
ORDER BY ChurnRate DESC;

-- 4. Spending Group + Churn
SELECT 
    CASE 
        WHEN Total_Spend < 3000 THEN 'Low Spender'
        WHEN Total_Spend BETWEEN 3000 AND 7000 THEN 'Mid Spender'
        ELSE 'High Spender'
    END AS Spend_Group,
    COUNT(*) AS TotalCount,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM online_retail), 2) AS Percentage,
    ROUND(SUM(CASE WHEN Target_Churn = 'True' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS ChurnRate
FROM online_retail
GROUP BY CASE 
        WHEN Total_Spend < 3000 THEN 'Low Spender'
        WHEN Total_Spend BETWEEN 3000 AND 7000 THEN 'Mid Spender'
        ELSE 'High Spender'
    END
ORDER BY ChurnRate DESC;

-- 5. Customer Tenure + Churn
SELECT 
    CASE 
        WHEN Years_as_Customer < 5 THEN 'Short Term Customer'
        WHEN Years_as_Customer BETWEEN 5 AND 10 THEN 'Medium Term Customer'
        ELSE 'Long Term Customer'
    END AS Term_Group,
    COUNT(*) AS TotalCount,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM online_retail), 2) AS Percentage,
    ROUND(SUM(CASE WHEN Target_Churn = 'True' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS ChurnRate
FROM online_retail
GROUP BY CASE 
        WHEN Years_as_Customer < 5 THEN 'Short Term Customer'
        WHEN Years_as_Customer BETWEEN 5 AND 10 THEN 'Medium Term Customer'
        ELSE 'Long Term Customer'
    END;

-- 6. Income Group + Churn
SELECT 
    CASE 
        WHEN Annual_Income < 30 THEN 'Low Income'
        WHEN Annual_Income BETWEEN 30 AND 70 THEN 'Medium Income'
        ELSE 'High Income'
    END AS Income_Group,
    COUNT(*) AS TotalCount,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM online_retail), 2) AS Percentage,
    ROUND(SUM(CASE WHEN Target_Churn = 'True' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS ChurnRate
FROM online_retail
GROUP BY CASE 
        WHEN Annual_Income < 30 THEN 'Low Income'
        WHEN Annual_Income BETWEEN 30 AND 70 THEN 'Medium Income'
        ELSE 'High Income'
    END;

-- 7. Gender Distribution + Churn
SELECT Gender, 
       COUNT(Gender) AS TotalCount,
       COUNT(Gender) * 100.0 / (SELECT COUNT(*) FROM online_retail) AS Percentage,
       ROUND(SUM(CASE WHEN Target_Churn = 'True' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS ChurnRate
FROM online_retail
GROUP BY Gender;

-- 8. Customer Satisfaction + Churn
SELECT 
    CASE
        WHEN Satisfaction_Score IN (1, 2) THEN 'Poorly Satisfied Customer'
        WHEN Satisfaction_Score = 3 THEN 'Moderately Satisfied Customer'
        ELSE 'Highly Satisfied Customer'
    END AS Satisfaction_Group,
    COUNT(*) AS TotalCount,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM online_retail), 2) AS Percentage,
    ROUND(SUM(CASE WHEN Target_Churn = 'True' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS ChurnRate
FROM online_retail
GROUP BY CASE
        WHEN Satisfaction_Score IN (1, 2) THEN 'Poorly Satisfied Customer'
        WHEN Satisfaction_Score = 3 THEN 'Moderately Satisfied Customer'
        ELSE 'Highly Satisfied Customer'
    END
ORDER BY ChurnRate DESC;

-- 9. Returns + Churn
SELECT 
    CASE
        WHEN Num_of_Returns BETWEEN 0 AND 3 THEN '0 to 3 Returns'
        WHEN Num_of_Returns BETWEEN 4 AND 6 THEN '4 to 6 Returns'
        ELSE '7+ Returns'
    END AS Return_Group,
    COUNT(*) AS TotalCount,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM online_retail), 2) AS Percentage,
    ROUND(SUM(CASE WHEN Target_Churn = 'True' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS ChurnRate
FROM online_retail
GROUP BY CASE
        WHEN Num_of_Returns BETWEEN 0 AND 3 THEN '0 to 3 Returns'
        WHEN Num_of_Returns BETWEEN 4 AND 6 THEN '4 to 6 Returns'
        ELSE '7+ Returns'
    END
ORDER BY ChurnRate DESC;

-- 10. Support Calls + Churn
SELECT 
    CASE
        WHEN Num_of_Support_Contacts BETWEEN 0 AND 1 THEN '0 to 1 Calls'
        WHEN Num_of_Support_Contacts BETWEEN 2 AND 3 THEN '2 to 3 Calls'
        ELSE '4+ Calls'
    END AS SupportCalls_Group,
    COUNT(*) AS TotalCount,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM online_retail), 2) AS Percentage,
    ROUND(SUM(CASE WHEN Target_Churn = 'True' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS ChurnRate
FROM online_retail
GROUP BY CASE
        WHEN Num_of_Support_Contacts BETWEEN 0 AND 1 THEN '0 to 1 Calls'
        WHEN Num_of_Support_Contacts BETWEEN 2 AND 3 THEN '2 to 3 Calls'
        ELSE '4+ Calls'
    END
ORDER BY ChurnRate DESC;

-- 11. Email Opt-in + Churn
SELECT 
    Email_Opt_In,
    COUNT(*) AS TotalCount,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM online_retail), 2) AS Percentage,
    ROUND(SUM(CASE WHEN Target_Churn = 'True' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS ChurnRate
FROM online_retail
GROUP BY Email_Opt_In
ORDER BY ChurnRate DESC;

-- 12. Promotion Response + Churn
SELECT 
    Promotion_Response,
    COUNT(*) AS TotalCount,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM online_retail), 2) AS Percentage,
    ROUND(SUM(CASE WHEN Target_Churn = 'True' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS ChurnRate
FROM online_retail
GROUP BY Promotion_Response
ORDER BY ChurnRate DESC;
