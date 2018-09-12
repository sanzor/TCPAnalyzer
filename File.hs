module File(parseFile) where 
    import qualified Data.Text as T
    import qualified Data.Text.IO as I
    import Control.Monad(forM,mapM,forM_)
    import Prelude hiding((<>))


    (<>)::String->T.Text
    (<>) = T.pack
    
    (><)::T.Text->String
    (><) =T.unpack

    data File=Rfile (Maybe Readme) | Dfile ([Maybe Double]) deriving(Show)
    
    data Readme=Readme{
        maxClients::Int,
        minClients::Int,
        stepClients::Int,
        maxDelay::Int,
        minDelay::Int,
        stepDelay::Int
    }deriving(Show)
    
    

    --first line split in 6 elements
    parseRfile::[T.Text]->Maybe Readme
    parseRfile arr |  Prelude.length arr /= 6  = Nothing
                   | otherwise = Just Readme{
                         maxClients=read . (><) . head $ arr ::Int,
                         minClients=read . (><) $ arr!!1 ::Int,
                         stepClients=read . (><) $ arr!!2 ::Int,
                         maxDelay=read . (><) $ arr!!3::Int,
                         minDelay=read . (><) $ arr!!4::Int,
                         stepDelay=read . (><) $ arr!!5 ::Int
                     }
    --data lines
    parseDfile::[T.Text]->IO [Maybe Double]
    parseDfile lines = forM lines $ \line ->
                          do   
                          let value = (read::String->Double) . T.unpack $ line 
                          print .show $ value
                          return (Just value)
        
              
    
   
    
    parseFile::FilePath->IO (Maybe File)
    parseFile fileName=I.readFile fileName>>= \text ->
        do
        let ! lines =  T.splitOn  ("," <>)  text
        let len=Prelude.length lines
        if len==1 then
            do
                let content=head  lines
                let values=T.splitOn ("," <>) content   -- de ce nu merge ( "," <>) ca la (1+)
                let readme=return Readme (parseRfile values)
                case Prelude.length content of
                     6 -> return (Just (Rfile readme))
                     _ -> error "invalid format"
        else
            do
                content <- parseDfile lines
                return (Just Dfile  content)
                
        
    
