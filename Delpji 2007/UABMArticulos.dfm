inherited FABMArticulos: TFABMArticulos
  Left = 218
  Top = 145
  Caption = 'FABMArticulos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PEncabezado: TPanel
    inherited LTitulo: TLabel
      Width = 274
      Caption = 'Administraci'#243'n de Articulos'
    end
  end
  inherited PBotones: TPanel
    inherited BEliminar: TcxButton
      OnClick = BEliminarClick
    end
  end
  inherited PGrilla: TPanel
    inherited DBGDatosGenerales: TDBGrid
      DataSource = DMGimnasio.DSArticulos
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NOMBRE'
          Title.Alignment = taCenter
          Title.Caption = 'Art'#237'culos'
          Width = 262
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PRECIO'
          Title.Alignment = taCenter
          Title.Caption = 'Precio Unitario ($)'
          Width = 259
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CANTIDAD'
          Title.Alignment = taCenter
          Title.Caption = 'Stock Disponible'
          Width = 149
          Visible = True
        end>
    end
  end
  inherited PDatos: TPanel
    object Label1: TLabel
      Left = 72
      Top = 60
      Width = 43
      Height = 13
      Caption = 'Art'#237'culo: '
    end
    object Label2: TLabel
      Left = 72
      Top = 104
      Width = 75
      Height = 13
      Caption = 'Precio Unitario: '
    end
    object Label3: TLabel
      Left = 32
      Top = 16
      Width = 104
      Height = 13
      Caption = 'Datos del Art'#237'culo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxNombre: TcxTextEdit
      Left = 132
      Top = 57
      Width = 121
      Height = 24
      Style.Shadow = True
      TabOrder = 0
    end
    object cxPrecio: TcxCurrencyEdit
      Left = 166
      Top = 99
      Width = 121
      Height = 24
      EditValue = 0.000000000000000000
      Properties.DisplayFormat = ',0.00 $;-,0.00 $'
      Style.Shadow = True
      TabOrder = 1
    end
    object TECantidad: TcxTextEdit
      Left = 424
      Top = 55
      Width = 83
      Height = 24
      Style.Shadow = True
      TabOrder = 2
    end
    object cxLabel1: TcxLabel
      Left = 376
      Top = 57
      Width = 39
      Height = 17
      TabOrder = 3
      Caption = 'Stock:'
    end
  end
  inherited IBQInsert: TIBQuery
    SQL.Strings = (
      
        'insert into articulos (nombre,precio,cantidad) values (:nombre,:' +
        'precio,:cantidad)')
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
        Name = 'cantidad'
        ParamType = ptUnknown
      end>
  end
  inherited IBQModificar: TIBQuery
    SQL.Strings = (
      
        'update articulos set nombre=:nombre, precio=:precio, cantidad=:c' +
        'antidad where id_articulo=:id')
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
        Name = 'cantidad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
end
