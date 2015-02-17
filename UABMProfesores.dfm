inherited FABMProfesores: TFABMProfesores
  Left = 197
  Top = 115
  Height = 486
  Caption = 'FABMProfesores'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PEncabezado: TPanel
    inherited LTitulo: TLabel
      Left = 48
      Top = 21
      Width = 300
      Caption = 'Administraci'#243'n de Profesores'
    end
  end
  inherited PBotones: TPanel
    Top = 373
    inherited BEliminar: TcxButton
      OnClick = BEliminarClick
    end
  end
  inherited PGrilla: TPanel
    inherited DBGDatosGenerales: TDBGrid
      DataSource = DMGimnasio.DSPersonal
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NOMBRE'
          Title.Alignment = taCenter
          Title.Caption = 'Nombre'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 235
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'APELLIDO'
          Title.Alignment = taCenter
          Title.Caption = 'Apellido'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 212
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'EDAD'
          Title.Alignment = taCenter
          Title.Caption = 'Edad'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 107
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'DNI'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Arial'
          Title.Font.Style = []
          Width = 118
          Visible = True
        end>
    end
  end
  inherited PDatos: TPanel
    Left = 0
    Top = 186
    Width = 687
    Height = 187
    Align = alBottom
    object Label1: TLabel
      Left = 88
      Top = 51
      Width = 43
      Height = 14
      Caption = 'Nombre: '
    end
    object Label2: TLabel
      Left = 88
      Top = 90
      Width = 44
      Height = 14
      Caption = 'Apellido: '
    end
    object Label3: TLabel
      Left = 88
      Top = 125
      Width = 30
      Height = 14
      Caption = 'Edad: '
    end
    object Label4: TLabel
      Left = 401
      Top = 52
      Width = 22
      Height = 14
      Caption = 'DNI: '
    end
    object Label5: TLabel
      Left = 391
      Top = 93
      Width = 39
      Height = 14
      Caption = 'Sueldo: '
    end
    object Label6: TLabel
      Left = 24
      Top = 16
      Width = 106
      Height = 13
      Caption = 'Datos del Profesor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxNombre: TcxTextEdit
      Left = 136
      Top = 48
      Width = 121
      Height = 22
      TabOrder = 0
      Text = 'cxNombre'
    end
    object cxApellido: TcxTextEdit
      Left = 136
      Top = 88
      Width = 121
      Height = 22
      TabOrder = 1
      Text = 'cxApellido'
    end
    object cxEdad: TcxTextEdit
      Left = 136
      Top = 120
      Width = 57
      Height = 22
      TabOrder = 2
      Text = 'cxEdad'
    end
    object cxDNI: TcxTextEdit
      Left = 432
      Top = 47
      Width = 121
      Height = 22
      TabOrder = 3
      Text = 'cxDNI'
    end
    object cxSueldo: TcxTextEdit
      Left = 432
      Top = 88
      Width = 121
      Height = 22
      TabOrder = 4
      Text = 'cxSueldo'
    end
    object RGTipoSueldo: TRadioGroup
      Left = 392
      Top = 124
      Width = 201
      Height = 56
      Caption = ' Tipo de Sueldo '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Por Clase'
        'A Porcentaje')
      TabOrder = 5
    end
  end
  inherited IBQInsert: TIBQuery
    SQL.Strings = (
      
        'insert into personal (nombre,apellido,edad,dni,sueldo,tipo_sueld' +
        'o,id_usuario,establecimiento)'
      'values (:nombre,:apellido,:edad,:dni,:sueldo,:TS,null,:esta)')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'edad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sueldo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'esta'
        ParamType = ptUnknown
      end>
  end
  inherited IBQModificar: TIBQuery
    SQL.Strings = (
      
        'update personal set nombre=:nombre, apellido=:apellido, edad=:ed' +
        'ad, dni=:dni, sueldo=:sueldo, tipo_sueldo=:TS where id_personal=' +
        ':id and establecimiento=:esta')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nombre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'apellido'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'edad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'sueldo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TS'
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
