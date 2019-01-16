<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Liste des matchs</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link type="text/css" rel="stylesheet" href= <c:out value="/inc/form.css"></c:out> />
	</head>
	<body>
	     <h1 class="connexion">Consultez les Matchs</h1>
	
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
		<div  id="phrase" class="row">
			<div class="offset-lg-4 col-lg-4">
			 	<c:if test="${!empty sessionScope.userSession}">

                    <%-- Si l'utilisateur existe en session, alors on affiche son adresse email. --%>

                    <p>Bravo <a href="http://localhost:8080/betedefoot/profile"><span class="pseudo">${sessionScope.userSession.pseudo}</span> </a>tu as reussi à accéder à liste des matchs</p>

                </c:if>
			</div>
		</div>
		<div id="matchs_list" class="row">
			
			<table >
                <tr>
                    <th class="text-center">Equipe à Domicile</th>
                    <th class="text-center">Equipe à l'extérieur</th>
                    <th class="text-center">Date de la rencontre</th>
                    <th class="text-center">Numéro de la journée</th>
                    <th class="text-center">Côte équipe domicile</th>
                    <th class="text-center">Côte match nul</th>
                    <th class="text-center">Côte équipe extérieure</th>
                    <th class="text-center">Action</th>
                  
                </tr>
                 <c:forEach items="${ matchs }" var="match" varStatus="boucle">
                 
                 <%-- Simple test de parité sur l'index de parcours, pour alterner la couleur de fond de chaque ligne du tableau. --%>
                
                 <tr class="${boucle.index % 2 == 0 ? 'pair' : 'impair'}">

                 <%-- Simple test de parité sur l'index de parcours, pour alterner la couleur de fond de chaque ligne du tableau. --%>

                <tr class="${boucle.index % 2 == 0 ? 'pair' : 'impair'}">

                    <%-- Affichage des propriétés du bean Client, qui est stocké en tant que valeur de l'entrée courante de la map --%>

                    <td><c:out value="${ match.homeTeam.teamName }"/></td>
                    <td class="text-right"><c:out value="${ match.extTeam.teamName}"/></td>
                    <td><c:out value="${ match.matchDate }"/></td>
                    <td class="text-center"><c:out value="${ match.dayNumber }"/></td>
                    <td class="text-center"><c:out value="${ match.homeCote }"/></td>
                    <td class="text-center"><c:out value="${ match.nulCote }"/></td>
                    <td class="text-center"><c:out value="${ match.extCote }"/></td>
                    <td class="text-center"><button id="bet" type="submit" class="btn btn-outline-secondary" onclick="parier(${match.id})">Parier sur ce match</button></td>
       
                    <%-- Lien vers la servlet de paris, avec passage de du user - c'est-à-dire la clé de la Map - en paramètre grâce à la balise <c:param></c:param>. --%>

                </tr>
                </c:forEach>
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
	<script type="text/javascript">
		function parier(id) {
			window.location = "Match/" + id;
		}
	</script>
	</body>
</html>