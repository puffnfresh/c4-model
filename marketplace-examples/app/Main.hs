{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Monad.Free (Free, foldFree)
import Control.Monad.IO.Class (liftIO)
import Control.Monad.Writer (Writer, execWriter, tell)
import qualified Data.Aeson as Json
import Data.Char (isAlphaNum, toLower)
import Data.Foldable (traverse_)
import Data.Functor (($>))
import Data.List (nub)
import Data.Map (Map, singleton, toList)
import Data.Semigroup.Foldable.Class (foldMap1)
import Data.String (fromString)
import Data.Text (Text)
import Marketplace.API
  ( API,
    createApp,
    createVendor,
    jsonData,
    jsonResponse,
  )
import Marketplace.Diagram (writeDiagram)
import Marketplace.Model
  ( App (App),
    Id (Id),
    Vendor (Vendor, vendorId),
  )
import Marketplace.Web (webAPI)
import Network.HTTP.Types (StdMethod (..))
import Network.Wai (defaultRequest)
import qualified Web.Scotty as Web

data NewVendorAndAppBody = NewVendorAndAppBody {vendorName :: Text, appName :: Text}
  deriving (Show)

instance Json.FromJSON NewVendorAndAppBody where
  parseJSON =
    Json.withObject "NewVendorAndAppBody" f
    where
      f o =
        NewVendorAndAppBody
          <$> o Json..: "vendorName"
          <*> o Json..: "appName"

serve :: Program -> IO ()
serve w =
  Web.scotty 8080 $
    traverse_ (uncurry f) (toList (execWriter w))
  where
    f (POST, r) p =
      Web.post (fromString r) (foldFree webAPI p)

type Program =
  Writer (Map (StdMethod, String) (Free API ())) ()

post :: String -> Free API () -> Program
post r p =
  tell (singleton (POST, r) p)

generateSequenceDiagrams :: Program -> IO ()
generateSequenceDiagrams w =
  traverse_ (uncurry f) (toList (execWriter w))
  where
    f (m, r) =
      writeDiagram (show m <> " " <> r)

-- Example

program :: Program
program =
  post "/create-app" $ do
    r <- jsonData
    v <- createVendor (\i -> Vendor i (vendorName r))
    a <- createApp (\i -> App i (vendorId v) (appName r))
    jsonResponse a

main :: IO ()
main = do
  generateSequenceDiagrams program
  serve program
