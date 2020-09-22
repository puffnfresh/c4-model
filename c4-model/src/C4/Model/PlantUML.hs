{-# LANGUAGE OverloadedStrings #-}

module C4.Model.PlantUML
  ( containerContextDiagram,
    containerContextDiagram',
    systemContextDiagram,
    systemContextDiagram',
  )
where

import C4.Model (Container (..), HasRelationships, Key, Model (..), Relationship (..), Technology, containers, relationships)
import Control.Lens (FoldableWithIndex, ifoldMap, ix, (^.))
import Data.Map (Map)
import Data.String (IsString)

rel :: (IsString x, Semigroup x) => x -> x -> x -> x
rel a b c =
  "Rel(" <> a <> ", " <> b <> ", \"" <> c <> "\")"

relations :: (IsString a, Semigroup a, HasRelationships s) => (Key s -> a) -> (Technology s -> a) -> Key s -> s -> [a]
relations sx tx s ss =
  ifoldMap (\s' (Relationship _ t) -> [rel (sx s) (sx s') (tx t)]) (ss ^. relationships)

person :: (IsString x, Semigroup x) => x -> x
person p =
  "Person(" <> p <> ", \"" <> p <> "\")"

container :: (IsString x, Semigroup x) => (c -> x) -> (t -> x) -> c -> Container c t cm -> x
container cx tx c (Container t _ _) =
  "Container(" <> cx c <> ", \"" <> cx c <> "\", \"" <> tx t <> "\")"

system :: (IsString x, Semigroup x) => (s -> x) -> s -> x
system sx s =
  "System(" <> sx s <> ", \"" <> sx s <> "\")"

interactions :: (IsString x, Semigroup x) => (p -> x) -> (i -> x) -> (s -> x) -> p -> Map s i -> [x]
interactions px ix' sx p =
  ifoldMap (\s i -> [rel (px p) (sx s) (ix' i)])

ifoldToList :: FoldableWithIndex a1 f => (a1 -> a2) -> f b -> [a2]
ifoldToList f =
  ifoldMap (const . (: []) . f)

wrapDiagram ::
  (IsString a, Semigroup a) =>
  a ->
  [a] ->
  [a]
wrapDiagram name x =
  [ "@startuml " <> name,
    "!includeurl https://raw.githubusercontent.com/RicardoNiepel/C4-PlantUML/release/1-0/C4_Container.puml",
    "LAYOUT_WITH_LEGEND()",
    "title " <> name
  ]
    <> x
    <> ["@enduml"]

containerContextDiagram ::
  (IsString x, Semigroup x, Ord c, Ord s) =>
  (c -> x) ->
  (t -> x) ->
  Model p i s c t o ->
  s ->
  [x]
containerContextDiagram cx tx (Model _ ss) s =
  wrapDiagram "Container context diagram"
    ( ifoldMap (\a b -> [container cx tx a b]) cs
        <> ifoldMap (relations cx tx) cs
    )
  where
    cs =
      ss ^. ix s . containers

containerContextDiagram' ::
  (Show p, Show i, Show s, Ord s, Show c, Ord c, Show t) =>
  Model p i s c t o ->
  s ->
  String
containerContextDiagram' m =
  unlines . containerContextDiagram show show m

systemContextDiagram ::
  (IsString x, Semigroup x, Ord c) =>
  (p -> x) ->
  (i -> x) ->
  (s -> x) ->
  (t -> x) ->
  Model p i s c t o ->
  [x]
systemContextDiagram px ix' sx tx (Model ps ss) =
  wrapDiagram "System context diagram"
    ( ifoldToList (person . px) ps
        <> ifoldToList (system sx) ss
        <> ifoldMap (relations sx tx) ss
        <> ifoldMap (interactions px ix' sx) ps
    )

systemContextDiagram' ::
  (Show p, Show i, Show s, Show c, Ord c, Show t) =>
  Model p i s c t o ->
  String
systemContextDiagram' =
  unlines . systemContextDiagram show show show show
