#!/bin/env nix-instantiate --eval

let
  # square : int -> int
  square = x: x * x;

  # sumOfSquares : int -> int -> int
  sumOfSquares = x: y: square x + square y;
in
  sumOfSquares 3 7
