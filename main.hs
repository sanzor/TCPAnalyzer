module Main where 
    import System.Directory
    import Parsing(parseFile)
    import Data.Text.IO
    import FileOps

    main::IO()
    main=do 
        dat<-parseFile "test.txt"
        wrtiteFile "out.txt" dat
        Prelude.putStrLn $ show dat


        
        
    
   