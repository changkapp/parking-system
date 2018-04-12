// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap_sb_admin_base_v2
//= require_tree .


$(document).ready( function () {
    $('#dataTables-example').DataTable();
} );

$(document).ready(function(){

	function addPlateOnClick(){

		var vaga = $("section .col-md-2");

		vaga.click(function(){
			if( $(this).find(".placa").html() == 0){
				var resposta = prompt("Digite a Placa do Carro");
				$(this).find(".placa").html(resposta);

				// $(this).find(".counter").filter(function () {
				// 	inicia($(this));
				// });

			}else{
				var confirmaExclusao = confirm("Essa vaga já possui um carro, você quer retirar?");
				if (confirmaExclusao){
					// para();
					$(this).removeClass("naoTemVaga");
					$(this).find(".placa").html('');
					CountFreeSpots();
				}
			}
		});

	}

	function changeColorOnClick(){

		var vaga = $("section .col-md-2");

		vaga.click(function(){
			$(this).addClass("naoTemVaga");

			//atualiza os valores no dashboard das vagas
			CountFreeSpots();
		});

	}

	function CountFreeSpots(){

		//variavel para ver a classe nao tem vaga
		var vagaFree = $(".naoTemVaga");

		//trocando no card para o numero exato de vagas ocupadas
		$("#vagasOcupadas").html(vagaFree.length);
 
		//contanto quantas vagas estao vazias
		var NumeroDeVagasOcupadas = $(".naoTemVaga").length;
		var numeroTotalDeVagas = $(".col-md-2").length;

		//substituindo os valores das vagas livres no card ( valor total menos o numero de vagas ocupadas, que dara o resultado das vagas livres)
		$("#vagasLivres").html(numeroTotalDeVagas - NumeroDeVagasOcupadas);

	}

	changeColorOnClick();
	addPlateOnClick();


});