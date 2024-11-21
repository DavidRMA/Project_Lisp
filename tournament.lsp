;Integrantes:
;David Chacón Morán <jhoanchacon@unicauca.edu.co>
;Jonathan Guejia Burbano <jonathanguejia@unicauca.edu.co>

(setq numTournaments 2)
(setq numBoxers 3)
(setq tournaments (make-array numTournaments :initial-element 0));Se crea un vector de torneos inicializado en 0
(setq numRegisterTournaments 0);Contador de torneos registrados
;Estructura de un torneo
(defstruct TournamentBox
    code         ;codigo torneo
    name         ;nombre torneo
    mode            ;modalidad torneo
    boxers          ;arreglo de boxeadores
    numRegisterBoxers ;contador de boxeadores registrados
)
;Instanciacion de la estructura torneo de box
(defun createTournament()        
    ;Se encapsula la instancia creada por medio de un let (no será accesible desde el exterior)
    (let 
        ((tBox (make-TournamentBox)))
        ; Crear un vector de boxeadores inicializado con ceros
        (setf (TournamentBox-boxers tBox) (make-array numBoxers :initial-element 0))
        (setf (TournamentBox-numRegisterBoxers tBox) 0)
        tBox
    ) ; Devolver el torneo creado
 
)
(defun registerTournament()
    (if (= numRegisterTournaments 2) (print "No se pueden registrar mas torneos")
    (progn 
        (format t "Registre el torneo de boxeo ~%")
        (setq tournament (createTournament))    
        ;Llenar datos del torneo
        (print "Codigo del torneo de boxeo:")
        (setq code (read))
        (setf (TournamentBox-code tournament) code)

        (print "Nombre del torneo de boxeo:")
        (setq nameTor (read))
        (setf (TournamentBox-name tournament) nameTor)

        (print "Modalidad del torneo de boxeo:")
        (setq mode (read))
        (setf (TournamentBox-mode tournament) mode)

        ;Almacenar torneo en el vector
        (setf (aref tournaments numRegisterTournaments) tournament)

        ;aumentamos indice despues de haber almacenado un torneo
        (setq numRegisterTournaments (+ numRegisterTournaments 1))

        (print "Torneo registrado con exito")
    )
    )
    
)
(defun printTournaments()
    (print "Torneos registrados:")
    (setq i 0)
    (loop
        (format t "~%Torneo ~D" (+ i 1))
        (format t "~%Codigo: ~D" (TournamentBox-code (aref tournaments i)))
        (format t "~%Nombre: ~A" (TournamentBox-name (aref tournaments i)))
        (format t "~%Modalidad: ~A" (TournamentBox-mode (aref tournaments i)))
        (setq i (+ i 1))
        (when (= i numRegisterTournaments)(return))
    )
)
(defun findTournament(code)
    (setq index -1)
    (setq i 0)
    (loop 
        (if (= code (TournamentBox-code (aref tournaments i)))
            (setq index i);Se encontro el torneo
        )
        (setq i (+ i 1))
        (when (or (= i numRegisterTournaments 1) (/= index -1))(return index))
    )    
)
(defun searchBoxerByTournament()
    (printTournaments)
    (print "Ingrese el codigo del torneo al que desea buscar el boxeador:")
    (setq codeTournament (read))
    (setq indexTournament (findTournament codeTournament))
    (if (= indexTournament -1)
        (print "El torneo no existe")
        (progn
            ;Se obtiene el torneo
            (setq tournament (aref tournaments indexTournament))
            (print "Torneo encontrado")
            (if(= (TournamentBox-numRegisterBoxers tournament) 0)
                (print "No hay boxeadores registrados en este torneo")
                (progn
                    (printBoxersByTournament tournament)
                    (print "Ingrese el codigo del boxeador que desea buscar:")
                    (setq codeBoxer (read))
                    (setq indexBoxer (findBoxer codeBoxer tournament))
                    (if (= indexBoxer -1)
                        (print "El boxeador no existe en este torneo")
                        (progn
                            (print "Boxeador encontrado")
                            (printBoxer (aref (TournamentBox-boxers tournament) indexBoxer))
                        )
                    )
                )                        
            )
        )
    )
)
(defun printBoxersByTournament (tournament)
    (print "Boxeadores registrados:")
    (setq i 0)
    (loop
        (format t "~%Boxeador ~D" (+ i 1))
        (format t "~%Codigo: ~D" (Boxer-code (aref (TournamentBox-boxers tournament) i)))        
        (setq i (+ i 1))
        (when (= i (TournamentBox-numRegisterBoxers tournament))(return))
    )
)
(defun findBoxer(codeBoxer tournament)
    (setq index -1)
    (setq i 0)
    (loop 
        (if (= codeBoxer (Boxer-code (aref (TournamentBox-boxers tournament) i)))
            (setq index i);Se encontro el boxeador
        )
        (setq i (+ i 1))
        (when (or (= i (TournamentBox-numRegisterBoxers tournament) 1) (/= index -1))(return index))
    )    
)