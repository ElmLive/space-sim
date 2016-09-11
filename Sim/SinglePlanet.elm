module Sim.SinglePlanet
    exposing
        ( Model
        , init
        , update
        , view
        , subscriptions
        )

import Chart
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
    Html.div []
        [ Html.text <| toString model.planet
        , Chart.pie
            [ model.planet.resources
            , model.planet.food
            , model.planet.population
            , 1000 * model.planet.technology
            ]
            [ "Resources"
            , "Food"
            , "Population"
            , "Technology"
            ]
            |> Chart.title (model.planet.name ++ " (Year " ++ toString model.planet.age ++ ")")
            |> Chart.toHtml
        ]



-- SUB


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every (0.05 * Time.second) Tick
