module Paths_Real (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/bsd/.cabal/bin"
libdir     = "/home/bsd/.cabal/lib/x86_64-linux-ghc-7.10.3/Real-0.1.0.0-6eqGUWuWh236szyOiEsGFd"
datadir    = "/home/bsd/.cabal/share/x86_64-linux-ghc-7.10.3/Real-0.1.0.0"
libexecdir = "/home/bsd/.cabal/libexec"
sysconfdir = "/home/bsd/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Real_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Real_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "Real_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Real_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Real_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
