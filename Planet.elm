module Planet exposing (Planet, testPlanet, step)


type alias Planet =
    { resources : Float
    , food : Float
    , foodGrowth : Float
    , population : Float
    , technology :
        Float
        -- Between 0.0 and 1.0
    , pollution :
        Float
        -- Between 0.0 and 1.0
    , name : String
    , age : Int
    }


testPlanet : Planet
testPlanet =
    { resources = 10000
    , food = 500
    , foodGrowth = 500
    , population = 100
    , technology = 0
    , pollution = 0
    , name = "Testopia"
    , age = 0
    }


step : Planet -> Planet
step planet =
    { planet
        | resources =
            planet.resources
                - (planet.population * (0.1 + planet.technology))
                |> max 0
        , food =
            planet.food
                - planet.population
                + (planet.foodGrowth * (1 - planet.pollution))
                |> max 0
        , population =
            planet.population
                * 1.01
                |> max 0
        , technology =
            if planet.technology == 0 then
                (planet.population / 100000)
            else
                planet.technology
                    * (1 + (planet.population / 100000))
        , pollution =
            planet.technology
        , age = planet.age + 1
    }
