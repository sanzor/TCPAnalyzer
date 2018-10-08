module Misc((<>),(><),coma)where
    import Prelude hiding((<>))
    import Data.Text(Text,pack,unpack)
    
    (<>)::String->Text
    (<>) = pack
    (><)::Text->String
    (><) =unpack

    coma=(<>) ","