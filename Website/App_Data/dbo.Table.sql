CREATE TABLE [dbo].[Table] (
    [ID]              INT           NOT NULL,
    [Game]            NVARCHAR (50) NOT NULL,
    [Paper or Online] NVARCHAR (50) NULL,
    [Creator]         NVARCHAR (50) NULL,
    [Set]             NVARCHAR (50) NULL,
    [Price]           SMALLMONEY    NULL,
    [Image]           NVARCHAR(50)         NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

