module Main exposing (..)

import Html.App
import Sim.SingleGalaxy


main : Program Never
main =
    Html.App.program
        { init = ( Sim.SingleGalaxy.init, Cmd.none )
        , subscriptions = Sim.SingleGalaxy.subscriptions
        , update =
            \msg model ->
                ( Sim.SingleGalaxy.update msg model
                , Cmd.none
                )
        , view = Sim.SingleGalaxy.view
        }
