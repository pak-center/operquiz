# operquiz
![GitHub top language](https://img.shields.io/github/languages/top/pak-center/operquiz?style=plastic)
![Lines of code](https://img.shields.io/tokei/lines/github/pak-center/operquiz?label=total%20lines%20of%20code&style=plastic)
![GitHub repo size](https://img.shields.io/github/repo-size/pak-center/operquiz?style=plastic)
![GitHub](https://img.shields.io/github/license/pak-center/operquiz?style=plastic)
## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Installation](#installation)
* [Features](#features)
* [Run the Project](#run-the-project)
* [TOO](#todo)
* [License](#license)
## General info
OPERATOR CONSOLE QUIZ ABOUT MAINFRAME (WRITTEN IN COBOL)
```cobol
      ******************************************************************
      *    OPERATOR CONSOLE & SCREEN QUIZ ABOUT MAINFRAME
      ******************************************************************
      *
      *          COPYRIGHT:  GNU GPLV2 LICENSE 2023
      *          AUTHOR:     PRZEMYSLAW ADAM KUPISZ
      *          VERSION:    2
      *
      *    WARNING
      *          CODE WAS NOT COMPILED AND RUN
      *          JUST PARSED AND SYSNTAX CHECKED FOR THAT MOMENT
      *          WRITTEN IN LEGACY VSCODE WITHOUT GNUCOBOL EXTENSION
      *
      *    PURPOSE
      *          TRAINING AND COGNITIVE OBJECTIVES OF COBOL 
      *
      *    INFO
      *          PGM TAKES PARMS FROM JCL TO SELECT OPERATION MODE
      *          OPERATOR (C)ONSOLE OR (B)ATCH
      *          FOR BATCH WRITE JCL PARM TO COMMAND PGM FLOW
      *          BATCH = PRINTS 5 QUESTIONS AND ABCD ANSWERS PROPOSAL
      *          C,ABCDA = CHECKS CORRECT ANSWERS AND PRINTS SUMMARY
      *          ('ABCDA' IS AN EXAMPLE LIKE 'BBBCC')
      *
      ******************************************************************
      *
      *    PROJECT CONTAINS:
      *          JCL JOB           OPERQUIZ.JCL   JCL WITH PARMS
      *          MAIN PGM          OPERQUIZ.CBL   INIT
      *          SUB PGM MODULES   ORQMOD01.CBL   WELCOME TEXT FOR CONS
      *                            ORQMOD02.CBL   CONSOLE PART OF QUIZ
      *          COBYBOOKS         CPBQAC01       QUESTIONS AND ANSWERS
      *                            CPBQAC02       V2 OF Q&A REC FORMAT
      *
      ******************************************************************
```
## Technologies
Project is created with:
* COBOL
* JCL
## Installation
* Available z/OS COBOL compiler PTF
## Features
| Feature  | % Progress | Status |
| ---      | ---       | --- |
| START/STOP  TIME | ########## | Completed |
| ELAPSED TIME    | ########## | Completed |
| Console Operator play |##########| Completed |
| 5 questions in quiz | ########## | Completed |
| Percentage SUMMARY | ########## | Completed |
| Batch play | ########## | Completed |
| PSEUDO-RANDOM ORDER OF QUESTIONS | # | In Progress | 
| Beautify code | # | In Progress |
## Run the Project
* First we need to compile it using default JCL for Enterprise COBOL
* Then we check compile results and correct warnings or errors if exists or just send them here to the author (to fix the code)
* Edit 'OPERQUIZ.JCL' and change it for our need
* Options available to SET the proper MODE
```jcl
//*            PLEASE CHOOSE ONLY ONE PARAMETER:
//* OPERATOR        FOR CONSOLE OPERATOR INTERACTION
//* BATCH           BATCH TO PRINT QUESTIONS AND ABCD ANSWERS PROPOSAL
//* C,ABCDA         TO PRINT CORRECT ANSWERS SUMMARY
//*   -----  , WHERE ABCDA IS USER ANSWER FOR 5 QUESTIONS
//*
//          SET USERP1='OPERATOR'
//**        SET USERP1='BATCH'
//**        SET USERP1='C,-----'
//STEP1 EXEC PGM=OPERQUIZ,PARM='&USERP1'
```
> Default setting is an operator mode and the rest of available options is commented:
```jcl
//          SET USERP1='OPERATOR'
```
> For batch mode PRINT QUESTIONS we need to comment and uncoment JCL code as below:
```jcl
//**      SET USERP1='OPERATOR'
//        SET USERP1='BATCH'
```
> For batch mode CHECK USER ANSWERS AND PRINT SUMMARY we need to input 5 letters from range A to D to JCL code in place of '-----':
```jcl
//        SET USERP1='C,AABBC'
```
> From TSO: 
> SUBMIT 'USERID.OPERQUIZ.JCL'
## TODO
* VER-3 IMPLEMENT PSEUDO-RANDOM ORDER OF QUESTIONS
## License
[![License: GPL v2](https://img.shields.io/badge/License-GPL_v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)
