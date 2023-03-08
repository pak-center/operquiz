       IDENTIFICATION DIVISION.
       PROGRAM-ID. ORQMOD02.
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
       01 WS-QA-TABLE.
        04 WS-RECORD02 OCCURS 5 TIMES INDEXED BY I.
           05 WS-Q           PIC   X(50).
           05 WS-A           PIC   X(40).
           05 WS-C           PIC   A.
       LOCAL-STORAGE SECTION.
       01 LS-ALL.
           05 LS-INPUT       PIC   X        VALUE 'Q'.
           05 LS-RES1        PIC   9(3)     VALUE 0.
           05 LS-RES2        COMP-2         VALUE 0.
           05 LS-Q-AMOUNT    PIC   999      VALUE 5.
       01 LS-QAC-BOOK.
           COPY CPBQAC02. *> PREV V1 CPBQAC01
       LINKAGE SECTION.
       01 WS-HLINE           PIC   X(80).
       PROCEDURE DIVISION USING WS-HLINE.
           ACCEPT LS-INPUT
      D    DISPLAY 'DEBUG: LS-INPUT=', LS-INPUT
           MOVE FUNCTION UPPER-CASE(LS-INPUT) TO LS-INPUT
           IF LS-INPUT = 'Y' THEN
            SET I TO 1
            MOVE LS-QAC-BOOK TO WS-RECORD02
              *>WS-QA-TABLE *>NEEDS CHECK AFTER COMPILE
      * LOOP FOR 5 QUESTIONS IN LS-Q-AMOUNT VARIABLE
            PERFORM VARYING I
             FROM 1 BY 1
             UNTIL I > LS-Q-AMOUNT *> 5 = NR OF QUESTIONS
             PERFORM PROC-ASK
             PERFORM PROC-RESPONSE                 
            END-PERFORM
           PERFORM PROC-SHOW-RESULT
           END-IF.
           DISPLAY WS-HLINE
           DISPLAY 'BYE, BYE :)'
           GOBACK.
      ******************************************************************      
       PROC-SHOW-RESULT.
           COMPUTE LS-RES2 = (LS-RES1 / LS-Q-AMOUNT) * 100
           DISPLAY '*** YOUR SCORE IS '
           , LS-RES1, ' ANSWERS CORRECT FROM ', LS-Q-AMOUNT ' TOTAL.'
           DISPLAY '*** ITS ', LS-RES2, '%'
           EXIT.
       PROC-ASK.
           DISPLAY WS-HLINE
           DISPLAY WS-HLINE(1:2),
           ' QUESTION-',I,': ', WS-Q(I)
           DISPLAY ' ',WS-A(I)
           DISPLAY 'CHOOSE THE CORRECT ANSWER'
           EXIT.
       PROC-RESPONSE.
           ACCEPT LS-INPUT
      D    DISPLAY 'DEBUG: LS-INPUT=', LS-INPUT
           MOVE FUNCTION UPPER-CASE(LS-INPUT) TO LS-INPUT
           IF LS-INPUT = WS-C(I) THEN
              COMPUTE LS-RES1 = LS-RES1 + 1
           END-IF.
           EXIT.
