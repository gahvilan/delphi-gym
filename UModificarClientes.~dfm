inherited FModificarCliente: TFModificarCliente
  Top = 68
  Height = 622
  Caption = 'FModificarCliente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 65
    inherited Image2: TImage
      Height = 57
    end
  end
  inherited IBQInsertCliente: TIBQuery
    SQL.Strings = (
      
        'update clientes set nombre=:nombre,apellido=:apellido,direccion=' +
        ':dir,telefono=:tel,edad=:edad,nomyap_familiar=:nomyap_familiar,r' +
        'elacion_familiar=:relac_familiar,telefono_familiar=:tel_familiar' +
        ',regimen_actividades=:regimen,fecha_nacimiento=:fecha_nac,caract' +
        'eristica=:caracteristica,caracteristica_familiar=:caracteristica' +
        '_familiar where id_cliente=:id and establecimiento=:esta')
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
        Name = 'dir'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tel'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'edad'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nomyap_familiar'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'relac_familiar'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tel_familiar'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'regimen'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fecha_nac'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'caracteristica'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'caracteristica_familiar'
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
  object IBQGetDatosClientes: TIBQuery
    Database = DMGimnasio.IBDGimnasio
    Transaction = DMGimnasio.IBTGimnasio
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from clientes where id_cliente=:id')
    Left = 304
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object IBQGetEnfermedadesCliente: TIBQuery
    Database = DMGimnasio.IBDGimnasio
    Transaction = DMGimnasio.IBTGimnasio
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from tieneenfermedad where id_cliente=:id')
    Left = 336
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object IBQGetActividadesCliente: TIBQuery
    Database = DMGimnasio.IBDGimnasio
    Transaction = DMGimnasio.IBTGimnasio
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from practica where id_cliente=:id')
    Left = 368
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object IBQDelEnfermedades: TIBQuery
    Database = DMGimnasio.IBDGimnasio
    Transaction = DMGimnasio.IBTGimnasio
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from tieneenfermedad where id_cliente=:id')
    Left = 264
    Top = 553
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
  object IBQDelActividades: TIBQuery
    Database = DMGimnasio.IBDGimnasio
    Transaction = DMGimnasio.IBTGimnasio
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'delete from practica where id_cliente=:id')
    Left = 296
    Top = 553
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
  end
end
