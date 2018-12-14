package com.seedsir.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table( name = "MATCH" )
public class Match {

    @Id
    @Column( name = "ID_MATCH" )
    private int   id;
    @JoinColumn( name = "ID_EQUIPE_DOM" )
    @ManyToOne
    private Team  homeTeam;
    @JoinColumn( name = "ID_EQUIPE_EXT" )
    @ManyToOne
    private Team  extTeam;
    @Column( name = "DATE_RENCONTRE" )
    private Date  matchDate;
    @Column( name = "NUMERO_JOURNEE" )
    private int   dayNumber;
    @Column( name = "NUM_SEMAINE" )
    private int   weekNumber;
    @Column( name = "COTE_DOM" )
    private float homeCote;
    @Column( name = "COTE_NUL" )
    private float nulCote;
    @Column( name = "COTE_EXT" )
    private float extCote;
}
