<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Liste des matchs</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link type="text/css" rel="stylesheet" href= <c:out value="/inc/form.css"></c:out> />
	</head>
	<body>
		<!-- <div class="plan-action">
             <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#ticketModal"><i class="fa fa-ticket"></i> Buy Now</a>
     	</div>
     	
		 <div class="modal fade" id="ticketModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	        <div class="modal-dialog" role="document">
	          <div class="modal-content">
	            <div class="modal-header">
	              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                <span aria-hidden="true">&times;</span>
	              </button>
	            </div>
	            <div class="modal-body">
	              <h4>Coming Soon !<h4>
	            </div>
	            <div class="modal-footer">
	              <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
	            </div>
	          </div>
	        </div>
	      </div> -->
      
      
	     <div class="interligne">
		</div>
 		<div class="navbar navbar-expand-lg navbar-light">
 
	 		<h1 id = "principal_tittle"><i class="fas fa-futbol"></i> Consultez la liste des matchs<i class="fas fa-futbol"></i></h1>
			
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
		</div>
		<div class="interligne">
		</div>
		
		 	<c:choose>
		 		<c:when test="${!empty sessionScope.userSession}">

                <div class="user">
					<i class="fas fa-user"></i><a href="http://localhost:8080/betedefoot/profile" title="Accédez à votre profil en cliquant sur ce lien"><span class="pseudo">${sessionScope.userSession.pseudo}</span> </a>
					<p class="pseudo">Montant de vos tockens: ${sessionScope.userSession.tockens}</p>	
				</div>
				<div class="deconnexion">
					<button type="submit" class="btn btn-outline-dark" onclick="deconnexion()">Deconnexion</button>
				</div>
				<div  id="phrase" class="row">
					<div class="offset-lg-4 col-lg-4">
                   		<p>Bonjour voici la liste des matchs de la ${matchs[0].dayNumber} ème journée </p>
					</div>
				</div>
				</c:when>
				<c:otherwise>
					<div id="visiteur" class="offset-lg-4 col-lg-4">
                   		<p>Bonjour voici la liste des matchs de la ${matchs[0].dayNumber} ème journée </p>
					</div>
				</c:otherwise>
            </c:choose>
		
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
                    <td class="text-center"><c:out value="${ match.resultMap.E1.cote }"/></td>
                    <td class="text-center"><c:out value="${ match.resultMap.N.cote }"/></td>
                    <td class="text-center"><c:out value="${ match.resultMap.E2.cote }"/></td>
                    <td class="text-center"><c:choose>
                    							<c:when test="${!empty sessionScope.userSession}">
                    								<button id="bet" type="submit" class="btn btn-outline-${boucle.index % 2 == 0 ? 'dark' : 'light'}" onclick="parier(${match.id})">Parier sur ce match</button>
                    							</c:when>
                    							<c:otherwise>
                    								<button id="bet" type="submit" class="btn btn-outline-${boucle.index % 2 == 0 ? 'dark' : 'light'}" title="Veuillez vous connecter afin de parier" disabled>Parier sur ce match</button>
                    							</c:otherwise>
                    						</c:choose>
       				</td>
                    <%-- Lien vers la servlet de paris, avec passage de du user - c'est-à-dire la clé de la Map - en paramètre grâce à la balise <c:param></c:param>. --%>

                </tr>
                </c:forEach>
            </table>
		</div>
		<div class="interligne">
	</div>
	<div  id="titre_remerciment" class="row">
			<div class ="offset-lg-5 col-lg-2"><h2>Remerciements</h2></div>
	</div>
	
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
		  </ol>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
			    <div class="card">
					  <img src="/inc/logo.png" class="card-img-top  treeptik" alt="logo">
					<div class="card-body">
					    <h5 class="card-title">TreepTik</h5>
					    <p class="card-text">Un grand merci à <span class="requis">"TreepTik"</span> pour m'avoir accepté au sein de leur entreprise pour mon stage. Je remercie également toute l'équipe quelque soit le service pour l'acceuil et l'aide qu'ils m'ont apporté. Et un remerciement tout particulier pour mon tuteur <span class="requis">Mr GRILLET Michaël</span> qui a pris du temps pour m'accompagner tout le long de ce stage et me transmettre son savoir.</p>
					    <a href="http://treeptik.fr" class="btn btn-primary">Visitez leur site</a>
					</div>
				</div>
		    </div>
		    <div class="carousel-item">
			    <div class="card" >
						  <img src="/inc/Logo_Afpa.jpg" class="card-img-top  afpa" alt="logo">
						<div class="card-body">
						    <h5 class="card-title">AFPA</h5>
						    <p class="card-text">L'Afpa est un outil de formation qu'il faut préserver et conserver. Je remercie à ce titre <span class="requis">Mr ANSELME Thierry</span> pour m'avoir accompagné tout au long de ma formation.</p>
						    <a href="https://www.afpa.fr/" class="btn btn-primary">Visitez le site de L'AFPA</a>
						</div>
				</div>
		    </div>
		    <div class="carousel-item">
			    <div class="card" >
						  <img src="/inc/logo_linkedin.png" class="card-img-top  linkedin" alt="logo">
						<div class="card-body">
						    <h5 class="card-title">Linkedin</h5>
						    <p class="card-text">Si vous souhaitez me contacter, vous pouvez cliquer sur ce lien pour consulter mon profil, <span class="requis">ESPOSITO Bastien</span>, sur Linkedin.</p>
						    <a href="https://www.linkedin.com/in/bastien-esposito-842b70164/" class="btn btn-primary">Visitez mon profil</a>
						</div>
				</div>
		    </div>
		    <div class="carousel-item">
			    <div class="card" >
						  <img src="/inc/logo_faftt.jpg" class="card-img-top  faftt" alt="logo">
						<div class="card-body">
						    <h5 class="card-title">FAFTT</h5>
						    <p class="card-text">Un grand merci aussi à l'organisme du <span class="requis">FAFTT</span> pour m'avoir accordé le droit de tenté ma chance dans ma nouvelle vie et dans <span class="requis">ma reconversion professionnelle</span>. C'est typiquement le genre d'organisme trop méconnu du grand public et pourtant outil essentiel à la formation de nos jour. N'hésitez pas à jeter un oeil à leur site ainsi qu'aux possibilité qu'ils pourraient vous offrir.</p>
						    <a href="https://www.faftt.fr/site/j_6/fr/accueil" class="btn btn-primary">Visitez le site du FAFTT</a>
						</div>
				</div>
		  	</div>
		  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
	</div>
	<div class="interligne">
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script type="text/javascript">
	function parier(id) {
		window.location = "Match/" + id;
	}
	function deconnexion() {
		window.location = "deconnexion";
	}
	</script>
	</body>
</html>