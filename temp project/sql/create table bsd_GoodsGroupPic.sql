create table bsd_GoodsGroupPic(
Id int not null PRIMARY KEY,
GoodsGroup varchar(100) not null,
Sha1 varchar(50) not null,
Sha1Small varchar(50) not null,
Description varchar(100),
IsDefault int
)
go

ALTER TABLE bsd_GoodsGroupPic
ADD CONSTRAINT FK_GoodsGroupPic_GoodsGroup
FOREIGN KEY (GoodsGroup)
REFERENCES bsd_GoodsGroup(GoodsGroup)
ON UPDATE CASCADE
ON DELETE CASCADE
go