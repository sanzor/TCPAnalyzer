module File where 

    import Data.Text(pack,unpack,splitOn)
    data File=Rfile (Maybe Readme) | Dfile  Samples
    
    data Readme=Readme{
        maxClients::Int,
        minClients::Int,
        stepClients::Int,
        maxDelay::Int,
        minDelay::Int,
        stepDelay::Int}deriving(Show)

    newtype Samples=Samples{values::[Maybe Double]}deriving(Show)

    class FileFormat  a where
        toFile::a->Text
        fromFile::Text->a
    instance FileFormat Samples where
        toFile s=mapMaybe trm  $ values s where 
                 case trm val of
                  Just nr ->  Just (pack . show $ nr)
                  _       ->  Nothing

        fromFile s=mapMaybe (readMaybe.unpack) (splitOn (pack ",") s)