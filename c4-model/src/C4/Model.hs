{-# LANGUAGE OverloadedStrings #-}

module C4.Model (
  HasDescription(..)
, Description(..)
, Relationship(..)
, relationship
, Component(..)
, Container(..)
, container
, components
, SoftwareSystem(..)
, softwareSystem
, containers
, relationships
, Model(..)
, model
, persons
, softwareSystems
) where

import           Control.Lens (Lens')
import           Data.Map     (Map)
import           Data.String  (IsString (..))
import           Data.Text    (Text)

newtype Description
  = Description Text
  deriving (Eq, Ord, Show)

instance Semigroup Description where
  (<>) (Description a) (Description b) = Description (a <> b)

instance Monoid Description where
  mempty = Description mempty

instance IsString Description where
  fromString =
    Description . fromString

class HasDescription a where
  description :: Lens' a Description

data Relationship technology
  = Relationship Description technology
  deriving (Eq, Ord, Show)

relationship :: technology -> Relationship technology
relationship =
  Relationship mempty

instance HasDescription (Relationship technology) where
  description f (Relationship a b) =
    (\a' -> Relationship a' b) <$> f a

data Component technology
  = Component technology
  deriving (Eq, Ord, Show)

data Container technology component
  = Container technology (Map component (Component technology))
  deriving (Eq, Ord, Show)

container :: Ord component => technology -> Container technology component
container a =
  Container a mempty

components :: Lens' (Container technology component) (Map component (Component technology))
components f (Container a b) =
  (\b' -> Container a b') <$> f b

data SoftwareSystem system container technology component
  = SoftwareSystem Description (Map container (Container technology component)) (Map system (Relationship technology))
  deriving (Eq, Ord, Show)

instance HasDescription (SoftwareSystem system container technology component) where
  description f (SoftwareSystem a b c) =
    (\a' -> SoftwareSystem a' b c) <$> f a

softwareSystem :: (Ord system, Ord container) => SoftwareSystem system container technology component
softwareSystem =
  SoftwareSystem mempty mempty mempty

containers :: Lens' (SoftwareSystem system container technology component) (Map container (Container technology component))
containers f (SoftwareSystem a b c) =
  (\b' -> SoftwareSystem a b' c) <$> f b

relationships :: Lens' (SoftwareSystem system container technology component) (Map system (Relationship technology))
relationships f (SoftwareSystem a b c) =
  (\c' -> SoftwareSystem a b c') <$> f c

data Model person interaction system container technology component
  = Model (Map person (Map system interaction)) (Map system (SoftwareSystem system container technology component))
  deriving (Eq, Ord, Show)

model :: (Ord person, Ord system) => Model person interaction system container technology component
model =
  Model mempty mempty

persons :: Lens' (Model person interaction system container technology component) (Map person (Map system interaction))
persons f (Model a b) =
  (\a' -> Model a' b) <$> f a

softwareSystems :: Lens' (Model person interaction system container technology component) (Map system (SoftwareSystem system container technology component))
softwareSystems f (Model a b) =
  (\b' -> Model a b') <$> f b
