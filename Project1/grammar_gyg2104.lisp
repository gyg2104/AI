(defparameter *grammar*
  '(
    (sentence -> (singularnoun-phrase singularverb-phrase) (PronounExpletive pluralverb-phrase)
              (singularnoun-phrase singularverb-phrase ConjunctionCoord pluralnoun-phrase pluralverb-phrase))
   
   
    (singularnoun-phrase -> (Adjective SingularNoun) (ArticleS singularnoun-phrase singularprep-phrase) (ArticleS Adjective SingularNoun)
                         (SingularNoun) (singularnoun-phrase SingularNoun) (ArticleS SingularNoun) (Adjective Preposition singularnoun-phrase)
                         (ConjunctionSub singularnoun-phrase singularverb-phrase))
   
    (pluralnoun-phrase -> (singularnoun-phrase PluralNoun) (AdjectivePlur PluralNoun) 
                       (pluralnoun-phrase relplur-clause singularprep-phrase pluralnoun-phrase) 
                       (singularnoun-phrase ConjunctionCoord pluralnoun-phrase) (pluralnoun-phrase ConjunctionCoord singularnoun-phrase)
                       (Adjective PluralNoun) (PluralNoun) (ArticleS AdjectivePlur PluralNoun))
    (pluralverb-phrase -> (PluralPastHelpVerb pluralnoun-phrase plurprep-phrase) (SingPresTransVerb pluralverb-phrase) 
                       (Preposition SingPresTransVerb Adverb) (AuxVerbPres PluralPresHelpVerb pluraladj-phrase)
                       (pluralverb-phrase plurprep-phrase) (SingPresTransVerb PronounReflexive))

    (pluraladj-phrase -> (Adjective Preposition pluralverb-phrase))

    (singularverb-phrase -> (AuxVerbPres SingPresTransVerb singularnoun-phrase) (AuxVerbPres Adverb SingPresTransVerb singularnoun-phrase)
                         (AuxVerbPres PluralPresHelpVerb SingPastTransVerb plurprep-phrase))
    (singularprep-phrase -> (Preposition SingularNoun) (Premod Preposition) (Preposition singularnoun-phrase)) 
    (plurprep-phrase -> (Preposition pluralnoun-phrase))
   (relplur-clause -> (RelativePronoun pluralverb-phrase))
    (Adjective -> higher prevailing flawed desired solid professional visible naked amateur able) 
    (AdjectivePlur -> several few)
    (Adverb -> hardly well not)
    (ArticleS -> the this a)
    (AuxVerbPres -> must will should) 
    (ConjunctionCoord -> and but)
    (ConjunctionSub -> whether)
    (PluralPastHelpVerb -> were)
    (PluralPresHelpVerb -> be)
    (PronounExpletive -> there)
    (PronounReflexive -> it)
    (PluralNoun -> gains industries services astronomers telescopes weeks) 
    (Premod -> such)
    (Preposition -> of as in to as with)
    (RelativePronoun -> that)
    (SingularNoun -> education narrative polarization strategy intent job business health care asteroid eye prosecution
                  death penalty case)
    (SingPastTransVerb -> decided)
    (SingPresTransVerb -> counter achieve tend pay be see seek))

  "A grammar for a trivial subset of English.")

(defun targeted-sentence (rules)
  (apply-rules rules nil)
)


;list of rules using DFS order
;(THE MAN LIKED A WOMAN)
(defparameter rules1 '((sentence 0) (singularnoun-phrase 0) (Adjective 0) (SingularNoun 0) (singularverb-phrase 0) (AuxVerbPres 0)(SingPresTransVerb 0)
                                    (singularnoun-phrase 1) (ArticleS 0) (singularnoun-phrase 0) (Adjective 1) (SingularNoun 1) 
                                    (singularprep-phrase 0) (Preposition 0) (SingularNoun 2)))
(defparameter rules2 '((sentence 0) (singularnoun-phrase 2) (ArticleS 1) (Adjective 2) (SingularNoun 3) (singularverb-phrase 1)
                                    (AuxVerbPres 1) (Adverb 0) (SingPresTransVerb 1) (singularnoun-phrase 2) (ArticleS 0) 
                                    (Adjective 3) (SingularNoun 4)))
(defparameter rules3 '((sentence 1) (PronounExpletive 0) (pluralverb-phrase 0) (PluralPastHelpVerb 0) (pluralnoun-phrase 0) 
                                    (singularnoun-phrase 0) (Adjective 4) (SingularNoun 5) (PluralNoun 0) (plurprep-phrase 0) 
                                    (Preposition 2) (pluralnoun-phrase 2) (pluralnoun-phrase 1) (AdjectivePlur 0) (PluralNoun 1) 
                                    (relplur-clause 0) (RelativePronoun 0) (pluralverb-phrase 1) (SingPresTransVerb 2)
                                    (pluralverb-phrase 2) (Preposition 3) (SingPresTransVerb 3) (Adverb 1) (singularprep-phrase 1)
                                    (Premod 0) (Preposition 4) (pluralnoun-phrase 3) (singularnoun-phrase 3) (SingularNoun 6)
                                    (ConjunctionCoord 0) (pluralnoun-phrase 4) (pluralnoun-phrase 5) (Adjective 5) (PluralNoun 2)
                                    (ConjunctionCoord 0) (singularnoun-phrase 4) (singularnoun-phrase 3) (SingularNoun 7) (SingularNoun 8)))
(defparameter rules4 '((sentence 2) (singularnoun-phrase 5) (ArticleS 0) (SingularNoun 9) (singularverb-phrase 1) (AuxVerbPres 1) 
                                    (Adverb 2) (SingPresTransVerb 4) (singularnoun-phrase 6) (Adjective 6) (Preposition 3) 
                                    (singularnoun-phrase 2) (ArticleS 0) (Adjective 7) (SingularNoun 10) (ConjunctionCoord 1) 
                                    (pluralnoun-phrase 5) (Adjective 8) (PluralNoun 3) (pluralverb-phrase 3) (AuxVerbPres 2)
                                    (PluralPresHelpVerb 0) (pluraladj-phrase 0) (Adjective 9) (Preposition 3) (pluralverb-phrase 4)
                                    (pluralverb-phrase 5) (SingPresTransVerb 5) (PronounReflexive 0) (plurprep-phrase 0) 
                                    (Preposition 5) (pluralnoun-phrase 6) (PluralNoun 4)))

(defparameter rules5 '((sentence 0) (singularnoun-phrase 7) (ConjunctionSub 0) (singularnoun-phrase 5) (ArticleS 0) (SingularNoun 11)
                                    (singularverb-phrase 0) (AuxVerbPres 1) (SingPresTransVerb 6) (singularnoun-phrase 1)
                                    (ArticleS 0) (singularnoun-phrase 4) (singularnoun-phrase 3) (SingularNoun 12) (SingularNoun 13)
                                    (singularprep-phrase 2) (Preposition 2) (singularnoun-phrase 5) (ArticleS 0) (SingularNoun 14)
                                    (singularverb-phrase 2) (AuxVerbPres 1) (PluralPresHelpVerb 0) (SingPastTransVerb 0)
                                    (plurprep-phrase 0) (Preposition 2) (pluralnoun-phrase 7) (ArticleS 2) (AdjectivePlur 1)
                                    (PluralNoun 5)))



;take a set of rules and the current sentence that has been generated so far
;here is what happens for the above example:
;when the first rule is called, the current sentence is empty and is rewritten to (noun-phase verb-phrase)
;second rule: (Article Noun verb-phrase)
;3: (THE Noun verb-phrase)
;4: (THE MAN verb-phrase)
;5: (THE MAN Verb noun-phrase)
;6: (THE MAN LIKED noun-phrase)
;7: (THE MAN LIKED Article Noun)
;8: (THE MAN LIKED A Noun)
;9: (THE MAN LIKED A WOMAN)

(defun apply-rules (rules sentence)
  (cond 
    ((null rules) sentence)
    ((null sentence) (apply-rules (rest rules) (elt (rule-rhs (assoc (car (car rules)) *grammar*)) (second (car rules)))))
    (t (let ((rule-to-rewrite (car (car rules))) (new-rule (elt (rule-rhs (assoc (car (car rules)) *grammar*)) (second (car rules)))))
      (apply-rules (rest rules) (rewrite-sentence nil sentence rule-to-rewrite new-rule)))))) 

;simply rewrites a sentence replacing the first occurence of the variable "rule-to-rewrite" in "sentence-next" by the symbols in "new-rule" 
;example: (rewrite-sentence nil '(THE MAN verb-phrase) 'verb-phrase '(Verb noun-phrase))
;returns (THE MAN Verb noun-phrase)
(defun rewrite-sentence (sentence-pre sentence-next rule-to-rewrite new-rule)
    (cond ((null sentence-next) sentence-pre)
    (t 
      (if (equal (car sentence-next) rule-to-rewrite)
      (append (append sentence-pre (if (listp new-rule) new-rule (list new-rule))) (rest sentence-next))
      (rewrite-sentence (append sentence-pre (list (car sentence-next))) (rest sentence-next) rule-to-rewrite new-rule)))))
      

(defun random-elt (list)
  (elt list
       (random (length list))))

(defun write-to-file(sentence)
  (with-open-file (str "~/hidden/2879360485844599/q2_gyg2104.txt"
                       :direction :output
                       :if-exists :append
                       :if-does-not-exist :create)
    (format str sentence)))

(defun run2 ()
  (let ((sent (random-sentence 'sentence)))
    (write-to-file (if (validp sent) (format nil "+ ~S ~%" sent) (format nil "- ~S ~%" sent)))))

(defun loop-run(N)
  (loop for i from 1 to N do (run2)))


(defun validp(sentence)
  ;marks a sentence invalid if an unexpected  word appears too many times
  ;or if it has an article appearing after another article
  ;or if it has too many conjunctions
  (setq count 0)
  
 (setq myArts (generate-all 'ArticleS))
 (setq justSawArt 0)
 (setq doubledArt 0)
 
(setq table (make-hash-table))
(dolist (item sentence)
  (cond      
    ((member item (apply #'append myArts)) 

   
     (cond 
       ((= 1 justSawArt) (setq doubledArt 1))
       (t (setq justSawArt 1)))

     )
    (t (setq justSawArt 0)))
 
  


  (cond
    ((gethash item table) 


      (setq curVal (gethash item table))
      
      (remhash item table)
      (setq curVal (+ 1 curVal))
      (setf(gethash item table) curVal)


       ) ;end if false statement
    (t 
  
     (setf(gethash item table) 1)
       ) ;end if true statement
    )
  
  
  ) ;end dolist

(setq badRep 0)

(setq myConjunctionCoords (generate-all 'ConjunctionCoord))
(setq myConjunctionSubs (generate-all 'ConjunctionSub))
(setq myPreps (generate-all 'Preposition))
(setq myAux (generate-all 'AuxVerbPres))

(setq overlyConjunct 0)
(maphash #'(lambda (key value) 
          
             (cond
               ((member key (apply #'append myArts) )  )
               ((member key (apply #'append myConjunctionCoords))
                (cond
                  ((> value 3) (setq overlyConjunct 1)))
                   )
               ((member key (apply #'append myConjunctionSubs))  )
               ((member key (apply #'append myPreps)) )
               ((member key (apply #'append myAux)) )
               ((> value 1) (setq badRep 1) )
               (t t))
             
             )table)        

 (cond ((> (length sentence) 30)
        nil)
       ((> badRep 0) nil)
       ((> doubledArt 0) nil)
       ((> overlyConjunct 0) nil)

       (t t))

)


(defun generate-all(phrase)
  ;i got this function and the combine-all function 
  ;from the book, which i figured should be okay?
  ;as the program itself is from the book also
  (cond ((null phrase) (list nil))
        ((listp phrase)
         (combine-all (generate-all (first phrase))
                      (generate-all (rest phrase))))
        ((rewrites phrase)
         (mappend #'generate-all (rewrites phrase)))
        (t (list (list phrase)))))

(defun combine-all (xlist ylist)
  ;from the book
  (mappend #'(lambda (y)
               (mapcar #'(lambda (x) (append x y)) xlist))
           ylist))
        

(defun generateValid(phrase)
(setq valid 1)
(loop (when (= valid 1))
      (setq sent (random-sentence phrase))
      (if (validp sent) (return sent))

   

      )
  )


(defun random-sentence (phrase)
  "Generate a random sentence or phrase"


  (cond ((listp phrase)

         (mappend #'random-sentence phrase))
        ((rewrites phrase)
         (random-sentence (random-elt (rewrites phrase))))
        (t

          (list phrase)
         
          
          ))
          
  ;instead of returning list phrase, should return a list of the list phrase and also the generatetree
  )

(defun generate-tree (phrase)
  "Generate a random sentence or phrase,
  with a complete parse tree."

  
 (cond ((listp phrase)
         

         (mapcar #'generate-tree phrase))
        ((rewrites phrase)
         

         (cons phrase
         
               (generate-tree (random-elt (rewrites phrase)))))

        (t
          
          (list phrase)  
        ;  (cons phrase (random-sentence phrase))

   
          )
      
       )
 )
         
         

;use cons, item and list
;a as tree, b as sentence q = cons(a, b)
         ; (list (list phrase) (random-sentence phrase)))))
          ;(list (list phrase) (random-sentence phrase)))))
         

(defun mappend (fn list)
  "Append the results of calling fn on each element of list.
  Like mapcon, but uses append instead of nconc."
  (apply #'append (mapcar fn list)))

(defun rule-rhs (rule)
  "The right hand side of a rule."
  (rest (rest rule)))

(defun rewrites (category)
  "Return a list of the possible rewrites for this category."
  (rule-rhs (assoc category *grammar*)))

(random-sentence 'sentence)
