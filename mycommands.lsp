;(load "c:/00001/03_estudos/lsp/mycommands.lsp")
;Zoom Commands
(defun c:ze() (command "zoom" "e"))
(defun c:za() (command "zoom" "a"))

;View Commands
(defun c:u3() (command "ucs" "3p"))
(defun c:uw() (command "ucs" "w" "" "plan" ""))
(defun c:uv() (command "ucs" "v" ""))

;S Commands
(defun c:zz() (command "STRETCH"))

;Layer Commands
(defun c:LM()

	(setq newlayer (getstring "\nEnter new layer name: "))
	(setq ltype (getstring "\nEnter line type: "))
	(setq color (getstring "\nEnter the color: "))
	(command "layer" "m" newlayer "lt" ltype "" "c" color "" "")
	prompt (strcat "\nLayer: " newlayer "created")
(princ)
)

;Civil Commands
(defun c:fo() (command "CreateFeatureLines")
(princ)
)

(defun c:aob() (command "CreateAlignmentEntities")
(princ)
)
(defun c:plab() (command "AddNetworkPartPlanLabel")
(princ)
)
(defun c:flab() (command "AddFeatureLineLabels")
(princ)
)
(defun c:ale() (command "AddAlignOffXYLbl")
(princ)
)
(defun c:prof() (command "CreateProfileFromSurface")
(princ)
)
(defun c:profv() (command "CreateProfileLayout")
(princ)
)
(defun c:profnw() (command "CreateAlignFromNetwork")
(princ)
)
(defun c:flip() (command "LabelFlip")
(princ)
)
(defun c:elt() (command "EditLabelText")
(princ)
)
(defun c:ppr() (command "EditParentPartProperties")
(princ)
)
(defun c:ex2d() (command "EXPORTC3DDRAWING")
(princ)
)
(defun c:cot() (command "AddSurfaceSpotElevLabel")
(princ)
)
(defun c:decliv() (command "AddSurfaceSlopeLabel")
(princ)
)
(defun c:felev() (command "GradingElevEditor")
(princ)
)
(defun c:eppr() (command "EditPipeProperties")
(princ)
)
(defun c:fea() (command "DrawFeatureLine")
(princ)
)

;Normalize pline
(defun c:normalize (/ ss idx obj)
  (vl-load-com)
  (if (setq ss (ssget "x" '((210 0 0 -1))))
    (progn
      (setq idx -1)
      (while (setq ent (ssname ss (setq idx (1+ idx))))
	(setq obj (vlax-ename->vla-object ent))
	(vlax-invoke-method obj 'transformby (vlax-tmatrix '((1.0 0.0 0.0 0.0)
				(0.0 1.0 0.0 0.0)
				(0.0 0.0 -1.0 0.0)
				(0.0 0.0 0.0 1.0))
				))
	)
      )
    )
  (princ)
)

