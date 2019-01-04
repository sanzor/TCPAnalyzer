module Main where 
    import Prelude hiding(readFile,writeFile)
    import Data.Text.IO(readFile,writeFile)
    import Data.List(intercalate)
    import Data.Text(Text)
    import System.Directory(getDirectoryContents,getCurrentDirectory)
    import qualified Data.Map as Map
    import Control.Monad(forM_,forM)
    import System.Environment(getArgs)


    import Tcp(TCPFile)
    import Classes(TextEncode,
                   toText,
                   fromText)
    import Utils(u,p)
    

    main::IO()
    main=do
        let fpath="files"
        fileNames<- fmap filterFiles $  getFiles fpath
        fn<-mapM (\x ->
            do 
               let p= pathCombine [fpath,x]
               fmap (writeFile ("./out/"++x)) (readFile p)
               
               
            ) fileNames
        putStrLn "done"

    parse::Text->TCPFile
    parse =fromText       
    pathCombine::[String]->String
    pathCombine ls="." ++ foldl (\x y-> x++"/"++y) "" ls
        
    getFiles::FilePath->IO [String]
    getFiles  = getDirectoryContents

    filterFiles::[String]->[String]
    filterFiles = filter (\x-> head x /= '.')

   
   

   

    
