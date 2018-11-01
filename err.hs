
TCPFile.hs:59:24: error:
    * Couldn't match expected type `TCPFile'
                  with actual type `Maybe b0'
    * In the expression:
        readHeader txt >>? \ h -> Just (FileData h txt) >>? makeFile
      In an equation for `fromText':
          fromText txt
            = readHeader txt >>? \ h -> Just (FileData h txt) >>? makeFile
      In the instance declaration for `TextEncode TCPFile'
   |
59 |         fromText txt = readHeader txt >>? \h-> Just ( FileData h txt )>>? makeFile
   |                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

TCPFile.hs:59:75: error:
    * Couldn't match type `TCPFile' with `Maybe b0'
      Expected type: FileData -> Maybe b0
        Actual type: FileData -> TCPFile
    * In the second argument of `(>>?)', namely `makeFile'
      In the expression: Just (FileData h txt) >>? makeFile
      In the second argument of `(>>?)', namely
        `\ h -> Just (FileData h txt) >>? makeFile'
   |
59 |         fromText txt = readHeader txt >>? \h-> Just ( FileData h txt )>>? makeFile
   |                                                                           ^^^^^^^^
