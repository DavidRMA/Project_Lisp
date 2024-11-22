;Integrantes:
;David Chacón Morán <jhoanchacon@unicauca.edu.co>
;Jonathan Guejia Burbano <jonathanguejia@unicauca.edu.co>

(load "tournament.lsp")

;Funcion para buscar un torneo de boxeo por codigo
(defun searchBoxingTournament()
    ;Mostramos los torneos que se han registrado
    (showRegisteredTournaments)
    (print "Ingrese el codigo del torneo para mostrar sus datos:")
    (setq codeTournament (read))
    (setq indexTournament (findTournament codeTournament))
    (if (= indexTournament -1)
        (print "El torneo no existe")
        (progn
            ;Se obtiene el torneo
            (setq tournament (aref tournaments indexTournament))
            ;invocamos funcion que imprime los datos del torneo
            (printTournament tournament)
        )
    )       

)