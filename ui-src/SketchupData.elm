port module SketchupData exposing (DialogData, call_dialog, from_ruby, to_ruby)

import Json.Decode as D
import Json.Encode as E


type alias DialogData =
    { m : String
    , d : E.Value
    }


port call_dialog : DialogData -> Cmd msg


port from_ruby : (D.Value -> msg) -> Sub msg


to_ruby : String -> E.Value -> Cmd msg
to_ruby m d =
    call_dialog <| DialogData m d
