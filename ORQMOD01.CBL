       IDENTIFICATION DIVISION.
       PROGRAM-ID. ORQMOD01.
      ******************************************************************
      *    OPERATOR CONSOLE & SCREEN QUIZ ABOUT MAINFRAME
      ******************************************************************
      *
      *          COPYRIGHT:  GNU GPLV2 LICENSE 2023
      *          AUTHOR:     PRZEMYSLAW ADAM KUPISZ
      *          VERSION:    1
      *
      *    WARNING
      *          CODE WAS NOT COMPILED AND RUN
      *          JUST PARSED AND SYSNTAX CHECKED FOR THAT MOMENT
      *          WRITTEN IN LEGACY VSCODE WITHOUT GNUCOBOL EXTENSION
      *
      *    PURPOSE
      *          TRAINING AND COGNITIVE OBJECTIVES OF COBOL
      *
      *    TODO
      *          VER-2 IMPL. SCREENS
      *          VER-3 IMPL. START/STOP, ELAPSED TIME
      *          VER-4 IMPL. PSEUDO-RANDOM ORDER OF QUESTIONS DISPL
      *
      ******************************************************************
      *
      *    PROJECT CONTAINS:
      *          JCL JOB           OPERQUIZ.JCL   JCL WITH PARAMS
      *          MAIN PGM          OPERQUIZ.CBL   INIT
      *          SUB PGM MODULES   ORQMOD01.CBL   WELCOME TEXT FOR CONS
      *                            ORQMOD02.CBL   CONSOLE PART OF QUIZ
      *          COBYBOOKS         CPBQAC01       QUESTIONS AND ANSWERS
      *							   CPBQAC02		  V2 OF Q&A REC FORMAT
      *
      ******************************************************************
       DATA DIVISION.
       LINKAGE SECTION.
       01 WS-HLINE    PIC Z(80).
       PROCEDURE DIVISION USING WS-HLINE.
           DISPLAY WS-HLINE
           DISPLAY WS-HLINE(1:1), 
           'OPERATOR CONSOLE & SCREEN QUIZ ABOUT MAINFRAME VER-1'
           , WS-HLINE(1:1)
           DISPLAY WS-HLINE(1:1), 
           'RULES: 1 QUESTION AND 4 ANSWERS, CHOOSE A,B,C OR D'
           , WS-HLINE(1:1)
           DISPLAY WS-HLINE(1:1), 
           'AUTHOR NAME: PRZEMYSLAW ADAM KUPISZ'
           , WS-HLINE(1:1)
           DISPLAY WS-HLINE(1:1), 
           'COPYRIGHTS: GNU GPL2 2023'
           , WS-HLINE(1:1)
           DISPLAY WS-HLINE
           DISPLAY 'PRESS Y TO START OR ANY OTHER KEY TO QUIT'
           GOBACK.