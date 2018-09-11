module File(parseFile) where 
    import qualified Data.Text as T
    import qualified Data.Text.IO as I
    import Control.Monad(forM,mapM,forM_)

    data File=Rfile (Maybe Readme) | Dfile ([Maybe Double]) deriving(Show)
    
    data Readme=Readme{
        maxClients::Int,
        minClients::Int,
        stepClients::Int,
        maxDelay::Int,
        minDelay::Int,
        stepDelay::Int
    }deriving(Show)
    
    

    
    parseRfile::[T.Text]->Maybe Readme
    parseRfile arr |  Prelude.length arr /= 6  = Nothing
                   | otherwise = Just Readme{
                         maxClients=read . T.unpack $ head arr ::Int,
                         minClients=read . T.unpack $ arr!!1 ::Int,
                         stepClients=read . T.unpack $ arr!!2 ::Int,
                         maxDelay=read . T.unpack $ arr!!3::Int,
                         minDelay=read . T.unpack $ arr!!4::Int,
                         stepDelay=read. T.unpack $ arr!!5 ::Int
                     }
    
    parseDfile::[T.Text]-> [Maybe Double]
    parseDfile = map (\line->Just(read. T.unpack $ line::Double))
                             
    

    parseFile::FilePath->IO (Maybe File)
    parseFile fileName=I.readFile fileName>>= \text ->
        do
         let ! lines = T.splitOn (T.pack ",") text 
         I.putStrLn . T.pack . show. Prelude.length $ lines
         forM_ lines I.putStrLn
         case Prelude.length lines of 
          1 -> return $ Just (Rfile  (parseRfile lines))
          _ -> return $ Just (Dfile  (parseDfile lines))
    
