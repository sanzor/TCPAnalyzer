module Parsing(parseFile) where 
    import File
    import Data.Maybe
    import Control.Monad(forM,mapM,forM_)
    import Data.Text(Text,splitOn,unpack,pack)
    import Data.Text.IO as I
    import Text.Read
   
    
    import Prelude hiding((<>))

    (<>)::String->Text
    (<>) = pack
    (><)::Text->String
    (><) =unpack
    coma=(<>) ","


    parseFile::FilePath->IO  File
    parseFile fileName= do
        text<-I.readFile fileName
        let ! fileLines =  splitOn  coma text
        let rowsCount=Prelude.length fileLines
        case rowsCount of 
         1 -> do
            let cells=splitOn coma (Prelude.head fileLines)
            let readme=parseReadme cells
            return (Rfile (fromMaybe  Nothing  (Just readme)))
         _ -> do
                let !samples=fromMaybe (Samples []) (parseSamples fileLines)
                return (Dfile  samples)
    


    parseReadme::[Text]->Maybe Readme
    parseReadme arr |  Prelude.length arr /= 6  = Nothing
                    |  otherwise = Just Readme{
                         maxClients=read . (><) . Prelude.head $ arr ::Int,
                         minClients=read . (><) $ arr!!1 ::Int,
                         stepClients=read . (><) $ arr!!2 ::Int,
                         maxDelay=read . (><) $ arr!!3::Int,
                         minDelay=read . (><) $ arr!!4::Int,
                         stepDelay=read . (><) $ arr!!5 ::Int
                     }



    parseSamples::[Text]->Maybe Samples
    parseSamples [] =  Nothing
    parseSamples textValues =  Just (Samples (map (readMaybe.unpack) textValues)) 

    