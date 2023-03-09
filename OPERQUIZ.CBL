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
      *          VER-2 IMPL. START/STOP, ELAPSED TIME
      *          VER-3 IMPL. PSEUDO-RANDOM ORDER OF QUESTIONS DISPL
      *
      ******************************************************************
      *
      *    PROJECT CONTAINS:
      *          JCL JOB           OPERQUIZ.JCL   JCL WITH PARAMS
      *          MAIN PGM          OPERQUIZ.CBL   INIT
      *          SUB PGM MODULES   ORQMOD01.CBL   WELCOME TEXT FOR CONS
      *                            ORQMOD02.CBL   CONSOLE PART OF QUIZ
      *          COBYBOOKS         CPBQAC01       QUESTIONS AND ANSWERS
      *                            CPBQAC02       V2 OF Q&A REC FORMAT
      *
      ******************************************************************
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-OPER-VIEW.
           05 WS-HLINE    PIC X(80) VALUES ALL '*'.
      ******************************************************************
       01 WS-START-DATE-DATA.
        05  WS-START-DATE.
         10  WS-START-YEAR                  PIC 9(04).
         10  WS-START-MONTH                 PIC 9(02).
         10  WS-START-DAY                   PIC 9(02).
        05  WS-START-TIME.
         10  WS-START-HOURS                 PIC 9(02).
         10  WS-START-MINUTE                PIC 9(02).
         10  WS-START-SECOND                PIC 9(02).
         10  WS-START-MILLISECONDS          PIC 9(02).
      *******************
       01 WS-STOP-DATE-DATA.
        05  WS-STOP-DATE.
         10  WS-STOP-YEAR                   PIC 9(04).
         10  WS-STOP-MONTH                  PIC 9(02).
         10  WS-STOP-DAY                    PIC 9(02).
        05  WS-STOP-TIME.
         10  WS-STOP-HOURS                  PIC 9(02).
         10  WS-STOP-MINUTE                 PIC 9(02).
         10  WS-STOP-SECOND                 PIC 9(02).
         10  WS-STOP-MILLISECONDS           PIC 9(02).         
      * LOCAL-STORAGE SECTION.
       LINKAGE SECTION.
       01 PARM-BUFFER.
           05 PARM-LENGTH                   PIC S9(4) COMP.
           05 PARM-DATA                     PIC X(256).
           05 LK-WORD REDEFINES PARM-DATA   PIC X. 
      ******************************************************************
       PROCEDURE DIVISION USING PARM-BUFFER. 
           INITIALIZE WS-START-DATE-DATA 
           INITIALIZE WS-STOP-DATE-DATA
           MOVE FUNCTION CURRENT-DATE TO WS-START-DATE-DATA 

           IF PARM-LENGTH > 0 
              PERFORM PROC-READ-PARAM 
           ELSE
              DISPLAY 'WARNING: JCL PARM IS EMPTY'
              MOVE 1 TO RETURN-CODE
           END-IF

           PERFORM PROC-ELAPSED-TIME.
      D    DISPLAY 'DEBUG: RC=', RETURN-CODE  
           STOP RUN.
      ******************************************************************
       PROC-READ-PARAM. 
           MOVE FUNCTION UPPER-CASE(LK-WORD) TO LK-WORD 
           EVALUATE LK-WORD 
              WHEN 'O'
                 PERFORM PROC-OPER
                 *>MOVE 0 TO RETURN-CODE
              WHEN 'B'
                 PERFORM PROC-BATCH-Q
              WHEN 'C'
                 PERFORM PROC-BATCH-C
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
       PROC-BATCH-Q.
           DISPLAY 'MSGINFO: FEATURE NOT IMPLEMENTED YET'
      D    DISPLAY 'PRINT ALL QUESTIONS AND ABCD ANSERS'
           CALL 'ORQMOD01'

           MOVE 0 TO RETURN-CODE
           EXIT.
       PROC-BATCH-C.
       *> ARG CHECK FOR C,ABCDA
      D    DISPLAY 'READ ANSWERS FROM PARM=(C,*) , WHERE * IS A-D',
      D    'E.G. (C,ABCDA) FOR 5 QUESTIONS'   
      D    DISPLAY 'PRINT SUMMARY'  
           EXIT.
       PROC-ELAPSED-TIME.
           MOVE FUNCTION CURRENT-DATE TO WS-START-DATE-DATA 
      D    DISPLAY 'START TIME/DATE'
      
      D    DISPLAY 'STOP TIME/DATE'

      D    DISPLAY 'ELAPSED TIME'
           SUBTRACT WS-STOP-DATE-DATA FROM WS-START-DATE-DATA

           EXIT.
