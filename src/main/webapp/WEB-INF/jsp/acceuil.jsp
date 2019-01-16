<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    
<!doctype html>
<html lang="fr">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link type="text/css" rel="stylesheet" href="<c:url value="${pageContext.request.contextPath}/inc/form.css"/>" />
    <title>Bête de Foot</title>
  </head>
  <body>
  <header class="page-header">
    <h1 id = "principal_tittle">Bienvenue sur Bête de Foot</h1>
  </header>
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
	<div id="introduction">
		<p>
			Cette application est construite à but purement pédagogique, donc n'hésitez surtout pas  à me faire des retours de vos expériences (problèmes rencontrés, amélioration souhaitées,etc...). <br/>Vous allez pouvoir parier en toute
			sérénité sur les matchs de championnat (pour le moment) de Ligue 1. Aucun argent n'est réel et si vous tombez à zéro, en début de semaine vous récupérerez des tockens afin de pouvoir continuez à jouer.
			Les buts d'une telle application peuvent être variées:<br/>
			- simplement s'amuser sans risque.<br/>
			- s'entraînner à parier avant de se lancer sur de vrais paris.<br/>
			- établir de petis jeux de groupes que ce soit au sein d'entreprises ou de groupes d'amis.<br/>
			Afin de récupérer vos commentaires une section "Mon avis" se situe dans le menu de navigation et vous mènera vers un espace ou vous pourrez déposer vos commentaires (très attendus :)).
			Je vous remercie d'avance et vous souhaite une bonne expérience.
		</p>
	</div>
	<div  class="row" id="image">
		
		<img src="/inc/Stade2.jpg" alt="image" class="img-responsive center-block" />

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
			</div>
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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>