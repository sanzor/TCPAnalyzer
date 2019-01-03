module Main where 
    import Prelude hiding(readFile,writeFile)
    import Data.Text(Text,pack,unpack)
    import Data.Text.IO(readFile,writeFile)
    import System.Directory(getDirectoryContents)
    import Classes(TextEncode,toText,fromText)
    import Control.Monad(forM_,filterM)
    import Text.Regex
    import qualified Data.Map as Map
    import Tcp(TCPFile)
    main::IO()
    main=do
        putStrLn "aa"

        
    getFiles::FilePath->IO [String]
    getFiles  = getDirectoryContents

   


   

   

    
