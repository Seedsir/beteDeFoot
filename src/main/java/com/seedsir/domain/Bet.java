package com.seedsir.domain;

import java.io.Serializable;

import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AccessLevel;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Entity
@Table( name = "PARI" )

public class Bet {

    @EmbeddedId
    @Getter( AccessLevel.PRIVATE )
    @Setter( AccessLevel.PRIVATE )
    private FooPK id;
    private float mise;

    public Bet() {
    }

    public Bet( User user, Result result, float mise ) {
        this.id = new FooPK( user, result );
        this.mise = mise;
    }

    @Embeddable
    @Data
    public static class FooPK implements Serializable {

        private static final long serialVersionUID = 1387401199307171738L;
        @JoinColumn( name = "ID_USER" )
        @ManyToOne
        private User              user;
        @JoinColumn( name = "ID_RESULTAT" )
        @ManyToOne
        private Result            result;

        public FooPK() {
        }

        public FooPK( User user, Result result ) {
            this.user = user;
            this.result = result;
        }
    }
}
