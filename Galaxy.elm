module Galaxy exposing (Galaxy, step)

import StarSystem exposing (StarSystem)


type alias Galaxy =
    { systems :
        List
            { distance : Float
            , orbitSpeed : Float
            , orbitPosition : Float
            , internals : StarSystem
            }
    }


step : Galaxy -> Galaxy
step galaxy =
    let
        updateSystem system =
            { system
                | internals = StarSystem.step system.internals
                , orbitPosition =
                    system.orbitPosition
                        + system.orbitSpeed
            }
    in
        { galaxy
            | systems = List.map updateSystem galaxy.systems
        }
