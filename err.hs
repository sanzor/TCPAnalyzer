
File.hs:32:26: error:
    * Couldn't match expected type `Text' with actual type `[a1]'
    * In the expression:
        (pack "r:{")
          ++ fromMaybe (pack "empty") (fmap toText c) ++ (pack "}")
      In an equation for `toText':
          toText (Rfile c)
            = (pack "r:{")
                ++ fromMaybe (pack "empty") (fmap toText c) ++ (pack "}")
      In the instance declaration for `TextEncode File'
   |
32 |         toText (Rfile c)=(pack "r:{")++fromMaybe (pack "empty") (fmap toText c)++ (pack "}")
   |                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

File.hs:32:27: error:
    * Couldn't match expected type `[a1]' with actual type `Text'
    * In the first argument of `(++)', namely `(pack "r:{")'
      In the expression:
        (pack "r:{")
          ++ fromMaybe (pack "empty") (fmap toText c) ++ (pack "}")
      In an equation for `toText':
          toText (Rfile c)
            = (pack "r:{")
                ++ fromMaybe (pack "empty") (fmap toText c) ++ (pack "}")
   |
32 |         toText (Rfile c)=(pack "r:{")++fromMaybe (pack "empty") (fmap toText c)++ (pack "}")
   |                           ^^^^^^^^^^

File.hs:32:40: error:
    * Couldn't match expected type `[a1]' with actual type `Text'
    * In the first argument of `(++)', namely
        `fromMaybe (pack "empty") (fmap toText c)'
      In the second argument of `(++)', namely
        `fromMaybe (pack "empty") (fmap toText c) ++ (pack "}")'
      In the expression:
        (pack "r:{")
          ++ fromMaybe (pack "empty") (fmap toText c) ++ (pack "}")
   |
32 |         toText (Rfile c)=(pack "r:{")++fromMaybe (pack "empty") (fmap toText c)++ (pack "}")
   |                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

File.hs:32:84: error:
    * Couldn't match expected type `[a1]' with actual type `Text'
    * In the second argument of `(++)', namely `(pack "}")'
      In the second argument of `(++)', namely
        `fromMaybe (pack "empty") (fmap toText c) ++ (pack "}")'
      In the expression:
        (pack "r:{")
          ++ fromMaybe (pack "empty") (fmap toText c) ++ (pack "}")
   |
32 |         toText (Rfile c)=(pack "r:{")++fromMaybe (pack "empty") (fmap toText c)++ (pack "}")
   |                                                                                    ^^^^^^^^

File.hs:33:26: error:
    * Couldn't match expected type `Text' with actual type `[a2]'
    * In the expression: (pack "d:{") ++ (toText s) ++ (pack "}")
      In an equation for `toText':
          toText (Dfile s) = (pack "d:{") ++ (toText s) ++ (pack "}")
      In the instance declaration for `TextEncode File'
   |
33 |         toText(Dfile s)= (pack "d:{")++(toText s) ++  (pack "}")
   |                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

File.hs:33:27: error:
    * Couldn't match expected type `[a2]' with actual type `Text'
    * In the first argument of `(++)', namely `(pack "d:{")'
      In the expression: (pack "d:{") ++ (toText s) ++ (pack "}")
      In an equation for `toText':
          toText (Dfile s) = (pack "d:{") ++ (toText s) ++ (pack "}")
   |
33 |         toText(Dfile s)= (pack "d:{")++(toText s) ++  (pack "}")
   |                           ^^^^^^^^^^

File.hs:33:41: error:
    * Couldn't match expected type `[a2]' with actual type `Text'
    * In the first argument of `(++)', namely `(toText s)'
      In the second argument of `(++)', namely `(toText s) ++ (pack "}")'
      In the expression: (pack "d:{") ++ (toText s) ++ (pack "}")
   |
33 |         toText(Dfile s)= (pack "d:{")++(toText s) ++  (pack "}")
   |                                         ^^^^^^^^

File.hs:33:56: error:
    * Couldn't match expected type `[a2]' with actual type `Text'
    * In the second argument of `(++)', namely `(pack "}")'
      In the second argument of `(++)', namely `(toText s) ++ (pack "}")'
      In the expression: (pack "d:{") ++ (toText s) ++ (pack "}")
   |
33 |         toText(Dfile s)= (pack "d:{")++(toText s) ++  (pack "}")
   |                                                        ^^^^^^^^

File.hs:34:36: error:
    * Couldn't match expected type `[a3]' with actual type `Text'
    * In the second argument of `take', namely `text'
      In the expression: take 1 text
      In the expression:
        case take 1 text of
          'r' -> Rfile (parseText text)
          'd' -> _
   |
34 |         fromText text =case take 1 text of
   |                                    ^^^^

File.hs:35:13: error:
    * Couldn't match expected type `[a3]' with actual type `Char'
    * In the pattern: 'r'
      In a case alternative: 'r' -> Rfile (parseText text)
      In the expression:
        case take 1 text of
          'r' -> Rfile (parseText text)
          'd' -> _
   |
35 |             'r' ->Rfile (parseText text) 
   |             ^^^

File.hs:35:26: error:
    * Couldn't match type `[Double]' with `Readme'
      Expected type: Maybe Readme
        Actual type: Maybe [Double]
    * In the first argument of `Rfile', namely `(parseText text)'
      In the expression: Rfile (parseText text)
      In a case alternative: 'r' -> Rfile (parseText text)
   |
35 |             'r' ->Rfile (parseText text) 
   |                          ^^^^^^^^^^^^^^

File.hs:37:13: error:
    * Couldn't match expected type `[a3]' with actual type `Char'
    * In the pattern: 'd'
      In a case alternative: 'd' -> _
      In the expression:
        case take 1 text of
          'r' -> Rfile (parseText text)
          'd' -> _
   |
37 |             'd' ->
   |             ^^^

File.hs:38:14: error:
    * Found hole: _ :: File
    * In the expression: _
      In a case alternative: 'd' -> _
      In the expression:
        case take 1 text of
          'r' -> Rfile (parseText text)
          'd' -> _
    * Relevant bindings include
        text :: Text (bound at File.hs:34:18)
        fromText :: Text -> File (bound at File.hs:34:9)
      Valid substitutions include
        undefined :: forall (a :: TYPE r).
                     GHC.Stack.Types.HasCallStack =>
                     a
          (imported from `Prelude' at File.hs:1:8-11
           (and originally defined in `GHC.Err'))
   |
38 |              _
   |              ^

File.hs:41:16: error:
    * Couldn't match expected type `Text' with actual type `[Char]'
    * In the pattern: x : xs
      In an equation for `parseText':
          parseText (x : xs)
            = go [] [] (x : xs)
            where
                go _ ls [] = if length ls == 6 then Just ls else Nothing
                go small big (x : xs)
                  = case x of {
                      ',' -> go ... ((read :: Text -> Double) . unpack small) : big xs }
   |
41 |     parseText (x:xs)=go [] [](x:xs) where
   |                ^^^^

File.hs:41:22: error:
    * Couldn't match type `[Char] -> Double' with `[Double]'
      Expected type: Maybe [Double]
        Actual type: Maybe ([Char] -> Double)
    * In the expression: go [] [] (x : xs)
      In an equation for `parseText':
          parseText (x : xs)
            = go [] [] (x : xs)
            where
                go _ ls [] = if length ls == 6 then Just ls else Nothing
                go small big (x : xs)
                  = case x of {
                      ',' -> go ... ((read :: Text -> Double) . unpack small) : big xs }
   |
41 |     parseText (x:xs)=go [] [](x:xs) where
   |                      ^^^^^^^^^^^^^^

File.hs:41:28: error:
    * Couldn't match expected type `[Char] -> Double'
                  with actual type `[a0]'
    * In the second argument of `go', namely `[]'
      In the expression: go [] [] (x : xs)
      In an equation for `parseText':
          parseText (x : xs)
            = go [] [] (x : xs)
            where
                go _ ls [] = if length ls == 6 then Just ls else Nothing
                go small big (x : xs)
                  = case x of {
                      ',' -> go ... ((read :: Text -> Double) . unpack small) : big xs }
   |
41 |     parseText (x:xs)=go [] [](x:xs) where
   |                            ^^

File.hs:42:9: error:
    * Couldn't match type `Text' with `[a]'
      Expected type: [a]
                     -> ([Char] -> Double) -> [Char] -> Maybe ([Char] -> Double)
        Actual type: Text
                     -> ([Char] -> Double) -> [Char] -> Maybe ([Char] -> Double)
    * In an equation for `parseText':
          parseText (x : xs)
            = go [] [] (x : xs)
            where
                go _ ls [] = if length ls == 6 then Just ls else Nothing
                go small big (x : xs)
                  = case x of {
                      ',' -> go ... ((read :: Text -> Double) . unpack small) : big xs }
    * Relevant bindings include
        go :: [a]
              -> ([Char] -> Double) -> [Char] -> Maybe ([Char] -> Double)
          (bound at File.hs:42:9)
   |
42 |         go _ ls []=if length ls == 6 then Just ls else Nothing
   |         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^...

File.hs:44:37: error:
    * Couldn't match expected type `Maybe ([Char] -> Double)'
                  with actual type `[[Char] -> Maybe ([Char] -> Double)]'
    * In the expression:
        go [] ((read :: Text -> Double) . unpack small) : big xs
      In a case alternative:
          ',' -> go [] ((read :: Text -> Double) . unpack small) : big xs
      In the expression:
        case x of {
          ',' -> go [] ((read :: Text -> Double) . unpack small) : big xs }
   |
44 |                               ',' ->go []  ((read::Text->Double). unpack small):big xs
   |                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

File.hs:44:46: error:
    * Couldn't match type `Text' with `[Char]'
      Expected type: Text -> Double
        Actual type: String -> Double
    * In the first argument of `(.)', namely `(read :: Text -> Double)'
      In the second argument of `go', namely
        `((read :: Text -> Double) . unpack small)'
      In the first argument of `(:)', namely
        `go [] ((read :: Text -> Double) . unpack small)'
   |
44 |                               ',' ->go []  ((read::Text->Double). unpack small):big xs
   |                                              ^^^^

File.hs:44:67: error:
    * Couldn't match type `[Char]' with `[Char] -> Text'
      Expected type: [Char] -> Text
        Actual type: String
    * Possible cause: `unpack' is applied to too many arguments
      In the second argument of `(.)', namely `unpack small'
      In the second argument of `go', namely
        `((read :: Text -> Double) . unpack small)'
      In the first argument of `(:)', namely
        `go [] ((read :: Text -> Double) . unpack small)'
   |
44 |                               ',' ->go []  ((read::Text->Double). unpack small):big xs
   |                                                                   ^^^^^^^^^^^^

File.hs:44:81: error:
    * Couldn't match type `Double'
                     with `[[Char] -> Maybe ([Char] -> Double)]'
      Expected type: [Char] -> [[Char] -> Maybe ([Char] -> Double)]
        Actual type: [Char] -> Double
    * The function `big' is applied to one argument,
      its type is `t0 a4',
      it is specialized to `[Char] -> Double'
      In the second argument of `(:)', namely `big xs'
      In the expression:
        go [] ((read :: Text -> Double) . unpack small) : big xs
   |
44 |                               ',' ->go []  ((read::Text->Double). unpack small):big xs
   |                                                                                 ^^^^^^

File.hs:48:15: error:
    * Couldn't match type `File' with `Text'
      Expected type: File -> String
        Actual type: Text -> String
    * In the expression: unpack . fromText
      In an equation for `show': show = unpack . fromText
      In the instance declaration for `Show File'
   |
48 |         show =unpack.fromText 
   |               ^^^^^^^^^^^^^^^
