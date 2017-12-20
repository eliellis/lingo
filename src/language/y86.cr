require "../lingo/*"
module Y86
  def Y86.lex(source : String)
    Lingo::Lexer.lex(source, self.tokens);
  end

  def Y86.tokens : Array(Token)
    [
      # whitespace
      Lingo::Token.new(nil, /[\s\n\t]+/, "whitespace"),
      Lingo::Token.new(nil, /[#;]\s*.*/, "comments"),
      # significant symbols
      Lingo::Token.new(Tag.new("LP_TOK"), /\(/, "left parenth"),
      Lingo::Token.new(Tag.new("RP_TOK"), /\)/, "right parenth"),
      Lingo::Token.new(Tag.new("COLON_TOK"), /:/, "colon"),
      Lingo::Token.new(Tag.new("COMMA_TOK"), /,/, "comma"),
      # assembler directives
      Lingo::Token.new(Tag.new("DIRECTIVE_TOK"), /\.align/),
      Lingo::Token.new(Tag.new("DIRECTIVE_TOK"), /\.section/),
      Lingo::Token.new(Tag.new("DIRECTIVE_TOK"), /\.pos/),
      Lingo::Token.new(Tag.new("DIRECTIVE_TOK"), /\.quad/),
      # instructions
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /halt/),
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /nop/),
      # OPl
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /andq/),
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /xorq/),
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /subq/),
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /addq/),
      # stack ops
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /pushq/),
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /popq/),
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /call/),
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /ret/),
      # register operators
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /mrmovq/),
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /rmmovq/),
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /irmovq/),
      # conditional move operators
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /rrmovq/),
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /cmovle/),
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /cmovne/),
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /cmovg/),
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /cmovle/),
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /cmovl/),
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /cmove/),
      # jump instructions
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /jne/),
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /je/),
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /jg/),
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /jge/),
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /jl/),
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /jle/),
      Lingo::Token.new(Tag.new("INSTRUCTION_TOK"), /jmp/),
      # registers
      Lingo::Token.new(Tag.new("REGISTER_TOK"), /%rax|%rcx|%rdx|%rbx|%rsi|%rdi|%rsp|%rbp|%r8|%r9|%r10|%r11|%r12|%r13|%r14/),
      # user defined tokens
      Lingo::Token.new(Tag.new("HEX_TOK"), /0x[0-9]+/, "hex digit"),
      Lingo::Token.new(Tag.new("INT_TOK"), /\$?[0-9]+/, "integer digit"),
      Token.new(Tag.new("LABEL_TOK"), /[A-Za-z][A-Za-z0-9]*/, "label"),
    ]
  end
end