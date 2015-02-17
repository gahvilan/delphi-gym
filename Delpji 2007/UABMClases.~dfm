inherited FABMClases: TFABMClases
  Left = 266
  Top = 107
  Caption = 'FABMClases'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PEncabezado: TPanel
    inherited LTitulo: TLabel
      Width = 237
      Caption = 'Aministraci'#243'n de Clases'
    end
  end
  inherited PBotones: TPanel
    inherited BEliminar: TcxButton
      OnClick = BEliminarClick
    end
  end
  inherited PGrilla: TPanel
    inherited DBGDatosGenerales: TDBGrid
      DataSource = DMGimnasio.DSClases
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NOMBRE'
          Title.Alignment = taCenter
          Title.Caption = 'Nombre de la Clase'
          Width = 337
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PRECIO_CLASE'
          Title.Alignment = taCenter
          Title.Caption = 'Precio por Clase o por Mes'
          Width = 336
          Visible = True
        end>
    end
  end
  inherited PDatos: TPanel
    object cxNombre: TcxTextEdit
      Left = 152
      Top = 64
      Width = 121
      Height = 24
      Style.Shadow = True
      TabOrder = 0
      Text = 'cxNombre'
    end
    object cxPrecio: TcxTextEdit
      Left = 184
      Top = 101
      Width = 121
      Height = 24
      Style.Shadow = True
      TabOrder = 1
      Text = 'cxPrecio'
    end
    object cxLabel1: TcxLabel
      Left = 32
      Top = 24
      Width = 109
      Height = 17
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.Shadow = False
      TabOrder = 2
      Caption = 'Datos de la Clase'
    end
    object cxLabel2: TcxLabel
      Left = 44
      Top = 67
      Width = 106
      Height = 17
      TabOrder = 3
      Caption = 'Nombre de la Clase: '
    end
    object cxLabel3: TcxLabel
      Left = 40
      Top = 104
      Width = 135
      Height = 17
      TabOrder = 4
      Caption = 'Precio por Clase o por Mes: '
    end
    object cxLCantReservas: TcxLabel
      Left = 380
      Top = 104
      Width = 158
      Height = 17
      Enabled = False
      TabOrder = 5
      Caption = 'Cantidad Maxima de Reservas  '
    end
    object cxCantReservas: TcxTextEdit
      Left = 544
      Top = 102
      Width = 41
      Height = 24
      Enabled = False
      Style.Shadow = True
      TabOrder = 6
      Text = 'cxCantReservas'
    end
    object CBConReserva: TcxCheckBox
      Left = 347
      Top = 64
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = 'Clase Reservable'
      TabOrder = 7
      OnClick = CBConReservaClick
    end
    object CBAparatos: TcxCheckBox
      Left = 504
      Top = 64
      Width = 121
      Height = 21
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = 'Incluye Aparatos'
      TabOrder = 8
    end
  end
  inherited IBQInsert: TIBQuery
    SQL.Strings = (
      
        'insert into disiplinas (nombre,precio_clase,establecimiento,rese' +
        'rva,cantreservas,conaparatos) values (:nombre,:precio,:esta,:res' +
        ',:cant,:conaparatos)')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'precio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'res'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cant'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'conaparatos'
        ParamType = ptUnknown
      end>
  end
  inherited IBQModificar: TIBQuery
    SQL.Strings = (
      
        'update disiplinas set nombre=:nombre, precio_clase=:precio, rese' +
        'rva=:res, cantreservas=:cant, conaparatos=:conaparatos where id_' +
        'disiplina=:id and establecimiento=:esta')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'precio'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'res'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cant'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'conaparatos'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
end
