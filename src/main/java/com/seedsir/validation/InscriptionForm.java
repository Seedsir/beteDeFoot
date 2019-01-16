package com.seedsir.validation;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class InscriptionForm {

    private static final String CHAMP_PSEUDO = "pseudo";
    private static final String CHAMP_EMAIL  = "email";
    private static final String CHAMP_PASS   = "motdepasse";
    private static final String CHAMP_CONF   = "confirmation";
    private static final String CHAMP_EQUIPE = "team";

    private String              resultat;
    private Map<String, String> erreurs      = new HashMap<String, String>();

    public String getResultat() {
        return resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public void inscribeUser( HttpServletRequest request ) {

        String pseudo = getValeurChamp( request, CHAMP_PSEUDO );
        String motDePasse = getValeurChamp( request, CHAMP_PASS );
        String email = getValeurChamp( request, CHAMP_EMAIL );
        String confirmation = getValeurChamp( request, CHAMP_CONF );
        String team = getValeurChamp( request, CHAMP_EQUIPE );

    }

    /* Validation du nom */
    private void validationPseudo( String pseudo ) throws FormatValidationException {
        if ( pseudo != null && pseudo.length() < 3 ) {
            throw new FormatValidationException( "Le nom d'utilisateur doit contenir au moins 3 caractères." );
        }
    }

    /* Validation des mots de passe */
    private void validationMotsDePasse( String motDePasse, String confirmation ) throws FormatValidationException {
        if ( motDePasse != null && confirmation != null ) {
            if ( !motDePasse.equals( confirmation ) ) {
                throw new FormatValidationException(
                        "Les mots de passe entrés sont différents, merci de les saisir à nouveau." );
            } else if ( motDePasse.length() < 3 ) {
                throw new FormatValidationException( "Les mots de passe doivent contenir au moins 3 caractères." );
            }
        } else {
            throw new FormatValidationException( "Merci de saisir et confirmer votre mot de passe." );
        }
    }

    /*
     * Méthode utilitaire qui retourne null si un champ est vide, et son contenu
     * sinon.
     */
    private static String getValeurChamp( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur;
        }
    }
}
