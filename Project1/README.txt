
gyg2104 HW1 README.txt
-uses "grammar_gyg2104.lisp", "q2_gyg2104.txt", "report_gyg2104.txt"


Please read "report_gyg2104.txt" for details on how I did each part
and what to look for

-note that I used more code from the book than was originally here
-note that I didn't figure out how to get max tree depth

-run program as follows:
clisp
> load ("grammar_gyg2104.lisp")
> (targeted-sentence rules1)
> (targeted-sentence rules2)
> (targeted-sentence rules3)
> (targeted-sentence rules4)
> (targeted-sentence rules5)
> (random-sentence 'sentence) --> gives random sentence
> (generateValid 'sentence)  --> this will give you a more valid random sentence
> (loop-run 1000) --> outputs 1000 random sentences to q2_gyg2104.txt with +
if valid and - if invalid


