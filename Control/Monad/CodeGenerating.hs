-- MHC: Minimal Haskell Compiler © 2018 Kaoru Kawamukai <bydriv@gmail.com>
--
-- MHC is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- MHC is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with MHC.  If not, see <http://www.gnu.org/licenses/>.

module Control.Monad.CodeGenerating (CodeGenerating, generate, write) where

import qualified Control.Monad.Identity             as Identity
import qualified Control.Monad.Trans.CodeGenerating as CodeGeneratingT

type CodeGenerating s = CodeGeneratingT.CodeGeneratingT s Identity.Identity

{-# INLINE generate #-}
generate :: CodeGenerating s () -> [s]
generate = Identity.runIdentity . CodeGeneratingT.generate

{-# INLINE write #-}
write :: [s] -> CodeGenerating s ()
write = CodeGeneratingT.write
