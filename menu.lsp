;Integrantes:
;David Chacón Morán <jhoanchacon@unicauca.edu.co>
;Jonathan Guejia Burbano <jonathanguejia@unicauca.edu.co>

;Archivos a cargar
(load "load.lsp")
(load "registerTournament.lsp")



(loop
      
	(print " ===========================================")
	(print " |                M E N U                  |")
	(print " ===========================================")
	(format t" ~%") 
	(print "   1.   Registrar Torneo de Boxeo")
	(print "   2.   Buscar Torneo de Boxeo por codigo")
	(print "   3.   Buscar un Boxeador especifico para un torneo de boxeo especifico")
    (print "   4.   Consultar el numero de Boxeadores que tienen tipo peso MOSCA para un Torneo de Boxeo especifico")
    (print "   5.   Salir.")
	(format t" ~%")
	(print "   Digite la opcion:")
      (setq opcion (read))	
  	(case opcion
		(1 
            (registerTournament) ;invocar funcion para registar un torneo
        )
		(2 
            ;funcion...
		)	
	
		(3  
            ;funcion...		   
		)

        (4
            ;funcion...
        )

	    (otherwise nil)
	)
	(when (eq opcion 5) (print "fin programa")(return))
  )
