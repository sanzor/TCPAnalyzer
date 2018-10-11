
File.hs:36:28: error:
    * Couldn't match expected type `Text' with actual type `[a2]'
    * In the expression:
        (pack "r:{") ++ fromMaybe (pack "emptyFile") mr ++ (pack "r:}")
      In a case alternative:
          (Rfile mr)
            -> (pack "r:{") ++ fromMaybe (pack "emptyFile") mr ++ (pack "r:}")
      In the expression:
        case f of
          (Rfile mr)
            -> (pack "r:{") ++ fromMaybe (pack "emptyFile") mr ++ (pack "r:}")
          (Dfile s) -> undefined
   |
36 |              (Rfile mr) -> (pack "r:{")++fromMaybe (pack "emptyFile") mr++(pack "r:}")
   |                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

File.hs:36:29: error:
    * Couldn't match expected type `[a2]' with actual type `Text'
    * In the first argument of `(++)', namely `(pack "r:{")'
      In the expression:
        (pack "r:{") ++ fromMaybe (pack "emptyFile") mr ++ (pack "r:}")
      In a case alternative:
          (Rfile mr)
            -> (pack "r:{") ++ fromMaybe (pack "emptyFile") mr ++ (pack "r:}")
   |
36 |              (Rfile mr) -> (pack "r:{")++fromMaybe (pack "emptyFile") mr++(pack "r:}")
   |                             ^^^^^^^^^^

File.hs:36:42: error:
    * Couldn't match expected type `[a2]' with actual type `Text'
    * In the first argument of `(++)', namely
        `fromMaybe (pack "emptyFile") mr'
      In the second argument of `(++)', namely
        `fromMaybe (pack "emptyFile") mr ++ (pack "r:}")'
      In the expression:
        (pack "r:{") ++ fromMaybe (pack "emptyFile") mr ++ (pack "r:}")
   |
36 |              (Rfile mr) -> (pack "r:{")++fromMaybe (pack "emptyFile") mr++(pack "r:}")
   |                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

File.hs:36:71: error:
    * Couldn't match type `Readme' with `Text'
      Expected type: Maybe Text
        Actual type: Maybe Readme
    * In the second argument of `fromMaybe', namely `mr'
      In the first argument of `(++)', namely
        `fromMaybe (pack "emptyFile") mr'
      In the second argument of `(++)', namely
        `fromMaybe (pack "emptyFile") mr ++ (pack "r:}")'
   |
36 |              (Rfile mr) -> (pack "r:{")++fromMaybe (pack "emptyFile") mr++(pack "r:}")
   |                                                                       ^^

File.hs:36:76: error:
    * Couldn't match expected type `[a2]' with actual type `Text'
    * In the second argument of `(++)', namely `(pack "r:}")'
      In the second argument of `(++)', namely
        `fromMaybe (pack "emptyFile") mr ++ (pack "r:}")'
      In the expression:
        (pack "r:{") ++ fromMaybe (pack "emptyFile") mr ++ (pack "r:}")
   |
36 |              (Rfile mr) -> (pack "r:{")++fromMaybe (pack "emptyFile") mr++(pack "r:}")
   |                                                                            ^^^^^^^^^^

File.hs:38:23: error:
    * Couldn't match expected type `Text' with actual type `[Text]'
    * In the pattern: x : xs
      In an equation for `fromText':
          fromText (x : xs)
            = case Data.Text.head x of
                'r' -> readContent xs
                'd' -> undefined
      In the instance declaration for `TextEncode File'
   |
38 |             fromText (x:xs)= case Data.Text.head  x of
   |                       ^^^^

File.hs:39:20: error:
    * Couldn't match expected type `File'
                  with actual type `Maybe [Double]'
    * In the expression: readContent xs
      In a case alternative: 'r' -> readContent xs
      In the expression:
        case Data.Text.head x of
          'r' -> readContent xs
          'd' -> undefined
   |
39 |              'r' ->readContent xs
   |                    ^^^^^^^^^^^^^^

File.hs:39:32: error:
    * Couldn't match type `Text' with `Char'
      Expected type: String
        Actual type: [Text]
    * In the first argument of `readContent', namely `xs'
      In the expression: readContent xs
      In a case alternative: 'r' -> readContent xs
   |
39 |              'r' ->readContent xs
   |                                ^^

File.hs:43:24: error:
    * Couldn't match type `[a0]' with `Double'
      Expected type: Maybe [Double]
        Actual type: Maybe [[a0]]
    * In the expression: go [] [] (x : xs)
      In an equation for `readContent':
          readContent (x : xs)
            = go [] [] (x : xs)
            where
                go _ ls [] = if length length ls > 0 then Just ls else Nothing
                go small big (x : xs)
                  = case x of
                      '}' -> Just (small : big)
                      ',' -> go ... small : big xs
   |
43 |     readContent (x:xs)=go [] [](x:xs) where
   |                        ^^^^^^^^^^^^^^

File.hs:44:32: error:
    * Couldn't match expected type `[[a]] -> Integer'
                  with actual type `Int'
    * The function `length' is applied to two arguments,
      but its type `(t0 a1 -> Int) -> Int' has only one
      In the first argument of `(>)', namely `length length ls'
      In the expression: length length ls > 0
    * Relevant bindings include
        ls :: [[a]] (bound at File.hs:44:14)
        go :: [a] -> [a] -> [Char] -> Maybe [[a]] (bound at File.hs:44:9)
   |
44 |         go _ ls []         =if length length ls > 0  then Just ls else Nothing
   |                                ^^^^^^^^^^^^^^^^

File.hs:47:38: error:
    * Couldn't match expected type `Maybe [[a]]'
                  with actual type `[[Char] -> Maybe [[a]]]'
    * In the expression: go [] small : big xs
      In a case alternative: ',' -> go [] small : big xs
      In the expression:
        case x of
          '}' -> Just (small : big)
          ',' -> go [] small : big xs
    * Relevant bindings include
        big :: [[a]] (bound at File.hs:45:18)
        small :: [a] (bound at File.hs:45:12)
        go :: [a] -> [a] -> [Char] -> Maybe [[a]] (bound at File.hs:44:9)
   |
47 |                               ',' -> go [] small:big  xs 
   |                                      ^^^^^^^^^^^^^^^^^^^

File.hs:47:50: error:
    * Couldn't match expected type `[Char] -> [[Char] -> Maybe [[a]]]'
                  with actual type `[[a]]'
    * The function `big' is applied to one argument,
      but its type `[[a]]' has none
      In the second argument of `(:)', namely `big xs'
      In the expression: go [] small : big xs
    * Relevant bindings include
        big :: [[a]] (bound at File.hs:45:18)
        small :: [a] (bound at File.hs:45:12)
        go :: [a] -> [a] -> [Char] -> Maybe [[a]] (bound at File.hs:44:9)
   |
47 |                               ',' -> go [] small:big  xs 
   |                                                  ^^^^^^^

File.hs:56:15: error:
    * Couldn't match type `File' with `Text'
      Expected type: File -> String
        Actual type: Text -> String
    * In the expression: unpack . fromText
      In an equation for `show': show = unpack . fromText
      In the instance declaration for `Show File'
   |
56 |         show =unpack.fromText 
   |               ^^^^^^^^^^^^^^^
