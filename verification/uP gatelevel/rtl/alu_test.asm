# ----------------------------------------------------------------------
# Test_name: nand_test/nor_test/sub_test/add_test/xor_test/xnor_test
# ----------------------------------------------------------------------
#
# RAM memory will be structured in the following manner:
#
# +---------+----------+
# | Address | Variable |
# +---------+----------+
# | RAM[00] | A        |
# | RAM[01] | B        |
# | RAM[02] | Y        |
# +---------+----------+
#
# Where:
#  - Y = A op B
#
#
# ROM Memory will be loaded with the following program:
# ----------------------------------------------------------------------

$begin:
LOAD  A,0;    # Load A operand
XNOR  A,1;    # ALU Operation to be tested: EDIT THE ALU INSTRUCTION (in this example it is XNOR operation)
STORE A,2;    # Save result
LOAD  A,0;    # Load A operand
ADDI  A,1;    # Add +1 to A operand
STORE A,0;    # Save A operand
JZ    $incb;  # Jump to increase B operand if A operand is 0
JUMP  $begin; # Start again the operation

$incb:
LOAD  A,1;    # Load B operand
ADDI  A,1;    # Add +1 to B operand
STORE A,1;    # Save B operand
JZ    $end;   # Go to end
JUMP  $begin; # Start again the operation

$end:
JUMP  $end;   # End, Finish test
