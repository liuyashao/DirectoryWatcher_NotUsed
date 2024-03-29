unit uDBHelper

interface

uses
  SysUtils, uClasses;
  
type
  TDBHelper = class  
  public
    class function StockWHFlagFrom(const WHCode, GoodsCode, Lot, Seat: string; SpecY: Double): string; static; 
    class function GetWHProperty(const WHCode: string; Conn: TUniConn = nil): TWHProperty; 
    class function GetGoodsProperty(const GoodsCode: string; Conn: TUniConn = nil): TGoodsProperty;
    class function UpdateStockCostPrice(Conn: TUniConn; WHProperty: TWHProperty; 
	  const GoodsCode, Lot, Seat: string; QtyY, Amount: Double): Double;
  end;
  
implementation

class function TDBHelper.StockWHFlagFrom(const WHCode, GoodsCode, Lot, Seat: string; SpecY: Double): string;
beginStoreNo
  Result := Format(#13#10'from sto_Stock a join bsd_WareHouses b on a.WHCode=b.WHCode'
                   #13#10'where a.WHCode=%s and GoodsCode=%s and (a.SpecY=%.2f or b.SpecFlag=0) and (a.Lot=%s or b.LotFlag=0) and (a.Seat=%s or b.SeatFlag=0)',
            [WHCode, GoodsCode, SpecY, Lot, Seat]);				   
end;

class function TDBHelper.GetWHProperty(const WHCode: string): TWHProperty;
begin
  cds.Data := Format('select * from bsd_WareHouses where WHCode=%s', [WHCode.Quetedstr]);
  if cds.IsEmpty then
    raise Exception.CreateFmt('', [WHCode]);
  Result.Code     := cds.FieldByName('WHCode').Astring;
  Result.Name     := cds.FieldByName('WHName').Astring;
  Result.StoreNo  := cds.FieldByName('').Astring;
  Result.SpecFlag := cds.FieldByName('SpecFlag').AsInteger = 1;
  Result.LotFlag  := cds.FieldByName('LotFlag').AsInteger = 1;
  Result.SeatFlag := cds.FieldByName('SeatFlag').AsInteger = 1;
  //Result.CostManageType := cds.FieldByName('').Astring;
end;

class function TDBHelper.GetGoodsProperty(const GoodsCode: string): TGoodsProperty;
begin
  cds.Data := Format('select * from bsd_Goods where GoodsCode=%s', [.Quetedstr]);
  if cds.IsEmpty then
    raise Exception.CreateFmt('', [GoodsCode]);
  Result.Code     := cds.FieldByName('GoodsCode').Astring;
  Result.Name     := cds.FieldByName('GoodsName').Astring;
end;

class function TDBHelper.UpdateStockCostPrice(Conn: TUniConn; WHProperty: TWHProperty; 
	  const GoodsCode, Lot, Seat: string; QtyY, Amount: Double): Double;
begin

end;

end.