#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.6
# from Racc grammer file "".
#

require 'racc/parser.rb'
class ExcelFormulaParser < Racc::Parser
##### State transition tables begin ###

racc_action_table = [
    17,    51,    23,    25,    27,    29,    31,    20,    19,     3,
   nil,    50,    18,   nil,     4,     5,     6,     8,    12,    13,
    14,    15,    16,    17,   nil,   nil,   nil,   nil,   nil,    10,
   nil,   nil,   nil,   nil,    17,    18,   nil,     4,     5,     6,
     8,    12,    13,    14,    15,    16,    18,    17,     4,     5,
     6,     8,    12,    13,    14,    15,    16,   nil,    17,    18,
   nil,     4,     5,     6,     8,    12,    13,    14,    15,    16,
    18,    17,     4,     5,     6,     8,    12,    13,    14,    15,
    16,   nil,    17,    18,   nil,     4,     5,     6,     8,    12,
    13,    14,    15,    16,    18,    17,     4,     5,     6,     8,
    12,    13,    14,    15,    16,   nil,    17,    18,    37,     4,
     5,     6,     8,    12,    13,    14,    15,    16,    18,    17,
     4,     5,     6,     8,    12,    13,    14,    15,    16,   nil,
    17,    18,   nil,     4,     5,     6,     8,    12,    13,    14,
    15,    16,    18,    17,     4,     5,     6,     8,    12,    13,
    14,    15,    16,   nil,    17,    18,   nil,     4,     5,     6,
     8,    12,    13,    14,    15,    16,    18,    17,     4,     5,
     6,     8,    12,    13,    14,    15,    16,   nil,    17,    18,
   nil,     4,     5,     6,     8,    12,    13,    14,    15,    16,
    18,    17,     4,     5,     6,     8,    12,    13,    14,    15,
    16,   nil,   nil,    18,   nil,     4,     5,     6,     8,    12,
    13,    14,    15,    16,    21,    24,    26,    28,    30,    32,
   nil,    21,   nil,   nil,   nil,   nil,    23,    25,    27,    29,
    31,   nil,    49,    23,    25,    27,    29,    31,    21,    24,
    26,    28,    30,    32,    21,    24,    26,    28,    30,    32,
    23,    25,    27,    29,    31,    21,    23,    25,    27,    29,
    31,    21,    24,    26,    28,    30,    32,    23,    25,    27,
    29,    31,    22,    23,    25,    27,    29,    31,    21,    24,
    26,    28,    30,    32,    21,    24,    26,    28,   nil,   nil,
    23,    25,    27,    29,    31,   nil,    23,    25,    27,    29,
    31,    21,    24,    26,    28,   nil,    21,    24,    26,    28,
    30,    32,   nil,    23,    25,    27,    29,    31,    23,    25,
    27,    29,    31,    21,    24,    26,    28,    30,    32,    21,
    24,   nil,   nil,   nil,   nil,    23,    25,    27,    29,    31,
   nil,    23,    25,    27,    29,    31,    21,    24,    26,    28,
    30,    32,    21,    24,   nil,   nil,   nil,   nil,    23,    25,
    27,    29,    31,   nil,    23,    25,    27,    29,    31,    21,
    24,    26,    28,    30,    32,   nil,   nil,   nil,   nil,   nil,
   nil,    23,    25,    27,    29,    31 ]

racc_action_check = [
    32,    36,    33,    33,    33,    33,    33,     4,     3,     1,
   nil,    36,    32,   nil,    32,    32,    32,    32,    32,    32,
    32,    32,    32,     2,   nil,   nil,   nil,   nil,   nil,     2,
   nil,   nil,   nil,   nil,    50,     2,   nil,     2,     2,     2,
     2,     2,     2,     2,     2,     2,    50,    31,    50,    50,
    50,    50,    50,    50,    50,    50,    50,   nil,    30,    31,
   nil,    31,    31,    31,    31,    31,    31,    31,    31,    31,
    30,    17,    30,    30,    30,    30,    30,    30,    30,    30,
    30,   nil,    18,    17,   nil,    17,    17,    17,    17,    17,
    17,    17,    17,    17,    18,    20,    18,    18,    18,    18,
    18,    18,    18,    18,    18,   nil,    21,    20,    20,    20,
    20,    20,    20,    20,    20,    20,    20,    20,    21,    23,
    21,    21,    21,    21,    21,    21,    21,    21,    21,   nil,
    24,    23,   nil,    23,    23,    23,    23,    23,    23,    23,
    23,    23,    24,    25,    24,    24,    24,    24,    24,    24,
    24,    24,    24,   nil,    26,    25,   nil,    25,    25,    25,
    25,    25,    25,    25,    25,    25,    26,    27,    26,    26,
    26,    26,    26,    26,    26,    26,    26,   nil,    28,    27,
   nil,    27,    27,    27,    27,    27,    27,    27,    27,    27,
    28,    29,    28,    28,    28,    28,    28,    28,    28,    28,
    28,   nil,   nil,    29,   nil,    29,    29,    29,    29,    29,
    29,    29,    29,    29,    34,    34,    34,    34,    34,    34,
   nil,    38,   nil,   nil,   nil,   nil,    34,    34,    34,    34,
    34,   nil,    34,    38,    38,    38,    38,    38,    45,    45,
    45,    45,    45,    45,    47,    47,    47,    47,    47,    47,
    45,    45,    45,    45,    45,    40,    47,    47,    47,    47,
    47,     7,     7,     7,     7,     7,     7,    40,    40,    40,
    40,    40,     7,     7,     7,     7,     7,     7,    35,    35,
    35,    35,    35,    35,    46,    46,    46,    46,   nil,   nil,
    35,    35,    35,    35,    35,   nil,    46,    46,    46,    46,
    46,    48,    48,    48,    48,   nil,    39,    39,    39,    39,
    39,    39,   nil,    48,    48,    48,    48,    48,    39,    39,
    39,    39,    39,    41,    41,    41,    41,    41,    41,    42,
    42,   nil,   nil,   nil,   nil,    41,    41,    41,    41,    41,
   nil,    42,    42,    42,    42,    42,    43,    43,    43,    43,
    43,    43,    44,    44,   nil,   nil,   nil,   nil,    43,    43,
    43,    43,    43,   nil,    44,    44,    44,    44,    44,    52,
    52,    52,    52,    52,    52,   nil,   nil,   nil,   nil,   nil,
   nil,    52,    52,    52,    52,    52 ]

racc_action_pointer = [
   nil,     9,    15,     8,   -13,   nil,   nil,   258,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    63,    74,   nil,
    87,    98,   nil,   111,   122,   135,   146,   159,   170,   183,
    50,    39,    -8,   -13,   211,   275,   -20,   nil,   218,   303,
   252,   320,   326,   343,   349,   235,   281,   241,   298,   nil,
    26,   nil,   366 ]

racc_action_default = [
    -2,   -33,    -1,   -33,   -19,   -20,   -21,   -33,   -22,   -16,
    -4,   -28,   -23,   -24,   -25,   -26,   -27,   -33,   -33,    53,
   -33,   -33,    -3,   -33,   -33,   -33,   -33,   -33,   -33,   -33,
   -33,   -33,   -33,   -18,   -33,   -31,   -33,   -30,    -9,   -11,
   -10,   -12,    -7,   -13,    -8,   -14,    -5,   -15,    -6,   -17,
   -33,   -29,   -32 ]

racc_goto_table = [
     7,     1,     2,    36,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,    33,    34,   nil,    35,    38,
   nil,    39,    40,    41,    42,    43,    44,    45,    46,    47,
    48,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    52 ]

racc_goto_check = [
     3,     1,     2,     6,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,     3,     3,   nil,     3,     3,
   nil,     3,     3,     3,     3,     3,     3,     3,     3,     3,
     3,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,     3 ]

racc_goto_pointer = [
   nil,     1,     2,    -2,   nil,   nil,   -17 ]

racc_goto_default = [
   nil,   nil,   nil,   nil,     9,    11,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 33, :_reduce_none,
  0, 34, :_reduce_2,
  3, 34, :_reduce_3,
  2, 34, :_reduce_none,
  3, 35, :_reduce_5,
  3, 35, :_reduce_6,
  3, 35, :_reduce_7,
  3, 35, :_reduce_8,
  3, 35, :_reduce_9,
  3, 35, :_reduce_10,
  3, 35, :_reduce_11,
  3, 35, :_reduce_12,
  3, 35, :_reduce_13,
  3, 35, :_reduce_14,
  3, 35, :_reduce_15,
  1, 35, :_reduce_none,
  3, 36, :_reduce_17,
  2, 36, :_reduce_18,
  1, 36, :_reduce_none,
  1, 36, :_reduce_20,
  1, 36, :_reduce_21,
  1, 36, :_reduce_22,
  1, 36, :_reduce_23,
  1, 36, :_reduce_24,
  1, 36, :_reduce_25,
  1, 36, :_reduce_26,
  1, 36, :_reduce_27,
  1, 36, :_reduce_none,
  4, 37, :_reduce_29,
  3, 37, :_reduce_30,
  1, 38, :_reduce_31,
  3, 38, :_reduce_32 ]

racc_reduce_n = 33

racc_shift_n = 53

racc_token_table = {
  false => 0,
  :error => 1,
  :UMINUS => 2,
  "^" => 3,
  "&" => 4,
  "*" => 5,
  "/" => 6,
  "+" => 7,
  "-" => 8,
  "<" => 9,
  ">" => 10,
  "<=" => 11,
  ">=" => 12,
  "<>" => 13,
  :EOL => 14,
  :LT => 15,
  :GT => 16,
  :LE => 17,
  :GE => 18,
  :NE => 19,
  "(" => 20,
  ")" => 21,
  :FUNC => 22,
  :NUMBER => 23,
  :STRING => 24,
  :REF2D => 25,
  :REF3D => 26,
  :RANGE2D => 27,
  :RANGE3D => 28,
  :TRUE => 29,
  :FALSE => 30,
  "," => 31 }

racc_nt_base = 32

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "UMINUS",
  "\"^\"",
  "\"&\"",
  "\"*\"",
  "\"/\"",
  "\"+\"",
  "\"-\"",
  "\"<\"",
  "\">\"",
  "\"<=\"",
  "\">=\"",
  "\"<>\"",
  "EOL",
  "LT",
  "GT",
  "LE",
  "GE",
  "NE",
  "\"(\"",
  "\")\"",
  "FUNC",
  "NUMBER",
  "STRING",
  "REF2D",
  "REF3D",
  "RANGE2D",
  "RANGE3D",
  "TRUE",
  "FALSE",
  "\",\"",
  "$start",
  "formula",
  "expr_list",
  "expr",
  "primary",
  "funcall",
  "args" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

module_eval(<<'.,.,', 'excelformula.y', 15)
  def _reduce_2(val, _values, result)
     result = [] 
    result
  end
.,.,

module_eval(<<'.,.,', 'excelformula.y', 16)
  def _reduce_3(val, _values, result)
     result.push val[1], '_arg', '1' 
    result
  end
.,.,

# reduce 4 omitted

module_eval(<<'.,.,', 'excelformula.y', 19)
  def _reduce_5(val, _values, result)
     result = [ val[0], val[2], 'ptgAdd' ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'excelformula.y', 20)
  def _reduce_6(val, _values, result)
     result = [ val[0], val[2], 'ptgSub' ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'excelformula.y', 21)
  def _reduce_7(val, _values, result)
     result = [ val[0], val[2], 'ptgMul' ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'excelformula.y', 22)
  def _reduce_8(val, _values, result)
     result = [ val[0], val[2], 'ptgDiv' ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'excelformula.y', 23)
  def _reduce_9(val, _values, result)
     result = [ val[0], val[2], 'ptgPower' ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'excelformula.y', 24)
  def _reduce_10(val, _values, result)
     result = [ val[0], val[2], 'ptgConcat' ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'excelformula.y', 25)
  def _reduce_11(val, _values, result)
     result = [ val[0], val[2], 'ptgLT' ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'excelformula.y', 26)
  def _reduce_12(val, _values, result)
     result = [ val[0], val[2], 'ptgGT' ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'excelformula.y', 27)
  def _reduce_13(val, _values, result)
     result = [ val[0], val[2], 'ptgLE' ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'excelformula.y', 28)
  def _reduce_14(val, _values, result)
     result = [ val[0], val[2], 'ptgGE' ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'excelformula.y', 29)
  def _reduce_15(val, _values, result)
     result = [ val[0], val[2], 'ptgNE' ] 
    result
  end
.,.,

# reduce 16 omitted

module_eval(<<'.,.,', 'excelformula.y', 32)
  def _reduce_17(val, _values, result)
     result = [ val[1], '_arg', '1', '_ptgParen'] 
    result
  end
.,.,

module_eval(<<'.,.,', 'excelformula.y', 33)
  def _reduce_18(val, _values, result)
     result = [ -1, val[1], '_ptgMul' ] 
    result
  end
.,.,

# reduce 19 omitted

module_eval(<<'.,.,', 'excelformula.y', 35)
  def _reduce_20(val, _values, result)
     result = [ '_num',     val[0] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'excelformula.y', 36)
  def _reduce_21(val, _values, result)
     result = [ '_str',     val[0] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'excelformula.y', 37)
  def _reduce_22(val, _values, result)
     result = [ '_ref2d',   val[0] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'excelformula.y', 38)
  def _reduce_23(val, _values, result)
     result = [ '_ref3d',   val[0] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'excelformula.y', 39)
  def _reduce_24(val, _values, result)
     result = [ '_range2d', val[0] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'excelformula.y', 40)
  def _reduce_25(val, _values, result)
     result = [ '_range3d', val[0] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'excelformula.y', 41)
  def _reduce_26(val, _values, result)
     result = [ 'ptgBool',  '1'    ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'excelformula.y', 42)
  def _reduce_27(val, _values, result)
     result = [ 'ptgBool',  '0'    ] 
    result
  end
.,.,

# reduce 28 omitted

module_eval(<<'.,.,', 'excelformula.y', 45)
  def _reduce_29(val, _values, result)
     result = [ '_class', val[0], val[2], '_arg', val[2].size.to_s, '_func', val[0] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'excelformula.y', 46)
  def _reduce_30(val, _values, result)
     result = [ '_func', val[0] ] 
    result
  end
.,.,

module_eval(<<'.,.,', 'excelformula.y', 48)
  def _reduce_31(val, _values, result)
     result = val 
    result
  end
.,.,

module_eval(<<'.,.,', 'excelformula.y', 49)
  def _reduce_32(val, _values, result)
     result.push val[2] 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

end   # class ExcelFormulaParser


class ExcelFormulaParserError < StandardError; end

class Node

   def exec_list(nodes)
      v = nil
      nodes.each { |i| v = i.evaluate }
      v
   end
   
   def excelformulaparser_error(msg)
      raise ExcelFormulaParserError, 
               "in #{fname}:#{lineno}: #{msg}"
   end

end

class RootNode < Node

   def initialize(tree)
      @tree = tree
   end
   
   def evaluate
      exec_list @tree
   end

end
   

class FuncallNode < Node

   def initialize(func, args)
      @func = func
      @args = args
   end
   
   def evaluate
      arg = @args.collect {|i| i.evaluate }
      out = []
      arg.each { |i| o.push i }
      o.push @func
      p o
   end
   
end

class NumberNode < Node

   def initialize(val)
      @val = val
   end
   
   def evaluate
      p @val
   end

end

class OperateNode < Node

   def initialize(op, left, right)
      @op = op
      @left = left
      @right = right
   end

   def evaluate
      o = []
      o.push @left
      o.push @right
      o.push @op
      p o
   end
end
