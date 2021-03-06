INSERT INTO tbl_Lookup
(	  
      [Organisation_ID]
      ,[Lookup_Code]
	  ,[Set_Name]
      ,[Short_Name]
      ,[Long_Name]
      ,[Print_Lookup_ID]
      ,[Sort_Order]
      ,[Category]
      ,[System_YN]
      ,[IsActive]
      ,[Created_By]
      ,[Created_Date]
      ,[Updated_By]
      ,[Updated_date]
)
values
(NULL,'EXTERNAL_FTP','TYPE_OF_INGESTION','EXTERNAL_FTP','EXTERNAL_FTP',0,1,NULL,'Y','Y','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(NULL,'INTERNAL_FTP','TYPE_OF_INGESTION','INTERNAL_FTP','INTERNAL_FTP',0,2,NULL,'Y','Y','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(NULL,'EMAIL','TYPE_OF_INGESTION','EMAIL','EMAIL',0,3,NULL,'Y','Y','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(NULL,'PCS_API','TYPE_OF_INGESTION','PCS_API','PCS_API',0,4,NULL,'Y','Y','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(NULL,'EXCEL','FILE_TYPE','EXCEL','EXCEL',0,1,NULL,'Y','Y','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(NULL,'DELIMITED','FILE_TYPE','DELIMITED','DELIMITED',0,2,NULL,'Y','Y','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(NULL,'JSON','FILE_TYPE','JSON','JSON',0,3,NULL,'Y','Y','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(NULL,'PAYROLL_PROVIDER','PAYROLL_PROVIDER','PAYROLL_PROVIDER','PAYROLL_DATA_PROVIDER',0,1,NULL,'Y','Y','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(NULL,'SPONSOR','PAYROLL_PROVIDER','SPONSOR','SPONSOR',0,2,NULL,'Y','Y','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),
(NULL,'REMITTER','PAYROLL_PROVIDER','REMITTER','REMITTER',0,3,NULL,'Y','Y','SYSTEM',GETDATE(),'SYSTEM',GETDATE()),

