;Integrantes:
;David Chacón Morán <jhoanchacon@unicauca.edu.co>
;Jonathan Guejia Burbano <jonathanguejia@unicauca.edu.co>

;Archivos a cargar

(load "tournament.lsp")
(load "boxer.lsp")
(load "searchBoxingT.lsp")

(loop
      
	(print " ===========================================")
	(print " |                M E N U                  |")
	(print " ===========================================")
	(format t" ~%") 
	(print "   1.   Registrar Torneo de Boxeo")
	(print "   2.   Registrar Boxeador")
	(print "   3.   Buscar un Torneo por codigo")
    (print "   4.   Buscar un Boxeador por Torneo especifico")
    (print "   5.   Consultar numero de Boxeadores MOSCA en un Torneo espefico.")
	(print "   6.   Salir.")
	(format t" ~%")
	(print "   Digite la opcion:")
      (setq opcion (read))	
  	(case opcion
		(1 
            (registerTournament) ;invocar funcion para registar un torneo
        )
		(2 
            (if (= numRegisterTournaments 0) (print "No se pueden registrar boxeadores sin torneos")
			(registerBoxer)) ;invocar funcion para registar un boxeador
		)	
	
		(3  
			(if (= numRegisterTournaments 0) (print "No hay torneos de boxeo registrados")
            (searchBoxingTournament)) ;incovar funcion para buscar un torneo por codigo	   
		)

        (4
			(if (= numRegisterTournaments 0) (print "No se pueden registrar boxeadores sin torneos")
            (searchBoxerByTournament)) ;invocar funcion para buscar un boxeador por torneo
        )
		(5
            ;funcion...
        )
		(6
            
        )
	    (otherwise 
			(print "Opcion no valida, intente de nuevo")
		)
	)
	(when (eq opcion 6) (print "Fin del programa, muchas gracias")(return))
  )
