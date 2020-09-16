{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Monad.Free (Free)
import Data.ByteString.Lazy (ByteString)
import Data.ByteString.Lazy.Char8 (pack)
import Marketplace.API (API, createApp, createVendor, jsonResponse)
import Marketplace.Diagram (renderDiagram)
import Marketplace.Model (App (..), Vendor (..))
import System.FilePath ((<.>), (</>))
import Test.Tasty (TestTree, defaultMain, testGroup)
import Test.Tasty.Golden (goldenVsString)

check :: String -> Free API a -> TestTree
check name =
  goldenVsString name ("tests" </> "golden" </> name <.> "puml") . pure . pack . renderDiagram name

tests :: TestTree
tests =
  testGroup
    "Tests"
    [ check "trivial" (pure ()),
      check "create vendor" $
        createVendor (\i -> Vendor i "Brian"),
      check "create vendor and app" $ do
        v <- createVendor (\i -> Vendor i "Brian")
        a <- createApp (\i -> App i (vendorId v) "Brian's App")
        jsonResponse a
    ]

main :: IO ()
main =
  defaultMain tests
