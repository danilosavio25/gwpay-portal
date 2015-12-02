var geraDataTable = function(idTabela){
	$('#' + idTabela).DataTable({
		order: [[ 3, "DESC" ]],
		language:{
			"sEmptyTable": "Nenhum registro encontrado",
			"sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
			"sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
			"sInfoFiltered": "(Filtrados de _MAX_ registros)",
			"sInfoPostFix": "",
			"sInfoThousands": ".",
			"sLengthMenu": "_MENU_ resultados por página",
			"sLoadingRecords": "Carregando...",
			"sProcessing": "Processando...",
			"sZeroRecords": "Nenhum registro encontrado",
			"sSearch": "Pesquisar",
			"oPaginate": {
				"sNext": "Próximo",
				"sPrevious": "Anterior",
				"sFirst": "Primeiro",
				"sLast": "Último"
			},
			"oAria": {
				"sSortAscending": ": Ordenar colunas de forma ascendente",
				"sSortDescending": ": Ordenar colunas de forma descendente"
			}
		}
	});
}

var iniciaForm = function(){
	
	var adquirenteId = 0;
	var bandeiraId = 0;
	var produto = 1;
	var dataInicio = new Date();
	var dataFim = new Date();
	var primeiraVez = true;
	
	dataInicio.setHours(0,0);
	dataFim.setHours(23,59);
	
	$("#selAdquirente").val(adquirenteId);
	$("#selBandeira").val(bandeiraId);
	$("#selProduto").val(produto);
	$("#inputDataInicio").val(dataInicio.format("yyyy-mm-dd'T'HH:MM"));
	$("#inputDataFim").val(dataFim.format("yyyy-mm-dd'T'HH:MM"));
	
}

