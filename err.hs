
TCPFile.hs:59:24: error:
    * Couldn't match expected type `TCPFile'
                  with actual type `Maybe b0'
    * In the expression:
        readHeader txt >>? \ h -> readFileData h txt >>? makeFile
      In an equation for `fromText':
          fromText txt
            = readHeader txt >>? \ h -> readFileData h txt >>? makeFile
      In the instance declaration for `TextEncode TCPFile'
   |
59 |         fromText txt = readHeader txt >>? \h->readFileData h txt >>? makeFile
   |                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

TCPFile.hs:59:70: error:
    * Couldn't match type `TCPFile' with `Maybe b0'
      Expected type: FileData -> Maybe b0
        Actual type: FileData -> TCPFile
    * In the second argument of `(>>?)', namely `makeFile'
      In the expression: readFileData h txt >>? makeFile
      In the second argument of `(>>?)', namely
        `\ h -> readFileData h txt >>? makeFile'
   |
59 |         fromText txt = readHeader txt >>? \h->readFileData h txt >>? makeFile
   |                                                                      ^^^^^^^^
