INSERT INTO customer(
    first_name,
    last_name,
    address,
    phone
) VALUES (
    'Mark', 'G', '555 Upper Lane', 5551234567)
INSERT INTO customer(
    first_name,
    last_name,
    address,
    phone
)VALUES(
    'Eduardo', 'R', '999 Cool Drive', 5559876543),(
    'Austin', 'C', '456 Rodeo Lane', 5556548756),(
    'Christina', 'P', '40 Yo Road', 5563278513),(
    'David', 'S', '000 Nowheresville, baby', 5553219874);

INSERT INTO salesperson(
    first_name, last_name, employee_id, invoice_id
)VALUES
    ('Devon', 'W', 1551234567, 1),
    ('Jesus', 'S', 1559876543, 2),
    ('McCall', 'B', 1556548756, 3),
    ('Mike', 'Oberdick', 1556327851, 4),
    ('Nabil', 'D', 1553219874, 5);

INSERT INTO mechanic(
    first_name, last_name, employee_id, invoice_id
)VALUES
    ('Toan', 'D', 1551234561),
    ('Alex', 'T', 1551234562),
    ('Nicole', 'S', 1551234563),
    ('Joel', 'C', 1551234564),
    ('Josh', 'C', 1551234565);

INSERT INTO car(
    vin, repair_performed
)VALUES
    (99875463728172635, 'OHHHHHH my god so much stuff is wrong with your car!!!!'),
    (55593549785876543, 'Dude, go to the lot. Pick something out. My treat.'),
    (12555467584586756, 'Welp, she had a good run - right over those "garbage cans."'),
    (55563278765411513, 'Hey, this is a good car! We gonna charge this guy sooo much!'),
    (51575936241593874, 'What cut do you make on a new car?Get jalopies.I can sell ’em');


INSERT INTO salesperson(
    first_name, last_name, employee_id
) VALUES
    ('Kevin', 'B', 321456986),
    ('Natasha', 'B', 321456987),
    ('Pari', 'P', 321456988),
    ('Tate', 'B', 321456989),
    ('Tim', 'L', 321456990);


INSERT INTO part(
    part_1, part_2, part_3, part_4, part_5, part_6
) VALUES
    ('computer thinkerdink'),
    ('gastank doit-nozzle'),
    ('brake crumble-stuffer'),
    ('wheelnoggin'),
    ('humblebraggin bouncyshock'),
    ('goquick pedalpusher');

INSERT INTO invoice(
    car_name, amount, vin
) VALUES
    ('ford', 321456986),
    ('hemi', 321456987),
    ('toyota', 321456988),
    ('ferrari', 321456989),
    ('junker', 321456990);

INSERT INTO service_ticket(
    labor_hours, customer_id, vin
)VALUES
    (25, (SELECT customer_id FROM customer WHERE last_name = 'G'), 99875463728172635),
    (242, (SELECT customer_id FROM customer WHERE last_name = 'R'), 55593549785876543),
    (1, (SELECT customer_id FROM customer WHERE last_name = 'C'), 12555467584586756),
    (15, (SELECT customer_id FROM customer WHERE last_name = 'P'), 55563278765411513),
    (3, (SELECT customer_id FROM customer WHERE last_name = 'S'), 51575936241593874);