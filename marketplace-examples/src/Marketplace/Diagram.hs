{-# LANGUAGE OverloadedStrings #-}

module Marketplace.Diagram where

import Control.Monad.Free (Free, foldFree)
import Control.Monad.Writer
  ( MonadWriter (tell),
    Writer,
    execWriter,
  )
import qualified Data.Aeson as Json
import Data.Char (isAlphaNum, toLower)
import Data.Functor (($>))
import Data.List (nub)
import Data.Map (singleton)
import DataFlow.Core
import DataFlow.PlantUML.Renderer (renderPlantUML)
import DataFlow.SequenceDiagram (asSequenceDiagram)
import Marketplace.API (API (..))
import Marketplace.Model (Id (Id))

data Relation
  = Relation String String String

relation :: API a -> Writer [Relation] a
relation (CreateVendor v f) =
  tell [Relation "Marketplace" "creates a vendor" "Database"] $> f (v (Id 0))
relation (CreateApplication a f) =
  tell [Relation "Marketplace" "creates an application" "Database"] $> f (a (Id 0))
relation (CreateApp a f) =
  tell [Relation "Marketplace" "creates an app" "Database"] $> f (a (Id 0))
relation (JsonData f) =
  tell [Relation "User" "requests" "Marketplace"] $> f (case Json.fromJSON (Json.object ["vendorName" Json..= ("Example vendor" :: String), "appName" Json..= ("Example App" :: String)]) of Json.Success a -> a)
relation (JsonResponse f x) =
  tell [Relation "Marketplace" "JSON response" "User"] $> x

makeDiagram :: String -> [Relation] -> Diagram
makeDiagram t rs =
  Diagram mempty [TrustBoundary t mempty nodes] flows
  where
    nodes =
      nub (rs >>= relation)
    relation (Relation a _ b) =
      [node a, node b]
    node s =
      (Function s (singleton "title" (String s)))
    flows =
      (\(Relation a b c) -> Flow a c (singleton "operation" (String b))) <$> rs

renderDiagram :: String -> Free API a -> String
renderDiagram title =
  renderPlantUML . asSequenceDiagram . makeDiagram title . execWriter . foldFree relation
