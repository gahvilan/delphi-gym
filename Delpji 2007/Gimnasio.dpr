program Gimnasio;

uses
  Forms,
  UUniversal in 'UUniversal.pas' {FUniversal},
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  UClientesNuevos in 'UClientesNuevos.pas' {FClientesNuevos},
  UEntradaSalida in 'UEntradaSalida.pas' {FEntradaSalida},
  UABMGeneral in 'UABMGeneral.pas' {FABMGeneral},
  UDatosDB in 'UDatosDB.pas' {DMGimnasio: TDataModule},
  UABMProfesores in 'UABMProfesores.pas' {FABMProfesores},
  UABMClases in 'UABMClases.pas' {FABMClases},
  UABMUsuarios in 'UABMUsuarios.pas' {FABMUsuarios},
  UABMArticulos in 'UABMArticulos.pas' {FABMArticulos},
  UReservas in 'UReservas.pas' {FReservas},
  UCronograma in 'UCronograma.pas' {FCronograma},
  UDis in 'UDis.pas' {FDis},
  UHoraReserva in 'UHoraReserva.pas' {FHora},
  UArticulos in 'UArticulos.pas' {FArticulos},
  UListadoClientes in 'UListadoClientes.pas' {FListadoClientes},
  UModificarClientes in 'UModificarClientes.pas' {FModificarCliente},
  UIngresosVarios in 'UIngresosVarios.pas' {FIngresosVarios},
  USalida in 'USalida.pas' {FSalida},
  ULogin in 'ULogin.pas' {FLogin},
  URepGenerico in 'URepGenerico.pas' {FRepGenerico},
  URepPlanillaES in 'URepPlanillaES.pas' {FRepPlanillaES},
  URepEntradaSalida in 'URepEntradaSalida.pas' {FRepEntradaSalida},
  URepProfesoresAerobicos in 'URepProfesoresAerobicos.pas' {FRepProfesoresAerobicos},
  URepListaClientes in 'URepListaClientes.pas' {FRepListaClientes},
  URepStock in 'URepStock.pas' {FRepStock},
  UEntradasVarias in 'UEntradasVarias.pas' {FEntradasVarias},
  UPagoGimnasio in 'UPagoGimnasio.pas' {FPagoGimnasio},
  URepSueldoAerobicos in 'URepSueldoAerobicos.pas' {FRepSueldoAerobicos},
  URepAparatos in 'URepAparatos.pas' {FRepAparatos},
  URepAparatosSueldos in 'URepAparatosSueldos.pas' {FRepAparatosSueldos},
  UEliminarRegAparatos in 'UEliminarRegAparatos.pas' {FEliminarRegAparatos},
  URepResumenMensual in 'URepResumenMensual.pas' {FRepResumenMensual},
  UResumenMensual in 'UResumenMensual.pas' {FResumenMensual},
  UAvisos in 'UAvisos.pas' {FAvisos},
  URepAvisos in 'URepAvisos.pas' {FRepAvisos},
  UParametros in 'UParametros.pas' {FParametros},
  UFechaPago in 'UFechaPago.pas' {FFechaPago},
  UPilates in 'UPilates.pas' {FPilates},
  URepListadoPilates in 'URepListadoPilates.pas' {FListadoPilates},
  URepListadoPilatesPrev in 'URepListadoPilatesPrev.pas' {FRepListadoPilates},
  UEliminarPilates in 'UEliminarPilates.pas' {FEliminarPilates},
  UEstadisticas in 'UEstadisticas.pas' {FEstadisticas};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDMGimnasio, DMGimnasio);
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;
end.
