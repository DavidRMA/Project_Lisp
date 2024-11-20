;Integrantes:
;David Chacón Morán <jhoanchacon@unicauca.edu.co>
;Jonathan Guejia Burbano <jonathanguejia@unicauca.edu.co>

;Funcion para registrar boxeadores
(defun registerBoxer()
     (setq indexB 0)
     (loop
        ;llenar datos del boxeador
        (format t "~%Ingrese los datos del boxeador ~D ~%" (+ indexB 1))
        (print "Codigo del boxeador: ")
        (setq codeBox (read))
        (setf (Boxer-codeBox box) codeBox)

        (print "Nombre del boxeador: ")
        (setq nameBox (read))
        (setf (Boxer-firstnameBox box) nameBox)

        (print "Apellido del boxeador: ")
        (setq lastnameBox (read))
        (setf (Boxer-lastnameBox box) lastnameBox)

        (print "Tipo de peso del boxeador: ")
        (setq typeWeightBox (read)) 
        (setf (Boxer-typeWeightBox box) typeWeightBox)

        ;Almacenar boxeador en el vector
        (setf (aref boxers indexB) box)

        (setq indexB (+ indexB 1))

        (when 
            (> indexB 2);cambiaaaaaar a 2
            (return )
        )
     )
)