module File where 
    import Text.Read(readMaybe)
    import Data.Text(pack,unpack,splitOn,Text,concat)
    import Data.Maybe
    import Data.List(intercalate)
    import Misc((<>),(><),coma)


    data File=Rfile (Maybe Readme) | Dfile  Samples
    
    data Readme=Readme{
        maxClients::Int,
        minClients::Int,
        stepClients::Int,
        maxDelay::Int,
        minDelay::Int,
        stepDelay::Int}deriving(Show)

    newtype Samples=Samples{values::[Maybe Double]}deriving(Show)

    class TextEncode  a where
        toText::a->Text
        fromText::Text->a

    instance TextEncode Samples where
        toText s=Data.Text.concat ( mapMaybe select (values s)) where
             select mDouble=case mDouble of 
                Just value ->Just (pack.show $ value)
                Nothing -> Nothing
        fromText text=Samples  (map (readMaybe.unpack) (splitOn (pack ",") text))
    
    instance TextEncode Readme where
        toText r=intercalate "," [maxClients,minClients,stepClients,maxDelay,minDelay,stepDelay]
    instance TextEncode File where
        toText (Rfile c)=

    instance Show File where
        show =unpack.fromText 
