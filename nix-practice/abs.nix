#!/bin/env nix-instantiate --eval

let
  # abs : int -> int
  abs = x: if x < 0 then (-x) else x;
in
  abs (-3)
