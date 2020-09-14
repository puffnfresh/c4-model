{-# LANGUAGE OverloadedStrings #-}

module Marketplace.Model where

import Data.Aeson (KeyValue ((.=)), ToJSON (toJSON), object)
import Data.Text (Text)
import Data.Word (Word64)

newtype Id
  = Id Word64
  deriving (Show)

instance ToJSON Id where
  toJSON (Id a) =
    toJSON a

data Vendor = Vendor {vendorId :: Id, vendorName :: Text}
  deriving (Show)

data Application
  = Application Id Text
  deriving (Show)

data App = App {appId :: Id, appVendorId :: Id, appName :: Text}
  deriving (Show)

instance ToJSON App where
  toJSON a =
    object
      [ "id" .= appId a
      ]
