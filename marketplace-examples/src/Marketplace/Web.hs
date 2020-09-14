module Marketplace.Web where

import Control.Monad.IO.Class (liftIO)
import Data.Functor (($>))
import Marketplace.API (API (..))
import Marketplace.Model (Id (Id))
import qualified Web.Scotty as Web

webAPI :: API a -> Web.ActionM a
webAPI (CreateVendor v x) =
  let v' = v (Id 0)
   in liftIO (print v') $> x v'
webAPI (CreateApplication a x) =
  let a' = a (Id 0)
   in liftIO (print a') $> x a'
webAPI (CreateApp a x) =
  let a' = a (Id 0)
   in liftIO (print a') $> x a'
webAPI (JsonData f) =
  f <$> Web.jsonData
webAPI (JsonResponse v x) =
  Web.json v $> x
