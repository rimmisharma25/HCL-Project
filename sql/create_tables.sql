-- =====================================
-- PERSONAL EXPENSE TRACKER PROJECT
-- =====================================

-- CREATE TABLE

CREATE TABLE EXPENSES(
    ID NUMBER PRIMARY KEY,
    EXPENSE_DATE DATE,
    CATEGORY VARCHAR2(50),
    DESCRIPTION VARCHAR2(100),
    AMOUNT NUMBER
);

-- =====================================
-- INSERT SAMPLE DATA
-- =====================================

INSERT INTO EXPENSES
VALUES(
1,
TO_DATE('2025-01-01','YYYY-MM-DD'),
'Food',
'Lunch',
250
);

INSERT INTO EXPENSES
VALUES(
2,
TO_DATE('2025-01-02','YYYY-MM-DD'),
'Travel',
'Metro',
100
);

INSERT INTO EXPENSES
VALUES(
3,
TO_DATE('2025-01-03','YYYY-MM-DD'),
'Shopping',
'Tshirt',
1200
);

INSERT INTO EXPENSES
VALUES(
4,
TO_DATE('2025-01-04','YYYY-MM-DD'),
'Bills',
'Electricity',
1500
);

COMMIT;

-- =====================================
-- VIEW ALL DATA
-- =====================================

SELECT * FROM EXPENSES;

-- =====================================
-- MONTHLY TOTAL EXPENSE
-- =====================================

SELECT SUM(AMOUNT) AS TOTAL_EXPENSE
FROM EXPENSES;

-- =====================================
-- CATEGORY WISE EXPENSE
-- =====================================

SELECT
CATEGORY,
SUM(AMOUNT) AS TOTAL
FROM EXPENSES
GROUP BY CATEGORY;

-- =====================================
-- CREATE VIEW
-- =====================================

CREATE VIEW CATEGORY_EXPENSE_VIEW AS
SELECT
CATEGORY,
SUM(AMOUNT) AS TOTAL_EXPENSE
FROM EXPENSES
GROUP BY CATEGORY;

-- VIEW OUTPUT

SELECT * FROM CATEGORY_EXPENSE_VIEW;

-- =====================================
-- PL/SQL BUDGET CHECK
-- =====================================

DECLARE

TOTAL_EXPENSE NUMBER;
MONTHLY_BUDGET NUMBER := 3000;

BEGIN

SELECT SUM(AMOUNT)
INTO TOTAL_EXPENSE
FROM EXPENSES;

IF TOTAL_EXPENSE > MONTHLY_BUDGET THEN
    DBMS_OUTPUT.PUT_LINE('BUDGET BREACH');
ELSE
    DBMS_OUTPUT.PUT_LINE('WITHIN BUDGET');
END IF;

END;
/