BEGIN
    -- UBER DRIVER ROLE GRANTS
    BEGIN
        EXECUTE IMMEDIATE 'GRANT SELECT, UPDATE ON Trip TO Uber_Driver';
        EXECUTE IMMEDIATE 'GRANT SELECT, INSERT ON Trip_Status TO Uber_Driver';
        EXECUTE IMMEDIATE 'GRANT SELECT, INSERT ON Driver_Status TO Uber_Driver';
        EXECUTE IMMEDIATE 'GRANT SELECT ON Payment TO Uber_Driver';
        EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE ON Vehicle TO Uber_Driver';
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error granting privileges to Uber_Driver: ' || SQLERRM);
    END;

    -- APP CUSTOMER ROLE GRANTS
    BEGIN
        EXECUTE IMMEDIATE 'GRANT INSERT, SELECT ON Trip TO App_Customer';
        EXECUTE IMMEDIATE 'GRANT INSERT, SELECT ON Payment TO App_Customer';
        EXECUTE IMMEDIATE 'GRANT INSERT, UPDATE, SELECT ON Customer TO App_Customer';
        EXECUTE IMMEDIATE 'GRANT UPDATE (cancelled_at, cancelled_by, cancellation_reason, driver_rating, trip_rating) ON Trip TO App_Customer';
        EXECUTE IMMEDIATE 'GRANT SELECT, INSERT ON Trip_Status TO App_Customer';
        EXECUTE IMMEDIATE 'GRANT INSERT, SELECT ON Payment TO App_Customer';
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error granting privileges to App_Customer: ' || SQLERRM);
    END;

    -- CUSTOMER SUPPORT TEAM ROLE GRANTS
    BEGIN
        EXECUTE IMMEDIATE 'GRANT SELECT ON Trip TO Support_Team';
        EXECUTE IMMEDIATE 'GRANT SELECT ON Trip_Status TO Support_Team';
        EXECUTE IMMEDIATE 'GRANT SELECT ON Customer TO Support_Team';
        EXECUTE IMMEDIATE 'GRANT SELECT ON Driver TO Support_Team';
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error granting privileges to Support_Team: ' || SQLERRM);
    END;

    -- FLEET MANAGEMENT TEAM ROLE GRANTS
    BEGIN
        EXECUTE IMMEDIATE 'GRANT SELECT ON Driver TO Fleet_Management';
        EXECUTE IMMEDIATE 'GRANT SELECT, INSERT ON Ride_Type TO Fleet_Management';
        EXECUTE IMMEDIATE 'GRANT UPDATE (Rating) ON Driver TO Fleet_Management';
        EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE ON Surge_Pricing TO Fleet_Management';
        EXECUTE IMMEDIATE 'GRANT SELECT, INSERT ON Trip_Status TO Fleet_Management';
        EXECUTE IMMEDIATE 'GRANT SELECT, INSERT ON Driver_Status TO Fleet_Management';
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error granting privileges to Fleet_Management: ' || SQLERRM);
    END;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('General error during grant execution: ' || SQLERRM);
        ROLLBACK;
END;
/
