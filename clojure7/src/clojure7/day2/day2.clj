(ns clojure7.day2.day2)

(defmacro unless [test body1 body2]
  (list 'if (list 'not test) body1 body2))

; (require '[clojure7.day2.day2])
; (ns clojure7.day2.day2)
; (unless true (println "No more danger, Will.") (println "Else.."))

(defprotocol Bird
  (fly [c])
  )

(defrecord Duck [wing]
  Bird
  (fly [_] (println (str "Fly " wing " !!")))
  Object
  (toString [_] (str "[" wing "]"))
  )

; (def d (Duck. 2))
; (fly d)
; (:wing d)