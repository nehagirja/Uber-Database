--  View to show customer profile information
CREATE OR REPLACE VIEW VW_CUSTOMER_PROFILE AS 
    SELECT FIRST_NAME, 
    LAST_NAME, 
    PHONE_NUMBER, 
    EMAIL, 
    ADDRESS_LINE_1, 
    ADDRESS_LINE_2, 
    ZIPCODE FROM CUSTOMER;

--test view 
--SELECT * FROM VW_CUSTOMER_PROFILE;

