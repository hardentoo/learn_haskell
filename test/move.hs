import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT
import Data.IORef
import Data.Time.Clock.POSIX

main = do
  _ <- getArgsAndInitialize
  _ <- createWindow "Jumping Triangle"
  tstamp <- getTimestamp
  st <- newIORef (0.0, 0.5, tstamp)
  displayCallback $= display st
  idleCallback $= Just (idle st)
  mainLoop

display st = do
  (dy, _, _) <- get st
  clear [ColorBuffer]
  currentColor $= Color4 1 0 0 1
  renderPrimitive Triangles $ do
    vertex $ Vertex3 (0    :: GLdouble) ( 0.5 + dy) 0
    vertex $ Vertex3 (0.5  :: GLdouble) (-0.5 + dy) 0
    vertex $ Vertex3 (-0.5 :: GLdouble) (-0.5 + dy) 0
  flush

idle st = do
  (dy, delta, prevTStamp) <- get st
  tstamp <- getTimestamp
  let dt = tstamp - prevTStamp
      dy' = dy + delta * dt
      delta' = if abs dy' <= 0.5 then delta else -delta
  st $=! (dy', delta', tstamp)
  postRedisplay Nothing

getTimestamp :: IO GLdouble
getTimestamp = do
  now <- getPOSIXTime
  return $ fromRational $ toRational now
