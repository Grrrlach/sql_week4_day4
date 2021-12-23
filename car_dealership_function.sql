CREATE OR REPLACE PROCEDURE total(

	car_id INTEGER NOT NULL,
	value DECIMAL(10, 2)
)
AS
$$
BEGIN
	UPDATE repair_performed
	SET "car totaled"
	WHERE car_id = vin;
	
	COMMIT;
	
END;
$$
LANGUAGE plpgsql;




CALL total(99875463728172635)