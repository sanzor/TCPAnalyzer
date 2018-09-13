module File(parseFile) where 
    import qualified Data.Text as T
    import qualified Data.Text.IO as I
    import Text.Read
    import Data.List
    import Control.Monad(forM,mapM,forM_)
    import Prelude hiding((<>))


    coma=((<>) ",") 

    (<>)::String->T.Text
    (<>) = T.pack
    (><)::T.Text->String
    (><) =T.unpack

    data File=Rfile (Maybe Readme) | Dfile ([Maybe Double]) 
    
    data Readme=Readme{
        maxClients::Int,
        minClients::Int,
        stepClients::Int,
        maxDelay::Int,
        minDelay::Int,
        stepDelay::Int
    }deriving(Show)
    
    instance Show File where 
        show =showFile
            --Data.List.intercalate "," [show e|e@(T (Just e)) <- ls]
    showFile::File->String
    showFile (Rfile Nothing) ="empty readme file"
    showFile (Rfile (Just x))=show x
    showFile (Dfile []) ="empty data file"
    showFile (Dfile ls)=Data.List.intercalate "," [show e| Just e<-ls] 
    --first line split in 6 elements

    parseFile::FilePath->IO (Maybe File)
    parseFile fileName=I.readFile fileName>>= \text ->
        do
        let ! lines =  T.splitOn  coma text
        let len=Prelude.length lines
        case len of 
         1 -> do
            let rowCells=T.splitOn coma (head lines)
            let readme=parseRfile rowCells
            case Prelude.length rowCells of
                 6 -> return (Just (Rfile readme))
                 _ -> error "invalid format"

         _ -> do
                I.putStrLn . (<>) $"reached other branch"
                content <- parseDfile lines
               
                forM_ content $ \mline ->
                    case mline of
                        Nothing -> I.putStrLn ((<>)"INVALID line")
                        Just val->I.putStrLn ((<>) .show $ val)
                return (Just (Dfile  content))
    
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
    parseDfile []= return [Nothing]
    parseDfile lines =return [e|Just e<-lines]
        
                          
        
              
    
    
    
    

    main::IO()
    main= do
        dt<-parseFile "test.txt"
        Prelude.putStrLn "finished"
        I.writeFile "out.txt" (T.pack.show $dt)
                
        
    
