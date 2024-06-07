CREATE LOGIN dev WITH PASSWORD = 'deva';


CREATE USER dev FOR LOGIN dev;

EXEC sp_addrolemember 'db_owner', 'dev';
