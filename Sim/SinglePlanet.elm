module Sim.SinglePlanet
    exposing
        ( Model
        , init
        , update
        , view
        , subscriptions
        )

import Html exposing (Html)
import Planet exposing (Planet)
import Time exposing (Time)


type alias Model =
    { planet : Planet }


init : Model
init =
    { planet = Planet.testPlanet
    }



-- UPDATE


type Msg
    = Tick Time


update : Msg -> Model -> Model
update msg model =
    case msg of
        Tick _ ->
            { model | planet = Planet.step model.planet }



-- VIEW


view : Model -> Html Msg
view model =
    Html.text <| toString model



-- SUB


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every (0.2 * Time.second) Tick
