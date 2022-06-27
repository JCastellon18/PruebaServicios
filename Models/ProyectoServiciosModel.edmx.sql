
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/26/2022 18:28:15
-- Generated from EDMX file: C:\Users\Jefry Castellón\source\repos\Proyectos_Xamarin\PruebaServicios\Models\ProyectoServiciosModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [PruebaServiciosBD];
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

-- Creating table 'Clientes'
CREATE TABLE [dbo].[Clientes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombres] nvarchar(max)  NOT NULL,
    [Apellidos] nvarchar(max)  NOT NULL,
    [Correo] nvarchar(max)  NOT NULL,
    [NumTelf] int  NOT NULL,
    [Direccion] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Articulos'
CREATE TABLE [dbo].[Articulos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PrecioUnitario] float  NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL,
    [Cantidad] int  NOT NULL,
    [Img] varbinary(max)  NOT NULL,
    [CategoriaId] int  NOT NULL
);
GO

-- Creating table 'Categorias'
CREATE TABLE [dbo].[Categorias] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL,
    [NombreCategoria] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Facturas'
CREATE TABLE [dbo].[Facturas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NumeroFactura] int  NOT NULL,
    [FechaFactura] datetime  NOT NULL,
    [TotalNeto] float  NOT NULL,
    [ClienteId] int  NOT NULL
);
GO

-- Creating table 'DetalleFacturas'
CREATE TABLE [dbo].[DetalleFacturas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FacturaId] int  NOT NULL,
    [ArticuloId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [PK_Clientes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Articulos'
ALTER TABLE [dbo].[Articulos]
ADD CONSTRAINT [PK_Articulos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categorias'
ALTER TABLE [dbo].[Categorias]
ADD CONSTRAINT [PK_Categorias]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Facturas'
ALTER TABLE [dbo].[Facturas]
ADD CONSTRAINT [PK_Facturas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DetalleFacturas'
ALTER TABLE [dbo].[DetalleFacturas]
ADD CONSTRAINT [PK_DetalleFacturas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ClienteId] in table 'Facturas'
ALTER TABLE [dbo].[Facturas]
ADD CONSTRAINT [FK_ClienteFactura]
    FOREIGN KEY ([ClienteId])
    REFERENCES [dbo].[Clientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteFactura'
CREATE INDEX [IX_FK_ClienteFactura]
ON [dbo].[Facturas]
    ([ClienteId]);
GO

-- Creating foreign key on [FacturaId] in table 'DetalleFacturas'
ALTER TABLE [dbo].[DetalleFacturas]
ADD CONSTRAINT [FK_FacturaDetalleFactura]
    FOREIGN KEY ([FacturaId])
    REFERENCES [dbo].[Facturas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FacturaDetalleFactura'
CREATE INDEX [IX_FK_FacturaDetalleFactura]
ON [dbo].[DetalleFacturas]
    ([FacturaId]);
GO

-- Creating foreign key on [ArticuloId] in table 'DetalleFacturas'
ALTER TABLE [dbo].[DetalleFacturas]
ADD CONSTRAINT [FK_ArticuloDetalleFactura]
    FOREIGN KEY ([ArticuloId])
    REFERENCES [dbo].[Articulos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticuloDetalleFactura'
CREATE INDEX [IX_FK_ArticuloDetalleFactura]
ON [dbo].[DetalleFacturas]
    ([ArticuloId]);
GO

-- Creating foreign key on [CategoriaId] in table 'Articulos'
ALTER TABLE [dbo].[Articulos]
ADD CONSTRAINT [FK_CategoriaArticulo]
    FOREIGN KEY ([CategoriaId])
    REFERENCES [dbo].[Categorias]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoriaArticulo'
CREATE INDEX [IX_FK_CategoriaArticulo]
ON [dbo].[Articulos]
    ([CategoriaId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------