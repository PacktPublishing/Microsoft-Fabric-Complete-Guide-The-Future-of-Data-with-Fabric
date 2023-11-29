-- At present not possible (June-2023)
CREATE USER anthony FOR LOGIN [anthonyn@ai-inter.com]
CREATE USER anthony WITH PASSWORD = 'J345#$Tthb';

-- View permissions granted explicitly to users 
SELECT DISTINCT pr.principal_id, pr.name, pr.type_desc, pr.authentication_type_desc, pe.state_desc, pe.permission_name
    FROM sys.database_principals AS pr
    JOIN sys.database_permissions AS pe ON pe.grantee_principal_id = pr.principal_id;

-- Create custom db role
CREATE ROLE RestrictedRole

-- When you GRANT permissions the user is created, in future CREATE USER will be enabled
GRANT SELECT ON [Groceries_wh].[dbo].[instacart_orders] TO [anthonyn@ai-inter.com]
ALTER ROLE RestrictedRole ADD MEMBER [anthonyn@ai-inter.com]

-- List Role membership
SELECT DP1.name AS DatabaseRoleName, isnull (DP2.name, 'No members') AS DatabaseUserName   
FROM sys.database_role_members AS DRM 
    RIGHT OUTER JOIN sys.database_principals AS DP1 ON DRM.role_principal_id = DP1.principal_id  
    LEFT OUTER JOIN sys.database_principals AS DP2  ON DRM.member_principal_id = DP2.principal_id  
WHERE DP1.type = 'R'
ORDER BY DP1.name;

SELECT SUSER_SNAME() as Logged_in_User
-- Example of using db roles to maanger Column Level security
SELECT TOP 100
    order_id,
    user_id,
    eval_set,
    order_number,
    order_dow,
    CASE WHEN IS_ROLEMEMBER ('RestrictedRole') = 1 THEN order_hour_of_day
    ELSE 0 END AS order_hour_of_day,
    days_since_prior_order,
    date_key
FROM [Groceries_wh].[dbo].[instacart_orders]


-- Clean up
DROP USER [anthonyn@ai-inter.com];
DROP ROLE RestrictedRole

EXECUTE AS USER 'anthonyn@ai-inter.com';
REVERT;
