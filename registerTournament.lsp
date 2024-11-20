;Integrantes:
;David Chacón Morán <jhoanchacon@unicauca.edu.co>
;Jonathan Guejia Burbano <jonathanguejia@unicauca.edu.co>

(load "registerBoxer.lsp")

;Funcion para registrar torneo
(defun registerTournament()
    (format t "Registre el torneo de boxeo ~%")
    (setq indexT 0)
    ;Llenar datos del torneo
    (print "Codigo del torneo de boxeo:")
    (setq code (read))
    (setf (TournamentBox-codeTor tbox) code)

    (print "Nombre del torneo de boxeo:")
    (setq nameTor (read))
    (setf (TournamentBox-nameTor tbox) nameTor)

    (print "Modalidad del torneo de boxeo:")
    (setq mode (read))
    (setf (TournamentBox-mode tbox) mode)


    (setq boxers (registerBoxer))
    (setf (TournamentBox-boxers tbox) boxers)

    ;Almacenar torneo en el vector
    (setf (aref tournaments indexT) tbox)

    ;aumentamos indice despues de haber almacenado un torneo
    (setq indexT (+ indexT 1))
        
)

