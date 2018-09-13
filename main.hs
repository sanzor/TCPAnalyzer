module Main where 
    import System.Directory
    import  Data.Text 
    import Data.List  as L
    import qualified Data.Text.IO as I
    import File
    import Control.Monad(forM,mapM,filterM)

    
    

  

    main::IO()
    main=do 
        dat<-parseFile "test.txt"
        putStrLn $ show dat
        --folderNames<-filterM doesDirectoryExist (listDirectory dataPath)
        --let folders=Prelude.map parseFolder folderNames


        
        
    
   