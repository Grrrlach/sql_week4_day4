CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	"address" VARCHAR(150) NOT NULL,
	phone INTEGER NOT NULL
);

CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	employee_id INTEGER NOT NULL,
	invoice_id INTEGER NOT NULL
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	employee_id INTEGER NOT NULL
);

CREATE TABLE car(
	vin INTEGER PRIMARY KEY,
	repair_performed VARCHAR(300),
	customer_id INTEGER NOT NULL,
	mechanic_id INTEGER NOT NULL,
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
	FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id) ON DELETE CASCADE,
	FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id) ON DELETE CASCADE
);

CREATE TABLE invoice(
    incoice_id SERIAL PRIMARY KEY,
    car_name VARCHAR(50),
	amount DECIMAL(10,2),
	customer_id INTEGER NOT NULL,
	car_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE
);

CREATE TABLE part(
	part_id SERIAL PRIMARY KEY,
    part_1 VARCHAR(50),
    part_2 VARCHAR(50),
    part_3 VARCHAR(50),
    part_4 VARCHAR(50),
    part_5 VARCHAR(50),
    part_6 VARCHAR(50)
);

CREATE TABLE service_ticket(
	service_ticket_id SERIAL PRIMARY KEY,
	labor_hours INTEGER,
	customer_id INTEGER NOT NULL,
	vin INTEGER NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE,
	FOREIGN KEY (vin) REFERENCES car(vin) ON DELETE CASCADE
);

CREATE TABLE part_repair_table(
	part_repair_id SERIAL PRIMARY KEY,
	part_id INTEGER NOT NULL,
	service_ticket_id INTEGER NOT NULL,
	FOREIGN KEY (part_id) REFERENCES part(part_id) ON DELETE CASCADE,
	FOREIGN KEY(service_ticket_id) REFERENCES service_ticket(service_ticket_id) ON DELETE CASCADE
);

CREATE TABLE mechanic_service_table(
	mechanic_service_id SERIAL PRIMARY KEY,
	service_ticket_id INTEGER NOT NULL,
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY (service_ticket_id) REFERENCES service_ticket(service_ticket_id) ON DELETE CASCADE,
	FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id) ON DELETE CASCADE
);

ALTER TABLE invoice
DROP COLUMN incoice_id,
ADD invoice_id SERIAL PRIMARY KEY;

ALTER TABLE invoice
DROP COLUMN car_id,
ADD vin INTEGER,
ADD FOREIGN KEY (vin) REFERENCES car(vin) ON DELETE CASCADE;

ALTER TABLE salesperson
ADD FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id) ON DELETE CASCADE;

ALTER TABLE invoice
ADD FOREIGN KEY (vin) REFERENCES car(vin) ON DELETE CASCADE;

ALTER TABLE customer
DROP COLUMN phone,
ADD phone VARCHAR(10);

ALTER TABLE car
ALTER COLUMN vin TYPE VARCHAR(50);
