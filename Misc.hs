module Misc((<>),(><),coma)where
    import Data.Text(Text,pack,unpack)
    
    (<>)::String->Text
    (<>) = pack
    (><)::Text->String
    (><) =unpack

    coma=(<>) ","