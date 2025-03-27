CREATE OR REPLACE PROCEDURE createNewReport(_date DATE)
    LANGUAGE plpgsql
AS
$$
    DECLARE
        _id integer;
        cdur INTERVAL;
        ys DECIMAL;
        hhe BIT;
        hheCef DECIMAL:=0.07;
        dhm DECIMAL:=50.0;
        hm DECIMAL;
        ts DECIMAl;
BEGIN
    FOR _id IN
        SELECT id FROM operators
    LOOP
        SELECT SUM(duration) INTO cdur FROM calls c
        WHERE operator_id=_id AND c.date <= _date AND c.date >= _date - INTERVAL '1 month';

        SELECT getEx(_id) INTO ys;

        SELECT has_higher_education INTO hhe
        FROM operators
        WHERE id=_id;


        RAISE NOTICE 'YEAR: %', ys;

        hm := dhm + dhm*(ys/100);

        IF(CAST(hhe AS INTEGER) = 1) THEN
            hm :=hm + dhm*hheCef;
        END IF;

        RAISE NOTICE 'Value: %', hm;


        ts := hm * (EXTRACT(EPOCH FROM cdur) / 60);

        INSERT INTO operators_report
        VALUES(default,_id, cdur, ts, _date);
    END LOOP;
END;
$$;

CALL createNewReport('2024-01-31');
