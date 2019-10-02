datatype expr = Variable of string
    | Application of expr * expr
    | Lambda of string * expr ;