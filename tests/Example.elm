module Example exposing (elm_test_github_example, rchaves_medium_example)

import Test exposing (Test, describe, fuzz, fuzzWith, fuzz2)
import Expect exposing (equal, fail, atLeast, true)
import Fuzz exposing (list, int, tuple, string)
import String exposing (length, left, reverse)
import ElmTestBDDStyle exposing (to, it, expect, toBe)

{-
Following the guides from ->
    (i) https://github.com/elm-community/elm-test
    (ii) https://medium.com/@_rchaves_/testing-in-elm-93ad05ee1832
-}

elm_test_github_example : Test
elm_test_github_example =
    describe "The String module"
        [ describe "String.reverse"
            [ it "has no effect on a palindrome" <|
                expect "hannah" to equal (reverse "hannah")
            , it "reverses a known string" <|
                expect "ABCDEFG" to equal (reverse "GFEDCBA")
            , fuzz string "restores the original string if you run it again" <|
                \s -> expect (s) to equal ((reverse << reverse) s)
            ]
        ]

rchaves_medium_example : Test
rchaves_medium_example =
    describe "Sample Test Suite"
        [ describe "Unit test examples"
            [ it "can add things" <|
                expect (3 + 7) to equal 10
            , it "gets the first letter" <|
                expect "a" to equal (left 1 "abcdefg")
            , it "fails - you should remove it" <|
                fail "Failed as expected!"
            ]
        , describe "Fuzz test examples, using randomly generated input"
            [ fuzz (list int) "Lists always have positive length" <|
                \aList ->
                    expect (List.length aList) toBe atLeast 0
            , fuzz (list int) "Sorting a list does not change its length" <|
                \aList ->
                    expect (List.sort aList |> List.length) to equal (List.length aList)
            , fuzzWith { runs = 1000 } int "List.member will find an integer in a list containing it" <|
                \i ->
                    expect (List.member i [ i ]) toBe true "If you see this, List.member returned False!"
            , fuzz2 string string "The length of a string equals the sum of its substrings' lengths" <|
                \s1 s2 ->
                    expect (s1 ++ s2 |> length) to equal (length s1 + length s2)
            ]
        ]
