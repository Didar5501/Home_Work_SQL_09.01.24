CREATE OR REPLACE FUNCTION task1(supplier_id smallint) RETURNS integer AS $$
DECLARE
    product_count integer;
BEGIN
    SELECT COUNT(*) INTO product_count
    FROM products
    WHERE supplier_id = supplier_id;
    
    RETURN product_count;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION task2(start_date date, end_date date) RETURNS TABLE (
    order_id smallint,
    customer_id bpchar,
    order_date date
) AS $$
BEGIN
    RETURN QUERY
    SELECT order_id, customer_id, order_date
    FROM orders
    WHERE order_date BETWEEN start_date AND end_date;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION get_employee(employee_name character varying)
RETURNS TABLE (
    employee_id smallint,
    last_name character varying(20),
    first_name character varying(10),
    title character varying(30),
    title_of_courtesy character varying(25),
    birth_date date,
    hire_date date,
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    home_phone character varying(24),
    extension character varying(4),
    photo bytea,
    notes text,
    reports_to smallint,
    photo_path character varying(255)
) AS $$
BEGIN
    RETURN QUERY
    SELECT e.*
    FROM employees e
    WHERE e.first_name = employee_name OR e.last_name = employee_name;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION update_employee_name(employee_id smallint, new_name character varying)
RETURNS void AS $$
BEGIN
    UPDATE employees
    SET first_name = new_name
    WHERE employee_id = employee_id;
END;
$$ LANGUAGE plpgsql;

