;Integrantes:
;David Chacón Morán <jhoanchacon@unicauca.edu.co>
;Jonathan Guejia Burbano <jonathanguejia@unicauca.edu.co>
;Archivo que define la estructura, instancia y las funciones relacionadas a los boxeadores

;Estructura boxeador
(defstruct Boxer
    code        ;Codigo boxeador
    firstname   ;Nombre boxeador
    lastname    ;Apellido boxeador
    typeWeight  ;Tipo de peso boxeador
)
;Instanciacion de un boxeador
(defun createBoxer()
    ;Se encapsula la instancia creada por medio de un let (no será accesible desde el exterior)
    (let 
        ((box (make-Boxer)))
        box
    )
)
;Funcion para registrar un boxeador
(defun registerBoxer()
    (printTournaments)    
    (setq codeTournament (readNumber "Ingrese el codigo del torneo al que desea registrar el boxeador:"))    
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
;Funcion para ingresar los datos de un boxeador
(defun readBoxer()
    (print "Ingrese los datos del boxeador")        
    (setq codeBox (readBoxerCode))
    (print "Nombre del boxeador: ")
    (setq nameBox (read-line))
    (print "Apellido del boxeador: ")
    (setq lastnameBox (read-line))        
    (setq typeWeightBox (readTypeWeightBoxer "Tipo de peso del boxeador: "))     
    (let 
        ((boxer (make-Boxer :code codeBox :firstname nameBox :lastname lastnameBox :typeWeight typeWeightBox)))                
        boxer
    )    
)
;Funcion para imprimir un boxeador
(defun printBoxer (boxer)
    (format t "~%Codigo: ~D" (Boxer-code boxer))
    (format t "~%Nombre: ~A" (Boxer-firstname boxer))
    (format t "~%Apellido: ~A" (Boxer-lastname boxer))
    (format t "~%Tipo de peso: ~A" (Boxer-typeWeight boxer))
)
;Funcion para validar si ya existe el codigo de un boxeador
(defun readBoxerCode()
    (loop
        (let
            ((codeBox (readNumber "Codigo del boxeador: ")))
            (when (= (findBoxer codeBox) -1)(return codeBox)) ;Si el boxeador no existe, se retorna el codigo
        )
        (print "El boxeador ya existe, intente con otro codigo")
    )    
)
;Funcion para buscar un boxeador por su codigo
(defun findBoxer(code)
    (setq index -1)
    ;Si no existen boxeadores registrados en el torneo, se retorna -1
    (if (= (TournamentBox-numRegisterBoxers (aref tournaments indexTournament)) 0)(return-from findBoxer index))
    (setq i 0)    
    (loop
        (setq boxer (aref (TournamentBox-boxers (aref tournaments indexTournament)) i))        
        (if (= code (Boxer-code boxer))
            (setq index i);Se encontro el boxeador
        )
        (setq i (+ i 1))
        (when (or (= i (TournamentBox-numRegisterBoxers (aref tournaments indexTournament))) (/= index -1))(return index))
    )    
)