create table bsd_Goods(
GoodsCode varchar(50) not null primary key,
GoodsName varchar(100) not null,
GoodsGroup varchar(100) not null,
ColorIndex int not null,
Color varchar(20),

SaleUnit varchar(10) not null,
PurchaseUnit varchar(10) not null,

SpecY decimal(12, 2) not null,
SpecM decimal(12, 2) not null,
SpecSaleY decimal(12, 2) not null,
SpecSaleM decimal(12, 2) not null,

SalePrice decimal(12, 2),
WholPrice decimal(12, 2),
MinPrice decimal(12, 2),

BottomCloth varchar(100),
Grain varchar(100),
Thick varchar(100),
Size varchar(100),

DefSeat varchar(30),
FactoryCode varchar(50),
DefSupplierCode varchar(20),

Disabled int default 0,

PYCode varchar(100)
)
go

create index idx_bsd_Goods_Code on bsd_Goods(GoodsCode);
go

create index idx_bsd_Goods_Name on bsd_Goods(GoodsName);
go

create index idx_bsd_Goods_Group on bsd_Goods(GoodsGroup);
go

create unique index idx_Goods_GoodsGroup_ColorIndex on bsd_Goods(GoodsGroup, ColorIndex);
go

ALTER TABLE bsd_Goods
ADD CONSTRAINT FK_bsd_Goods_GoodsGroup
FOREIGN KEY (GoodsGroup)
REFERENCES bsd_GoodsGroup(GoodsGroup)
ON UPDATE CASCADE
go