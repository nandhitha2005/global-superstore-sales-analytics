PRAGMA table_info(orders);
SELECT
    SUM("Sales"),
	SUM("Profit")
FROM orders;
SELECT
    Category,
	
    ROUND(SUM("Sales"),2) AS
Total_Sales,

    ROUND(SUM("Profit"),2) AS
Total_Profit

FROM orders

GROUP BY Category

ORDER BY Total_Profit DESC;

SELECT

    Category,
	ROUND(
	    (SUM("Profit") /
SUM("Sales")) * 100,
     2) AS Profit_Margin_Percentage

FROM orders

GROUP BY Category

ORDER BY Profit_Margin_Percentage
DESC;

SELECT

    substr(OrderDate,7,4) || '-' ||
substr(OrderDate,4,2)
    AS Month,
	
	ROUND(SUM(Sales),2) AS
Total_Sales

FROM orders

GROUP BY Month

ORDER BY Month;

SELECT 

    ShipMode,

    ROUND(
        AVG(
            julianday(
                substr(ShipDate,7,4) || '-' ||
                substr(ShipDate,4,2) || '-' ||
                substr(ShipDate,1,2)
            )

            -

            julianday(
                substr(OrderDate,7,4) || '-' ||
                substr(OrderDate,4,2) || '-' ||
                substr(OrderDate,1,2)
            )
        ),2
    ) AS Avg_Delivery_Days

FROM orders

GROUP BY ShipMode

ORDER BY Avg_Delivery_Days;

SELECT 

    CustomerName,

    ROUND(SUM(Sales),2) AS Total_Sales,

    ROUND(SUM(Profit),2) AS Total_Profit

FROM orders

GROUP BY CustomerName

ORDER BY Total_Sales DESC

LIMIT 10;

SELECT 

    ProductName,

    ROUND(SUM(Sales),2) AS Total_Sales,

    ROUND(SUM(Profit),2) AS Total_Profit

FROM orders

GROUP BY ProductName

HAVING SUM(Profit) < 0

ORDER BY Total_Profit ASC

LIMIT 10;
