package com.seedsir.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;

@Data
@Entity
@Table( name = "MATCH" )
public class Match {

    @Id
    @Column( name = "ID_MATCH" )
    private int                 id;
    @JoinColumn( name = "ID_EQUIPE_DOM" )
    @ManyToOne
    private Team                homeTeam;
    @JoinColumn( name = "ID_EQUIPE_EXT" )
    @ManyToOne
    private Team                extTeam;
    @Column( name = "MATCH_NUL" )
    private String              nulMatch;
    @Column( name = "DATE_RENCONTRE" )
    private Date                matchDate;
    @Column( name = "NUMERO_JOURNEE" )
    private int                 dayNumber;
    @Column( name = "NUM_SEMAINE" )
    private int                 weekNumber;
    @Column( name = "COTE_DOM" )
    private Float               homeCote;
    @Column( name = "COTE_NUL" )
    private Float               nulCote;
    @Column( name = "COTE_EXT" )
    private Float               extCote;
    @OneToMany( mappedBy = "match" )
    private List<Result>        results   = new ArrayList<>();
    @Transient
    private Map<String, Result> resultMap = new HashMap<>();

    public Map<String, Result> getResultMap() {
        if ( resultMap.isEmpty() ) {
            for ( Result result : results ) {
                resultMap.put( result.getChoice().toString(), result );
            }
        }
        return resultMap;
    }

}
