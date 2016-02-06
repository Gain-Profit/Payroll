object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 358
  Top = 174
  Height = 415
  Width = 427
  object xConn: TmySQLDatabase
    ConnectOptions = []
    Params.Strings = (
      'Port=3306'
      'TIMEOUT=30')
    Left = 24
    Top = 16
  end
  object Qexe: TmySQLQuery
    Database = xConn
    Left = 88
    Top = 16
  end
  object QShow: TmySQLQuery
    Database = xConn
    Left = 24
    Top = 72
  end
end
