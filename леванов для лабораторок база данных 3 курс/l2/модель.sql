USE model;
SELECT name, physical_name, size, growth, is_percent_growth
FROM sys.master_files
ORDER BY name
