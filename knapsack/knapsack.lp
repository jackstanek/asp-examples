item(apple, 4, 12). item(book, 2, 9). item(lamp, 5, 7).
{ chosen(I) } :- item(I, _, _).
:- #sum { W, I : chosen(I), item(I, W, _) } > 10.
#maximize { V, I : chosen(I), item(I, _, V) }.
