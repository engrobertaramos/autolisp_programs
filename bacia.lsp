;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;Developed by Roberta Santos [engrobertaramos09@gmail.com]
;Interface language: Portuguese
;Description: Routine to calculate the watershed area clicking inside of a polyline, line or arc closed. Will be created a hach and a text with the name and the area in hectares.
;The layer configuration follow the DER-SP / BRAZIL patterns. 
;Command: BACIA
;Date: 2022.07.13
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
(defun c:bacia ()
	(command "UNDO" "Begin")
	(if (eq count nil)
		(setq count 1)
	)
	(setq fonte (getreal "\nTamanho do texto: "))
	(setq pt (getpoint "\nClique dentro da área: "))
	(setq dados '())
	
	(while (/= pt nil)
		(command "layer" "m" "H-BACIA_HACH" "l" "center" "" "c" "t" "11,244,15" "" "tr" "50" "" "")
		(command "-HATCH" "p" "ansi31" "1.0" "" pt "")
		(command "area" "e" (entlast))
		(setq aream2 (getvar "Area"))
		(setq areaha (/ aream2 10000))
		(command "style" "Bacia" "arial black" fonte "" "" "" "")
		(command "layer" "m" "H_BACIA" "l" "continuous" "" "c" "t" "3,16,201" "" "tr" "0" "" "")
		(setq width (* fonte 12))
		(setq areatxt (strcat "A" (rtos count 2 0) "=" (rtos areaha 2 2) "ha"))
		(command "mtext" pt "j" "mc" "w" width areatxt "" "esc")
		(setq count (1+ count))
		
		(setq pt (getpoint "\nClique dentro da área: "))
	)
	(command "UNDO" "END")
(princ)
)