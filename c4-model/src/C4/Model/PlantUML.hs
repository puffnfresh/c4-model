{-# LANGUAGE OverloadedStrings #-}

module C4.Model.PlantUML (
  plantUML
, plantUML'
) where

import C4.Model (Model(..), Relationship(..), SoftwareSystem, relationships)
import Data.Map (Map)
import Control.Lens ((^.), ifoldMap)
import Data.String (IsString)

actor :: (IsString x, Semigroup x) => x -> [x]
actor p =
  [ "actor \"" <> p <> "\" <<Person>>"
  ]

rectangle :: (IsString x, Semigroup x) => x -> [x]
rectangle s =
  [ "rectangle " <> s <> " <<Software System>> ["
  , "  " <> s
  , "]"
  ]

relations :: (IsString x, Semigroup x) => (s -> x) -> (t -> x) -> s -> SoftwareSystem s c t o -> [x]
relations sx tx s ss =
  ifoldMap (\s' (Relationship _ t) -> [ sx s <> " ..> " <> sx s' <> " : <<" <> tx t <> ">>" ]) (ss ^. relationships)

interactions :: (IsString x, Semigroup x) => (p -> x) -> (i -> x) -> (s -> x) -> p -> Map s i -> [x]
interactions px ix sx p =
  ifoldMap (\s i -> [ px p <> " ..> " <> sx s <> " : " <> ix i ])

plantUML ::
  (IsString x, Semigroup x) =>
  (p -> x)
  -> (i -> x)
  -> (s -> x)
  -> (t -> x)
  -> Model p i s c t o
  -> [x]
plantUML px ix sx tx (Model ps ss) =
     ["@startuml"]
  <> ifoldMap (const . actor . px) ps
  <> ifoldMap (const . rectangle . sx) ss
  <> ifoldMap (relations sx tx) ss
  <> ifoldMap (interactions px ix sx) ps
  <> ["@enduml"]

plantUML' ::
  (Show p, Show i, Show s, Show t) =>
  Model p i s c t o
  -> String
plantUML' =
  unlines . plantUML show show show show
