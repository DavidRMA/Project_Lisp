;Integrantes:
;David Chacón Morán <jhoanchacon@unicauca.edu.co>
;Jonathan Guejia Burbano <jonathanguejia@unicauca.edu.co>
;Archivo que define variables, vectores, estructura torneo de box y funciones relacionadas a un torneo de boxeo

;Definicion de variables
(setq numTournaments 2)
(setq numBoxers 3)
(setq tournaments (make-array numTournaments :initial-element 0));Se crea un vector de torneos inicializado en 0
(setq numRegisterTournaments 0);Contador de torneos registrados
;Estructura de un torneo de boxeo
(defstruct TournamentBox
    code         ;codigo torneo
    name         ;nombre torneo
    mode            ;modalidad torneo
    boxers          ;arreglo de boxeadores
    numRegisterBoxers ;contador de boxeadores registrados
)
;Funcion para la instanciacion de la estructura torneo de box
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
;Funcion para registrar un torneo de box
(defun registerTournament()
    (if (= numRegisterTournaments 2) (print "No se pueden registrar mas torneos")
        (progn 
            (format t "Registre el torneo de boxeo ~%")
            (setq tournament (createTournament))    
            ;Llenar datos del torneo        
            (setq code (readTournamentCode))
            (setf (TournamentBox-code tournament) code)

            (print "Nombre del torneo de boxeo:")
            (setq nameTor (read))
            (setf (TournamentBox-name tournament) nameTor)

            (setq mode (readModalityTournament "Modalidad del torneo de boxeo:"))
            (setf (TournamentBox-mode tournament) mode)

            ;Almacenar torneo en el vector
            (setf (aref tournaments numRegisterTournaments) tournament)

            ;aumentamos indice despues de haber almacenado un torneo
            (setq numRegisterTournaments (+ numRegisterTournaments 1))

            (print "Torneo registrado con exito")
        )
    )   
)
;Funcion validar la existencia del codigo de un torneo de box
(defun readTournamentCode()
    (loop        
        (let            
            ((code (readNumber "Codigo del torneo de boxeo: ")))        
            (when (= (findTournament code) -1)(return code))                        
        )
        (print "El torneo ya existe, ingrese otro codigo")
    )        
)
;Funcion para mostrar los torneos registrados
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
;Funcion para encontrar un torneo por su codigo
(defun findTournament(code)
    (setq index -1)
    (if (= numRegisterTournaments 0)(return-from findTournament index))
    (setq i 0)
    (loop         
        (if (= code (TournamentBox-code (aref tournaments i)))
            (setq index i);Se encontro el torneo
        )
        (setq i (+ i 1))
        (when (or (= i numRegisterTournaments) (/= index -1))(return index))
    )    
)
;Funcion para buscar un boxeador de un torneo especifico
(defun searchBoxerByTournament()
    (printTournaments)    
    (setq codeTournament (readNumber "Ingrese el codigo del torneo al que desea buscar el boxeador:"))
    (setq indexTournament (findTournament codeTournament))
    (if (= indexTournament -1)
        (print "El torneo no existe")
        (progn
            ;Se obtiene el torneo
            (setq tournament (aref tournaments indexTournament))
            (print "Torneo encontrado")
            (if (= (TournamentBox-numRegisterBoxers tournament) 0)
                (print "No hay boxeadores registrados en este torneo")
                (progn
                    (printBoxersByTournament tournament)                    
                    (setq codeBoxer (readNumber "Ingrese el codigo del boxeador que desea buscar:"))
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
;Funcion para mostrar los datos(codigo) de un boxeador recibiendo como parametro un torneo
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
;Funcion para buscar un boxeador a partir de su codigo y un torneo de box
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
;Funcion para mostrar los datos de un torneo especifico
(defun printTournament(tournament)
    (print "Datos del torneo:")
    (setq i 0)
    (format t "~%Codigo: ~D" (TournamentBox-code tournament ))
    (format t "~%Nombre: ~A" (TournamentBox-name tournament))
    (format t "~%Modalidad: ~A" (TournamentBox-mode tournament))
    (if (= (TournamentBox-numRegisterBoxers tournament) 0)
        (print "Aun no hay boxeadores registrados en este torneo")
        (progn
            (showBoxersByTournament tournament)
        )
    )
)
;Funcion para mostrar los torneos registrados
(defun showRegisteredTournaments()
    (print "Torneos registrados:")
    (setq i 0)
    (loop
        (format t "~%Torneo ~D" (+ i 1))
        (format t "~%Codigo: ~D" (TournamentBox-code (aref tournaments i)))
        (setq i (+ i 1))
        (when (= i numRegisterTournaments)(return))
    )
)
;Funcion para mostrar los boxeadores registrados a un torneo especifico
(defun showBoxersByTournament (tournament)
    (print "Boxeadores registrados:")
    (setq i 0)
    (loop
        (format t "~%Boxeador ~D" (+ i 1))
        (printBoxer (aref (TournamentBox-boxers tournament) i))
        (setq i (+ i 1))
        (when (= i (TournamentBox-numRegisterBoxers tournament))(return))
    )
)
;Funcion para buscar un toreno de box por su codigo y mostrar sus datos
(defun searchBoxingTournament()
    ;Mostramos los torneos que se han registrado
    (showRegisteredTournaments)    
    (setq codeTournament (readNumber "Ingrese el codigo del torneo para mostrar sus datos:"))
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
;Funcion para contar los boxeadores con tipo de peso MOSCA en un torneo especifico
(defun numBoxersMosca()
    ;Mostramos los torneos que se han registrado
    (showRegisteredTournaments)    
    (setq codeTournament (readNumber "Ingrese el codigo del torneo:"))
    (setq indexTournament (findTournament codeTournament))
    (if (= indexTournament -1)
        (print "El torneo no existe")
        (progn
            ;Se obtiene el torneo
            (setq tournament (aref tournaments indexTournament))
            (if(= (TournamentBox-numRegisterBoxers tournament) 0)
                (print "Aun no hay boxeadores registrados en este torneo")
                (progn
                    (setq i 0)
                    (setq cont 0)
                    (loop 
                        (if (eq 'MOSCA (Boxer-typeWeight (aref (TournamentBox-boxers tournament) i)))
                            (setq cont (+ cont 1))
                        )
                        (setq i (+ i 1))
                        (when (= i (TournamentBox-numRegisterBoxers tournament))(return))
                    )
                    (format t "La cantidad de boxeadores mosca en el torneo con codigo ~D es: ~D~%" codeTournament cont)
                )
             )
        )
    )       
)