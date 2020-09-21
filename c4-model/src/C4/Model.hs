{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeFamilies #-}

module C4.Model
  ( HasDescription (..),
    Description (..),
    Relationship (..),
    relationship,
    HasRelationships (..),
    Component (..),
    Container (..),
    container,
    components,
    SoftwareSystem (..),
    softwareSystem,
    containers,
    Model (..),
    model,
    persons,
    softwareSystems,
  )
where

import Control.Lens (Lens')
import Data.Map (Map, empty)
import Data.String (IsString (..))
import Data.Text (Text)

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

class HasRelationships a where
  type Key a :: *
  type Technology a :: *
  relationships :: Lens' a (Map (Key a) (Relationship (Technology a)))

data Component technology
  = Component technology
  deriving (Eq, Ord, Show)

data Container container technology component
  = Container technology (Map component (Component technology)) (Map container (Relationship technology))
  deriving (Eq, Ord, Show)

container :: Ord component => technology -> Container container technology component
container a =
  Container a mempty empty

components :: Lens' (Container container technology component) (Map component (Component technology))
components f (Container a b c) =
  (\b' -> Container a b' c) <$> f b

instance HasRelationships (Container container technology component) where
  type
    Key (Container container technology component) =
      container

  type
    Technology (Container container technology component) =
      technology

  relationships f (Container a b c) =
    (\c' -> Container a b c') <$> f c

data SoftwareSystem system container technology component
  = SoftwareSystem Description (Map container (Container container technology component)) (Map system (Relationship technology))
  deriving (Eq, Ord, Show)

instance HasDescription (SoftwareSystem system container technology component) where
  description f (SoftwareSystem a b c) =
    (\a' -> SoftwareSystem a' b c) <$> f a

softwareSystem :: (Ord system, Ord container) => SoftwareSystem system container technology component
softwareSystem =
  SoftwareSystem mempty mempty mempty

containers :: Lens' (SoftwareSystem system container technology component) (Map container (Container container technology component))
containers f (SoftwareSystem a b c) =
  (\b' -> SoftwareSystem a b' c) <$> f b

instance HasRelationships (SoftwareSystem system container technology component) where
  type
    Key (SoftwareSystem system container technology component) =
      system

  type
    Technology (SoftwareSystem system container technology component) =
      technology

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
