<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link type="text/css" rel="stylesheet" href="<c:url value="/inc/form.css"/>" />
<title>Consultation équipe</title>
</head>
<body>
	<h1 class="connexion">Match numero ${match.id} </h1>
	<p>Instructions: <br/> Afin d'effectuer votre pari veuillez auparavant rentrer une valeur de token misé et cliquez ensuite sur sur le bouton de l'équipe ou le match nul de votre choix.</p>
	<div class="row">
		 <nav class="navbar navbar-expand-lg navbar-light bg-light">
		  
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
	
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		  	
			    <ul class="row navbar-nav ">
			      <li class="offset-lg-1 col-lg-2 nav-item">
			        <a class="nav-link" href="/betedefoot/Acceuil">Acceuil <span class="sr-only">(current)</span></a>
			      </li>
			      <li class="col-lg-2 offset-lg-1 nav-item">
			        <a class="nav-link" href="/betedefoot/Connexion">Connexion</a>
			      </li>
			      <li class="col-lg-2 offset-lg-1 nav-item">
			        <a class="nav-link" href="/betedefoot/Inscription">Inscription</a>
			      </li>
			      <li class="col-lg-2 offset-lg-1 nav-item">
			        <a class="nav-link" href="/betedefoot/visiteur">Visiteur</a>
			      </li>
			    </ul>
		    
		  </div>
		</nav>
	</div>
	<div id="match_table">
	<table >
                <tr>
                    <th width="40%" class="text-center">Equipe à Domicile</th>
                    <th width="20%" class="text-center">-</th>
                    <th width="40%" class="text-center">Equipe à l'extérieur</th>                  
                </tr>
                
                <tr>
	            	<td class="text-center ">
						<div id="equipe_dom">
							<figure >
							<img src="/inc/equipes/${match.homeTeam.teamName}.png" alt="image" class=" col-lg-4"/>
							</figure>
						</div>
					</td>
					<td class="text-center">-</td>
	            	<td class="text-center ">
	            		<div id="equipe_ext">
							<figure>
							<img src="/inc/equipes/${match.extTeam.teamName}.png" alt="image" class=" col-lg-4"/>
							</figure>
						</div>
	            	</td>
            	</tr>
	            	
				<tr>
	            	<td class="text-center"><span id="equipeDom">${match.homeTeam.teamName}</span></td>
	            	<td class="text-center">-</td>
	            	<td class="text-center">${match.extTeam.teamName}</td>
            	</tr>
            	
            	<tr>
	            	<td class="text-center"><button id="homeTeam" type="button"  onclick="bet(${match.resultMap.E1.id})" class="btn btn-outline-primary col-lg-4">${match.resultMap.E1.cote }</button></td>
	            	<td class="text-center"><button id="equality" type="button"  onclick="bet(${match.resultMap.N.id})" class="btn btn-outline-primary col-lg-4">${match.resultMap.N.cote }</button></td>
	            	<td class="text-center"><button id="extTeam" type="button"  onclick="bet(${match.resultMap.E2.id})" class="btn btn-outline-primary col-lg-4" >${match.resultMap.E2.cote }</button></td>
            	</tr>
	</table>
	</div>
	<footer>
		<div  id="titre_remerciment" class="row">
			<div class ="offset-lg-5 col-lg-2"><h2>Remerciements</h2></div>
		</div>
		
		<div id="remerciements" class="row">			
			<div class ="offset-lg-1 col-lg-3">
				<figure>
					<a href="http://treeptik.fr/"><img src="/inc/logo.png" alt="logo"   class="treeptik"/></a>
					<figcaption class="caption_treeptik">Un grand merci à <span class="requis">"TreepTik"</span> pour m'avoir accepté au sein de leur entreprise pour mon stage. Je remercie également toute l'équipe quelque soit le service pour l'acceuil et l'aide qu'ils m'ont apporté. Et un remerciement tout particulier pour mon tuteur <span class="requis">Mr GRILLET Michaël</span> qui a pris du temps pour m'accompagner tout le long de ce stage et me transmettre son savoir.</figcaption>
				</figure>
			</div>
			<div class ="col-lg-2">
				<figure >
					<a href="https://www.afpa.fr/"><img src="/inc/Logo_Afpa.jpg" alt="logo" class="offset-lg-4 afpa" /></a>
					<figcaption class="caption_afpa">L'Afpa est un outil de formation qu'il faut préserver et conserver. Je remercie à ce titre <span class="requis">Mr ANSELME Thierry</span> pour m'avoir accompagné tout au long de ma formation. </figcaption>
				</figure>
			</div>idEquipe
			<div class ="col-lg-2">
				<figure>
					<a href="https://www.linkedin.com/in/bastien-esposito-842b70164/"><img src="/inc/logo_linkedin.png" alt="logo" class="offset-lg-4 linkedin" /></a>
					<figcaption class="caption_linkedin">Si vous souhaitez me contacter, vous pouvez cliquer sur ce lien pour consulter mon profil, <span class="requis">ESPOSITO Bastien</span>, sur Linkedin</figcaption>
				</figure>	
			</div>
			<div class ="col-lg-3">
				<figure class="row">
					<a href="https://www.faftt.fr/site/j_6/fr/accueil"><img src="/inc/logo_faftt.jpg" alt="logo" class="offset-lg-3 faftt" /></a>
					<figcaption class="caption_faftt">Un grand merci aussi à l'organisme du <span class="requis">FAFTT</span> pour m'avoir accordé le droit de tenté ma chance dans ma nouvelle vie et dans <span class="requis">ma reconversion professionnelle</span>. C'est typiquement le genre d'organisme trop méconnu du grand public et pourtant outil essentiel à la formation de nos jour. N'hésitez pas à jeter un oeil à leur site ainsi qu'aux possibilité qu'ils pourraient vous offrir.</figcaption>
				</figure>
			</div>		
		</div>
	</footer>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="/inc/jQuery.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> -->
<script type="text/javascript">

function bet(idResult) {
  var miser = prompt("Entrez une mise:", "Valeur numérique uniquement");
  if (miser == null || isNaN(miser)==true) {
	  alert("La valeur n'est pas un numérique");
	  
  } else {
    requestPari(miser, idResult);
  }
  //document.getElementById("demo").innerHTML = txt;
}


function requestPari(mise, idResult){
	$.ajax({
	       url : '/betedefoot/validation?mise=' + mise + '&idResult=' + idResult, // La ressource ciblée
	       type : 'POST', // Le type de la requête HTTP.
	       success : function(data){ // code_html contient le HTML renvoyé
	           if(data == 'ok') {
	        	   window.location = '/betedefoot/ListeMatchs'
	           } else {
	        	   alert(data);
	           }
	       }
	    });
}

</script>

</body>
</html>