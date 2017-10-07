import Prelude
import Graphics.UI.SDL as SDL

quitHandler :: IO ()
quitHandler = do
    e <- waitEvent
    case e of
        Quit -> return ()
        otherwise -> quitHandler

white = SDL.Pixel 0x00FFFFFF
grey  = SDL.Pixel 0x00888888
black = SDL.Pixel 0x00000000

rect1 = SDL.Rect 10 10 250 250
rect2 = SDL.Rect 40 40 100 100

main :: IO ()
main = do
    SDL.init [InitEverything]
    setVideoMode 640 480 32 []
    screen <- getVideoSurface
    SDL.fillRect screen (Just rect1) white
    SDL.fillRect screen (Just rect2) grey
    SDL.flip screen
    quitHandler
