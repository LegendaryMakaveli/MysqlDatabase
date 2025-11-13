use cape_codd_database;

-- 2.17
select SKU, SKU_Description
from INVENTORY;

-- 2.18
select SKU_Description, SKU
FROM INVENTORY;

-- 2.19
select WarehouseID as ID
from INVENTORY;

-- 2.20
select distinct WarehouseID as ID  -- we use distict to remove duplicate;
from INVENTORY;

-- 2.21
select WarehouseID, SKU, SKU_Description, QuantityOnHand, QuantityOnOrder
from INVENTORY;

-- 2.22
select *
from INVENTORY;

-- 2.23
select QuantityOnHand
from INVENTORY
where QuantityOnHand > 0;

-- 2.24
select SKU, SKU_Description
from INVENTORY
where QuantityOnHand = 0;

-- 2.25
select SKU, SKU_Description, WarehouseID
From INVENTORY
where QuantityOnHand = 0
order by WarehouseID ASC;

-- 2.26
select SKU, SKU_Description, WarehouseID
From INVENTORY
where QuantityOnHand > 0
order by WarehouseID desc, SKU asc;

-- 2.27
select SKU, SKU_Description, WarehouseID
from INVENTORY
where QuantityOnHand = 0 and QuantityOnOrder > 0
order by WarehouseID desc, SKU asc;

-- 2.28
select SKU, SKU_Description, WarehouseID
from INVENTORY
where QuantityOnHand = 0 and QuantityOnOrder = 0
order by WarehouseID desc, SKU asc;

-- 2.29
select SKU, SKU_Description, WarehouseID, QuantityOnHand
from INVENTORY
where QuantityOnHand > 1 and QuantityOnHand < 10;

-- 2.30
select SKU, SKU_Description, WarehouseID, QuantityOnHand
from INVENTORY
where QuantityOnHand between 2 and 9;

-- 2.31
select distinct SKU, SKU_Description
from INVENTORY
where SKU_Description LIKE 'Half-Dome%';

-- 2.32
select distinct SKU, SKU_Description
from INVENTORY
where SKU_Description LIKE '%Climb%';

-- 2.33
select distinct SKU, SKU_Description
from INVENTORY
where substring(SKU_Description, 3, 1) = 'd';

-- 2.34
select upper(Quantity-OnHand) as Quantity-available;

-- 2.36
select WarehouseID, sum(QuantityOnHand) as TotalQuantityOnHand
from INVENTORY
group by WarehouseID
order by TotalQuantityOnHand asc;

-- 2.37
select WarehouseID, sum(QuantityOnHand) as TotalItemsOnHandLT3
from INVENTORY
where QuantityOnHand < 3
group by WarehouseID
order by TotalItemsOnHandLT3 desc;

-- 2.38
select WarehouseID, sum(QuantityOnHand) as TotalItemsOnHandLT3
from INVENTORY
where QuantityOnHand < 3
group by WarehouseID
having count(SKU) < 2
order by TotalItemsOnHandLT3 desc;
