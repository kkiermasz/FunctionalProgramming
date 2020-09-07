import System.IO;
import System.Environment; 

palindroms :: Int -> [String]
palindroms n = map (\x -> " a") [1..n]

writePalindroms :: Handle -> Int -> IO ()
writePalindroms handle n = do
                    hPutStrLn handle (takeWhile checkLength [(palindroms n)])
                    where checkLength lista = (length lista > 0)


main = do
    (firstArg:secondArg:rest) <-getArgs
    fileHandle <-openFile firstArg ReadMode
    writePalindroms fileHandle (read(secondArg))
    hClose fileHandle