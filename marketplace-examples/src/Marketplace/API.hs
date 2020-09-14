{-# LANGUAGE ExistentialQuantification #-}

module Marketplace.API where

import Control.Monad.Free (Free, liftF)
import qualified Data.Aeson as Json
import Marketplace.Model (App, Application, Id, Vendor)

data API a
  = CreateVendor (Id -> Vendor) (Vendor -> a)
  | CreateApplication (Id -> Application) (Application -> a)
  | CreateApp (Id -> App) (App -> a)
  | forall x. (Json.FromJSON x) => JsonData (x -> a)
  | JsonResponse Json.Value a

createVendor :: (Id -> Vendor) -> Free API Vendor
createVendor v =
  liftF (CreateVendor v id)

createApplication :: (Id -> Application) -> Free API Application
createApplication a =
  liftF (CreateApplication a id)

createApp :: (Id -> App) -> Free API App
createApp a =
  liftF (CreateApp a id)

jsonData :: (Json.FromJSON a) => Free API a
jsonData =
  liftF (JsonData id)

jsonResponse :: Json.ToJSON a => a -> Free API ()
jsonResponse v =
  liftF (JsonResponse (Json.toJSON v) ())

instance Functor API where
  fmap f (CreateVendor v g) =
    CreateVendor v (f . g)
  fmap f (CreateApplication v g) =
    CreateApplication v (f . g)
  fmap f (CreateApp v g) =
    CreateApp v (f . g)
  fmap f (JsonData g) =
    JsonData (f . g)
  fmap f (JsonResponse v x) =
    JsonResponse v (f x)
