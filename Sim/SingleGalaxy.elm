module Sim.SingleGalaxy
    exposing
        ( Model
        , init
        , update
        , view
        , subscriptions
        )

import Color
import Galaxy exposing (Galaxy)
import Graphics.Render exposing (..)
import Html exposing (Html)
import Planet
import Time exposing (Time)


type alias Model =
    { galaxy : Galaxy }


init : Model
init =
    { galaxy =
        { systems =
            [ { distance = 1
              , orbitSpeed = 1
              , orbitPosition = 0
              , internals =
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
            , { distance = 1.1
              , orbitSpeed = 1
              , orbitPosition = 2
              , internals =
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
            , { distance = 0.9
              , orbitSpeed = 1.2
              , orbitPosition = 0
              , internals =
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
            , { distance = 3
              , orbitSpeed = 0.4
              , orbitPosition = 20
              , internals =
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
            { model | galaxy = Galaxy.step model.galaxy }



-- VIEW


view : Model -> Html Msg
view model =
    let
        star =
            circle 5
                |> solidFill Color.yellow

        system s =
            group
                [ star
                , group <| List.map planet s.planets
                ]

        planet p =
            group
                [ rectangle 2 2
                    |> solidFill Color.green
                    |> move (p.distance * 3) 0
                    |> (\x -> group [ x ])
                    |> rotate (p.orbitPosition / 100)
                ]

        galaxies =
            List.map galaxy model.galaxy.systems

        galaxy s =
            system s.internals
                |> move (s.distance * 30) 0
                |> (\x -> group [ x ])
                |> rotate (s.orbitPosition / 100)
    in
        Html.div []
            [ Html.text ""
              -- <| toString model
            , group galaxies
                |> svg 500 500
            ]



-- SUB


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every (0.05 * Time.second) Tick
