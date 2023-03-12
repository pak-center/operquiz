       IDENTIFICATION DIVISION.
       PROGRAM-ID. OPERQUIZ.
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
      *          VER-2 IMPL. START/STOP, ELAPSED TIME
      *
      *    TODO
      *          VER-3 IMPL. PSEUDO-RANDOM ORDER OF QUESTIONS DISPL
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
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-OPER-VIEW.
           05 WS-HLINE    PIC X(80) VALUES ALL '*'.
      ******************************************************************
       01 WS-DATE-DATA OCCURS 2 TIMES INDEXED BY INDX-T. 
                          *> 1 AT START, 2 AT STOP
        05  WS-DATE.
         10  WS-Y                           PIC 9(04).
         10  WS-M                           PIC 9(02).
         10  WS-D                           PIC 9(02).
        05  WS-TIME.
         10  WS-H                           PIC 9(02).
         10  WS-MN                          PIC 9(02).
         10  WS-S                           PIC 9(02).
         10  WS-MS                          PIC 9(02).
      *******************       
      * LOCAL-STORAGE SECTION.
       LINKAGE SECTION.
       01 PARM-BUFFER.
           05 PARM-LENGTH                   PIC S9(4) COMP. 
           05 PARM-DATA                     PIC X(256). 
           05 LK-WORD REDEFINES PARM-DATA   PIC X. 
      ******************************************************************
       PROCEDURE DIVISION USING PARM-BUFFER. 
           INITIALIZE WS-DATE-DATA 
           MOVE FUNCTION CURRENT-DATE TO WS-DATE-DATA(1) 

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
      *     MOVE FUNCTION UPPER-CASE(LK-WORD) TO LK-WORD 
           MOVE FUNCTION UPPER-CASE(PARM-DATA) TO PARM-DATA 
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
      D    DISPLAY 'PRINT ALL QUESTIONS AND ABCD ANSwERS'
           CALL 'ORQMOD01' USING WS-HLINE 
           CALL 'ORQMOD02' USING WS-HLINE, PARM-BUFFER *>parm not used 
           MOVE 0 TO RETURN-CODE
           EXIT.
       PROC-BATCH-C.
       *> ARG CHECK FOR C,ABCDA
      D    DISPLAY 'READ ANSWERS FROM PARM=(C,*) , WHERE * IS A-D',
      D    'E.G. (C,ABCDA) FOR 5 QUESTIONS'   
           CALL 'ORQMOD01' USING WS-HLINE 
      D    DISPLAY 'DEBUG: PARM-BUFFER= ', PARM-BUFFER 
           CALL 'ORQMOD02' USING WS-HLINE, PARM-BUFFER  
           EXIT. 
       PROC-ELAPSED-TIME. 
           MOVE FUNCTION CURRENT-DATE TO WS-DATE-DATA(2)  
           SET INDX-T TO 1 
           PERFORM 2 TIMES 
           DISPLAY WS-HLINE 
           IF INDX-T IS EQUAL 1 
            DISPLAY '* PGM STARTED AT: ' 
            ELSE 
            DISPLAY '* PGM ENDED AT:   '  
           END-IF 

           PERFORM PROC-TIME-DISPL 
           SET INDX-T UP BY 1
           END-PERFORM
         
           DISPLAY WS-HLINE
           DISPLAY '* PGM ELAPSED TIME: ' 
           SUBTRACT WS-DATE-DATA(2) FROM WS-DATE-DATA(1) 
           SET INDX-T TO 1
           PERFORM PROC-TIME-DISPL 
           DISPLAY WS-HLINE 
           DISPLAY WS-HLINE 
           EXIT. 
       PROC-TIME-DISPL. 
           DISPLAY 'DATE: ',
           WS-Y(INDX-T),'/',WS-M(INDX-T),'/',WS-D(INDX-T),' ',
           'TIME: ',WS-H(INDX-T),':',WS-MN(INDX-T),
           ':',WS-S(INDX-T),':',WS-MS(INDX-T),'MS'  
           EXIT. 
