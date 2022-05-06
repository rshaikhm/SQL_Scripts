CREATE TABLE [dbo].[tbl_Voya] (
    [rowid]            INT            IDENTITY (1, 1) NOT NULL,
    [rowno]            NVARCHAR (50)  NULL,
    [column2]          NVARCHAR (50)  NOT NULL,
    [column3]          NVARCHAR (200) NOT NULL,
    [column4]          NVARCHAR (200) NOT NULL,
    [column5]          NVARCHAR (200) NULL,
    [column6]          NVARCHAR (200) NOT NULL,
    [column7]          NVARCHAR (200) NOT NULL,
    [column8]          NVARCHAR (200) NULL,
    [column9]          NVARCHAR (200) NULL,
    [column10]         NVARCHAR (200) NULL,
    [Setno]            NUMERIC (18)   NULL,
    [Parentid]         NUMERIC (18)   NULL,
    [file_received_id] INT            NULL
);

