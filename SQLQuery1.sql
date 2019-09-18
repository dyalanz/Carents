
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/18/2019 11:20:50
-- Generated from EDMX file: G:\network\Carents\Models\CarentsModel1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CARatabase1];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Cars'
CREATE TABLE [dbo].[Cars] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Body_type] nvarchar(max)  NOT NULL,
    [Brand] nvarchar(max)  NOT NULL,
    [Max_rent_period] nvarchar(max)  NOT NULL,
    [Location] nvarchar(max)  NOT NULL,
    [Price] nvarchar(max)  NOT NULL,
    [image] nvarchar(max)  NOT NULL,
    [rate] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Orders'
CREATE TABLE [dbo].[Orders] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [date] nvarchar(max)  NOT NULL,
    [tot_price] nvarchar(max)  NOT NULL,
    [CarId] int  NOT NULL,
    [name] nvarchar(max)  NOT NULL,
    [status] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Permissons'
CREATE TABLE [dbo].[Permissons] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RolesId] int  NOT NULL,
    [Permission_name] nvarchar(max)  NOT NULL,
    [permission_type] nvarchar(max)  NOT NULL,
    [Permission_av] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Email] int IDENTITY(1,1) NOT NULL,
    [Firstname] nvarchar(max)  NOT NULL,
    [Lastname] nvarchar(max)  NOT NULL,
    [Gender] nvarchar(max)  NOT NULL,
    [DOB] nvarchar(max)  NOT NULL,
    [Pwd_hash] nvarchar(max)  NOT NULL,
    [locksta] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'User_roles'
CREATE TABLE [dbo].[User_roles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RolesId] int  NOT NULL,
    [UserEmail] int  NOT NULL
);
GO

-- Creating table 'permi_car'
CREATE TABLE [dbo].[permi_car] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PermissonId] int  NOT NULL,
    [CarId] int  NOT NULL
);
GO

-- Creating table 'permi_order'
CREATE TABLE [dbo].[permi_order] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PermissonId] int  NOT NULL,
    [OrderId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Cars'
ALTER TABLE [dbo].[Cars]
ADD CONSTRAINT [PK_Cars]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [PK_Orders]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Permissons'
ALTER TABLE [dbo].[Permissons]
ADD CONSTRAINT [PK_Permissons]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Email] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Email] ASC);
GO

-- Creating primary key on [Id] in table 'User_roles'
ALTER TABLE [dbo].[User_roles]
ADD CONSTRAINT [PK_User_roles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'permi_car'
ALTER TABLE [dbo].[permi_car]
ADD CONSTRAINT [PK_permi_car]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'permi_order'
ALTER TABLE [dbo].[permi_order]
ADD CONSTRAINT [PK_permi_order]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CarId] in table 'Orders'
ALTER TABLE [dbo].[Orders]
ADD CONSTRAINT [FK_CarOrder]
    FOREIGN KEY ([CarId])
    REFERENCES [dbo].[Cars]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CarOrder'
CREATE INDEX [IX_FK_CarOrder]
ON [dbo].[Orders]
    ([CarId]);
GO

-- Creating foreign key on [CarId] in table 'permi_car'
ALTER TABLE [dbo].[permi_car]
ADD CONSTRAINT [FK_Carpermi_car]
    FOREIGN KEY ([CarId])
    REFERENCES [dbo].[Cars]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Carpermi_car'
CREATE INDEX [IX_FK_Carpermi_car]
ON [dbo].[permi_car]
    ([CarId]);
GO

-- Creating foreign key on [RolesId] in table 'User_roles'
ALTER TABLE [dbo].[User_roles]
ADD CONSTRAINT [FK_RolesUser_roles]
    FOREIGN KEY ([RolesId])
    REFERENCES [dbo].[Roles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RolesUser_roles'
CREATE INDEX [IX_FK_RolesUser_roles]
ON [dbo].[User_roles]
    ([RolesId]);
GO

-- Creating foreign key on [RolesId] in table 'Permissons'
ALTER TABLE [dbo].[Permissons]
ADD CONSTRAINT [FK_RolesPermisson]
    FOREIGN KEY ([RolesId])
    REFERENCES [dbo].[Roles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RolesPermisson'
CREATE INDEX [IX_FK_RolesPermisson]
ON [dbo].[Permissons]
    ([RolesId]);
GO

-- Creating foreign key on [UserEmail] in table 'User_roles'
ALTER TABLE [dbo].[User_roles]
ADD CONSTRAINT [FK_UserUser_roles]
    FOREIGN KEY ([UserEmail])
    REFERENCES [dbo].[Users]
        ([Email])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserUser_roles'
CREATE INDEX [IX_FK_UserUser_roles]
ON [dbo].[User_roles]
    ([UserEmail]);
GO

-- Creating foreign key on [PermissonId] in table 'permi_car'
ALTER TABLE [dbo].[permi_car]
ADD CONSTRAINT [FK_Permissonpermi_car]
    FOREIGN KEY ([PermissonId])
    REFERENCES [dbo].[Permissons]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Permissonpermi_car'
CREATE INDEX [IX_FK_Permissonpermi_car]
ON [dbo].[permi_car]
    ([PermissonId]);
GO

-- Creating foreign key on [PermissonId] in table 'permi_order'
ALTER TABLE [dbo].[permi_order]
ADD CONSTRAINT [FK_Permissonpermi_order]
    FOREIGN KEY ([PermissonId])
    REFERENCES [dbo].[Permissons]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Permissonpermi_order'
CREATE INDEX [IX_FK_Permissonpermi_order]
ON [dbo].[permi_order]
    ([PermissonId]);
GO

-- Creating foreign key on [OrderId] in table 'permi_order'
ALTER TABLE [dbo].[permi_order]
ADD CONSTRAINT [FK_Orderpermi_order]
    FOREIGN KEY ([OrderId])
    REFERENCES [dbo].[Orders]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Orderpermi_order'
CREATE INDEX [IX_FK_Orderpermi_order]
ON [dbo].[permi_order]
    ([OrderId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------