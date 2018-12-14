<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Inscription</title>
        <link type="text/css" rel="stylesheet" href= <c:out value="/inc/form.css"></c:out> />
    </head>
    <body>
        <form method="post" action="inscription">
            <fieldset>
                <legend>Inscription</legend>
                <p>Vous pouvez vous inscrire via ce formulaire.</p>
                
                <label for="pseudo">Pseudo<span class="requis">*</span></label>
                <input type="text" id="pseudo" name="pseudo" value="<c:out value="${utilisateur.nom}"></c:out>" size="20" maxlength="20" />
                <span class="erreur">${form.erreurs['nom'] }</span>
                <br />

                <label for="email">Adresse email <span class="requis">*</span></label>
                <input type="text" id="email" name="email" value="<c:out value="${utilisateur.email}"></c:out>" size="20" maxlength="60" />
                <span class="erreur">${form.erreurs['email'] }</span>
                <br />

                <label for="motdepasse">Mot de passe <span class="requis">*</span></label>
                <input type="password" id="motdepasse" name="motdepasse" maxlength="20" />
                <span class="erreur">${form.erreurs['motdepasse'] }</span>
                <br />

                <label for="confirmation">Confirmation du mot de passe <span class="requis">*</span></label>
                <input type="password" id="confirmation" name="confirmation" maxlength="20" />
               	<span class="erreur">${form.erreurs['confirmation'] }</span>
                <br />
				<label for="equipe">Votre équipe préférée:<span class="requis">*</span></label>
				<select id="equipe" name="equipe">
                <c:forEach items="${teams}" var="team">
                	<option value="">${team.teamName}</option>
                </c:forEach>
				</select>
				<br />
                <input type="submit" value="Inscription" class="sansLabel" />
                <br />
                <p class="${empty form.erreurs ? 'succes' : 'erreur'}">${form.resultat}</p>
            </fieldset>
        </form>
    </body>
</html>