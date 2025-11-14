use cape_codd_database;

-- 2.40
select SKU, SKU_Description, INVENTORY.WarehouseID, WAREHOUSE.WarehouseID, WarehouseCity, WarehouseState
from INVENTORY join WAREHOUSE
on INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
where WarehouseCity = 'Atlanta'
	or WarehouseCity = 'Bangor'
    or WarehouseCity = 'Chicago';
    
-- 2.41
select SKU, SKU_Description, INVENTORY.WarehouseID, WAREHOUSE.WarehouseID, WarehouseCity, WarehouseState
from INVENTORY join WAREHOUSE
on INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
where WarehouseCity IN ('Atlanta', 'Bangor', 'Chicago');


-- 2.42
select SKU, SKU_Description, INVENTORY.WarehouseID, WAREHOUSE.WarehouseID, WarehouseCity, WarehouseState
from INVENTORY join WAREHOUSE
on INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
where WarehouseCity <> 'Atlanta'
  and WarehouseCity <> 'Bangor'
  and WarehouseCity <> 'Chicago';
  
  -- 2.44
select SKU, SKU_Description, INVENTORY.WarehouseID, WAREHOUSE.WarehouseID, WarehouseCity, WarehouseState
from INVENTORY join WAREHOUSE
on INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
where WarehouseCity not in ('Atlanta', 'Bangor', 'Chicago');

-- 2.45
select INVENTORY.SKU_Description, ' is located in ',  INVENTORY.WarehouseID, WAREHOUSE.WarehouseCity as ItemLocation
from INVENTORY join WAREHOUSE
on INVENTORY.WarehouseID = WAREHOUSE.WarehouseID;

-- 2.46
select SKU, SKU_Description, WarehouseID
from INVENTORY
where WarehouseID = (
        select WarehouseID
        from WAREHOUSE
        where Manager = 'Lucille Smith'
);

-- 2.47
select INVENTORY.SKU, INVENTORY.SKU_Description, INVENTORY.WarehouseID
from INVENTORY, WAREHOUSE
where INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
  and WAREHOUSE.Manager = 'Lucille Smith';
  
-- 2.48
select INVENTORY.SKU, INVENTORY.SKU_Description, INVENTORY.WarehouseID
from INVENTORY join WAREHOUSE 
on INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
where WAREHOUSE.Manager = 'Lucille Smith';

-- 2.49
select WarehouseID, avg(QuantityOnHand) as AvgQuantityOnHand
from INVENTORY
where WarehouseID in (
      select WarehouseID
      from WAREHOUSE
      where Manager = 'Lucille Smith'
)
group by WarehouseID;

-- 2.50
select INVENTORY.WarehouseID, avg(INVENTORY.QuantityOnHand) as AvgQuantityOnHand
from INVENTORY join WAREHOUSE
on INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
where Manager = 'Lucille Smith'
group by WarehouseID;

-- 2.51
select WAREHOUSE.WarehouseID, WAREHOUSE.WarehouseCity, WAREHOUSE.WarehouseState,WAREHOUSE.Manager,
		INVENTORY.SKU, INVENTORY.SKU_Description, INVENTORY.QuantityOnHand
from WAREHOUSE join INVENTORY
on WAREHOUSE.WarehouseID = INVENTORY.WarehouseID
where WAREHOUSE.Manager = 'Lucille Smith';

-- 2.52
select WarehouseID, sum(QuantityOnOrder) as TotalItemsOnOrder, sum(QuantityOnHand) as TotalItemsOnHand
from INVENTORY
group by WarehouseID, QuantityOnOrder;

-- 2.55
select WAREHOUSE.Manager, WAREHOUSE.SquareFeet, WAREHOUSE.WarehouseCity, WAREHOUSE.WarehouseID, WAREHOUSE.WarehouseState,
	INVENTORY.QuantityOnHand, INVENTORY.QuantityOnOrder, INVENTORY.SKU, INVENTORY.SKU_Description, INVENTORY.WarehouseID

from WAREHOUSE left join INVENTORY
on WAREHOUSE.WarehouseID = INVENTORY.WarehouseID;