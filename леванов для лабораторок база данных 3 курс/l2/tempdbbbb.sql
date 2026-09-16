USE tempdb;
SELECT session_id, user_object_reserved_page_count, internal_oject_reserved_page_count

FROM SYS.dm_db_file_space_usage