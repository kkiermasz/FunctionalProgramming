import System.IO;

readAndDisplay :: String -> IO()
readAndDisplay str =
    if str == "."
        then
            return ()
        else
            do
                putStrLn (show(reverse str))
                newLine <- getLine
                readAndDisplay newLine

main = do
    str <- getLine
    readAndDisplay str
