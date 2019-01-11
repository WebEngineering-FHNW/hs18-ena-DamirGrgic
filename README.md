# WebEngineering Module, Graded Exercise

## Commit Proposal

Matriculation Number: 17-549-718  

Socrative-Light

Lecturer enters question

Lecturer enters available answers

Students choose answers

Everybody can see report about answers

## Project confirmation

Interesting. This has been the default project before.

confirmed,
D. König


## Project delivery <to be filled by student>

How to start the project: (if other than `grailsw run-app`)

How to test the project:  (if other than `grailsw test-app`)

Hand-written, static HTML 
project description:      (if other than `index.html` in project root directory)

External contributions:

Other comments: 

I'm particular proud of:


## Project grading 

index.html given with one validation error "th start tag in table body". Otherwise ok.

The application works as described.

The application features an information system with CRUD operations for essentially 
6 domain classes, including many to many relations with specialized views and role-based
security. There is only little need for validation and so it doesn't contain much of that.
The UI has basic aspects of responsiveness.

The commit log is very good.
The testing effort is clearly visible, even though some tests fail.
HTML validity with minor issues, e.g. "The aria-controls attribute must point to an element in the same document." Sporadic use of semantic elements (nav).

Commenting is too sparse.
The naming is questionable in some places (what is a survey as opposed to a quiz?)
There is some effort to avoid duplication, e.g. by using templates but then the 
_displayWrapper.gsp appears three times. Also the use of "generate-all" instead of using
scaffolding with selective override leads to lots of duplication in controllers and views.
BTW: this also makes domain evolution more difficult as you have experienced.

You could have made your life easier with the use of scaffolding and by replacing "hasMany"
with a relation table like we did in the lecture. You essentially re-invented the concept of
foreign keys in the StudentAnswer class.
I award an extra point for the particular effort even though you could have spared much of the
work if you followed the lecture approach more closely.

You have created a fully functional, secured, full-stack web application 
and you shown good knowledge of WebMVC.

Grade: 5.8