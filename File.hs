module File where 

    import Data.Text 
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
        toBfile s=undefined