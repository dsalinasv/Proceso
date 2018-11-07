inherited frmAlmacen: TfrmAlmacen
  Caption = 'Almacenes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited dsMaster: TDataSource
    DataSet = dmAlmacen.cdsMaster
  end
  inherited imgList: TcxImageList
    FormatVersion = 1
  end
  inherited barList: TdxBarManager
    PixelsPerInch = 96
  end
end
