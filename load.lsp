;Integrantes:
;David Chacón Morán <jhoanchacon@unicauca.edu.co>
;Jonathan Guejia Burbano <jonathanguejia@unicauca.edu.co>

;Creacion del vector de torneos
(setq tournaments (make-array 2 :initial-element 0))

;Creacion del vector de boxeadores
(setq boxers (make-array 3 :initial-element 0))

;Defincion de la estructura boxeador
(defstruct Boxer
    codeBox         ;codigo boxeador
    firstnameBox    ;nombre boxeador
    lastnameBox     ;apellido boxeador
    typeWeightBox   ;tipo peso boxeador
)

;Instanciacion de la estructura boxeador
(setq box (make-Boxer))

;defincion de la estructura Torneo de boxeo
(defstruct TournamentBox
    codeTor         ;codigo torneo
    nameTor         ;nombre torneo
    mode            ;modalidad torneo
    boxers          ;arreglo de boxeadores
)

;Instanciacion de la estructura torneo de box
(setq tbox (make-TournamentBox))

