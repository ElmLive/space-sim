module Sim.SingleSystem
    exposing
        ( Model
        , init
        , update
        , view
        , subscriptions
        )

import Color
import Graphics.Render exposing (..)
import Html exposing (Html)
import Planet exposing (Planet)
import StarSystem exposing (StarSystem)
import Time exposing (Time)


type alias Model =
    { system : StarSystem }


init : Model
init =
    { system =
        { starMass = 1
        , planets =
            [ { distance = 1
              , orbitSpeed = 1
              , orbitPosition = 0
              , internals = Planet.testPlanet
              }
            , { distance = 2
              , orbitSpeed = 1
              , orbitPosition = 0
              , internals = Planet.testPlanet
              }
            , { distance = 5
              , orbitSpeed = 3
              , orbitPosition = 0
              , internals = Planet.testPlanet
              }
            ]
        }
    }



-- UPDATE


type Msg
    = Tick Time


update : Msg -> Model -> Model
update msg model =
    case msg of
        Tick _ ->
            { model | system = StarSystem.step model.system }



-- VIEW


view : Model -> Html Msg
view model =
    let
        star =
            circle 10
                |> solidFill Color.yellow

        planets =
            List.map planet model.system.planets

        planet p =
            group
                [ rectangle 5 5
                    |> solidFill Color.green
                    |> move (p.distance * 30) 0
                    |> (\x -> group [ x ])
                    |> rotate (p.orbitPosition / 100)
                  -- TODO: draw planet orbits
                  -- , circle (p.distance * 30)
                  --     |> dotted 1 Color.grey
                ]
    in
        Html.div []
            [ Html.text ""
              -- <| toString model
            , group
                [ star
                , group planets
                ]
                |> svg 500 500
            ]



-- SUB


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every (0.05 * Time.second) Tick
