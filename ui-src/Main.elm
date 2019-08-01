port module Main exposing (Model, Msg(..), init, main, subscriptions, update, view)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as D
import Json.Encode as E
import SketchupData


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


type alias Model =
    { test : Bool
    }


init : D.Value -> ( Model, Cmd Msg )
init flags =
    let
        model =
            Model False
    in
    update MsgSkip model


type Msg
    = MsgSkip
    | ToRuby E.Value


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MsgSkip ->
            ( model, Cmd.none )

        ToRuby json ->
            ( model, SketchupData.to_ruby "test" json )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- View


view : Model -> Html Msg
view model =
    div []
        [ text "test"
        , button [ onClick <| ToRuby <| E.string "str" ] [ text "a" ]
        ]
