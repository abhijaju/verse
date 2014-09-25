module verse.error where

open import Level
open import Category.Functor
open import Function
open import Relation.Nullary
open import Relation.Nullary.Negation
import Data.Maybe as Maybe

open import Data.Maybe public
                       using    ()
                       renaming ( Maybe to Error
                                ; just  to error:
                                ; nothing to ✓
                                )


data Expect (K : Set) : Set where
  expected   : K → Expect K
  unexpected : K → Expect K

when_raise_ : {C E : Set} → Dec C → E → Error E
when c raise e with c
...            |    yes _ = error: e
...            |    no  _ = ✓

unless_raise_ : {C E : Set} → Dec C → E → Error E
unless c raise e = when ¬? c raise e