{-# LANGUAGE OverloadedStrings #-}

{- |
Module      : Network.MPD.Commands.PlaybackControl
Copyright   : (c) Ben Sinclair 2005-2009, Joachim Fasting 2012
License     : MIT (see LICENSE)

Maintainer  : joachifm@fastmail.fm
Stability   : stable
Portability : unportable

Controlling playback.
-}

module Network.MPD.Commands.PlaybackControl
    ( next
    , pause
    , toggle
    , play
    , playId
    , previous
    , seek
    , seekId
    , seekCur
    , stop
    ) where

import qualified Network.MPD.Applicative.Internal as A
import qualified Network.MPD.Applicative.PlaybackControl as A
import           Network.MPD.Commands.Types
import           Network.MPD.Core

-- | Play the next song.
next :: MonadMPD m => m ()
next = A.runCommand A.next

-- | Pauses playback on True, resumes on False.
pause :: MonadMPD m => Bool -> m ()
pause = A.runCommand . A.pause

-- | Toggles play\/pause. Plays if stopped.
--
-- @since 0.10.0.0
toggle :: MonadMPD m => m ()
toggle = A.runCommand A.toggle

-- | Begin\/continue playing.
play :: MonadMPD m => Maybe Position -> m ()
play = A.runCommand . A.play

-- | Play a file with given id.
playId :: MonadMPD m => Id -> m ()
playId = A.runCommand . A.playId

-- | Play the previous song.
previous :: MonadMPD m => m ()
previous = A.runCommand A.previous

-- | Seek to some point in a song.
seek :: MonadMPD m => Position -> FractionalSeconds -> m ()
seek pos = A.runCommand . A.seek pos

-- | Seek to some point in a song (id version)
seekId :: MonadMPD m => Id -> FractionalSeconds -> m ()
seekId id' = A.runCommand . A.seekId id'

-- | Seek to some point in the current song. Absolute time for True in
-- the frist argument, relative time for False.
--
-- @since 0.9.2.0
seekCur :: MonadMPD m => Bool -> FractionalSeconds -> m ()
seekCur bool = A.runCommand . A.seekCur bool

-- | Stop playing.
stop :: MonadMPD m => m ()
stop = A.runCommand A.stop
