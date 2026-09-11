(ns mio.methods.kotoba
  "Compatibility membrane over the shared kotoba.datom commit-DAG library."
  (:require [kotoba.datom :as datom]))

(def add datom/add)
(def tx-cid datom/tx-cid)

(defn make-tx [datoms tx-id as-of prev-cid]
  (let [tx (datom/make-tx datoms {:tx-id tx-id :as-of as-of :prev-cid prev-cid})]
    {":tx/id" (:tx/id tx) ":tx/as-of" (:tx/as-of tx)
     ":tx/prev" (:tx/prev tx) ":tx/cid" (:tx/cid tx)
     ":tx/count" (:tx/count tx) ":tx/datoms" (:tx/datoms tx)}))

(defn- shared-tx [tx]
  {:tx/id (get tx ":tx/id") :tx/as-of (get tx ":tx/as-of")
   :tx/prev (get tx ":tx/prev") :tx/cid (get tx ":tx/cid")
   :tx/count (get tx ":tx/count") :tx/datoms (get tx ":tx/datoms")})

(defn- actor-tx [tx]
  {":tx/id" (:tx/id tx) ":tx/as-of" (:tx/as-of tx)
   ":tx/prev" (:tx/prev tx) ":tx/cid" (:tx/cid tx)
   ":tx/count" (:tx/count tx) ":tx/datoms" (:tx/datoms tx)})

(defn tx->edn [tx] (datom/tx->edn-line (shared-tx tx)))

#?(:clj
   (do
     (defn append-tx [tx path] (datom/append-tx! (shared-tx tx) path))
     (defn read-log [path] (mapv actor-tx (datom/read-log path)))
     (defn head-cid [path] (datom/head-cid path))
     (defn verify-chain [path] (datom/verify-chain path))))
