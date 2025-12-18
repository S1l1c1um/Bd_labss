-- проверка руководителя
EXECUTE AS USER = 'User_JeweleryManager'

SELECT * FROM Workshop  
SELECT * FROM Client 
EXEC GetClientByContract @contract_id = 1, @client_name = '' 

REVERT

-- проверка сотрудника
EXECUTE AS USER = 'User_JeweleryEmployee'

SELECT * FROM Jewelery   
SELECT * FROM Material  
EXEC GetJeweleryByType @product_type = 'Кольцо' 

SELECT * FROM Workshop 

UPDATE Contract SET price = 50000 WHERE id = 1 
DELETE FROM Client WHERE id = 1 

REVERT