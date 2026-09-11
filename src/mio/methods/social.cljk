(ns mio.methods.social
  "mio configuration wrapper around the shared social-publication membrane."
  (:require [etzhayyim.social.publication :as publication]))

(def config {:actor-id "mio" :display-name "mio"})
(def DISCLAIMER (publication/disclaimer config))

(defn draft-observation-post
  ([subject body sources] (draft-observation-post subject body sources ""))
  ([subject body sources author]
   (publication/draft-observation-post config subject body sources author)))

(defn build-live [& args] (apply publication/build-live config args))
