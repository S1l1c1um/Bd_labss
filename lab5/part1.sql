CREATE LOGIN User_JeweleryManager WITH PASSWORD = '1234567';
CREATE LOGIN User_JeweleryEmployee WITH PASSWORD = '1234567';

USE JaweleryStore;

-- создаем пользователей в базе данных
CREATE USER User_JeweleryManager FOR LOGIN User_JeweleryManager;
CREATE USER User_JeweleryEmployee FOR LOGIN User_JeweleryEmployee;

-- создаем роли менеджера и работника
CREATE ROLE Role_JeweleryManager;
CREATE ROLE Role_JeweleryEmployee;

-- пользователей к ролям 
ALTER ROLE Role_JeweleryManager ADD MEMBER User_JeweleryManager;
ALTER ROLE Role_JeweleryEmployee ADD MEMBER User_JeweleryEmployee;


-- полные права
GRANT SELECT, INSERT, UPDATE, DELETE ON Discount TO Role_JeweleryManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Client TO Role_JeweleryManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Workshop TO Role_JeweleryManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Material TO Role_JeweleryManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Jewelery TO Role_JeweleryManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON Contract TO Role_JeweleryManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON client_discount TO Role_JeweleryManager;
GRANT SELECT, INSERT, UPDATE, DELETE ON jewelery_material TO Role_JeweleryManager;

GRANT EXECUTE ON FindMostUsedMaterials TO Role_JeweleryManager;
GRANT EXECUTE ON GetClientByContract TO Role_JeweleryManager;
GRANT EXECUTE ON GetJeweleryByType TO Role_JeweleryManager;
GRANT EXECUTE ON GetJeweleryWithPopularMaterials TO Role_JeweleryManager;
GRANT EXECUTE ON GetUnusedMaterials TO Role_JeweleryManager;

GRANT EXECUTE ON GetWorkshopRevenue TO Role_JeweleryManager;
GRANT SELECT ON GetTopClients TO Role_JeweleryManager;
GRANT SELECT ON AnalyzeJeweleryByMaterialsSimple TO Role_JeweleryManager;

GRANT SELECT ON Client TO Role_JeweleryManager WITH GRANT OPTION;
GRANT SELECT ON Contract TO Role_JeweleryManager WITH GRANT OPTION;
GRANT EXECUTE ON GetWorkshopRevenue TO Role_JeweleryManager WITH GRANT OPTION;
GRANT SELECT ON GetTopClients TO Role_JeweleryManager WITH GRANT OPTION;

--права для сотрудника
GRANT SELECT ON Material TO Role_JeweleryEmployee
GRANT SELECT ON Jewelery TO Role_JeweleryEmployee
GRANT SELECT ON jewelery_material TO Role_JeweleryEmployee
GRANT SELECT ON client_discount TO Role_JeweleryEmployee
GRANT SELECT, INSERT ON Discount TO Role_JeweleryEmployee
GRANT SELECT, INSERT ON Client TO Role_JeweleryEmployee
GRANT SELECT, INSERT ON Contract TO Role_JeweleryEmployee

DENY SELECT ON Workshop TO Role_JeweleryEmployee

GRANT EXECUTE ON GetWorkshopRevenue TO Role_JeweleryEmployee
GRANT SELECT ON GetTopClients TO Role_JeweleryEmployee
GRANT EXECUTE ON GetJeweleryByType TO Role_JeweleryEmployee

DENY UPDATE, DELETE ON Contract TO Role_JeweleryEmployee
DENY UPDATE, DELETE ON Jewelery TO Role_JeweleryEmployee
DENY UPDATE, DELETE ON Material TO Role_JeweleryEmployee
DENY UPDATE, DELETE ON Discount TO Role_JeweleryEmployee


