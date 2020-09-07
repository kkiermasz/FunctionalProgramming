import System.IO;
import System.Environment; 


lineCount :: Handle -> Int -> IO ()
lineCount handle n = do
                eof<-hIsEOF handle 
                if eof then (putStrLn (show n))
                        else 
                            do
                             line<-hGetLine handle
                             lineCount handle (n + 1)
                             return ()


main = do
    (firstArg:rest) <-getArgs
    fileHandle <-openFile firstArg ReadMode
    lineCount fileHandle 0
    hClose fileHandle
    