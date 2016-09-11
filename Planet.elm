module Planet exposing (..)


type alias Planet =
    { resources : Int
    , food : Int
    , population : Int
    , technology : Float
    }


testPlanet : Planet
testPlanet =
    { resources = 10000
    , food = 500
    , population = 100
    , technology = 0
    }


step : Planet -> Planet
step planet =
    { planet | population = planet.population - 1 }
