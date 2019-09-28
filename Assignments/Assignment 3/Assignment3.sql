/*************************/
/*Name: Levi Sutton      */
/*Term: Spring 2019      */
/*Assignment 3		 */
/*************************/

/* 2.28 */
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE QuantityOnHand = 0 OR QuantityOnOrder = 0
ORDER BY WarehouseID DESC, SKU ASC;

/* 2.29 */
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM INVENTORY
WHERE QuantityOnHand IN (2,3,4,5,6,7,8,9);

/* 2.30 */
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand
FROM INVENTORY
WHERE QuantityOnHand BETWEEN 2 AND 9;

/* 2.31 */
SELECT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE 'Half-dome%';

/* 2.32 */
SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE '% Climb%';

/* 2.33 */
SELECT DISTINCT SKU, SKU_Description
FROM INVENTORY
WHERE SKU_Description LIKE '__d%';

/* 2.34 */
SELECT SUM(QuantityOnHand) AS QuantityOnHand_Sum, 
       AVG(QuantityOnHand) AS QuantityOnHand_Avg,
       COUNT(QuantityOnHand) AS QuantityOnHand_Count,
       MAX(QuantityOnHand) AS QuantityOnHand_Max,
       MIN(QuantityOnHand) AS QuantityOnHand_Min
FROM INVENTORY;

/* 2.35 */
//The difference between the COUNT and SUM functions are that, 
//the COUNT function counts the numbers of rows in a database,
//and the SUM function adds the values inside a column of a database

/* 2.36 */
SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHand
FROM INVENTORY
GROUP BY WarehouseID
ORDER BY TotalItemsOnHand DESC;

/* 2.37 */
SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand < 3
GROUP BY WarehouseID
ORDER BY TotalItemsOnHandLT3 DESC;

/* 2.38 */
SELECT WarehouseID, SUM(QuantityOnHand) AS TotalItemsOnHandLT3
FROM INVENTORY
WHERE QuantityOnHand <= 3
GROUP BY WarehouseID
HAVING SUM(QuantityOnHand) < 2
ORDER BY TotalItemsOnHandLT3 DESC;

/* 2.39 */
//The WHERE clause was applied first

/* 2.40 */
SELECT SKU, SKU_Description, WarehouseID, WarehouseCity, WarehouseState
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID AND (WarehouseCity = 'Atlanta' OR WarehouseCity = 'Bangor' OR WarehouseCity = 'Chicago');

/* 2.41 */
SELECT SKU, SKU_Description, WarehouseID, WarehouseCity, WarehouseState
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID AND WarehouseCity IN ('Atlanta', 'Bangor', 'Chicago');

/* 2.42 */
SELECT SKU, SKU_Description, WarehouseID, WarehouseCity, WarehouseState
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID AND WarehouseCity <> 'Atlanta' AND WarehouseCity <> 'Bangor' AND WarehouseCity <> 'Chicago';

/* 2.43 */
SELECT SKU, SKU_Description, WarehouseID, WarehouseCity, WarehouseState
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID AND WarehouseCity NOT IN ('Atlanta','Bangor','Chicago');

/* 2.44 */
SELECT SKU_Description+'is located in' +WarehouseCity AS ITEM_Location
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID;

/* 2.45 */
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE WarehouseID IN (SELECT WarehouseID FROM WAREHOUSE WHERE Manager = 'Lucille Smith');

/* 2.46 */
SELECT SKU, SKU_Description, WarehouseID
FROM WAREHOUSE
WHERE Manager = 'Lucille Smith';

/* 2.47 */
SELECT SKU, SKU_Description, WAREHOUSE.WarehouseID
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID AND Manager = 'Lucille Smith';

/* 2.48 */
SELECT WarehouseID, AVG(QuantityOnHand) AS QuantityOnHand_AVG
FROM INVENTORY
WHERE WarehouseID IN (SELECT WarehouseID FROM WAREHOUSE WHERE Manager = 'Lucille Smith');

/* 2.49 */
SELECT WarehouseID, AVG(QuantityOnHand) AS QuantityOnHand_AVG
FROM WAREHOUSE
WHERE Manager = 'Lucille Smith';

/* 2.50 */
SELECT WarehouseID, WarehouseCity, WareHouseState, Manager, SKU, SKU_Description, QuantityOnHand
FROM INVENTORY, WAREHOUSE
WHERE INVENTORY.WarehouseID = WAREHOUSE.WarehouseID AND Manager = 'Lucille Smith';







 