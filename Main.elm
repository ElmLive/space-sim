module Main exposing (..)

import Html.App
import Sim.SinglePlanet


main : Program Never
main =
    Html.App.program
        { init = ( Sim.SinglePlanet.init, Cmd.none )
        , subscriptions = Sim.SinglePlanet.subscriptions
        , update =
            \msg model ->
                ( Sim.SinglePlanet.update msg model
                , Cmd.none
                )
        , view = Sim.SinglePlanet.view
        }
