;Integrantes:
;David Chacón Morán <jhoanchacon@unicauca.edu.co>
;Jonathan Guejia Burbano <jonathanguejia@unicauca.edu.co>

;Archivo que define funciones de validacion

;Funcion para leer un numero entero positivo
(defun readNumber(mensaje)
    (loop
        (print mensaje)
        (let            
            ((number (read)))
            ;Numberp verifica si es un numero
            (when (and (numberp number)(> number 0))(return number))                        
        )
        (print "Debe ingresar un numero entero positivo")
    )        
)
;Funcion para validar el tipo de peso de un boxeador
(defun readTypeWeightBoxer(mensaje)
    (loop
        (print mensaje)
        (let            
            ((typeWeight (read)))            
            (when (or (eq 'MOSCA typeWeight)(eq 'PLUMA typeWeight))(return typeWeight))                        
        )
        (print "El tipo de peso debe ser MOSCA o PLUMA")
    )        
)
;Funcion para validar la modalidad  de un torneo de box
(defun readModalityTournament(mensaje)
    (loop
        (print mensaje)
        (let            
            ((modeTournament (read)))            
            (when (or (eq 'INFANTIL modeTournament)(eq 'JUVENIL modeTournament)(eq 'ADULTOS modeTournament))(return modeTournament))                        
        )
        (print "La modalidad del torneo debe ser INFANTIL,JUVENIL o ADULTOS")
    )        
)