module File where 
    import Text.Read(readMaybe)
    import Data.Text(pack,unpack,splitOn,Text,concat)
    import Data.Maybe


    data File=Rfile (Maybe Readme) | Dfile  Samples
    
    data Readme=Readme{
        maxClients::Int,
        minClients::Int,
        stepClients::Int,
        maxDelay::Int,
        minDelay::Int,
        stepDelay::Int}deriving(Show)

    newtype Samples=Samples{values::[Maybe Double]}deriving(Show)

    class FileText  a where
        fromFile::a->Text
        toFile::Text->a

    instance FileText Samples where
        fromFile s=Data.Text.concat ( mapMaybe select (values s)) where
             select mDouble=case mDouble of 
                Just value ->Just (pack.show $ value)
                Nothing -> Nothing
        toFile text=Samples  (map (readMaybe.unpack) (splitOn (pack ",") text))
    instance Show File where
        show =unpack.fromFile 