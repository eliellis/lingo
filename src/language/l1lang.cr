require "../lingo/*"
alias Token = Lingo::Token
alias Tag = Lingo::Tag
module L1Lang

  def L1Lang.tokens : Array(Token)
    [
      # whitespace processing
      Token.new(nil, /[\s\n\t]+/, "whitespace"),
      Token.new(nil, /#\s*.*/ + /\/\*[a-zA-Z0-9\s]*\*\//, "comments"),
      # reserved words and symbols
      Token.new(Tag.new("LP"), /\(/, "left paren"),
      Token.new(Tag.new("RP"), /\)/, "right paren"),
      Token.new(Tag.new("EQ"), /=/, "equality operator"),
      Token.new(Tag.new("LE_TOK"), /</, "less keyword"),
      Token.new(Tag.new("LEQ_TOK"), /<=/, "less equal keyword"),
      Token.new(Tag.new("GTQ_TOK"), />=/, "greater equal keyword"),
      Token.new(Tag.new("GT_THAN"), />/, "greater keyword"),
      Token.new(Tag.new("WHILE_TOK"), /maintain|while/, "while loop keyword"),
      Token.new(Tag.new("IF_TOK"), /if/, "if keyword"),
      Token.new(Tag.new("START_TOK"), /start/, "starting keyword"),
      Token.new(Tag.new("END_TOK"), /end/, "terminating keyword"),
      # user defined tokens
      Token.new(Tag.new("FLOAT_TOK"), /[0-9]+\.[0-9]+/, "floating point digit"),
      Token.new(Tag.new("INT_TOK"), /[0-9]+/, "integer digit"),
      Token.new(Tag.new("ID_TOK"), /[A-Za-z][A-Za-z0-9]*/, "identifier"),
    ]
  end
end