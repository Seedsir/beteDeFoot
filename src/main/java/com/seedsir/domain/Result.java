package com.seedsir.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table( name = "RESULTAT" )
public class Result {
    enum Choice {
        E1, N, E2
    }

    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY )
    @Column( name = "ID_RESULTAT" )
    private int    id;
    @ManyToOne
    @JoinColumn( name = "ID_MATCH" )
    private Match  match;
    @Enumerated( EnumType.STRING )
    @Column( name = "CHOIX" )
    private Choice choice;
    @Column( name = "COTE" )
    private float  cote;

}
