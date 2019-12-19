---
interact_link: content/labs/lab01/index.ipynb
title: 'Lab 1 - Elemementary Signals'
prev_page:
  url: /labs/index
  title: 'Laboratory Exercises'
next_page:
  url: /labs/lab02/index
  title: 'Lab 2 - Laplace and Inverse Laplace Transforms'
comment: "***PROGRAMMATICALLY GENERATED, DO NOT EDIT. SEE ORIGINAL FILES IN /content***"
---

# Lab 01: Elementary Signals

## Keeping Lab Records

The lab component will be assessed based on a portfolio of the MATLAB scripts, Simulink models and publishable MATLAB Live Scripts. You should therefore aim to keep all the files from each lab session in a suitable folder in your workspace on the `p:\` drive. I would suggest a structure like **eg-247-textbook\portfolio\lab01** which matches the layout of the files on this [GitHub repository](https://github.com/cpjobling/eg-247-textbook/tree/master/portfolio).

One elegant way to do this would be to fork this GitHub repository ([cpjobling/eg-247-textbook](https://github.com/cpjobling/eg-247-textbook)) and then build on from there, but that is not necessary.

If you do not use GitHub as the master repository of your portfolio, please ensure that you backup your work files regularly. You will be required to submit some or all of them for assessment.

## Preamble to this Lab

### Associated Class Notes

This lab supports the materials covered in [Chapter 2 Elementary Signals](https://cpjobling.github.io/eg-247-textbook/elementary_signals/index) of the course notes. You may wish to refer to the Worksheets [worksheet 2](https://cpjobling.github.io/eg-247-textbook/introduction/worksheet2) and [worksheet 3](https://cpjobling.github.io/eg-247-textbook/introduction/worksheet3) for additional examples to try. 

### Other formats

This document is available in [HTML](https://cpjobling.github.io/eg-247-textbook/labs/lab01/index) format for online viewing and as [PDF](https://cpjobling.github.io/eg-247-textbook/labs/lab01/lab01.pdf) for printing.

### Acknowledgement

These examples have been adapted from Chapter 1 of
[Stephen Karris, Signals and Systems : With MATLAB
Computing and Simulink Modeling (5th Edition)](http://site.ebrary.com/lib/swansea/docDetail.action?docID=10547416)

## Aims

The purposes of this laboratory are to

1. Explore the properties of the unit step and Dirac delta functions using the analysis and plotting tools  provided by Matlab.
1. Synthesise a generalised signal in Simulink and plot it and its derivative.
1. Experience **Peer Assessment** as a coursework moderation and feedback process.

This will introduce the symbolic toolbox and the `heaviside`, `delta` and `ezplot` functions provided by MATLAB  and the *signal design block*, *multiplexer*, *scope* and *derivative* blocks provided by Simulink for the simulation of continuous time signals and systems.

We will also demonstrate the Live Script feature provided by MATLAB that will be useful for recording lab results for this module.

## Assessment criteria

Up to three marks can be claimed according to how many of parts 1-5 in the lab exercises have been completed. The mini project is worth an additional two marks. There are an additional 5 marks available for participating in the peer assessment. 

Detailed marking criteria for this and the other labs and the project are given in the linked [Assessment Criteria](https://docs.google.com/spreadsheets/d/1EQzwSfGMdw8oiQds4bUR8sZTCgb2lMvcJHjmea-8hW4/edit?usp=sharing) [Google sheet].

## Set up

### Before you start

Create a suitable folder structure on your file-store for your labs. 

I suggest:

```
P:\workspace
  signals-and-systems-lab
	lab01
	lab02
```
				:

Use folder `p:\workspace\signals-and-systems-lab\lab01` for this lab.

### Download starter script

Right click to save the file [elem_sigs.m](elem_sigs.m) as `elem_sigs.m` to your ``lab01`` folder. Open the file from the file browser in MATLAB as a Live Script file.

Here is a [short video](https://youtu.be/xwrZAE0D6cY), illustrating how to do this.

## Lab Exercises

### Lab Exercise 1.1

For Lab Exercise 1 you are required to complete parts 1 to 2 of the provided script (1 mark).

### Lab Exercise 1.2

For Lab Exercise 2 you are required to complete parts 3 to 5 of the provided script (2 marks).

### Mini Project 1

Work through the procedures given between [pages 1-18 and 1-19 of the text book](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?ppg=34&docID=3384197&tm=1518436444996) to construct the piecewise signal generator first shown in [Figure 1.21](https://ebookcentral.proquest.com/lib/swansea-ebooks/reader.action?ppg=31&docID=3384197&tm=1518436492450) inside Simulink. 

![Signal Synthesis Example](fig21.PNG)

*Signal to be synthesised (Reproduction of Fig 1.21 of Karris)*

Connect the signal up a derivative block and scope as shown in Figure 1.24 and simulate the system. Verify the result illustrated in Figures 1.23, 1.25 and 1.26. Store the Simulink model as ``signal.slx`` in your portfolio for later assessment. 

**Note**: you will need to adjust the Simulation parameters in Simulink in orer to allow the simulation to run from a time earlier than -1 seconds.

(2 marks)

## What to Hand In


### Claim

Up to three marks can be claimed according to how many of parts 1-5 in the lab exercises have been completed. The mini project is worth an additional 2 marks.

Make your claim by downloading and editing the labwork claim form and declaration: [lab01-claim.docx](lab01-claim.docx) [Word].

### Submission

You should submit the following to the **Lab 01: Elementary Signals** Assignment on Canvas.

1. The completed labwork claim form and declaration.
2. As evidence for completion of the lab exercises, your completed version of the Live Script file `elem_signals.mlx`.
3. As evidence of completion of the Miniproject, the Simulink model of the piecewise linear signal `signal.slx`.

### Deadline

The Deadline for claims and submission is Midnight, 21st February 2020.

### Important

To avoid errors in verification, particularly with Simulink, you should check that your script and simulations work on the version of MATLAB that is installed in the shared desktop (Version 2018b at last check). If you have installed a more recent version of MATLAB, ensure that you save your Simulink model using the older version (use **File** > **Export Model to** > **Previous Version**).

## Peer Assessment

Peer assessment is valuable for the following three reasons:

1. You will be able to learn something about the electronic assessment processes being used in the University.
2. You will learn more about how to give and receive constructive feedback.
3. It encourages you to to realistic in your claims and increases my confidence in self-assessment as a valid method of marking coursework.
4. By seeing several submissions, you will be able to identify good and poor practice and be encouraged improve your own work.
5. It allows me to distribute the load of validating individual claims making grading more efficient for me.

The claims on this and the next two lab submissions will be moderated by **Peer Assessment**. Each one of you will be asked to review three of this first submission, two of the second and one of the third. 

For this lab exercise, the peer assessment is worth five marks. There is a total of 10 marks available for your participation in peer assessment. 

## How to do Peer Assessment

As a peer assessor, you will be required to review three of these submissions and let me know if you agree with the self-assigned score. 

To complete your peer assessments, you should download and run the MATLAB Live Scripts and Simulink models and check that the results are correct and complete.

### Checking the submitted work

On Monday 24th February, you should receive notification that the submissions of three of your colleagues are available for peer assessment. This notification will arrive by email (if you have your Canvas notifications turned on) or via the inbox on Canvas or the Canvas Student App. 

To perform an assessment, you will need access to MATLAB and Simulink. For compatibility reasons, you should use the version of MATLAB that is installed on the shared University desktop. (Although newer versions of MATLAB will open older versions of Simulink files, the reverse is not true.) If you have problems running any files that are submitted, please note this in your feedback.

To perform a Peer Assessment you should visit each submission, review the claim form submitted and download the attached files. I would recommend that you create a folder for each submission. I would also recommend that you clear the MATLAB workspace (see command below) before testing each set of submitted files.

``matlab
clear all
``

### Assessment procedure for this lab

1. Open the Live Script file `elem_signals.mlx` and execute **run all**. Check that the results are all present and that there are no errors. Review the formatting of the file and think about how readable and understandable the script is as a record of the experiment. 
2. Open and run the Simulink model `signal.slx` and confirm that the results match the figure given above. 

### Grading

Use the grading rubric to confirm your peer's self assessment. **Note** you may may award a higher mark if you feel that the student has marked themselves too harshly! You should give a reason for your score if it does not agree with the student's own self-assessment. 

### Feedback

You should also provide feedback on the student's approach to the lab exercise. Your comments might include comments on:

* Any problems you encountered checking your peer's submission.
* Use of headings and sections to break up the Live Script documentation of the lab exercise.
* Good use of textual comments in the Live Script file to explain the MATLAB code.
* Things that the student did that you wish you had thought of.
* Suggestions on what the student may do next time to clarify their approach.

Note that the instructor will moderate all peer assessments before assigning the final grade.

## Doing More

If you have time remaining, you may wish to confirm some of the results covered in class from [worksheet 2](https://cpjobling.github.io/eg-247-textbook/worksheets/worksheet2) and [worksheet 3](https://cpjobling.github.io/eg-247-textbook/worksheets/worksheet3). You can also work through Appendix A of the textbook: that chapter introduces MATLAB in a way that matches the presentation in the rest of the book. There are also additional tutorial and video introductions to *MATLAB*, *Simulink* and the *Signal Processing Toolbox* in the **Getting Started with MATLAB** folder in the Labs section of the Canvas site for Signals and Systems.
