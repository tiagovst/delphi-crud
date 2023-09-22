object DmConexao: TDmConexao
  OldCreateOrder = False
  Height = 150
  Width = 215
  object FDCon: TFDConnection
    Params.Strings = (
      'Database=E:\Tiago\Programming\Embarcadero\TestDebug\DB\CRUD.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    LoginPrompt = False
    Left = 88
    Top = 56
  end
end
