module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)


--model


type alias Model =
    { calories : Int
    , total : Int
    }


initModel : Model
initModel =
    { calories = 0
    , total = 0
    }



--update


type Msg
    = AddCalorie
    | Change String
    | Clear


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddCalorie ->
            { model | total = model.total + model.calories }

        Change s ->
            { model | calories = (String.toInt s) |> Result.toMaybe |> Maybe.withDefault 0 }

        Clear ->
            initModel



--view


view : Model -> Html Msg
view model =
    div []
        [ h3 []
            [ text ("Total Calories: " ++ (toString model.total)) ]
        , input [ placeholder "Type calories", onInput Change ]
            []
        , button
            [ type_ "button"
            , onClick AddCalorie
            ]
            [ text "Add" ]
        , button
            [ type_ "button"
            , onClick Clear
            ]
            [ text "Clear" ]
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = initModel, view = view, update = update }
