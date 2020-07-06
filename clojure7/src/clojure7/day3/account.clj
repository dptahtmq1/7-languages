(ns clojure7.day3.account)

(defn account-create
  []
  (ref []))

(defn account-deposit
  [account amount]
  (dosync (alter account conj amount)))

(defn account-withdraw
  [account amount]
  (dosync (alter account conj (* -1 amount))))

(defn account-get
  [account]
  (apply + @account))

; (require '[clojure7.day3.account])
; (ns clojure7.day3.account)
; (def a (account-create))
; (account-deposit a 1000)
; (account-deposit a 2000)
; (account-withdraw a 500)
; (account-get a)