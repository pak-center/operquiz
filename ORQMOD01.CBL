       IDENTIFICATION DIVISION.
       PROGRAM-ID. ORQMOD01.
      ******************************************************************
      *    OPERATOR CONSOLE & SCREEN QUIZ ABOUT MAINFRAME
      ******************************************************************
      *
      *          COPYRIGHT:  GNU GPLV2 LICENSE 2023
      *          AUTHOR:     PRZEMYSLAW ADAM KUPISZ
      *
      *    WARNING
      *          CODE WAS NOT COMPILED AND RUN
      *          JUST PARSED AND SYSNTAX CHECKED FOR THAT MOMENT
      *          WRITTEN IN LEGACY VSCODE WITHOUT GNUCOBOL EXTENSION
      ******************************************************************
      *
      *    PROJECT CONTAINS:
      *          JCL JOB           OPERQUIZ.JCL   JCL WITH PARAMS
      *          MAIN PGM          OPERQUIZ.CBL   INIT
      *          SUB PGM MODULES   ORQMOD01.CBL   WELCOME TEXT FOR CONS
      *                            ORQMOD02.CBL   QUIZ PART
      *          COBYBOOKS         CPBQAC01       QUESTIONS AND ANSWERS
      *                            CPBQAC02       VER2 OF Q&A
      *
      ******************************************************************
       DATA DIVISION.
       LINKAGE SECTION.
       01 WS-HLINE    PIC X(80).
       PROCEDURE DIVISION USING WS-HLINE.
           DISPLAY WS-HLINE
           DISPLAY WS-HLINE(1:1), 
           'OPERATOR CONSOLE & SCREEN QUIZ ABOUT MAINFRAME VER-2'
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
