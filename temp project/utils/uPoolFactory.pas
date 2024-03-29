unit uPoolFactory;

interface

uses
  SysUtils, SyncObjs, Classes, System.Generics.Collections, System.Variants,
  System.Generics.Defaults, System.TypInfo, System.Rtti, Threading;

type
  TType = record
  {$IFDEF pool_auto_creator}
  private
    class var FContext: TRttiContext;
    class constructor Create;
    class destructor Destroy;
  public
    class property Context: TRttiContext read FContext;
  {$ENDIF pool_auto_creator}
  public
    class function Kind<T>: TTypeKind; inline; static;
    class function IsEqual<T>(A, B: T): Boolean; static;
  end;
  
  IPooledInstanceInitiFinal = interface
  ['{565E1E1E-C684-41B0-A74D-BA68E48F50B3}']
    procedure InstanceInitialize;
    procedure InstanceFinalize;
  end;

  ICreator<T> = interface
  ['{5A2E4300-9AEB-4F8D-854A-160480ED0AB5}']
    function CreateInstance: T;
    procedure Initialize(anInstance: T);
    procedure Finalize(anInstance: T);
  end;

  TPoolEntry<T> = class
  private
    FInUse: Boolean;
    FInstance: T;
    FToClear: Boolean;
    FUsedCount: Integer;
    FLastAccess: Int64;
    procedure SetInstance(const Value: T);
    procedure SetInUse(const Value: Boolean);
    procedure SetToClear(const Value: Boolean);
    procedure SetLastAccess(const Value: Int64);
  public
    destructor Destroy; override;
    property Instance: T read FInstance write SetInstance;
    property InUse: Boolean read FInUse write SetInUse;
    property LastAccess: Int64 read FLastAccess write SetLastAccess;
    property ToClear: Boolean read FToClear write SetToClear;
    property UsedCount: Integer read FUsedCount;
  end;

  IPoolFactory<T> = interface
  ['{C693A7F1-CFC9-4396-9EC7-C89D7B9BA76C}']
    function CreateInstance: T;
    procedure ReleaseInstance(var anInstance : T);
	  procedure MarkToClear(anInstance : T);
    procedure Clear;
  end;

  IPoolClear = interface
  ['{5D953070-F5FB-40E7-9CBE-1288ADDE5315}']
    procedure Enabled(const MaxMinute: Integer);
    procedure Disable;
    procedure Clear;
  end;

  IPoolStatInfo = interface
  ['{6B52ED99-4E94-44F8-87AE-324F91332957}']
    function GetPoolSize: Integer;
    function GetCurrSize: Integer;
    function GetExceedCount: Integer;
    property PoolSize: Integer read GetPoolSize;
    property CurrSize: Integer read GetCurrSize;
    property ExceedCount: Integer read GetExceedCount;
  end;

  TPoolFactory<T> = class(TInterfacedObject, IPoolFactory<T>, IPoolStatInfo, IPoolClear)
  private
    FPoolSize: Integer;
    FExceedCount: Integer;
    FLockObject: TObject;
    FCreator: ICreator<T>;
	  FComparer: IComparer<TPoolEntry<T>>;
    FMaxNotUsedSeconds: Integer;
    FNextPoolClear: Int64;
    FPoolClearEnabled: Boolean;
  protected
    { IPoolStatInfo }
    function GetCurrSize: Integer;
    function GetPoolSize: Integer;
    function GetExceedCount: Integer;
    property PoolSize: Integer read GetPoolSize;
    property CurrSize: Integer read GetCurrSize;
    property ExceedCount: Integer read GetExceedCount;
  protected
    { IPoolClear }
    procedure PoolClearEnabled(const MaxNotUsedSeconds: Integer);
    procedure PoolClearDisable;
    procedure ClearPool;
    procedure IPoolClear.Enabled = PoolClearEnabled;
    procedure IPoolClear.Disable = PoolClearDisable;
    procedure IPoolClear.Clear = ClearPool;
  protected
    { IPoolFactory }
    function CreateInstance: T; virtual;
    procedure MarkToClear(AInstance: T); virtual;
    procedure ReleaseInstance(var AInstance: T); virtual;
    procedure Clear;
  protected
    FList: TObjectList<TPoolEntry<T>>;
	  function GetComparer: IComparer<TPoolEntry<T>>; dynamic;
  public
    constructor Create(aCreator: ICreator<T>; const PoolSize: Integer = 50);
    destructor Destroy; override;
    procedure Lock;
    procedure Unlock;
  end;

  IPool<T> = reference to function: T;

  Pool<T> = record
  private type
    TFinalizer = class(TInterfacedObject, IPool<T>)
    private
      FValue: T;
      function Invoke: T;
    public
      constructor Create(Value: T);
      destructor Destroy; override;
    end;
  private
    class var FLock: TObject;
    class var FCreator: ICreator<T>;
    class var FPoolSize: Integer;
    class var FPool: IPoolFactory<T>;
    class function CreatePool: IPoolFactory<T>; static;
    class function GetMake: IPool<T>; static;
  private
    FFinalizer: IPool<T>;
    function GetValue: T;
  public
    property Value: T read GetValue;
    class constructor Create;
    class destructor Destroy;
    class function Pool: IPoolFactory<T>; static;
    class function PoolExists: Boolean;  static;
    class function CreateInstance: T; static;
    class procedure ReleaseInstance(var anInstance : T); static;
	  class procedure MarkToClear(anInstance : T); static;
    class procedure Clear; static;
    class procedure RegisterCreator(Creator: ICreator<T>; PoolSize: Integer = 50); static;
    class procedure RegisterPool(Pool: IPoolFactory<T>); static;
    class procedure Proc(APrco: TProc<T>); static;
    class function ProcAsny(APrco: TProc<T>): ITask; static;
    class function Func<TResult>(AFunc: TFunc<T, TResult>): TResult; static;
    class property Make: IPool<T> read GetMake;
  end;

  TCreator<T> = class(TInterfacedObject, ICreator<T>)
  private
    FCreateInstance: TFunc<T>;
    FInitialize: TProc<T>;
    FFinalize: TProc<T>;
    function CreateInstance: T;
    procedure Initialize(anInstance: T);
    procedure Finalize(anInstance: T);
  public
    constructor Create(CreateInstance: TFunc<T>; Initialize: TProc<T>; Finalize: TProc<T>);
    class function Construct(CreateInstance: TFunc<T>; Initialize: TProc<T> = nil;
      Finalize: TProc<T> = nil): ICreator<T>;
  end;

  TPoolClearThread = class sealed(TThread)
  private
    class var FInstance: TPoolClearThread;
    class constructor Create;
    class destructor Destroy;
  private
    FList: TThreadList<IPoolClear>;
  protected
    procedure Execute; override;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Register(Item: IPoolClear);
    procedure UnRegister(Item: IPoolClear);
  end;

var
  OnPoolCreatePool: TProc<PTypeInfo, IInterface>;
  DefaultMaxNotUsedSeconds: Integer = 60*60*4;//4小时
  
implementation

uses spFunc;

{ TType }

{$IFDEF pool_auto_creator}
class constructor TType.Create;
begin
  FContext := TRttiContext.Create;
end;

class destructor TType.Destroy;
begin
  FContext.Free;
end;
{$ENDIF pool_auto_creator}

class function TType.Kind<T>: TTypeKind;
var
  P: PTypeInfo;
begin
  P := System.TypeInfo(T);
  if P = nil then
    Exit(tkUnknown);
  Result := P.Kind;
end;

class function TType.IsEqual<T>(A, B: T): Boolean;
begin
  case Kind<T> of
    tkClass: Result := PObject(@A)^ = PObject(@B)^;
    tkInterface: Result := PPointer(@T(A))^ = PPointer(@T(B))^;
    else raise Exception.CreateFmt('not support equal operation for type %s.', [GetTypeName(TypeInfo(T))]);
  end;
end;

{ TPoolEntry<T>  }

destructor TPoolEntry<T>.Destroy;
begin
  if (TType.Kind<T> = tkClass) and (PObject(@FInstance)^ <> nil) then
    PObject(@FInstance)^.Free;
  inherited;
end;

procedure TPoolEntry<T>.SetInstance(const Value: T);
begin
  FInstance := Value;
end;

procedure TPoolEntry<T>.SetInUse(const Value: Boolean);
begin
  FInUse := Value;
end;

procedure TPoolEntry<T>.SetLastAccess(const Value: Int64);
begin
  FLastAccess := Value;
end;

procedure TPoolEntry<T>.SetToClear(const Value: Boolean);
begin
  FToClear := Value;
end;

{ TPoolFactory<T> }

constructor TPoolFactory<T>.Create(
  aCreator: ICreator<T>; const PoolSize: Integer);
begin
  FLockObject := TObject.Create;
  FList := TObjectList<TPoolEntry<T>>.Create(True);
  FPoolSize := PoolSize;
  FCreator := aCreator;
  FComparer := GetComparer;
  PoolClearEnabled(DefaultMaxNotUsedSeconds);
end;

destructor TPoolFactory<T>.Destroy;
begin
  PoolClearDisable;
  Lock;
  try
    FCreator := nil;
    FComparer := nil;
    while FList.Count > 0 do begin
      FList.Remove(FList[0]);
    end;
    FreeAndNil(FList);
    inherited;
  finally
    Unlock;
  end;
  FreeAndNil(FLockObject);
end;

function TPoolFactory<T>.GetComparer: IComparer<TPoolEntry<T>>;
begin
  Result := nil;
end;

function TPoolFactory<T>.CreateInstance: T;
var
  Entry: TPoolEntry<T>;
  piif: IPooledInstanceInitiFinal;
  IsFound: Boolean;
begin
  IsFound := False;
  Lock;
  try
	  if Assigned(FComparer) then
	    FList.Sort(FComparer);
    for Entry in FList do begin
      if not Entry.InUse then begin
        Entry.InUse := True;
        Entry.LastAccess := MyGetTickCount64;
        Entry.FUsedCount := Entry.FUsedCount + 1;
        Result := Entry.Instance;
        IsFound := True;
        Break;
      end;
    end;
    if not IsFound then begin
      Result := FCreator.CreateInstance;
      if FList.Count < PoolSize then begin
        Entry := TPoolEntry<T>.Create;
        Entry.Instance := Result;
        Entry.InUse := True;
        Entry.LastAccess := MyGetTickCount64;
		    Entry.FUsedCount := 1;
        FList.Add(Entry);
      end
      else Inc(FExceedCount);
    end;
  finally
    Unlock;
  end;
  try
    FCreator.Initialize(Result);
  finally
    if TType.Kind<T> = tkClass then begin
      if Supports(TValue.From<T>(Result).AsObject, IPooledInstanceInitiFinal, piif) then
        piif.InstanceInitialize;
    end
    else if TType.Kind<T> = tkInterface then begin
      if Supports(TValue.From<T>(Result).AsInterface, IPooledInstanceInitiFinal, piif) then
        piif.InstanceInitialize;
    end;
  end;
end;

procedure TPoolFactory<T>.ReleaseInstance(
  var AInstance: T);
var
  Entry: TPoolEntry<T>;
  piif: IPooledInstanceInitiFinal;
begin
  try
    try
      FCreator.Finalize(AInstance);
	  finally
      if TType.Kind<T> = tkClass then begin
       if Supports(TValue.From<T>(AInstance).AsObject, IPooledInstanceInitiFinal, piif) then
         piif.InstanceFinalize
      end
      else if TType.Kind<T> = tkInterface then begin
        if Supports(TValue.From<T>(AInstance).AsInterface, IPooledInstanceInitiFinal, piif) then
          piif.InstanceInitialize;
      end
    end;
  finally
    try
      Lock;
      try
        for Entry in FList do
        if TType.IsEqual<T>(Entry.Instance, AInstance) then begin
          if Entry.ToClear then begin
            FList.Remove(Entry);
            case TType.Kind<T> of
              tkClass: PObject(@AInstance)^ := nil;
            end;
          end
          else begin
            case TType.Kind<T> of
              tkClass: PObject(@AInstance)^ := nil;
            end;
            Entry.InUse := False;
          end;
          Break;
        end;
      finally
        Unlock;
      end;
    finally
      if (TType.Kind<T> = tkClass) and (PObject(@AInstance)^ <> nil) then begin
        PObject(@AInstance)^.Free;
        PObject(@AInstance)^ := nil;
      end;
    end;
  end;
end;

procedure TPoolFactory<T>.MarkToClear(AInstance: T);
var
  Entry: TPoolEntry<T>;
begin
  Lock;
  try
    for Entry in FList do
    if TType.IsEqual<T>(Entry.Instance, AInstance) then begin
      Entry.ToClear := True;
	    if not Entry.InUse then
	      FList.Remove(Entry);
      Break;
    end;
  finally
    Unlock;
  end;
end;

procedure TPoolFactory<T>.Clear;
var
  I: Integer;
  Entry: TPoolEntry<T>;
begin
  I := 0;
  Lock;
  try
    while I < FList.Count do begin
      Entry := FList.Items[I];
      if Entry.InUse then begin
        Entry.ToClear := True;
        Inc(I);
      end
      else
        FList.Remove(Entry);
    end;
  finally
    Unlock;
  end;
end;

function TPoolFactory<T>.GetCurrSize: Integer;
begin
  Result := FList.Count;
end;

function TPoolFactory<T>.GetExceedCount: Integer;
begin
  Result := FExceedCount;
end;

function TPoolFactory<T>.GetPoolSize: Integer;
begin
  Result := FPoolSize;
end;

procedure TPoolFactory<T>.Lock;
begin
  System.TMonitor.Enter(FLockObject);
end;

procedure TPoolFactory<T>.Unlock;
begin
  System.TMonitor.Exit(FLockObject);
end;

procedure TPoolFactory<T>.PoolClearEnabled(const MaxNotUsedSeconds: Integer);
begin
  FMaxNotUsedSeconds := MaxNotUsedSeconds;
  TPoolClearThread.FInstance.Register(Self);
  FPoolClearEnabled := True;
end;

procedure TPoolFactory<T>.PoolClearDisable;
begin
  if FPoolClearEnabled then begin
    TPoolClearThread.FInstance.UnRegister(Self);
    FPoolClearEnabled := False;
  end;
end;

procedure TPoolFactory<T>.ClearPool;
var
  I: Integer;
  Entry: TPoolEntry<T>;
begin
  if FNextPoolClear < MyGetTickCount64  then begin
    try
      I := 0;
      Lock;
      try
        while I < FList.Count do begin
          Entry := FList.Items[I];
          if Entry.InUse then
            Inc(I)
          else begin
            if FMaxNotUsedSeconds * 1000 < (MyGetTickCount64 - Entry.LastAccess) then
              FList.Remove(Entry)
            else
              Inc(I);
          end;
        end;
      finally
        Unlock;
      end;
    finally
      FNextPoolClear := MyGetTickCount64 + 5000 + Random(1000);
    end;
  end;
end;

{ Pool<T> }

function Pool<T>.GetValue: T;
begin
  if not Assigned(FFinalizer) then
    FFinalizer := TFinalizer.Create(CreateInstance);
  Result := FFinalizer;
end;

class constructor Pool<T>.Create;
begin
  FLock := TObject.Create;
end;

class destructor Pool<T>.Destroy;
begin
  FLock.Free;
end;

class function Pool<T>.Pool: IPoolFactory<T>;
begin
  System.TMonitor.Enter(FLock);
  try
    if FPool = nil then
      FPool := CreatePool;
    Result := FPool;
  finally
    System.TMonitor.Exit(FLock);
  end;
end;

class function Pool<T>.CreatePool: IPoolFactory<T>;
{$IFDEF pool_auto_creator}
var
  Method: TRttiMethod;
{$ENDIF pool_auto_creator}
begin
  Result := nil;
  if Assigned(FCreator) then
    Result := TPoolFactory<T>.Create(FCreator, FPoolSize);
  {$IFDEF pool_auto_creator}
  if not Assigned(Result) and (TType.Kind<T> in [tkClass, tkInterface]) then
    for Method in TType.Context.GetType(TypeInfo(T)).GetMethods do begin
      if not Method.IsConstructor then
        Continue;
      if Length(Method.GetParameters) = 0 then begin
        Result := TPoolFactory<T>.Create(
          TCreator<T>.Construct(
          function : T
          begin
            Result := Method.Invoke(GetTypeData(TypeInfo(T)).ClassType, []).AsType<T>;
          end));
        Break;
      end;
      if (Length(Method.GetParameters) = 1)
        and (Method.GetParameters[0].ParamType.TypeKind = tkClass)
        and GetTypeData(Method.GetParameters[0].ParamType.Handle).ClassType.InheritsFrom(TComponent)
      then begin
        Result := TPoolFactory<T>.Create(
          TCreator<T>.Construct(
          function : T
          begin
            Result := Method.Invoke(GetTypeData(TypeInfo(T)).ClassType, [nil]).AsType<T>;
          end));
        Break;
      end;
    end;
  {$ENDIF pool_auto_creator}
  if Assigned(Result) then begin
    if Assigned(OnPoolCreatePool) then
      OnPoolCreatePool(TypeInfo(T), Result);
  end
  else raise Exception.CreateFmt('pool can not find creator for type %s', [GetTypeName(TypeInfo(T))]);
end;

class function Pool<T>.PoolExists: Boolean;
begin
  System.TMonitor.Enter(FLock);
  try
    Result := FPool <> nil;
  finally
    System.TMonitor.Exit(FLock);
  end;
end;

class function Pool<T>.CreateInstance: T;
begin
  Result := Pool.CreateInstance;
end;

class procedure Pool<T>.ReleaseInstance(var anInstance: T);
begin
  Pool.ReleaseInstance(anInstance);
end;

class procedure Pool<T>.Clear;
begin
  Pool.Clear;
end;

class procedure Pool<T>.MarkToClear(anInstance: T);
begin
  Pool.MarkToClear(anInstance);
end;

class procedure Pool<T>.RegisterCreator(Creator: ICreator<T>;
  PoolSize: Integer);
var
  Intf: IInterface;
begin
  if not (TType.Kind<T> in [tkClass, tkInterface]) then
    raise Exception.Create('only support register pool creator for class and interface type.');
  System.TMonitor.Enter(FLock);
  try
    if Assigned(FCreator) then
       raise Exception.CreateFmt('creator for type %s is already exists.', [GetTypeName(TypeInfo(T))]);
    FCreator := Creator;
    FPoolSize := PoolSize;
  finally
    System.TMonitor.Exit(FLock);
  end;
end;

class procedure Pool<T>.RegisterPool(Pool: IPoolFactory<T>);
begin
  FPool := Pool
end;

class procedure Pool<T>.Proc(APrco: TProc<T>);
var
  Instance: T;
begin
  if Assigned(APrco) then begin
    Instance := CreateInstance;
    try
      APrco(Instance);
    finally
      ReleaseInstance(Instance);
    end;
  end;
end;

class function Pool<T>.ProcAsny(APrco: TProc<T>): ITask;
begin
  Result := TTask.Run(procedure
  begin
    Proc(APrco);
  end);
end;

class function Pool<T>.Func<TResult>(AFunc: TFunc<T, TResult>): TResult;
var
  Instance: T;
begin
  Instance := CreateInstance;
  try
    Result := AFunc(Instance);
  finally
    ReleaseInstance(Instance);
  end;
end;

class function Pool<T>.GetMake: IPool<T>;
begin
  Result := TFinalizer.Create(CreateInstance);
end;

{ Pool<T>.TFinalizer }

constructor Pool<T>.TFinalizer.Create(Value: T);
begin
  FValue := Value;
end;

destructor Pool<T>.TFinalizer.Destroy;
begin
  ReleaseInstance(FValue);
  inherited;
end;

function Pool<T>.TFinalizer.Invoke: T;
begin
  Result := FValue;
end;

{ TCreator<T> }

constructor TCreator<T>.Create(CreateInstance: TFunc<T>; Initialize,
  Finalize: TProc<T>);
begin
  FCreateInstance := CreateInstance;
  FInitialize := Initialize;
  FFinalize := Finalize;
end;

function TCreator<T>.CreateInstance: T;
begin
  Result := FCreateInstance();
end;

procedure TCreator<T>.Finalize(anInstance: T);
begin
  if Assigned(FFinalize) then
    FFinalize(anInstance)
end;

procedure TCreator<T>.Initialize(anInstance: T);
begin
  if Assigned(FInitialize) then
    FInitialize(anInstance)
end;

class function TCreator<T>.Construct(CreateInstance: TFunc<T>; Initialize,
  Finalize: TProc<T>): ICreator<T>;
begin
  Result := TCreator<T>.Create(CreateInstance, Initialize, Finalize)
end;

{ TPoolClearThread }

class constructor TPoolClearThread.Create;
begin
  FInstance := TPoolClearThread.Create;
end;

class destructor TPoolClearThread.Destroy;
begin
  FInstance.Free;//不要用FreeAndNil,否则会报错
end;

constructor TPoolClearThread.Create;
begin
  inherited Create;
  FList := TThreadList<IPoolClear>.Create;
end;

destructor TPoolClearThread.Destroy;
var
  List: TList<IPoolClear>;
begin
  Terminate;
  WaitFor;
  List := FList.LockList;
  try
    while 0 < List.Count do
      List.First.Disable;
  finally
    FList.UnlockList;
  end;
  FList.Free;
  inherited;
end;

procedure TPoolClearThread.Execute;
var
  I: IPoolClear;
  List: TList<IPoolClear>;
begin
  inherited;
  while not Terminated do begin
    List := FList.LockList;
    try
      for I in List do
        try
          I.Clear;
        except
          ;
        end;
    finally
      FList.UnlockList;
    end;
    Sleep(200);
  end;
end;

procedure TPoolClearThread.Register(Item: IPoolClear);
var
  List: TList<IPoolClear>;
begin
  List := FList.LockList;
  try
    if not List.Contains(Item) then
      List.Add(Item);
  finally
    FList.UnlockList;
  end;
end;

procedure TPoolClearThread.UnRegister(Item: IPoolClear);
begin
  FList.Remove(Item);
end;

end.