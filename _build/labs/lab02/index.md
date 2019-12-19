---
interact_link: content/labs/lab02/index.ipynb
title: 'Lab 2 - Laplace and Inverse Laplace Transforms'
prev_page:
  url: /labs/lab01/index
  title: 'Lab 1 - Elemementary Signals'
next_page:
  url: /labs/lab03/index
  title: 'Lab 3 -  Laplace Transforms and Transfer Functions for Circuit Analysis'
comment: "***PROGRAMMATICALLY GENERATED, DO NOT EDIT. SEE ORIGINAL FILES IN /content***"
---

# Lab 2: Laplace and Inverse Laplace Transforms

## Preamble

### Associated Class Notes

This lab supports the materials covered in [Chapter 3 Laplace Transforms](https://cpjobling.github.io/eg-247-textbook/laplace_transform/index) of the course notes. You may wish to refer to the Worksheets [worksheet 4](https://cpjobling.github.io/eg-247-textbook/laplace_transform/1/worksheet4) and [worksheet 5](https://cpjobling.github.io/eg-247-textbook/laplace_transform/1/worksheet5) for additional examples to try. 

### Other formats

This document is available in [HTML](https://cpjobling.github.io/eg-247-textbook/labs/lab02/index) format for online viewing and [PDF](https://cpjobling.github.io/eg-247-textbook/labs/lab02/lab02.pdf) for printing.

### Acknowledgements

These examples have been adapted from Chapters 1, 2 and 3 of Stephen Karris, [Signals and Systems : With MATLAB Computing and Simulink Modeling (5th Edition)](http://site.ebrary.com/lib/swansea/docDetail.action?docID=10547416).

## Aims

The purpose of this laboratory is to explore more of the features of the MATLAB symbolic toolbox, in particular the `laplace` and `ilaplace` functions. These will be used to verify some of the properties of the Laplace transform typically published in textbooks and in tables of properties and transforms and to solve some inverse transform problems.

## Assessment criteria

Marks will be awarded according to how many of the parts of Lab Exercise 2 and 3 have been completed.

Detailed marking criteria for this and the other labs and the project are given in the linked [Assessment Criteria](https://docs.google.com/spreadsheets/d/1EQzwSfGMdw8oiQds4bUR8sZTCgb2lMvcJHjmea-8hW4/edit?usp=sharing) [Google sheet].

## Setup

### Before you start

If you haven't already, create a suitable folder structure on your file-store for your labs. 

I suggest

```
P:\workspace
    signals-and-systems-lab
	    lab01
		lab02
		:
```

Use folder `p:\workspace\signals-and-systems-lab\lab02` for this lab.

## Lab Exercises


### Lab Exercise 2: Laplace Transforms

Use file save as to download the script [laplace_lab.m](laplace_lab.m). Open the script as a Live Script and use the Matlab ``laplace`` and ``ezplot`` functions as appropriate to complete the examples given in the comments in the script.

Save and upload the resulting modified script as a Live Script file ``laplace_lab.mlx`` to the **Lab 2: Laplace and inverse Laplace transforms** assignment in Canvas.

3 Marks

### Lab Exercise 3: Inverse Laplace Transforms

Use file save as to download the script [ilaplace_lab.m](ilaplace_lab.m). Open the script as a Live Script and use the Matlab ``laplace``, ``ilaplace`` and ``ezplot`` functions as appropriate to complete the examples given in the comments in the script.

Save and attach the resulting modified script as a Live Script file ``ilaplace_lab.mlx`` to the **Lab 2: Laplace and inverse Laplace transforms** assignment in Canvas.

2 marks

## What to Hand In


### Claim

Up to three marks can be claimed according to how much of Exercise 2 you have completed and Exercise 3 is worth an additional 2 marks.

Make your claim by downloading and editing the labwork claim form and declaration: [lab02-claim.docx](lab02-claim.docx) [Word].

### Submission

You should submit the following to the **Lab 02: Laplace and inverse Laplace transforms** Assignment on Canvas.

1. The completed labwork claim form and declaration.
1. As evidence for completion of the lab exercises, you should submit your completed versions of the Live Script files `laplace_lab.mlx` and `ilaplace_lab.mlx`.

### Deadline

The Deadline for claims and submission is Midnight, 28th February 2020.

## Peer Assessment

Peer assessment is valuable for the following three reasons:

1. You will be able to learn something about the electronic assessment processes being used in the University.
2. You will learn more about how to give and receive constructive feedback.
3. It encourages you to to realistic in your claims and increases my confidence in self-assessment as a valid method of marking coursework.
4. By seeing several submissions, you will be able to identify good and poor practice and be encouraged improve your own work.
5. It allows me to distribute the load of validating individual claims making grading more efficient for me.

The claims on this and the next lab submission will be moderated by **Peer Assessment**. Each one of you will be asked to review two of this second submission, and one of the next. 

For this lab exercise, the peer assessment is worth three marks. There is a total of 10 marks available for your participation in peer assessment. 

## How to do Peer Assessment

As a peer assessor, you will be required to review two of these submissions and let me know if you agree with the self-assigned score. 

To complete your peer assessments, you should download and run the MATLAB Live Scripts and check that the results are correct and complete.

### Checking the submitted work

On Monday 2nd March, you should receive notification that the submissions of two of your colleagues are available for peer assessment. This notification will arrive by email (if you have your Canvas notifications turned on) or via the inbox on Canvas or the Canvas Student App. 

To perform an assessment, you will need access to MATLAB. If you have problems running any files that are submitted, please note this in your feedback.

To perform a Peer Assessment you should visit each submission, review the claim form submitted and download the attached files. I would recommend that you create a folder for each submission. I would also recommend that you clear the MATLAB workspace (see command below) before testing each submitted file.

``matlab
clear all
``

### Assessment procedure for this lab

1. Open the Live Script file `laplace_lab.mlx` and execute **run all**. Check that the results are all present and that there are no errors. Review the formatting of the file and think about how readable and understandable the script is as a record of the experiment. 
2. Repeat for `ilaplace_lab.mlx`. 

### Grading

Use the grading rubric to confirm your peer's self assessment. **Note** you may may award a higher mark if you feel that the student has marked themselves too harshly! You should give a reason for your score if it does not agree with the student's own self-assessment. 

### Feedback

You should also provide feedback on the student's approach to the lab exercise. Your comments might include comments on:

* Any problems you encountered checking your peer's submission.
* Use of headings and sections to break up the Live Script documentation of the lab exercises.
* Good use of textual comments in the Live Script file to explain the MATLAB code.
* Things that the student did that you wish you had thought of.
* Suggestions on what the student may do next time to clarify their approach.

Note that the instructor will moderate all peer assessments before assigning the final grade.

## Doing More

If you have time remaining, you may wish to work through [Appendix B of the textbook](http://site.ebrary.com/lib/swansea/reader.action?docID=10547416&ppg=17). This chapter introduces Simulink in a way that matches the presentation in the rest of the book.
