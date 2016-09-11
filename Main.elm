module Main exposing (..)

import Html.App
import Sim.SingleSystem


main : Program Never
main =
    Html.App.program
        { init = ( Sim.SingleSystem.init, Cmd.none )
        , subscriptions = Sim.SingleSystem.subscriptions
        , update =
            \msg model ->
                ( Sim.SingleSystem.update msg model
                , Cmd.none
                )
        , view = Sim.SingleSystem.view
        }
