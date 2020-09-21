{-# LANGUAGE OverloadedStrings #-}

module Main where

import C4.Model
import C4.Model.PlantUML (containerContextDiagram', systemContextDiagram')
import Control.Lens hiding (Identity)

data MarketplacePerson
  = Vendor
  deriving (Eq, Ord, Show)

data MarketplaceSystem
  = Marketplace
  | Identity
  | PAKO
  deriving (Eq, Ord, Show)

data MarketplaceContainer
  = AMKT
  | Padres
  | Athreos
  | Hub
  | Hiberico
  | Postaldistrix
  deriving (Eq, Ord, Show)

data MarketplaceTechnology
  = Scala
  | Haskell
  | Docker
  | HAProxy
  | Varnish
  | REST
  | SQL
  | HTTP
  | SQS
  deriving (Eq, Ord, Show)

data MarketplaceComponent
  = ReverseProxy
  | Cache
  | WebApp
  | Analytics
  deriving (Eq, Ord, Show)

data MarketplaceInteraction
  = Manages
  deriving (Eq, Ord, Show)

athreos ::
  Container
    MarketplaceContainer
    MarketplaceTechnology
    MarketplaceComponent
athreos =
  container Docker
    & components . at ReverseProxy ?~ Component HAProxy
    & components . at Cache ?~ Component Varnish
    & relationships . at AMKT ?~ relationship HTTP
    & relationships . at Padres ?~ relationship HTTP
    & relationships . at Hiberico ?~ relationship HTTP

amkt ::
  Container
    MarketplaceContainer
    MarketplaceTechnology
    MarketplaceComponent
amkt =
  container Scala
    & components . at WebApp ?~ Component Scala
    & components . at Analytics ?~ Component Scala
    & relationships . at Postaldistrix ?~ relationship SQS

hub ::
  Container
    MarketplaceContainer
    MarketplaceTechnology
    MarketplaceComponent
hub =
  container Scala
    & relationships . at AMKT ?~ relationship HTTP

padres ::
  Container
    MarketplaceContainer
    MarketplaceTechnology
    MarketplaceComponent
padres =
  container Scala
    & relationships . at AMKT ?~ relationship HTTP

marketplaceSystem ::
  SoftwareSystem
    MarketplaceSystem
    MarketplaceContainer
    MarketplaceTechnology
    MarketplaceComponent
marketplaceSystem =
  softwareSystem
    & containers . at AMKT ?~ amkt
    & containers . at Athreos ?~ athreos
    & containers . at Hub ?~ hub
    & containers . at Padres ?~ padres
    & containers . at Hiberico ?~ container Haskell
    & containers . at Postaldistrix ?~ container Scala
    & relationships . at Identity ?~ relationship REST
    & relationships . at PAKO ?~ relationship SQL

marketplace ::
  Model
    MarketplacePerson
    MarketplaceInteraction
    MarketplaceSystem
    MarketplaceContainer
    MarketplaceTechnology
    MarketplaceComponent
marketplace =
  model
    & softwareSystems . at Marketplace ?~ marketplaceSystem
    & softwareSystems . at Identity ?~ softwareSystem
    & softwareSystems . at PAKO ?~ softwareSystem
    & persons . at Vendor ?~ (mempty & at Marketplace ?~ Manages)

main :: IO ()
main =
  putStrLn (containerContextDiagram' marketplace)
