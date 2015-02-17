object Form1: TForm1
  Left = 285
  Top = 142
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SQLConnection1: TSQLConnection
    ConnectionName = 'ConeccionPuntos'
    DriverName = 'MySQL'
    GetDriverFunc = 'getSQLDriverMYSQL50'
    LibraryName = 'dbexpmysql50.dll'
    Params.Strings = (
      'DriverName=MySQL'
      'HostName=localhost'
      'Database=dbpuntos'
      'User_Name=root'
      'Password=a'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000')
    VendorLib = 'libmysql.dll'
    Left = 216
    Top = 104
  end
end
