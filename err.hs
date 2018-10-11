
File.hs:62:18: error:
    * Couldn't match expected type `File' with actual type `Text'
    * In the expression: Data.Text.take 6 . readData . rawContent $ fd
      In a case alternative:
          'r' -> Data.Text.take 6 . readData . rawContent $ fd
      In the expression:
        case header fd of
          'r' -> Data.Text.take 6 . readData . rawContent $ fd
          'd' -> readData . rawContent $ fd
          _ -> Empty
   |
62 |             'r'->Data.Text.take 6 . readData . rawContent $ fd
   |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

File.hs:62:37: error:
    * Couldn't match type `[Int]' with `Text'
      Expected type: FileData -> Text
        Actual type: FileData -> [Int]
    * In the second argument of `(.)', namely `readData . rawContent'
      In the expression: Data.Text.take 6 . readData . rawContent
      In the expression: Data.Text.take 6 . readData . rawContent $ fd
   |
62 |             'r'->Data.Text.take 6 . readData . rawContent $ fd
   |                                     ^^^^^^^^^^^^^^^^^^^^^

File.hs:63:18: error:
    * Couldn't match expected type `File' with actual type `[Int]'
    * In the expression: readData . rawContent $ fd
      In a case alternative: 'd' -> readData . rawContent $ fd
      In the expression:
        case header fd of
          'r' -> Data.Text.take 6 . readData . rawContent $ fd
          'd' -> readData . rawContent $ fd
          _ -> Empty
   |
63 |             'd'->readData . rawContent $ fd
   |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^

File.hs:67:15: error:
    * Variable not in scope: catMaybes :: Maybe [Int] -> [Int]
    * Perhaps you want to add `catMaybes' to the import list
      in the import of `Data.Maybe' (File.hs:4:5-47).
   |
67 |     readData =catMaybes . readDataRaw .unpack 
   |               ^^^^^^^^^

File.hs:70:24: error:
    * Couldn't match type `[a0]' with `Int'
      Expected type: Maybe [Int]
        Actual type: Maybe [[a0]]
    * In the expression: go [] [] (x : xs)
      In an equation for `readDataRaw':
          readDataRaw (x : xs)
            = go [] [] (x : xs)
            where
                go _ ls [] = if length length ls > 0 then Just ls else Nothing
                go small big (x : xs)
                  = case x of
                      '}' -> Just (small : big)
                      ',' -> go ... small : big xs
   |
70 |     readDataRaw (x:xs)=go [] [](x:xs) where
   |                        ^^^^^^^^^^^^^^

File.hs:71:36: error:
    * Couldn't match expected type `[[a]] -> Integer'
                  with actual type `Int'
    * The function `length' is applied to two arguments,
      but its type `(t0 a1 -> Int) -> Int' has only one
      In the first argument of `(>)', namely `length length ls'
      In the expression: length length ls > 0
    * Relevant bindings include
        ls :: [[a]] (bound at File.hs:71:18)
        go :: [a] -> [a] -> [Char] -> Maybe [[a]] (bound at File.hs:71:13)
   |
71 |             go _ ls []         =if length length ls > 0  then Just ls else Nothing
   |                                    ^^^^^^^^^^^^^^^^

File.hs:74:42: error:
    * Couldn't match expected type `Maybe [[a]]'
                  with actual type `[[Char] -> Maybe [[a]]]'
    * In the expression: go [] small : big xs
      In a case alternative: ',' -> go [] small : big xs
      In the expression:
        case x of
          '}' -> Just (small : big)
          ',' -> go [] small : big xs
    * Relevant bindings include
        big :: [[a]] (bound at File.hs:72:22)
        small :: [a] (bound at File.hs:72:16)
        go :: [a] -> [a] -> [Char] -> Maybe [[a]] (bound at File.hs:71:13)
   |
74 |                                   ',' -> go [] small:big  xs 
   |                                          ^^^^^^^^^^^^^^^^^^^

File.hs:74:54: error:
    * Couldn't match expected type `[Char] -> [[Char] -> Maybe [[a]]]'
                  with actual type `[[a]]'
    * The function `big' is applied to one argument,
      but its type `[[a]]' has none
      In the second argument of `(:)', namely `big xs'
      In the expression: go [] small : big xs
    * Relevant bindings include
        big :: [[a]] (bound at File.hs:72:22)
        small :: [a] (bound at File.hs:72:16)
        go :: [a] -> [a] -> [Char] -> Maybe [[a]] (bound at File.hs:71:13)
   |
74 |                                   ',' -> go [] small:big  xs 
   |                                                      ^^^^^^^

File.hs:76:19: error:
    * Couldn't match type `File' with `Text'
      Expected type: File -> String
        Actual type: Text -> String
    * In the expression: unpack . fromText
      In an equation for `show': show = unpack . fromText
      In the instance declaration for `Show File'
   |
76 |             show =unpack.fromText              
   |                   ^^^^^^^^^^^^^^^
