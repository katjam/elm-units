module Torque exposing
    ( Torque, NewtonMeters
    , newtonMeters, inNewtonMeters, kilogramMeters, inKilogramMeters, poundFeet, inPoundFeet
    )

{-| A `Torque` value represents a moment of force (twisting or turning effect) in newton meters
, pound feet or kilogram meters. It is stored as a number of newtonMeters.

Note that since `NewtonMeters` is defined as `Product Newtons Meters`, you can compute
energy directly as a product of force and distance:

    Force.newtons 5 |> Quantity.times (Length.meters 4)
    --> Torque.newtonMeters 20

@docs Torque, NewtonMeters


## Conversions

@docs newtonMeters, inNewtonMeters, kilogramMeters, inKilogramMeters, poundFeet, inPoundFeet

-}

import Constants
import Force exposing (Newtons)
import Length exposing (Meters)
import Quantity exposing (Product, Quantity(..))


{-| -}
type alias NewtonMeters =
    Product Newtons Meters


{-| -}
type alias Torque =
    Quantity Float NewtonMeters


{-| Construct a torque value from a number of newton meters.
-}
newtonMeters : Float -> Torque
newtonMeters numNewtonMeters =
    Quantity numNewtonMeters


{-| Convert a torque value to a number of newton meters.
-}
inNewtonMeters : Torque -> Float
inNewtonMeters (Quantity numNewtonMeters) =
    numNewtonMeters


{-| Construct a torque value from a number of kilogram meters.
-}
kilogramMeters : Float -> Torque
kilogramMeters numKilogramMeters =
    newtonMeters (9.80665 * numKilogramMeters)


{-| Convert a torque value to a number of kilogram meters.
-}
inKilogramMeters : Torque -> Float
inKilogramMeters energy =
    inNewtonMeters energy / 9.80665


{-| Construct a torque value from a number of pound feet.
-}
poundFeet : Float -> Torque
poundFeet numPoundFeet =
    newtonMeters (1.3558 * numPoundFeet)


{-| Convert a torque value to a number of pound feet.
-}
inPoundFeet : Torque -> Float
inPoundFeet energy =
    inNewtonMeters energy / 1.3558
