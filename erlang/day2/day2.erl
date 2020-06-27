-module(day2).
-export([find_keyword/2, total_price/1, tictactoe/1]).

%% find by keyword
%%DataList = [{erlang, "a functional language"}, {ruby, "an OO language"}].
find_keyword(DataList, Keyword) -> [Description || {Language, Description} <- DataList, Language == Keyword].

%%DataList = [{item1, 1, 20}, {item2, 2, 40}]
total_price(ShoppingList) -> [{Item, Quantity * Price} || {Item, Quantity, Price} <- ShoppingList].

%%["O", "O", "O", " ", " ", " ", " ", " ", " "] - O
%%["O", "X", "X", "O", " ", " ", "O", " ", " "] - O
%%["O", "X", "X", "X", "O", " ", " ", " ", "X"] - cat
%%["O", "X", "X", " ", " ", " ", "O", " ", " "] - cat
%%["O", "X", "O", "X", "O", "X", "X", "O", "X"] - no_winner
get_result(Rows) -> lists:foldl(fun(X, Result) -> X ++ Result end, "", Rows).
tictactoe(Board) ->
  [S11, S12, S13, S21, S22, S23, S31, S32, S33] = Board,
  Row1 = get_result([S11, S12, S13]),
  Row2 = get_result([S21, S22, S23]),
  Row3 = get_result([S31, S32, S33]),

  Col1 = get_result([S11, S21, S31]),
  Col2 = get_result([S12, S22, S32]),
  Col3 = get_result([S13, S23, S33]),

  Diags1 = get_result([S11, S22, S33]),
  Diags2 = get_result([S13, S22, S31]),

  Result = [Row1, Row2, Row3, Col1, Col2, Col3, Diags1, Diags2],
  WinO = lists:any(fun(T) -> T == "OOO" end, Result),
  WinX = lists:any(fun(T) -> T == "XXX" end, Result),
  Draw = lists:any(fun(T) -> T == " " end, Board),

  if
    WinO -> "O";
    WinX -> "X";
    Draw -> "cat";
    true -> no_winner
  end.



