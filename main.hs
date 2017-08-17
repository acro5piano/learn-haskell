import Text.Regex
import Codec.Binary.UTF8.String

sub :: String -> String -> String -> String
sub subject re replace = decodeString $ subRegex (mkRegex re) (encodeString subject) replace

dispatch :: String -> [(String, String)] -> String
dispatch text [] = text
dispatch text (x:xs) = dispatch (sub text (fst x) (snd x)) xs

parse :: String -> String
parse text = dispatch text exps
    where exps = [("^- (.+)$", "<li>\\1</li>"), ("^# (.+)$", "<h1>\\1</h1>")]

main :: IO ()
main = do text <- readFile "./assets/test.md"
          mapM_ putStrLn (map parse (lines text))

