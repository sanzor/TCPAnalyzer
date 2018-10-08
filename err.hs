
File.hs:33:18: error:
    * Couldn't match expected type `Text' with actual type `[Char]'
    * In the expression:
        intercalate
          "," [maxClients, minClients, stepClients, maxDelay, ....]
      In an equation for `toText':
          toText r
            = intercalate "," [maxClients, minClients, stepClients, ....]
      In the instance declaration for `TextEncode Readme'
   |
33 |         toText r=intercalate "," [maxClients,minClients,stepClients,maxDelay,minDelay,stepDelay]
   |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

File.hs:33:35: error:
    * Couldn't match expected type `[Char]'
                  with actual type `Readme -> Int'
    * Probable cause: `maxClients' is applied to too few arguments
      In the expression: maxClients
      In the second argument of `intercalate', namely
        `[maxClients, minClients, stepClients, maxDelay, ....]'
      In the expression:
        intercalate
          "," [maxClients, minClients, stepClients, maxDelay, ....]
   |
33 |         toText r=intercalate "," [maxClients,minClients,stepClients,maxDelay,minDelay,stepDelay]
   |                                   ^^^^^^^^^^

File.hs:33:46: error:
    * Couldn't match expected type `[Char]'
                  with actual type `Readme -> Int'
    * Probable cause: `minClients' is applied to too few arguments
      In the expression: minClients
      In the second argument of `intercalate', namely
        `[maxClients, minClients, stepClients, maxDelay, ....]'
      In the expression:
        intercalate
          "," [maxClients, minClients, stepClients, maxDelay, ....]
   |
33 |         toText r=intercalate "," [maxClients,minClients,stepClients,maxDelay,minDelay,stepDelay]
   |                                              ^^^^^^^^^^

File.hs:33:57: error:
    * Couldn't match expected type `[Char]'
                  with actual type `Readme -> Int'
    * Probable cause: `stepClients' is applied to too few arguments
      In the expression: stepClients
      In the second argument of `intercalate', namely
        `[maxClients, minClients, stepClients, maxDelay, ....]'
      In the expression:
        intercalate
          "," [maxClients, minClients, stepClients, maxDelay, ....]
   |
33 |         toText r=intercalate "," [maxClients,minClients,stepClients,maxDelay,minDelay,stepDelay]
   |                                                         ^^^^^^^^^^^

File.hs:33:69: error:
    * Couldn't match expected type `[Char]'
                  with actual type `Readme -> Int'
    * Probable cause: `maxDelay' is applied to too few arguments
      In the expression: maxDelay
      In the second argument of `intercalate', namely
        `[maxClients, minClients, stepClients, maxDelay, ....]'
      In the expression:
        intercalate
          "," [maxClients, minClients, stepClients, maxDelay, ....]
   |
33 |         toText r=intercalate "," [maxClients,minClients,stepClients,maxDelay,minDelay,stepDelay]
   |                                                                     ^^^^^^^^

File.hs:33:78: error:
    * Couldn't match expected type `[Char]'
                  with actual type `Readme -> Int'
    * Probable cause: `minDelay' is applied to too few arguments
      In the expression: minDelay
      In the second argument of `intercalate', namely
        `[maxClients, minClients, stepClients, maxDelay, ....]'
      In the expression:
        intercalate
          "," [maxClients, minClients, stepClients, maxDelay, ....]
   |
33 |         toText r=intercalate "," [maxClients,minClients,stepClients,maxDelay,minDelay,stepDelay]
   |                                                                              ^^^^^^^^

File.hs:33:87: error:
    * Couldn't match expected type `[Char]'
                  with actual type `Readme -> Int'
    * Probable cause: `stepDelay' is applied to too few arguments
      In the expression: stepDelay
      In the second argument of `intercalate', namely
        `[maxClients, minClients, stepClients, maxDelay, ....]'
      In the expression:
        intercalate
          "," [maxClients, minClients, stepClients, maxDelay, ....]
   |
33 |         toText r=intercalate "," [maxClients,minClients,stepClients,maxDelay,minDelay,stepDelay]
   |                                                                                       ^^^^^^^^^

File.hs:35:26: error:
    * Variable not in scope:
        fromMaybe :: ([Char] -> [Char]) -> Maybe Text -> Text
    * Perhaps you want to add `fromMaybe' to the import list
      in the import of `Data.Maybe' (File.hs:4:5-38).
   |
35 |         toText (Rfile c)=fromMaybe (<> "empty") (fmap toText c)
   |                          ^^^^^^^^^

File.hs:38:15: error:
    * Couldn't match type `File' with `Text'
      Expected type: File -> String
        Actual type: Text -> String
    * In the expression: unpack . fromText
      In an equation for `show': show = unpack . fromText
      In the instance declaration for `Show File'
   |
38 |         show =unpack.fromText 
   |               ^^^^^^^^^^^^^^^
