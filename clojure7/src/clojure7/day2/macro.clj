(ns clojure7.day2.macro)

(defmacro unless [test body]
  (list 'if (list 'not test) body))

; (require '[clojure7.day2.macro])
; (ns clojure7.day2.macro)
; (macroexpand '(unless condition body))
; (unless true (println "No more danger, Will."))