;Integrantes:
;David Chacón Morán <jhoanchacon@unicauca.edu.co>
;Jonathan Guejia Burbano <jonathanguejia@unicauca.edu.co>
(load "tournament.lsp")
(defstruct Boxer
    code
    firstname
    lastname
    typeWeight
)
;Instanciacion de un boxeador
(defun createBoxer()
    ;Se encapsula la instancia creada por medio de un let (no será accesible desde el exterior)
    (let 
        ((box (make-Boxer)))
        box
    )
)
(defun registerBoxer()
    (printTournaments)
    (print "Ingrese el codigo del torneo al que desea registrar el boxeador:")
    (setq codeTournament (read))
    (setq indexTournament (findTournament codeTournament))
    (if (= indexTournament -1)
        (print "El torneo no existe")
        (progn
            ;Se obtiene el torneo
            (setq tournament (aref tournaments indexTournament))
            (print "Torneo encontrado")
            ;Se verifica si el torneo tiene cupo
            (if (= (TournamentBox-numRegisterBoxers tournament) 3)
                (print "No se pueden registrar mas boxeadores en este torneo")
                (progn
                    (setq boxer (readBoxer))
                    ;Almacenar boxeador en el vector
                    (setf (aref (TournamentBox-boxers tournament) (TournamentBox-numRegisterBoxers tournament)) boxer)
                    ;aumentamos indice despues de haber almacenado un boxeador
                    (setf (TournamentBox-numRegisterBoxers tournament) (+ (TournamentBox-numRegisterBoxers tournament) 1))
                    (print "Boxeador registrado"))
            )                          
        )
    )
)
(defun readBoxer()
    (print "Ingrese los datos del boxeador")    
    (print "Codigo del boxeador: ")
    (setq codeBox (read))
    (print "Nombre del boxeador: ")
    (setq nameBox (read))
    (print "Apellido del boxeador: ")
    (setq lastnameBox (read))    
    (print "Tipo de peso del boxeador: ")
    (setq typeWeightBox (read))     
    (let 
        ((boxer (make-Boxer :code codeBox :firstname nameBox :lastname lastnameBox :typeWeight typeWeightBox)))                
        boxer
    )    
)
(defun printBoxer (boxer)
    (format t "~%Codigo: ~D" (Boxer-code boxer))
    (format t "~%Nombre: ~A" (Boxer-firstname boxer))
    (format t "~%Apellido: ~A" (Boxer-lastname boxer))
    (format t "~%Tipo de peso: ~A" (Boxer-typeWeight boxer))
)