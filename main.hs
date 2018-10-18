module Main where 
    import Data.Text(Text,pack,unpack)
    import Data.Text.IO(readFile,writeFile)
    import TCPFile(TCPFile)
    import TCPEncoding(toText,fromText)
    main::IO()
    main=do
        dat<-readTcpFile "test.txt"
        writeTcpFile "output.txt" dat
    
    writeTcpFile::FilePath->TCPFile->IO()
    writeTcpFile path file=Data.Text.IO.writeFile path (toText file)

    readTcpFile::FilePath->IO TCPFile
    readTcpFile path =fromText <$> Data.Text.IO.readFile path  