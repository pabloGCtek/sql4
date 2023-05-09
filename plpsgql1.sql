--ej1
--
DO $$
DECLARE nota integer := 8;
BEGIN
CASE nota
WHEN 10 THEN
RAISE NOTICE 'A';
WHEN 9 THEN
RAISE NOTICE 'B';
WHEN 8 THEN
RAISE NOTICE 'C';
WHEN 7 THEN
RAISE NOTICE 'D';
WHEN 6 THEN
RAISE NOTICE 'E';
ELSE
RAISE NOTICE 'F';
END CASE;

END $$ language 'plpgsql';
--ej2
--
DO $$
DECLARE num integer := 8;
BEGIN
FOR n IN 1..10 LOOP
RAISE NOTICE '% x % = %',num,n,num*n;
END LOOP;
END $$ language 'plpgsql';
--ej3
--
DO $$
DECLARE dolares decimal := 1000;
DECLARE cambio decimal := 0.9;
BEGIN
RAISE NOTICE '% Dólares = % Euros',dolares,dolares*cambio;
END $$ language 'plpgsql';

--ej4
--

DO $$
DECLARE V decimal := 1000;
DECLARE N decimal := 1;
DECLARE i decimal := 0.01;
BEGIN
i := i/12;
RAISE NOTICE 'La cantidad tras amortizacion: %',(V*i)/(1-(1+i)^(-N));
END $$ language 'plpgsql';
