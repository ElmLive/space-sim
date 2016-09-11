module StarSystem exposing (StarSystem, step)

import Planet exposing (Planet)


type alias StarSystem =
    { starMass : Float
    , planets :
        List
            { distance : Float
            , orbitSpeed : Float
            , orbitPosition : Float
            , internals : Planet
            }
    }


step : StarSystem -> StarSystem
step system =
    let
        updatePlanet planet =
            { planet
                | internals = Planet.step planet.internals
                , orbitPosition =
                    planet.orbitPosition
                        + planet.orbitSpeed
            }
    in
        { system
            | planets =
                List.map updatePlanet system.planets
        }
