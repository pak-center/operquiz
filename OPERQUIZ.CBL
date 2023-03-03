       IDENTIFICATION DIVISION.
       PROGRAM-ID. OPERQUIZ.
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
      *							        CPBQAC02		  V2 OF Q&A REC FORMAT
      *
      ******************************************************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-OPER-VIEW.
           05 WS-HLINE    PIC Z(80) VALUES ALL '*'.
      * LOCAL-STORAGE SECTION.
       LINKAGE SECTION.
       01 PARM-BUFFER.
           05 PARM-LENGTH                   PIC S9(4) COMP.
           05 PARM-DATA                     PIC X(256).
           05 LK-WORD REDEFINES PARM-DATA   PIC X.
       PROCEDURE DIVISION USING PARM-BUFFER.
           IF PARM-LENGTH > 0
              PERFORM PROC-READ-PARAM
           ELSE
              DISPLAY 'WARNING: JCL PARM IS EMPTY'
              MOVE 1 TO RETURN-CODE
           END-IF
      D    DISPLAY 'DEBUG: RC=', RETURN-CODE  
           STOP RUN.
      ******************************************************************
       PROC-READ-PARAM.
           MOVE FUNCTION UPPER-CASE(LK-WORD) TO LK-WORD
           EVALUATE LK-WORD
              WHEN 'O'
                 PERFORM PROC-OPER
                 *>MOVE 0 TO RETURN-CODE
              WHEN 'S'
                 PERFORM PROC-SCREEN
              WHEN OTHER
                 DISPLAY 'WARNING: JCL PARM NAME IS INVALID'
                 MOVE 1 TO RETURN-CODE
           END-EVALUATE
           EXIT.
       PROC-OPER.
           CALL 'ORQMOD01' USING WS-HLINE *> WELCOME MSG SCREEN
           CALL 'ORQMOD02' USING WS-HLINE *> QUIZ CODE FOR CONSOLE     
           MOVE 0 TO RETURN-CODE
           EXIT.
       PROC-SCREEN.
           DISPLAY 'MSGINFO: SCREEN FEATURE NOT IMPLEMENTED YET'
           MOVE 0 TO RETURN-CODE
           EXIT.