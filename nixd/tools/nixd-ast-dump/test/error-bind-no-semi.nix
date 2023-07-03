# RUN: nixd-ast-dump -bindv -range %s | FileCheck %s

# Tests error recovoery for:
# binds
# | binds attrpath error


# CHECK: ExprAttrs: rec { a = 1; b = <nixd:err>; c = 1; d = c; } 9:1 14:2
rec {
  a = 1;
  b
    c = 1;
  d = c; # CHECK: ExprVar: c 13:7 13:8 level: 0 displ: 2
}
