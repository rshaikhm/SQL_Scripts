/****** Object:  Database [pcs-sqldb-config-payroll360-dev]    Script Date: 3/12/2021 8:44:48 AM ******/
CREATE DATABASE [pcs-sqldb-config-payroll360-dev]  (EDITION = 'Standard', SERVICE_OBJECTIVE = 'ElasticPool', MAXSIZE = 250 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [pcs-sqldb-config-payroll360-dev] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [pcs-sqldb-config-payroll360-dev] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pcs-sqldb-config-payroll360-dev] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pcs-sqldb-config-payroll360-dev] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pcs-sqldb-config-payroll360-dev] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pcs-sqldb-config-payroll360-dev] SET ARITHABORT OFF 
GO
ALTER DATABASE [pcs-sqldb-config-payroll360-dev] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pcs-sqldb-config-payroll360-dev] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pcs-sqldb-config-payroll360-dev] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pcs-sqldb-config-payroll360-dev] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pcs-sqldb-config-payroll360-dev] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pcs-sqldb-config-payroll360-dev] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pcs-sqldb-config-payroll360-dev] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pcs-sqldb-config-payroll360-dev] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pcs-sqldb-config-payroll360-dev] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [pcs-sqldb-config-payroll360-dev] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pcs-sqldb-config-payroll360-dev] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [pcs-sqldb-config-payroll360-dev] SET  MULTI_USER 
GO
ALTER DATABASE [pcs-sqldb-config-payroll360-dev] SET ENCRYPTION ON
GO
ALTER DATABASE [pcs-sqldb-config-payroll360-dev] SET QUERY_STORE = ON
GO
ALTER DATABASE [pcs-sqldb-config-payroll360-dev] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Schema [ #TempVoya]    Script Date: 3/12/2021 8:44:48 AM ******/
CREATE SCHEMA [ #TempVoya]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_diagramobjects]    Script Date: 3/12/2021 8:44:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE FUNCTION [dbo].[fn_diagramobjects]() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
	
GO
/****** Object:  Table [dbo].[History_Lookup]    Script Date: 3/12/2021 8:44:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History_Lookup](
	[Lookup_ID] [int] NOT NULL,
	[Lookup_Code] [varchar](50) NULL,
	[Organisation_ID] [int] NULL,
	[Set_Name] [varchar](100) NULL,
	[Short_Name] [varchar](100) NULL,
	[Long_Name] [varchar](200) NULL,
	[Print_Lookup_ID] [int] NULL,
	[Sort_Order] [tinyint] NULL,
	[Category] [varchar](50) NULL,
	[System_YN] [char](1) NULL,
	[IsActive] [char](1) NULL,
	[Created_By] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_By] [varchar](50) NULL,
	[Updated_date] [datetime] NULL,
	[SysStartTime] [datetime2](7) NOT NULL,
	[SysEndTime] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [ix_History_Lookup]    Script Date: 3/12/2021 8:44:48 AM ******/
CREATE CLUSTERED INDEX [ix_History_Lookup] ON [dbo].[History_Lookup]
(
	[SysEndTime] ASC,
	[SysStartTime] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Lookup]    Script Date: 3/12/2021 8:44:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Lookup](
	[Lookup_ID] [int] IDENTITY(1,1) NOT NULL,
	[Lookup_Code] [varchar](50) NULL,
	[Organisation_ID] [int] NULL,
	[Set_Name] [varchar](100) NULL,
	[Short_Name] [varchar](100) NULL,
	[Long_Name] [varchar](200) NULL,
	[Print_Lookup_ID] [int] NULL,
	[Sort_Order] [tinyint] NULL,
	[Category] [varchar](50) NULL,
	[System_YN] [char](1) NULL,
	[IsActive] [char](1) NULL,
	[Created_By] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_By] [varchar](50) NULL,
	[Updated_date] [datetime] NULL,
	[SysStartTime] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[SysEndTime] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Lookup_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([SysStartTime], [SysEndTime])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [dbo].[History_Lookup] )
)
GO
/****** Object:  Table [dbo].[History_Payroll_Provider]    Script Date: 3/12/2021 8:44:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History_Payroll_Provider](
	[Payroll_Provider_ID] [int] NOT NULL,
	[Payroll_Provider_Type_LK_ID] [int] NULL,
	[Payroll_Provider_Name] [varchar](50) NULL,
	[IsActive] [tinyint] NULL,
	[Created_By] [varchar](50) NULL,
	[Updated_By] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_Date] [datetime] NULL,
	[SysStartTime] [datetime2](7) NOT NULL,
	[SysEndTime] [datetime2](7) NOT NULL,
	[Payroll_Provider_Code] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [ix_History_Payroll_Provider]    Script Date: 3/12/2021 8:44:49 AM ******/
CREATE CLUSTERED INDEX [ix_History_Payroll_Provider] ON [dbo].[History_Payroll_Provider]
(
	[SysEndTime] ASC,
	[SysStartTime] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Payroll_Provider]    Script Date: 3/12/2021 8:44:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Payroll_Provider](
	[Payroll_Provider_ID] [int] IDENTITY(1,1) NOT NULL,
	[Payroll_Provider_Type_LK_ID] [int] NULL,
	[Payroll_Provider_Name] [varchar](50) NULL,
	[IsActive] [tinyint] NULL,
	[Created_By] [varchar](50) NULL,
	[Updated_By] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_Date] [datetime] NULL,
	[SysStartTime] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[SysEndTime] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
	[Payroll_Provider_Code] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Payroll_Provider_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([SysStartTime], [SysEndTime])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [dbo].[History_Payroll_Provider] )
)
GO
/****** Object:  Table [dbo].[History_File_Received]    Script Date: 3/12/2021 8:44:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History_File_Received](
	[File_Received_ID] [int] NOT NULL,
	[File_Name] [varchar](250) NULL,
	[Received_Date_And_Time] [datetime] NULL,
	[Inbound_Source_Setup_ID] [int] NULL,
	[Loaded_By] [varchar](150) NULL,
	[File_Type_LK_ID] [int] NULL,
	[As_OF_Date] [datetime] NULL,
	[Actual_File] [varchar](1000) NULL,
	[From_Email_ID] [varchar](100) NULL,
	[Status] [varchar](50) NULL,
	[Created_By] [varchar](100) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
	[Updated_Date] [datetime] NULL,
	[ValidFromFR] [datetime2](7) NOT NULL,
	[ValidTillFR] [datetime2](7) NOT NULL,
	[Updated_Payload_ID] [int] NULL,
	[Comment] [varchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [ix_History_File_Received]    Script Date: 3/12/2021 8:44:49 AM ******/
CREATE CLUSTERED INDEX [ix_History_File_Received] ON [dbo].[History_File_Received]
(
	[ValidTillFR] ASC,
	[ValidFromFR] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_File_Received]    Script Date: 3/12/2021 8:44:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_File_Received](
	[File_Received_ID] [int] IDENTITY(1,1) NOT NULL,
	[File_Name] [varchar](250) NULL,
	[Received_Date_And_Time] [datetime] NULL,
	[Inbound_Source_Setup_ID] [int] NULL,
	[Loaded_By] [varchar](150) NULL,
	[File_Type_LK_ID] [int] NULL,
	[As_OF_Date] [datetime] NULL,
	[Actual_File] [varchar](1000) NULL,
	[From_Email_ID] [varchar](100) NULL,
	[Status] [varchar](50) NULL,
	[Created_By] [varchar](100) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
	[Updated_Date] [datetime] NULL,
	[ValidFromFR] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTillFR] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
	[Updated_Payload_ID] [int] NULL,
	[Comment] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[File_Received_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFromFR], [ValidTillFR])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [dbo].[History_File_Received] , HISTORY_RETENTION_PERIOD = 1 YEAR )
)
GO
/****** Object:  Table [dbo].[History_Inbound_Source_Setup]    Script Date: 3/12/2021 8:44:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History_Inbound_Source_Setup](
	[Inbound_Source_SetupID] [int] NOT NULL,
	[Type_Of_Ingestion_LK_ID] [int] NULL,
	[Source_URL] [varchar](500) NULL,
	[User_ID] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Payroll_Provider_Type_LK_ID] [int] NULL,
	[Frequency_ID] [int] NULL,
	[Destination_Setup_ID] [int] NULL,
	[Connection_Port] [varchar](100) NULL,
	[Source_Folder_Path] [varchar](500) NULL,
	[From_Email_ID] [varchar](100) NULL,
	[API_Name] [varchar](500) NULL,
	[File_Type_LK_ID] [int] NULL,
	[File_Name_Pattern] [varchar](200) NULL,
	[Payroll_Provider_ID] [int] NULL,
	[Delimiter] [varchar](50) NULL,
	[Is_Column_Header_Available] [char](1) NULL,
	[Is_Header_Row_Available] [char](1) NULL,
	[Is_Column_Footer_Header_Available] [char](1) NULL,
	[Is_Footer_Row_Available] [char](1) NULL,
	[Data_Header_Row] [int] NULL,
	[Data_Start_Row] [int] NULL,
	[Footer_Start_Row] [int] NULL,
	[Hierarchial_Data] [char](1) NULL,
	[Get_Or_Put] [varchar](10) NULL,
	[Is_Active] [tinyint] NULL,
	[Created_By] [varchar](100) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
	[Updated_Date] [datetime] NULL,
	[SysStartTime] [datetime2](7) NOT NULL,
	[SysEndTime] [datetime2](7) NOT NULL,
	[Filename_Structure_Parts] [int] NULL,
	[Storage_Folder_Name] [varchar](100) NULL,
	[Sheet_Name] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [ix_History_Inbound_Source_Setup]    Script Date: 3/12/2021 8:44:49 AM ******/
CREATE CLUSTERED INDEX [ix_History_Inbound_Source_Setup] ON [dbo].[History_Inbound_Source_Setup]
(
	[SysEndTime] ASC,
	[SysStartTime] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Inbound_Source_Setup]    Script Date: 3/12/2021 8:44:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Inbound_Source_Setup](
	[Inbound_Source_SetupID] [int] IDENTITY(1,1) NOT NULL,
	[Type_Of_Ingestion_LK_ID] [int] NULL,
	[Source_URL] [varchar](500) NULL,
	[User_ID] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Payroll_Provider_Type_LK_ID] [int] NULL,
	[Frequency_ID] [int] NULL,
	[Destination_Setup_ID] [int] NULL,
	[Connection_Port] [varchar](100) NULL,
	[Source_Folder_Path] [varchar](500) NULL,
	[From_Email_ID] [varchar](100) NULL,
	[API_Name] [varchar](500) NULL,
	[File_Type_LK_ID] [int] NULL,
	[File_Name_Pattern] [varchar](200) NULL,
	[Payroll_Provider_ID] [int] NULL,
	[Delimiter] [varchar](50) NULL,
	[Is_Column_Header_Available] [char](1) NULL,
	[Is_Header_Row_Available] [char](1) NULL,
	[Is_Column_Footer_Header_Available] [char](1) NULL,
	[Is_Footer_Row_Available] [char](1) NULL,
	[Data_Header_Row] [int] NULL,
	[Data_Start_Row] [int] NULL,
	[Footer_Start_Row] [int] NULL,
	[Hierarchial_Data] [char](1) NULL,
	[Get_Or_Put] [varchar](10) NULL,
	[Is_Active] [tinyint] NULL,
	[Created_By] [varchar](100) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
	[Updated_Date] [datetime] NULL,
	[SysStartTime] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[SysEndTime] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
	[Filename_Structure_Parts] [int] NULL,
	[Storage_Folder_Name] [varchar](100) NULL,
	[Sheet_Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Inbound_Source_SetupID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([SysStartTime], [SysEndTime])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [dbo].[History_Inbound_Source_Setup] )
)
GO
/****** Object:  Table [dbo].[History_Master_Metadata_Mapping]    Script Date: 3/12/2021 8:44:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History_Master_Metadata_Mapping](
	[Master_Metadata_Mapping_ID] [int] NOT NULL,
	[Inbound_Source_Setup_ID] [int] NULL,
	[Mapping_Name] [varchar](100) NULL,
	[IsActive] [tinyint] NULL,
	[Created_By] [varchar](100) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
	[Updated_Date] [datetime] NULL,
	[SysStartTime] [datetime2](7) NOT NULL,
	[SysEndTime] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [ix_History_Master_Metadata_Mapping]    Script Date: 3/12/2021 8:44:49 AM ******/
CREATE CLUSTERED INDEX [ix_History_Master_Metadata_Mapping] ON [dbo].[History_Master_Metadata_Mapping]
(
	[SysEndTime] ASC,
	[SysStartTime] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Master_Metadata_Mapping]    Script Date: 3/12/2021 8:44:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Master_Metadata_Mapping](
	[Master_Metadata_Mapping_ID] [int] IDENTITY(1,1) NOT NULL,
	[Inbound_Source_Setup_ID] [int] NULL,
	[Mapping_Name] [varchar](100) NULL,
	[IsActive] [tinyint] NULL,
	[Created_By] [varchar](100) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
	[Updated_Date] [datetime] NULL,
	[SysStartTime] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[SysEndTime] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Master_Metadata_Mapping_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([SysStartTime], [SysEndTime])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [dbo].[History_Master_Metadata_Mapping] )
)
GO
/****** Object:  Table [dbo].[History_Metadata_Mapping]    Script Date: 3/12/2021 8:44:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History_Metadata_Mapping](
	[Metadata_Mapping_ID] [int] NOT NULL,
	[Master_Metadata_Mapping_ID] [int] NULL,
	[Inbound_Source_Setup_ID] [int] NULL,
	[Source_Column_Name] [varchar](100) NULL,
	[Destination_Table_name] [varchar](100) NULL,
	[Destination_Column_Name] [varchar](100) NULL,
	[Source_Data_Type] [varchar](50) NULL,
	[Column_Order] [int] NULL,
	[Format] [varchar](50) NULL,
	[IsActive] [tinyint] NULL,
	[Created_By] [varchar](100) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
	[Updated_Date] [datetime] NULL,
	[SysStartTime] [datetime2](7) NOT NULL,
	[SysEndTime] [datetime2](7) NOT NULL,
	[Source_Type] [varchar](50) NULL,
	[Source_Table_Name] [varchar](100) NULL,
	[Is_Transformation_Needed] [char](1) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [ix_History_Metadata_Mapping]    Script Date: 3/12/2021 8:44:49 AM ******/
CREATE CLUSTERED INDEX [ix_History_Metadata_Mapping] ON [dbo].[History_Metadata_Mapping]
(
	[SysEndTime] ASC,
	[SysStartTime] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Metadata_Mapping]    Script Date: 3/12/2021 8:44:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Metadata_Mapping](
	[Metadata_Mapping_ID] [int] IDENTITY(1,1) NOT NULL,
	[Master_Metadata_Mapping_ID] [int] NULL,
	[Inbound_Source_Setup_ID] [int] NULL,
	[Source_Column_Name] [varchar](100) NULL,
	[Destination_Table_name] [varchar](100) NULL,
	[Destination_Column_Name] [varchar](100) NULL,
	[Source_Data_Type] [varchar](50) NULL,
	[Column_Order] [int] NULL,
	[Format] [varchar](50) NULL,
	[IsActive] [tinyint] NULL,
	[Created_By] [varchar](100) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
	[Updated_Date] [datetime] NULL,
	[SysStartTime] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[SysEndTime] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
	[Source_Type] [varchar](50) NULL,
	[Source_Table_Name] [varchar](100) NULL,
	[Is_Transformation_Needed] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[Metadata_Mapping_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([SysStartTime], [SysEndTime])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [dbo].[History_Metadata_Mapping] )
)
GO
/****** Object:  Table [dbo].[History_Frequency]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History_Frequency](
	[Frequency_ID] [int] NOT NULL,
	[Frequency_Duration] [varchar](50) NULL,
	[Day] [int] NULL,
	[Time] [time](7) NULL,
	[IsActive] [tinyint] NULL,
	[Created_By] [varchar](100) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
	[Updated_Date] [datetime] NULL,
	[ValidFrom] [datetime2](7) NOT NULL,
	[ValidTill] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [ix_History_Frequency]    Script Date: 3/12/2021 8:44:50 AM ******/
CREATE CLUSTERED INDEX [ix_History_Frequency] ON [dbo].[History_Frequency]
(
	[ValidTill] ASC,
	[ValidFrom] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Frequency]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Frequency](
	[Frequency_ID] [int] IDENTITY(1,1) NOT NULL,
	[Frequency_Duration] [varchar](50) NULL,
	[Day] [int] NULL,
	[Time] [time](7) NULL,
	[IsActive] [tinyint] NULL,
	[Created_By] [varchar](100) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
	[Updated_Date] [datetime] NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[ValidTill] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Frequency_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTill])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [dbo].[History_Frequency] , HISTORY_RETENTION_PERIOD = 1 YEAR )
)
GO
/****** Object:  Table [dbo].[History_Destination_Setup]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History_Destination_Setup](
	[Destination_Setup_ID] [int] NOT NULL,
	[Destination_URL] [varchar](500) NULL,
	[User_ID] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[connection_port] [varchar](100) NULL,
	[destination_folder_path] [varchar](500) NULL,
	[Error_Folder_Path] [varchar](50) NULL,
	[SysStartTime] [datetime2](7) NOT NULL,
	[SysEndTime] [datetime2](7) NOT NULL,
	[Created_By] [varchar](100) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
	[Updated_Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [ix_History_Destination_Setup]    Script Date: 3/12/2021 8:44:50 AM ******/
CREATE CLUSTERED INDEX [ix_History_Destination_Setup] ON [dbo].[History_Destination_Setup]
(
	[SysEndTime] ASC,
	[SysStartTime] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Destination_Setup]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Destination_Setup](
	[Destination_Setup_ID] [int] IDENTITY(1,1) NOT NULL,
	[Destination_URL] [varchar](500) NULL,
	[User_ID] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[connection_port] [varchar](100) NULL,
	[destination_folder_path] [varchar](500) NULL,
	[Error_Folder_Path] [varchar](50) NULL,
	[SysStartTime] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[SysEndTime] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
	[Created_By] [varchar](100) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
	[Updated_Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Destination_Setup_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([SysStartTime], [SysEndTime])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [dbo].[History_Destination_Setup] )
)
GO
/****** Object:  Table [dbo].[History_Control_Table]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History_Control_Table](
	[Control_Table_ID] [int] NOT NULL,
	[File_Received_ID] [int] NULL,
	[File_Row_Count] [int] NULL,
	[File_header1_row_count] [int] NULL,
	[File_footer1_row_count] [int] NULL,
	[File_header2_row_count] [int] NULL,
	[File_footer2_row_count] [int] NULL,
	[File_header3_row_count] [int] NULL,
	[File_footer3_row_count] [int] NULL,
	[Acquisition_Row_Count] [int] NULL,
	[Cleansing_Row_Count] [int] NULL,
	[Acquisition_Error_Row_Count] [int] NULL,
	[Cleansing_Error_Row_Count] [int] NULL,
	[Status] [varchar](10) NULL,
	[File_header1_Control_Amount] [decimal](18, 2) NULL,
	[File_footer1_Control_Amount] [decimal](18, 2) NULL,
	[File_header2_Control_Amount] [decimal](18, 2) NULL,
	[File_footer2_Control_Amount] [decimal](18, 2) NULL,
	[File_header3_Control_Amount] [decimal](18, 2) NULL,
	[File_footer3_Control_Amount] [decimal](18, 2) NULL,
	[Acquisition_control_Amount] [decimal](18, 2) NULL,
	[Cleansing_Control_Amount] [decimal](18, 2) NULL,
	[Created_By] [varchar](50) NULL,
	[Updated_By] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_Date] [datetime] NULL,
	[SysStartTime] [datetime2](7) NOT NULL,
	[SysEndTime] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [ix_History_Control_Table]    Script Date: 3/12/2021 8:44:50 AM ******/
CREATE CLUSTERED INDEX [ix_History_Control_Table] ON [dbo].[History_Control_Table]
(
	[SysEndTime] ASC,
	[SysStartTime] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Control_Table]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Control_Table](
	[Control_Table_ID] [int] IDENTITY(1,1) NOT NULL,
	[File_Received_ID] [int] NULL,
	[File_Row_Count] [int] NULL,
	[File_header1_row_count] [int] NULL,
	[File_footer1_row_count] [int] NULL,
	[File_header2_row_count] [int] NULL,
	[File_footer2_row_count] [int] NULL,
	[File_header3_row_count] [int] NULL,
	[File_footer3_row_count] [int] NULL,
	[Acquisition_Row_Count] [int] NULL,
	[Cleansing_Row_Count] [int] NULL,
	[Acquisition_Error_Row_Count] [int] NULL,
	[Cleansing_Error_Row_Count] [int] NULL,
	[Status] [varchar](10) NULL,
	[File_header1_Control_Amount] [decimal](18, 2) NULL,
	[File_footer1_Control_Amount] [decimal](18, 2) NULL,
	[File_header2_Control_Amount] [decimal](18, 2) NULL,
	[File_footer2_Control_Amount] [decimal](18, 2) NULL,
	[File_header3_Control_Amount] [decimal](18, 2) NULL,
	[File_footer3_Control_Amount] [decimal](18, 2) NULL,
	[Acquisition_control_Amount] [decimal](18, 2) NULL,
	[Cleansing_Control_Amount] [decimal](18, 2) NULL,
	[Created_By] [varchar](50) NULL,
	[Updated_By] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_Date] [datetime] NULL,
	[SysStartTime] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[SysEndTime] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Control_Table_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([SysStartTime], [SysEndTime])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [dbo].[History_Control_Table] )
)
GO
/****** Object:  Table [dbo].[History_Error_Message_Setup]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History_Error_Message_Setup](
	[Error_Message_Setup_ID] [int] NOT NULL,
	[Error_Date] [datetime] NULL,
	[Error_ID] [int] NULL,
	[Error_Name] [varchar](500) NULL,
	[Error_Type] [varchar](50) NULL,
	[Created_By] [varchar](50) NULL,
	[Updated_By] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_Date] [datetime] NULL,
	[SysStartTime] [datetime2](7) NOT NULL,
	[SysEndTime] [datetime2](7) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [ix_History_Error_Message_Setup]    Script Date: 3/12/2021 8:44:50 AM ******/
CREATE CLUSTERED INDEX [ix_History_Error_Message_Setup] ON [dbo].[History_Error_Message_Setup]
(
	[SysEndTime] ASC,
	[SysStartTime] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Error_Message_Setup]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Error_Message_Setup](
	[Error_Message_Setup_ID] [int] IDENTITY(1,1) NOT NULL,
	[Error_Date] [datetime] NULL,
	[Error_ID] [int] NULL,
	[Error_Name] [varchar](500) NULL,
	[Error_Type] [varchar](50) NULL,
	[Created_By] [varchar](50) NULL,
	[Updated_By] [varchar](50) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_Date] [datetime] NULL,
	[SysStartTime] [datetime2](7) GENERATED ALWAYS AS ROW START NOT NULL,
	[SysEndTime] [datetime2](7) GENERATED ALWAYS AS ROW END NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Error_Message_Setup_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([SysStartTime], [SysEndTime])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [dbo].[History_Error_Message_Setup] )
)
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [sysname] NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED 
(
	[principal_id] ASC,
	[name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Error_Master]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Error_Master](
	[Error_Message_Setup_ID] [int] IDENTITY(1,1) NOT NULL,
	[Error_Code] [varchar](50) NULL,
	[Error_Category] [varchar](100) NULL,
	[Error_msg] [varchar](500) NULL,
	[Error_Type_ID] [int] NULL,
	[Created_By] [varchar](100) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
	[Updated_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Error_Message_Setup_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Header_Metadata_Table]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Header_Metadata_Table](
	[Header_Metadata_Table_ID] [int] IDENTITY(1,1) NOT NULL,
	[Header_Column_Name] [varchar](100) NULL,
	[Header_Column_Meaning] [varchar](100) NULL,
	[IsActive] [tinyint] NULL,
	[Created_By] [varchar](100) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
	[Updated_Date] [datetime] NULL,
	[Inbound_Source_Setup_ID] [int] NULL,
	[Sort_Order] [int] NULL,
	[Column_Format] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Header_Metadata_Table_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Header_Received]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Header_Received](
	[Header_Received_ID] [int] IDENTITY(1,1) NOT NULL,
	[Header_Metadata_Table_ID] [int] NULL,
	[Header_Name] [varchar](250) NULL,
	[Header_Type] [varchar](50) NULL,
	[IsActive] [tinyint] NULL,
	[Created_By] [varchar](100) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
	[Updated_Date] [datetime] NULL,
	[Inbound_Source_Setup_ID] [int] NULL,
	[File_Received_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Header_Received_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Payload]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Payload](
	[Payload_received_ID] [int] IDENTITY(1,1) NOT NULL,
	[Payload] [varchar](1000) NULL,
	[API_Name] [varchar](500) NULL,
	[Status] [varchar](50) NULL,
	[IsActive] [tinyint] NULL,
	[Created_By] [varchar](100) NULL,
	[Created_Date] [datetime] NULL,
	[Updated_By] [varchar](100) NULL,
	[Updated_Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Payload_received_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Voya]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Voya](
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[rowno] [nvarchar](50) NULL,
	[column2] [nvarchar](50) NULL,
	[column3] [nvarchar](200) NULL,
	[column4] [nvarchar](200) NULL,
	[column5] [nvarchar](200) NULL,
	[column6] [nvarchar](200) NULL,
	[column7] [nvarchar](200) NULL,
	[column8] [nvarchar](200) NULL,
	[column9] [nvarchar](200) NULL,
	[column10] [nvarchar](200) NULL,
	[Setno] [numeric](18, 0) NULL,
	[Parentid] [numeric](18, 0) NULL,
	[file_received_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTriggerWebhook]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTriggerWebhook](
	[TriggerWebhookID] [int] IDENTITY(1,1) NOT NULL,
	[TriggerMessage] [varchar](255) NULL,
	[IsActive] [char](1) NULL,
	[CreateDttm] [datetime] NULL,
	[UpdateDttm] [datetime] NULL,
	[CreateUserId] [varchar](255) NULL,
	[UpdateUserId] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[TriggerWebhookID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblWebhookMsgHandled]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWebhookMsgHandled](
	[MessageHandledID] [int] IDENTITY(1,1) NOT NULL,
	[HandledMessage] [varchar](255) NULL,
	[IsActive] [char](1) NULL,
	[CreateDttm] [datetime] NULL,
	[UpdateDttm] [datetime] NULL,
	[CreateUserId] [varchar](255) NULL,
	[UpdateUserId] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MessageHandledID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Control_Table] ADD  CONSTRAINT [DF_SysStartctl]  DEFAULT (sysutcdatetime()) FOR [SysStartTime]
GO
ALTER TABLE [dbo].[tbl_Control_Table] ADD  CONSTRAINT [DF_SysEndctl]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) FOR [SysEndTime]
GO
ALTER TABLE [dbo].[tbl_Destination_Setup] ADD  CONSTRAINT [DF_SysStartds]  DEFAULT (sysutcdatetime()) FOR [SysStartTime]
GO
ALTER TABLE [dbo].[tbl_Destination_Setup] ADD  CONSTRAINT [DF_SysEndds]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) FOR [SysEndTime]
GO
ALTER TABLE [dbo].[tbl_Error_Message_Setup] ADD  CONSTRAINT [DF_SysStartems]  DEFAULT (sysutcdatetime()) FOR [SysStartTime]
GO
ALTER TABLE [dbo].[tbl_Error_Message_Setup] ADD  CONSTRAINT [DF_SysEndems]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) FOR [SysEndTime]
GO
ALTER TABLE [dbo].[tbl_Frequency] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tbl_Header_Metadata_Table] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tbl_Header_Received] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tbl_Inbound_Source_Setup] ADD  CONSTRAINT [DF_SysStart]  DEFAULT (sysutcdatetime()) FOR [SysStartTime]
GO
ALTER TABLE [dbo].[tbl_Inbound_Source_Setup] ADD  CONSTRAINT [DF_SysEnd]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) FOR [SysEndTime]
GO
ALTER TABLE [dbo].[tbl_Lookup] ADD  DEFAULT (NULL) FOR [Organisation_ID]
GO
ALTER TABLE [dbo].[tbl_Lookup] ADD  DEFAULT (NULL) FOR [Long_Name]
GO
ALTER TABLE [dbo].[tbl_Lookup] ADD  DEFAULT (NULL) FOR [Sort_Order]
GO
ALTER TABLE [dbo].[tbl_Lookup] ADD  DEFAULT (NULL) FOR [Category]
GO
ALTER TABLE [dbo].[tbl_Lookup] ADD  DEFAULT ('Y') FOR [System_YN]
GO
ALTER TABLE [dbo].[tbl_Lookup] ADD  DEFAULT ('Y') FOR [IsActive]
GO
ALTER TABLE [dbo].[tbl_Lookup] ADD  DEFAULT ('SYSTEM') FOR [Created_By]
GO
ALTER TABLE [dbo].[tbl_Lookup] ADD  DEFAULT (getdate()) FOR [Created_Date]
GO
ALTER TABLE [dbo].[tbl_Lookup] ADD  DEFAULT (NULL) FOR [Updated_By]
GO
ALTER TABLE [dbo].[tbl_Lookup] ADD  DEFAULT (NULL) FOR [Updated_date]
GO
ALTER TABLE [dbo].[tbl_Lookup] ADD  CONSTRAINT [DF_SysStartlk]  DEFAULT (sysutcdatetime()) FOR [SysStartTime]
GO
ALTER TABLE [dbo].[tbl_Lookup] ADD  CONSTRAINT [DF_SysEndlk]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) FOR [SysEndTime]
GO
ALTER TABLE [dbo].[tbl_Master_Metadata_Mapping] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tbl_Master_Metadata_Mapping] ADD  CONSTRAINT [DF_SysStartmmm]  DEFAULT (sysutcdatetime()) FOR [SysStartTime]
GO
ALTER TABLE [dbo].[tbl_Master_Metadata_Mapping] ADD  CONSTRAINT [DF_SysEndmmm]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) FOR [SysEndTime]
GO
ALTER TABLE [dbo].[tbl_Metadata_Mapping] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tbl_Metadata_Mapping] ADD  CONSTRAINT [DF_SysStartmm]  DEFAULT (sysutcdatetime()) FOR [SysStartTime]
GO
ALTER TABLE [dbo].[tbl_Metadata_Mapping] ADD  CONSTRAINT [DF_SysEndmm]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) FOR [SysEndTime]
GO
ALTER TABLE [dbo].[tbl_Payload] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tbl_Payroll_Provider] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tbl_Payroll_Provider] ADD  CONSTRAINT [DF_SysStartpp]  DEFAULT (sysutcdatetime()) FOR [SysStartTime]
GO
ALTER TABLE [dbo].[tbl_Payroll_Provider] ADD  CONSTRAINT [DF_SysEndpp]  DEFAULT (CONVERT([datetime2],'9999-12-31 23:59:59.9999999')) FOR [SysEndTime]
GO
ALTER TABLE [dbo].[tbl_File_Received]  WITH CHECK ADD FOREIGN KEY([File_Type_LK_ID])
REFERENCES [dbo].[tbl_Lookup] ([Lookup_ID])
GO
ALTER TABLE [dbo].[tbl_File_Received]  WITH CHECK ADD FOREIGN KEY([Inbound_Source_Setup_ID])
REFERENCES [dbo].[tbl_Inbound_Source_Setup] ([Inbound_Source_SetupID])
GO
ALTER TABLE [dbo].[tbl_Header_Metadata_Table]  WITH CHECK ADD FOREIGN KEY([Inbound_Source_Setup_ID])
REFERENCES [dbo].[tbl_Inbound_Source_Setup] ([Inbound_Source_SetupID])
GO
ALTER TABLE [dbo].[tbl_Header_Received]  WITH CHECK ADD FOREIGN KEY([Header_Metadata_Table_ID])
REFERENCES [dbo].[tbl_Header_Metadata_Table] ([Header_Metadata_Table_ID])
GO
ALTER TABLE [dbo].[tbl_Header_Received]  WITH CHECK ADD FOREIGN KEY([Inbound_Source_Setup_ID])
REFERENCES [dbo].[tbl_Inbound_Source_Setup] ([Inbound_Source_SetupID])
GO
ALTER TABLE [dbo].[tbl_Header_Received]  WITH NOCHECK ADD  CONSTRAINT [FK_tbl_File_Received] FOREIGN KEY([File_Received_ID])
REFERENCES [dbo].[tbl_File_Received] ([File_Received_ID])
GO
ALTER TABLE [dbo].[tbl_Header_Received] CHECK CONSTRAINT [FK_tbl_File_Received]
GO
ALTER TABLE [dbo].[tbl_Inbound_Source_Setup]  WITH CHECK ADD FOREIGN KEY([Destination_Setup_ID])
REFERENCES [dbo].[tbl_Destination_Setup] ([Destination_Setup_ID])
GO
ALTER TABLE [dbo].[tbl_Inbound_Source_Setup]  WITH CHECK ADD FOREIGN KEY([File_Type_LK_ID])
REFERENCES [dbo].[tbl_Lookup] ([Lookup_ID])
GO
ALTER TABLE [dbo].[tbl_Inbound_Source_Setup]  WITH CHECK ADD FOREIGN KEY([Payroll_Provider_Type_LK_ID])
REFERENCES [dbo].[tbl_Lookup] ([Lookup_ID])
GO
ALTER TABLE [dbo].[tbl_Inbound_Source_Setup]  WITH CHECK ADD FOREIGN KEY([Payroll_Provider_ID])
REFERENCES [dbo].[tbl_Payroll_Provider] ([Payroll_Provider_ID])
GO
ALTER TABLE [dbo].[tbl_Inbound_Source_Setup]  WITH CHECK ADD FOREIGN KEY([Type_Of_Ingestion_LK_ID])
REFERENCES [dbo].[tbl_Lookup] ([Lookup_ID])
GO
ALTER TABLE [dbo].[tbl_Master_Metadata_Mapping]  WITH CHECK ADD FOREIGN KEY([Inbound_Source_Setup_ID])
REFERENCES [dbo].[tbl_Inbound_Source_Setup] ([Inbound_Source_SetupID])
GO
ALTER TABLE [dbo].[tbl_Metadata_Mapping]  WITH CHECK ADD FOREIGN KEY([Inbound_Source_Setup_ID])
REFERENCES [dbo].[tbl_Inbound_Source_Setup] ([Inbound_Source_SetupID])
GO
ALTER TABLE [dbo].[tbl_Metadata_Mapping]  WITH CHECK ADD FOREIGN KEY([Master_Metadata_Mapping_ID])
REFERENCES [dbo].[tbl_Master_Metadata_Mapping] ([Master_Metadata_Mapping_ID])
GO
ALTER TABLE [dbo].[tbl_Payroll_Provider]  WITH CHECK ADD FOREIGN KEY([Payroll_Provider_Type_LK_ID])
REFERENCES [dbo].[tbl_Lookup] ([Lookup_ID])
GO
/****** Object:  StoredProcedure [dbo].[sp_alterdiagram]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_alterdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[SP_CheckCorrectFolderPathForFileInsert]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--   EXEC SP_CheckCorrectFolderPathForFileInsert 'tsm/omni', 0

CREATE PROCEDURE [dbo].[SP_CheckCorrectFolderPathForFileInsert]  
@FolderPath VARCHAR(1000) = NULL,  
@Result INT = 0 OUTPUT -- 1 = CORRECT PATH / 0 = INCORRECT PATH 
  
AS BEGIN  
SET NOCOUNT ON  
 
IF( CHARINDEX('ERROR',UPPER(@FolderPath)) > 0  OR  CHARINDEX('ARCHIVE',UPPER(@FolderPath)) > 0  ) 
BEGIN 

--BEGIN TRY 
--RAISERROR ('Error raised in SP_CheckCorrectFolderPathForFileInsert Result 1 Scenario Testing', -- Message text.  
--            16, -- Severity.  
--            1 -- State.  
--            )
--END TRY  
--BEGIN CATCH
--RAISERROR ('Error raised in SP_CheckCorrectFolderPathForFileInsert Result 1 Scenario Testing', -- Message text.  
--            16, -- Severity.  
--            1 -- State.  
--            )
---END CATCH 

SET @Result = 0
  SELECT @Result AS Result  
END  

ELSE
--BEGIN TRY 
--RAISERROR ('Error raised in SP_CheckCorrectFolderPathForFileInsert Result 1 Scenario Testing', -- Message text.  
--            16, -- Severity.  
--            1 -- State.  
--            )
--END TRY  
--BEGIN CATCH
--RAISERROR ('Error raised in SP_CheckCorrectFolderPathForFileInsert Result 1 Scenario Testing', -- Message text.  
--            16, -- Severity.  
--            1 -- State.  
--            )
---END CATCH 

SET @Result = 1
  SELECT @Result AS Result
   
END
GO
/****** Object:  StoredProcedure [dbo].[sp_creatediagram]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_creatediagram]
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_dropdiagram]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_dropdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
	
GO
/****** Object:  StoredProcedure [dbo].[SP_File_Process_Status]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SP_File_Process_Status]
(
@File_Received_ID int,
@Status varchar(30)
)
as
begin
update [dbo]. [tbl_File_Received]
  set Status=@Status
  where File_Received_ID=@File_Received_ID

Select 1

End
GO
/****** Object:  StoredProcedure [dbo].[sp_getColumnMapping]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_getColumnMapping]
  
  @inboundSourceSetupID int
AS
BEGIN
  DECLARE @json_construct varchar(MAX) = '{"type": "TabularTranslator", "mappings": {X}}';
  DECLARE @json VARCHAR(MAX);
    
  SET @json = (
    SELECT
        c.[Source_Column_Name] AS 'source.name', 
        c.[Destination_Column_Name] AS 'sink.name' 
    FROM dbo.[tbl_Metadata_Mapping] as c 
  WHERE c.[Inbound_Source_Setup_ID] = @inboundSourceSetupID
    AND c.[Destination_Table_name] = 'tbl_Landing_Contribution_Data'
	--AND c.[Column_Order]<900 
    FOR JSON PATH );
 
    SELECT REPLACE(@json_construct,'{X}', @json) AS json_output;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetFileTpeIDFromFileName]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXEC SP_GetFileTpeIDFromFileName 'HGHFG.TXT',0, null

CREATE PROCEDURE [dbo].[SP_GetFileTpeIDFromFileName]  
@FileName VARCHAR(1000) = NULL,  
@FileType INT = 0 OUTPUT,
@FileExtension VARCHAR(1000) = NULL OUTPUT
  
AS BEGIN  
SET NOCOUNT ON  

 DECLARE @FileNameExtentionSubstring VARCHAR(50)
 DECLARE @FileTypeExists_LookupID INT 

 SET @FileType = 0
 SET @FileExtension = 'NA'

 SET @FileNameExtentionSubstring = (SELECT UPPER(REVERSE(LEFT(REVERSE(@FileName), CHARINDEX('.', REVERSE(@FileName)) - 1)))) 

  SET @FileTypeExists_LookupID = (  
  SELECT TOP 1 L.Lookup_ID FROM [dbo].[tbl_Lookup] L  
  WHERE SUBSTRING(UPPER(L.Short_Name),1,3) = UPPER(SUBSTRING(@FileNameExtentionSubstring,1,3)) 
  AND UPPER(L.IsActive)= UPPER('Y') )

IF(@FileTypeExists_LookupID IS NOT NULL)  
BEGIN 

SET @FileType = @FileTypeExists_LookupID
SET @FileExtension = @FileNameExtentionSubstring
  SELECT @FileType AS FileType, @FileExtension AS FileExtension

END  
ELSE
  SELECT @FileType AS FileType, @FileExtension AS FileExtension
END


GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagramdefinition]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagramdefinition]
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagrams]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagrams]
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
	
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertIntoFileReceived]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
/*----------------------------------------------------------------------------  
Created By: Fanisha verma  
Created Date: 30th Dec 2020  
Purpose: To insert record in tbl_File_Received when a file is received in Azure Blob Storage   
------------------------------------------------------------------------------*/  
  
--Exec SP_InsertIntoFileReceived @IngestionType, @EmailId, @FileName, @FileType, @UserName,@StorageLink, @SourceProviderName, @Result 
--Exec SP_InsertIntoFileReceived '3','shelara@pcscapital.com','Omni.txt','6','shelara@pcscapital.com','/tsm','10'  
--Exec SP_InsertIntoFileReceived '1','shelara@pcscapital.com','voya123.csv','11','shelara@pcscapital.com','/tsm','pcs'  
--Exec SP_InsertIntoFileReceived '4','vermaf@pcscapital.com','PAYLOCITY.xlsx','6','verma fanisha','/tsm','10'  

--Exec SP_InsertIntoFileReceived null,'null','omni_05012021_demo12.txt',0,'null','tsm/omni','null',0
--Exec SP_InsertIntoFileReceived null,'null','omni_05012021_demo12.csv',0,'null','tsm/omni','null',0
--Exec SP_InsertIntoFileReceived null,'null','omni_05012021_demo9.txt',0,'null','tsm/SchoolsFirst','null',0

--Exec SP_InsertIntoFileReceived null,'null','voya_05012021_demo11.csv',0,'null','tsm/voya','null',0
--Exec SP_InsertIntoFileReceived null,'null','voya_05012021_demo11.txt',0,'null','tsm/voya','null',0
--Exec SP_InsertIntoFileReceived null,'null','voya_05012021_demo12.csv',0,'null','tsm/SchoolsFirst','null',0
--Exec SP_InsertIntoFileReceived null,'null','voya_05012021_demo13.csv',0,'null','tsm/paylocity','null',0

--Exec SP_InsertIntoFileReceived null,'null','schoolsfirst_20210108_34567.xls',0,'null','tsm/schoolsfirst','null',0 
--Exec SP_InsertIntoFileReceived null,'null','schoolsfirst_20210108_34567.txt',0,'null','tsm/schoolsfirst','null',0 
--Exec SP_InsertIntoFileReceived null,'null','schoolsfirst_20210108_34567.txt',0,'null','tsm/paylocity','null',0 

--Exec SP_InsertIntoFileReceived null,'null','Omni_11012021_39344569866.TXT',0,'null','tsm/omni','null',0
--Exec SP_InsertIntoFileReceived null,'null','Omni_11012021_39342269866.TXT',0,'null','tsm/omni','null',0
--Exec SP_InsertIntoFileReceived null,'null','Omni_11012021_39342999870.TXT',0,'null','tsm/omni','null',0

--Exec SP_InsertIntoFileReceived null,'null','VOYA_18102020_$27292.0896.csv',0,'null','tsm/voya','null','null',0,0,0,',', 'NA',  'NA',  'NA',  'NA',  'NA', 0
--Exec SP_InsertIntoFileReceived null,'null','VOYA_18102020_$27292_08197.csv',0,'null','tsm/voya','null','null',0,0,0,',', 'NA',  'NA',  'NA',  'NA',  'NA', 0
--Exec SP_InsertIntoFileReceived null,'null','OMNI_1812020New.csv',0,'null','relius','null','null',0,0,0,',', 'NA',  'NA',  'NA',  'NA',  'NA', 0
--Exec SP_InsertIntoFileReceived null,'null','voya_1812020New1.csv',0,'null','relius','null','null',0,0,0,',', 'NA',  'NA',  'NA',  'NA',  'NA', 0

--Exec SP_InsertStatusIntoFileReceived 'kratikhandelwal3190@gmail.com','45310_Payroll_BCHA1645_12242020_510.csv'

CREATE PROCEDURE [dbo].[SP_InsertIntoFileReceived]  
@IngestionType INT,  
@EmailId VARCHAR(200) = NULL,  
@FileName VARCHAR(250),
@FileType INT = 0,  
@UserName VARCHAR(50) = NULL,  
@StorageLink VARCHAR(1000) = NULL,  --'tsm/omni'
@SourceProviderName VARCHAR(150) = NULL,  
@ActualFile  VARCHAR(1000) = NULL,
@Result INT = 0 OUTPUT, --1 = INSERT SUCCESS/ 0 = ERROR or FILE EXIST 
@FileReceivedId INT = 0 OUTPUT,
@InboundSourceSetupId INT = 0 OUTPUT,
@Delimiter VARCHAR(50) = NULL OUTPUT,  
@IsColumnHeaderAvailable VARCHAR(50) = NULL OUTPUT,
@FileNameExtension VARCHAR(50) = NULL OUTPUT,
@ContainerName VARCHAR(100) = NULL OUTPUT,
@FolderName VARCHAR(100) = NULL OUTPUT,
@SheetName VARCHAR(100) = NULL OUTPUT,
@DataHeaderRow INT = 0 OUTPUT
  
AS BEGIN  
SET NOCOUNT ON  
 
DECLARE @Inbound_Source_SetupID INT  
DECLARE @FileExitsCount INT  
DECLARE @FileExitsInprogressCount INT 
DECLARE @FileNamePatternSubstring VARCHAR(50)  
DECLARE @FileNameExtentionSubstring VARCHAR(50)
DECLARE @StorageLinkSubstring VARCHAR(50)
DECLARE @FileTypeExists_LookupID INT  
DECLARE @Sort_Order INT
DECLARE @Filename_Structure_Parts INT
DECLARE @File_Received_ID INT
DECLARE @FromEmailId VARCHAR(150)

SET @Result = 0  
SET @FileReceivedId = 0
SET @InboundSourceSetupId = 0
SET @Inbound_Source_SetupID = 0
SET @Delimiter = 'NA' 
SET @IsColumnHeaderAvailable = 'N'
SET @FileTypeExists_LookupID = 0
SET @FileNameExtension = ''
SET @ContainerName = ''
SET @FolderName = ''
SET @SheetName = ''
SET @DataHeaderRow = 0
SET @FileExitsInprogressCount = 0
SET @FromEmailId = ''
  
---If FileName is already present in tbl_File_Received then No changes else Insert in the table  
SET @FileExitsCount = (SELECT COUNT(*) FROM dbo.tbl_File_Received NOLOCK WHERE UPPER(File_Name) = UPPER(@FileName))  
PRINT '@FileExitsCount: '
PRINT  @FileExitsCount  

SET @FileExitsInprogressCount = (SELECT COUNT(*) FROM dbo.tbl_File_Received NOLOCK WHERE UPPER(File_Name) = UPPER(@FileName) AND UPPER(Status) = 'INPROGRESS') 
PRINT '@FileExitsInprogressCount: ' 
PRINT @FileExitsInprogressCount 
  
IF(@FileExitsCount = 0 OR @FileExitsInprogressCount > 0)  
BEGIN  
  
  SET @FileNamePatternSubstring=(SELECT UPPER(SUBSTRING(@FileName, 0, CHARINDEX('_',@FileName))))  
  SET @FileNameExtentionSubstring = (SELECT UPPER(REVERSE(LEFT(REVERSE(@FileName), CHARINDEX('.', REVERSE(@FileName)) - 1)))) 

   IF (CHARINDEX( '/', @StorageLink) > 0)
	BEGIN
	 SET @StorageLinkSubstring  = (SELECT UPPER(REVERSE(LEFT(REVERSE(TRIM('/' FROM @StorageLink)), CHARINDEX('/', REVERSE(TRIM('/' FROM @StorageLink))) - 1)))) ----tsm/omni
	 SET @FolderName  =  LOWER(TRIM('/' FROM @StorageLinkSubstring)) ---omni
     SET @ContainerName = TRIM('/' FROM  REPLACE(LOWER(TRIM('/' FROM @StorageLink)), @FolderName, '')) ----tsm
	 PRINT '@StorageLink contains /'
    END
	ELSE
	BEGIN
	 SET @StorageLinkSubstring  = @StorageLink
     SET @ContainerName = LOWER(TRIM('/' FROM @StorageLinkSubstring))
	 PRINT '@StorageLink doesnot contains /'
	END

   PRINT '@ContainerName: ' + @ContainerName
   PRINT '@FolderName: ' + @FolderName
  
  IF(@FileNamePatternSubstring='')    
  BEGIN  
   PRINT 'null @FileNamePatternSubstring encounter'  
   SET @FileNamePatternSubstring=(SELECT UPPER(SUBSTRING(@FileName, 0, CHARINDEX('.',@FileName))))  
  END  

  PRINT '@FileNamePatternSubstring: ' + @FileNamePatternSubstring

  IF(@StorageLinkSubstring='')  
  BEGIN  
   PRINT 'null @StorageLinkSubstring encounter'  
   SET @StorageLinkSubstring=(SELECT CHARINDEX(@FileNamePatternSubstring, UPPER(@StorageLinkSubstring)))
  END 

  PRINT '@StorageLinkSubstring: ' + @StorageLinkSubstring

  IF(@FileNameExtentionSubstring='')    
  BEGIN  
   PRINT 'null @FileNameExtentionSubstring encounter'  
   SET @FileNameExtension=''; 
  END  
  ELSE
  BEGIN
    PRINT 'Not null  @FileNameExtentionSubstring encounter'  
	IF(UPPER(SUBSTRING(@FileNameExtentionSubstring,1,3)) = 'XLS')
	 BEGIN
	 SET @FileNameExtension = 'excel'; 
	 END
	ELSE
	BEGIN
	SET @FileNameExtension = LOWER(@FileNameExtentionSubstring)
	END
  END

  PRINT '@FileNameExtentionSubstring: '
  PRINT @FileNameExtentionSubstring

  PRINT '@FileNameExtension: ' + @FileNameExtension
  
  PRINT '@FileName: '
  PRINT @FileName
      
  PRINT 'begin1'  
  
  SET @FileTypeExists_LookupID = (  
  SELECT TOP 1 L.Lookup_ID FROM [dbo].[tbl_Lookup] L  
  WHERE SUBSTRING(UPPER(L.Short_Name),1,3) = UPPER(SUBSTRING(@FileNameExtentionSubstring,1,3)) 
  AND UPPER(L.IsActive)= UPPER('Y') )
  
  PRINT 'end1' 

  PRINT '@FileTypeExists_LookupID: '   
  PRINT @FileTypeExists_LookupID
  
 IF(@FileTypeExists_LookupID > 0)
 BEGIN

  PRINT ' IF(@FileTypeExists_LookupID > 0) BEGINS'  
  
 IF(@FileExitsInprogressCount = 0)
 BEGIN

  SELECT @Inbound_Source_SetupID = I.Inbound_Source_SetupID, 
  @Filename_Structure_Parts = I.Filename_Structure_Parts,
  @Delimiter = I.Delimiter,
  @IsColumnHeaderAvailable = I.Is_Column_Header_Available,
  @SheetName = I.Sheet_Name,
  @DataHeaderRow = I.Data_Header_Row,
  @FromEmailId = I.From_Email_ID
  FROM [dbo].[tbl_Inbound_Source_Setup] I 
  WHERE UPPER(@FileName) LIKE '%' + UPPER(TRIM('*' FROM I.File_Name_Pattern)) + '%'
  AND UPPER(TRIM('/' FROM I.Storage_Folder_Name)) LIKE UPPER(TRIM('/' FROM @StorageLink )) -- LIKE @StorageLinkSubstring
  AND I.Is_Active = 1
 -- AND I.Type_Of_Ingestion_LK_ID = @IngestionType
  -- AND I.File_TypE_LK_ID = @FileTypeExists_LookupID
  -- AND UPPER(TRIM('*' FROM I.File_Name_Pattern)) LIKE @FileNamePatternSubstring
  END
  ELSE
  BEGIN
   SELECT @Inbound_Source_SetupID = I.Inbound_Source_SetupID, 
  @Filename_Structure_Parts = I.Filename_Structure_Parts,
  @Delimiter = I.Delimiter,
  @IsColumnHeaderAvailable = I.Is_Column_Header_Available,
  @SheetName = I.Sheet_Name,
  @DataHeaderRow = I.Data_Header_Row,
  @FromEmailId = I.From_Email_ID
  FROM [dbo].[tbl_Inbound_Source_Setup] I 
  WHERE UPPER(@FileName) LIKE '%' + UPPER(TRIM('*' FROM I.File_Name_Pattern)) + '%'
  AND UPPER(TRIM('/' FROM I.Storage_Folder_Name)) LIKE UPPER(TRIM('/' FROM @StorageLink )) -- LIKE @StorageLinkSubstring
  AND I.Is_Active = 1
  END

  IF(@FileNameExtension != '' AND @FileNameExtension = 'excel')
  BEGIN
   SET @Delimiter = 'NA'
  END

  IF(@FileNameExtension != '' AND @FileNameExtension = 'csv')
  BEGIN
    SET @Delimiter = ','
  END
	
  PRINT 'end2'  

  PRINT '@Inbound_Source_SetupID'
  PRINT  @Inbound_Source_SetupID
  
  PRINT '@FileTypeExists_LookupID'   
  PRINT  @FileTypeExists_LookupID 
  
  PRINT '@Filename_Structure_Parts'   
  PRINT  @Filename_Structure_Parts 

  IF(@Inbound_Source_SetupID > 0)  
  BEGIN  
  
  SET @InboundSourceSetupId = @Inbound_Source_SetupID

  PRINT 'IF BEGIN---'
	
 IF(@FileExitsInprogressCount = 0)
 BEGIN 

  PRINT 'Insert into tbl_File_Received'

  INSERT INTO dbo.tbl_File_Received(  
        [File_Name]  
         ,[Received_Date_And_Time]  
         ,[Inbound_Source_Setup_ID]  
         ,[Loaded_By] -- the person who provided source @SourceProviderName  
         ,[File_Type_LK_ID] -- @FileType -- Values: Excel, Delimiter etc.  
         ,[As_OF_Date]  
         ,[Actual_File] -- @StorageLink-link of azure storage blob  
         ,[Status] -- Values -received/processed/error  
         ,[Created_By] -- @UserName param  
         ,[Created_Date]  
         ,[Updated_By]  
         ,[Updated_Date])  
        Values(@FileName,CURRENT_TIMESTAMP,@Inbound_Source_SetupID,'SYSTEM',@FileTypeExists_LookupID,  
         GETDATE(),@StorageLink,'RECEIVED', 'SYSTEM', GETDATE(),'SYSTEM', GETDATE())  

		SET @File_Received_ID = (SELECT F.File_Received_ID  FROM dbo. tbl_File_Received F WHERE F.File_Name = @FileName )

		SET @FileReceivedId = @File_Received_ID

		PRINT '@File_Received_ID'
		PRINT @File_Received_ID

	    ---Code to enter header received starts
		PRINT 'Code to enter header received starts' 

		IF(@Filename_Structure_Parts IS NOT NULL AND @Filename_Structure_Parts > 0)
		BEGIN
			  PRINT 'IF @Filename_Structure_Parts STARTS---'
	 
			  EXEC [dbo].[SP_InsertIntoHeaderReceived]  @Inbound_Source_SetupID, @Filename_Structure_Parts, @FileNameExtentionSubstring, @FileName, @FileReceivedId

			  PRINT 'IF @Filename_Structure_Parts ENDS---'
		END   
		PRINT 'Code to enter header received ends' 
		 ---Code to enter header received ends

		SET @Result=1 
		SELECT @Result AS Result, @FileReceivedId AS FileReceivedID, @InboundSourceSetupId AS InboundSourceSetupID, @Delimiter AS Delimiter, @IsColumnHeaderAvailable AS IsColumnHeaderAvailable, @FileNameExtension AS FileExtension, @SheetName AS SheetName, @ContainerName AS ContainerName, @FolderName AS FolderName, @DataHeaderRow AS DataHeaderRow


END
ELSE
BEGIN
  
 PRINT 'Update tbl_File_Received starts'

		SET @File_Received_ID = (SELECT F.File_Received_ID  FROM dbo. tbl_File_Received F WHERE F.File_Name=@FileName )
		SET @FileReceivedId = @File_Received_ID

		 PRINT '@File_Received_ID'
		 PRINT @File_Received_ID

		 DECLARE @FromEmailIDFileReceived VARCHAR(100) 
		 SET @FromEmailIDFileReceived =''
		 SET @FromEmailIDFileReceived = (SELECT F.From_Email_ID  FROM dbo. tbl_File_Received F WHERE F.File_Name=@FileName )

		 IF(@FromEmailIDFileReceived = @FromEmailId)
		 BEGIN
		 UPDATE dbo. tbl_File_Received
		 SET Status = 'RECEIVED',
		 File_Type_LK_ID = @FileTypeExists_LookupID,
		 Actual_File = @StorageLink
		 WHERE File_Received_ID = @File_Received_ID

		 PRINT 'Update tbl_File_Received status Received ends'

		---Code to enter header received starts
		PRINT 'Code to enter header received starts' 

		IF(@Filename_Structure_Parts IS NOT NULL AND @Filename_Structure_Parts > 0)
		BEGIN
			  PRINT 'IF @Filename_Structure_Parts STARTS---'
	 
			  EXEC [dbo].[SP_InsertIntoHeaderReceived]  @Inbound_Source_SetupID, @Filename_Structure_Parts, @FileNameExtentionSubstring, @FileName, @FileReceivedId

			  PRINT 'IF @Filename_Structure_Parts ENDS---'
		END   

		PRINT 'Code to enter header received ends' 
		 ---Code to enter header received ends

		SET @Result=1 
		SELECT @Result AS Result, @FileReceivedId AS FileReceivedID, @InboundSourceSetupId AS InboundSourceSetupID, @Delimiter AS Delimiter, @IsColumnHeaderAvailable AS IsColumnHeaderAvailable, @FileNameExtension AS FileExtension, @SheetName AS SheetName, @ContainerName AS ContainerName, @FolderName AS FolderName, @DataHeaderRow AS DataHeaderRow

		END

		 ELSE
		 BEGIN
		 UPDATE dbo. tbl_File_Received
		 SET Status = 'ERROR',
		 File_Type_LK_ID = @FileTypeExists_LookupID,
		 Actual_File = @StorageLink
		 WHERE File_Received_ID = @File_Received_ID

		 PRINT 'Update tbl_File_Received status Error ends'

		PRINT 'No insert in tbl_FileReceived table as From_Email_Id did not match' 

		SET @Result=0  
		SELECT @Result AS Result, @FileReceivedId AS FileReceivedID, @InboundSourceSetupId AS InboundSourceSetupID, @Delimiter AS Delimiter, @IsColumnHeaderAvailable AS IsColumnHeaderAvailable, @FileNameExtension AS FileExtension, @SheetName AS SheetName, @ContainerName AS ContainerName, @FolderName AS FolderName, @DataHeaderRow AS DataHeaderRow
		END 
		 		 
END

END
ELSE  
   BEGIN  
     PRINT 'No insert in tbl_FileReceived table as InboundSourceSetupID is 0' 

	 IF(@FileExitsInprogressCount > 0)
	 BEGIN

	  PRINT 'Update tbl_File_Received starts'

		SET @File_Received_ID = (SELECT F.File_Received_ID  FROM dbo. tbl_File_Received F WHERE F.File_Name=@FileName )

		SET @FileReceivedId = @File_Received_ID

		 PRINT '@File_Received_ID'
		 PRINT @File_Received_ID

		 UPDATE dbo. tbl_File_Received
		 SET Status = 'ERROR',
		 File_Type_LK_ID = @FileTypeExists_LookupID,
		 Actual_File = @StorageLink
		 WHERE File_Received_ID = @File_Received_ID

		 PRINT 'Update tbl_File_Received ends'

		 END

	 SET @Result=0 --- No insert as the InboundSourceSetupID is null 
	 SELECT @Result AS Result, @FileReceivedId AS FileReceivedID, @InboundSourceSetupId AS InboundSourceSetupID, @Delimiter AS Delimiter, @IsColumnHeaderAvailable AS IsColumnHeaderAvailable, @FileNameExtension AS FileExtension, @SheetName AS SheetName, @ContainerName AS ContainerName, @FolderName AS FolderName, @DataHeaderRow AS DataHeaderRow
   END 
END  
  
ELSE  
  BEGIN   
    PRINT 'No insert in tbl_FileReceived table as the File type does not exists' 
	SET @Result = 0 --- No insert as the File type does not exists
	SELECT @Result AS Result, @FileReceivedId AS FileReceivedID, @InboundSourceSetupId AS InboundSourceSetupID, @Delimiter AS Delimiter, @IsColumnHeaderAvailable AS IsColumnHeaderAvailable, @FileNameExtension AS FileExtension, @SheetName AS SheetName, @ContainerName AS ContainerName, @FolderName AS FolderName, @DataHeaderRow AS DataHeaderRow
  END  
  
END

ELSE  
BEGIN
	PRINT 'No insert in tbl_FileReceived table as the File name exists with status other than INPROGRESS' 
	SET @Result = 0 ---No insert in tbl_FileReceived table as the File name exists with status other than INPROGRESS
	SELECT @Result AS Result, @FileReceivedId AS FileReceivedID, @InboundSourceSetupId AS InboundSourceSetupID, @Delimiter AS Delimiter, @IsColumnHeaderAvailable AS IsColumnHeaderAvailable, @FileNameExtension AS FileExtension,  @SheetName AS SheetName, @ContainerName AS ContainerName, @FolderName AS FolderName, @DataHeaderRow AS DataHeaderRow
END  

END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertIntoHeaderReceived]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_InsertIntoHeaderReceived]  
@Inbound_Source_SetupID INT,  
@Filename_Structure_Parts INT,
@FileNameExtentionSubstring VARCHAR(50),
@FileName VARCHAR(250),
@FileReceivedId INT

AS BEGIN  
SET NOCOUNT ON 

 DECLARE @CountHeaderMetadataTableRecords INT
 DECLARE @Header_Column_Name VARCHAR(100) 
 DECLARE @Header_Metadata_Table_ID INT
 DECLARE @File_Part_Name VARCHAR(100) 

	  SELECT H.Header_Metadata_Table_ID,
	   H.Header_Column_Name,
	   H.Column_Format,
	   H.Sort_Order
      INTO #Temp_Header_Metadata_Table
	  FROM [dbo].[tbl_Header_Metadata_Table] H
	  WHERE H.Inbound_Source_Setup_ID = @Inbound_Source_SetupID 
	  AND H.IsActive = 1
	  ORDER BY H.Sort_Order ASC

	  SET @CountHeaderMetadataTableRecords =
	  (SELECT COUNT(H.Header_Metadata_Table_ID)
	  FROM [dbo].[tbl_Header_Metadata_Table] H
	  WHERE H.Inbound_Source_Setup_ID = @Inbound_Source_SetupID 
	  AND H.IsActive = 1)

	  CREATE TABLE #TEMP_File_Name_Split
	  (RowID INT IDENTITY(1,1) NOT NULL,
	  FileNamePart VARCHAR(50) NOT NULL)

	  PRINT '@CountHeaderMetadataTableRecords'
	  PRINT @CountHeaderMetadataTableRecords
	  
	  IF(@CountHeaderMetadataTableRecords > 0)
	  BEGIN

	  PRINT 'if @CountHeaderMetadataTableRecords > 0 Starts'

	  DECLARE @FileNameExtentionSubstringWithDot VARCHAR(50)
	  DECLARE @FileNameWithoutExtension VARCHAR(150)
	  DECLARE @CountFileNameSplitParts INT

	  SET @FileNameExtentionSubstringWithDot = '.' + @FileNameExtentionSubstring
	  SET @FileNameWithoutExtension = (SELECT REPLACE(@FileName, @FileNameExtentionSubstringWithDot, ''))

	  PRINT '@FileNameExtentionSubstringWithDot: '
	  PRINT @FileNameExtentionSubstringWithDot

	  PRINT '@FileNameWithoutExtension'
	  PRINT @FileNameWithoutExtension

	  INSERT INTO #TEMP_File_Name_Split(FileNamePart)
	  SELECT VALUE	 
	  FROM STRING_SPLIT(@FileNameWithoutExtension , '_')

	  SET @CountFileNameSplitParts = (SELECT COUNT(*) FROM #TEMP_File_Name_Split)

	  PRINT '@CountFileNameSplitParts'
	  PRINT @CountFileNameSplitParts

	  DECLARE @CountLoop INT
	  SET @CountLoop = 1


	  IF(@CountFileNameSplitParts >= @Filename_Structure_Parts)
	  BEGIN

	  PRINT 'if @CountFileNameSplitParts >= @Filename_Structure_Parts Starts'
	  
	  WHILE(@CountLoop < = @Filename_Structure_Parts)
	  BEGIN

	  SELECT @Header_Column_Name = T.Header_Column_Name,  
	  @Header_Metadata_Table_ID = T.Header_Metadata_Table_ID,
	  @Header_Column_Name = T.Header_Column_Name
	  FROM #Temp_Header_Metadata_Table T
	  WHERE T.Sort_Order = @CountLoop

	  SET @File_Part_Name =
	  (SELECT F.FileNamePart
	  FROM #TEMP_File_Name_Split F
	  WHERE F.RowID = @CountLoop)

	   PRINT  '@Header_Column_Name: '
	   PRINT @Header_Column_Name

	   PRINT '@Header_Metadata_Table_ID : '
	   PRINT @Header_Metadata_Table_ID

	   PRINT '@Header_Column_Name : '
	   PRINT @Header_Column_Name

	   PRINT '@File_Part_Name : '
	   PRINT @File_Part_Name	   

	  INSERT INTO [dbo].[tbl_Header_Received]
           ([Header_Metadata_Table_ID]
		   ,[Header_Name]
           ,[Header_Type]
           ,[IsActive]
           ,[Created_By]
           ,[Created_Date]
           ,[Updated_By]
           ,[Updated_Date]
           ,[Inbound_Source_Setup_ID]
           ,[File_Received_ID])
     VALUES
           ( @Header_Metadata_Table_ID
		   ,@File_Part_Name
           ,@Header_Column_Name
           ,1
           ,'SYSTEM'
           ,GETDATE()
           ,'SYSTEM'
           ,GETDATE()
           ,@Inbound_Source_SetupID
		   ,@FileReceivedId)
	  
	 SET @CountLoop = @CountLoop + 1
	  
	  END

	  DROP TABLE #Temp_Header_Metadata_Table
	  	
	  PRINT 'if @CountFileNameSplitParts >= @Filename_Structure_Parts Ends'
	  END

	  IF(@CountFileNameSplitParts < @Filename_Structure_Parts)
	  BEGIN

	  PRINT 'if @CountFileNameSplitParts < @Filename_Structure_Parts Starts'
	  
	  WHILE(@CountLoop < = @CountFileNameSplitParts)
	  BEGIN

	  SELECT @Header_Column_Name = T.Header_Column_Name,  
	  @Header_Metadata_Table_ID = T.Header_Metadata_Table_ID,
	  @Header_Column_Name = T.Header_Column_Name
	  FROM #Temp_Header_Metadata_Table T
	  WHERE T.Sort_Order = @CountLoop

	  SET @File_Part_Name =
	  (SELECT F.FileNamePart
	  FROM #TEMP_File_Name_Split F
	  WHERE F.RowID = @CountLoop)

	   PRINT  '@Header_Column_Name: '
	   PRINT @Header_Column_Name

	   PRINT '@Header_Metadata_Table_ID : '
	   PRINT @Header_Metadata_Table_ID

	   PRINT '@Header_Column_Name : '
	   PRINT @Header_Column_Name

	   PRINT '@File_Part_Name : '
	   PRINT @File_Part_Name	   

	  INSERT INTO [dbo].[tbl_Header_Received]
           ([Header_Metadata_Table_ID]
		   ,[Header_Name]
           ,[Header_Type]
           ,[IsActive]
           ,[Created_By]
           ,[Created_Date]
           ,[Updated_By]
           ,[Updated_Date]
           ,[Inbound_Source_Setup_ID]
           ,[File_Received_ID])
     VALUES
           ( @Header_Metadata_Table_ID
		   ,@File_Part_Name
           ,@Header_Column_Name
           ,1
           ,'SYSTEM'
           ,GETDATE()
           ,'SYSTEM'
           ,GETDATE()
           ,@Inbound_Source_SetupID
		   ,@FileReceivedId)
	  
	 SET @CountLoop = @CountLoop + 1
	  
	  END

	  DROP TABLE #Temp_Header_Metadata_Table
	  	
	  PRINT 'if @CountFileNameSplitParts < @Filename_Structure_Parts Ends'
	  END

 	  PRINT 'if @CountHeaderMetadataTableRecords > 0 Ends'
	  END

	  DROP TABLE #TEMP_File_Name_Split

END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertStatusIntoFileReceived]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Exec SP_InsertStatusIntoFileReceived 'vermaf@pcscapital.com','OMNI_1812020New.csv'

CREATE PROCEDURE [dbo].[SP_InsertStatusIntoFileReceived] 
@FromEmailId VARCHAR(200),
@FileName VARCHAR(250)

AS BEGIN  
SET NOCOUNT ON  
 
DECLARE @DestinationSetupId INT
DECLARE @InboundSourceSetupId INT
DECLARE @FileExitsCount VARCHAR(50)  
DECLARE @DestinationFolderPath VARCHAR(1000)

SET @FileExitsCount = 0
SET @DestinationSetupId = 0
  
---If FileName is already present in tbl_File_Received then No changes else Insert in the table  
SET @FileExitsCount = (SELECT COUNT(*) FROM dbo.tbl_File_Received NOLOCK WHERE UPPER(File_Name) = UPPER(@FileName)) 
PRINT '@FileExitsCount: ' + @FileExitsCount  

IF(@FileExitsCount = 0)  
BEGIN 

PRINT 'IF(@FileExitsCount = 0) STARTS'  
  
 SET @DestinationSetupId = (SELECT TOP 1 I.Destination_Setup_ID
							  FROM dbo.tbl_Inbound_Source_Setup  I
							  WHERE UPPER(I.From_Email_ID) = UPPER(@FromEmailId))

 PRINT '@DestinationSetupId'  
 PRINT @DestinationSetupId

IF(@DestinationSetupId > 0)
BEGIN

PRINT 'IF(@DestinationSetupId > 0) STARTS'  

SET @DestinationFolderPath = (SELECT destination_folder_path 
							  FROM [dbo].tbl_Destination_Setup
							  WHERE Destination_Setup_ID = @DestinationSetupId)

 PRINT '@DestinationFolderPath' 
 PRINT @DestinationFolderPath 

SET @InboundSourceSetupId = (SELECT TOP 1 I.Inbound_Source_SetupID
							  FROM dbo.tbl_Inbound_Source_Setup  I
							  WHERE UPPER(I.From_Email_ID) = UPPER(@FromEmailId))

 PRINT '@InboundSourceSetupId' 
 PRINT @InboundSourceSetupId 
	
 INSERT INTO dbo.tbl_File_Received(  
        [File_Name]  
         ,[Received_Date_And_Time]  
         ,[Inbound_Source_Setup_ID]  
         ,[Loaded_By]-- the person who provided source @SourceProviderName  
         ,[File_Type_LK_ID]-- @FileType -- Values: Excel, Delimiter etc.  
         ,[As_OF_Date]  
         ,[Actual_File]-- @StorageLink-link of azure storage blob  
         ,[Status]-- Values -received/processed/error  
		 ,[From_Email_ID]
         ,[Created_By]-- @UserName param  
         ,[Created_Date]  
         ,[Updated_By]  
         ,[Updated_Date])  
        Values(@FileName,CURRENT_TIMESTAMP,@InboundSourceSetupId,'SYSTEM',NULL,  
         GETDATE(), @DestinationFolderPath,'INPROGRESS', @FromEmailId, 'SYSTEM', GETDATE(),'SYSTEM', GETDATE())  

SELECT * FROM dbo.tbl_File_Received WHERE File_Name = @FileName

END
ELSE
BEGIN
PRINT 'IF(@DestinationSetupId > 0) ENDS '  
END
END
ELSE
BEGIN
PRINT 'IF (@FileExitsCount = 0) ENDS ' 
END
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_IsHierarchicalData]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [dbo].[Sp_IsHierarchicalData]
(
   @inboundSourceSetupID int,
   @isHierarchy char(1) = null output,
	@PayrollProviderCode varchar(30)= null output,
	@ColumnHeaderAvailable char(1) = null output
	
)

AS
BEGIN

  select 
  @isHierarchy=[Hierarchial_Data] , @PayrollProviderCode=[Payroll_Provider_Code], @ColumnHeaderAvailable=[Is_Column_Header_Available]
  from tbl_Inbound_Source_Setup inner join tbl_Payroll_Provider on tbl_Inbound_Source_Setup.[Payroll_Provider_ID]=tbl_Payroll_Provider.Payroll_Provider_ID
  where Inbound_Source_SetupID= @inboundSourceSetupID
  

  select @isHierarchy as IsHierarchy, @PayrollProviderCode as PayrollProviderCode, @ColumnHeaderAvailable as ColumnHeaderAvailable

END



GO
/****** Object:  StoredProcedure [dbo].[sp_renamediagram]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_renamediagram]
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_upgraddiagrams]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_upgraddiagrams]
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
	
GO
/****** Object:  StoredProcedure [dbo].[transformvoya]    Script Date: 3/12/2021 8:44:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



  
CREATE PROCEDURE [dbo].[transformvoya]  
@file_received_id numeric, 
@Result INT = 0 OUTPUT
as begin 
  
 
  
UPDATE dbo.tbl_voya SET Parentid = 0, setno = 0 WHERE rowno = 1 and file_received_id = @file_received_id;  
  
UPDATE dbo.tbl_voya SET Parentid = 1, setno = 0 WHERE rowno = 2 and file_received_id = @file_received_id;  
  
UPDATE dbo.tbl_voya SET Parentid = 2, setno = 0 WHERE rowno = 3 and file_received_id = @file_received_id;  
  
UPDATE dbo.tbl_voya SET Parentid = 1, setno = 0 WHERE rowno = 4 and file_received_id = @file_received_id;  
  
UPDATE dbo.tbl_voya SET Parentid = 1, setno = 0 WHERE rowno = 5 and file_received_id = @file_received_id;  
  
DECLARE @Rowno int  
DECLARE @Rowid int  
DECLARE @Setno int  
set @Setno = 1  
  
DECLARE MY_CURSOR CURSOR   
  LOCAL STATIC READ_ONLY FORWARD_ONLY  
FOR   
SELECT rowno,rowid  
FROM dbo.tbl_voya  
where rowno in (2,3,4)  
and file_received_id = @file_received_id
order by rowid  
  
  
OPEN MY_CURSOR  
FETCH NEXT FROM MY_CURSOR INTO @Rowno,@rowid --COLUMN1  
WHILE @@FETCH_STATUS = 0  
BEGIN   
    --Do something with Id here  
 --SELECT @Rowno;  
 --SELECT @Setno;  
   
    IF @Rowno = 2  
    BEGIN  
          
  UPDATE dbo.tbl_voya SET Setno = @Setno WHERE rowid = @Rowid and file_received_id = @file_received_id;  
  --UPDATE dbo.tbl_voya SET Setno = @Setno WHERE Parentid = @Rowno;  
    END  
   
 IF @Rowno = 3  
    begin         
   UPDATE dbo.tbl_voya SET Setno = @Setno WHERE rowid = @Rowid and file_received_id = @file_received_id;  
  --UPDATE dbo.tbl_voya SET Setno = @Setno WHERE Parentid = @Rowno;  
    END  
   
 IF @Rowno = 4  
    BEGIN  
          
  UPDATE dbo.tbl_voya SET Setno = @Setno WHERE rowid = @Rowid and file_received_id = @file_received_id;  
  --UPDATE dbo.tbl_voya SET Setno = @Setno WHERE Parentid = @Rowno;  
  SET @Setno = @Setno + 1;  
  print @Setno;  
    END  
   
 FETCH NEXT FROM MY_CURSOR INTO @Rowno,@rowid; --COLUMN1  
end  
CLOSE MY_CURSOR  
DEALLOCATE MY_CURSOR  
  
select @result as result

--select * from dbo.tbl_voya  
/*select a.*,b.*,c.* ,d.*, e.*
from dbo.tbl_voya a,dbo.tbl_voya b,dbo.tbl_voya c,dbo.tbl_voya d,dbo.tbl_voya e
where a.rowno =3
and a.parentid = b.rowno
and b.rowno =2
and c.rowno=1
and d.rowno=5
and e.rowno=4
and a.setno = b.setno
and c.setno = 0
and b.parentid = c.rowno
and d.setno = 0
and e.parentid = c.rowno
and a.setno = e.setno
and a.file_received_id = b.file_received_id 
and b.file_received_id = c.file_received_id 
and c.file_received_id = d.file_received_id 
and d.file_received_id = e.file_received_id
and a.file_received_id = @file_received_id;*/
-- exec transformvoya 101

end 
GO
EXEC sys.sp_addextendedproperty @name=N'microsoft_database_tools_support', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysdiagrams'
GO
ALTER DATABASE [pcs-sqldb-config-payroll360-dev] SET  READ_WRITE 
GO
