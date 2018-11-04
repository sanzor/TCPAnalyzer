
TCPFile.hs:75:18: error:
    * Couldn't match expected type `Maybe TCPFile'
                  with actual type `TCPFile'
    * In the expression: Rfile (Just (fromText . rawContent $ fd))
      In a case alternative:
          'r' -> Rfile (Just (fromText . rawContent $ fd))
      In the expression:
        case ftype . header $ fd of
          'r' -> Rfile (Just (fromText . rawContent $ fd))
          'd' -> Dfile (fromText . rawContent $ fd)
          _ -> Empty
   |
75 |             'r'->Rfile (Just (fromText . rawContent $ fd))
   |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

TCPFile.hs:76:18: error:
    * Couldn't match expected type `Maybe TCPFile'
                  with actual type `TCPFile'
    * In the expression: Dfile (fromText . rawContent $ fd)
      In a case alternative: 'd' -> Dfile (fromText . rawContent $ fd)
      In the expression:
        case ftype . header $ fd of
          'r' -> Rfile (Just (fromText . rawContent $ fd))
          'd' -> Dfile (fromText . rawContent $ fd)
          _ -> Empty
   |
76 |             'd'->Dfile (fromText . rawContent $ fd)
   |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

TCPFile.hs:77:18: error:
    * Couldn't match expected type `Maybe TCPFile'
                  with actual type `TCPFile'
    * In the expression: Empty
      In a case alternative: _ -> Empty
      In the expression:
        case ftype . header $ fd of
          'r' -> Rfile (Just (fromText . rawContent $ fd))
          'd' -> Dfile (fromText . rawContent $ fd)
          _ -> Empty
   |
77 |             _  ->Empty 
   |                  ^^^^^
