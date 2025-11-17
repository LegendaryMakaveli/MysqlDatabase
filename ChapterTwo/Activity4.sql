use cape_codd_database;

-- 2.56
select SKU, SKU_Description, Department
from CATALOG_SKU_2016
union -- dont display duplicate
select SKU, SKU_Description, Department
from CATALOG_SKU_2017;

-- 2.57
select SKU, SKU_Description, Department
from CATALOG_SKU_2016
where CatalogPage is not null
union -- dont display duplicate
select SKU, SKU_Description, Department
from CATALOG_SKU_2017
where CatalogPage is not null;

-- 2.58
select CATALOG_SKU_2016.SKU, CATALOG_SKU_2016.SKU_Description, CATALOG_SKU_2016.Department
from CATALOG_SKU_2016 join CATALOG_SKU_2017
on CATALOG_SKU_2016.SKU = CATALOG_SKU_2017.SKU;

-- 2.59
select CATALOG_SKU_2016.SKU, CATALOG_SKU_2016.SKU_Description, CATALOG_SKU_2016.Department
from CATALOG_SKU_2016 join CATALOG_SKU_2017
on CATALOG_SKU_2016.SKU = CATALOG_SKU_2017.SKU
where CATALOG_SKU_2016.CatalogPage is not null and CATALOG_SKU_2017.CatalogPage is not null;

-- 2.60
select CATALOG_SKU_2016.SKU, CATALOG_SKU_2016.SKU_Description, CATALOG_SKU_2016.Department
from CATALOG_SKU_2016 left join CATALOG_SKU_2017
on CATALOG_SKU_2016.SKU = CATALOG_SKU_2017.SKU
where CATALOG_SKU_2017.SKU is null;
