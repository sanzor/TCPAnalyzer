module Main where 
    import System.Directory
    import Parsing(parseFile)
    import FileOps

    
    

  

    main::IO()
    main=do 
        dat<-parseFile "test.txt"
        putStrLn $ show dat


        
        
    
   