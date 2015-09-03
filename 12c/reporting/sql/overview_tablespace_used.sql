SELECT
      HOST_NAME,
      TARGET_NAME,
      round(SUM(TABLESPACE_SIZE)/1024/1024,0) AS "DB_TABLESPACE_USED"
FROM 
    MGMT$DB_TABLESPACES
GROUP BY
        target_name,
        host_name
ORDER BY 
        host_name, 
        target_name
