       IDENTIFICATION DIVISION.                                         00010001
       PROGRAM-ID. ORQMOD02.                                            00020001
      ******************************************************************00030001
      *    OPERATOR CONSOLE & SCREEN QUIZ ABOUT MAINFRAME               00040001
      ******************************************************************00050001
      *                                                                 00060001
      *          COPYRIGHT:  GNU GPLV2 LICENSE 2023                     00070001
      *          AUTHOR:     PRZEMYSLAW ADAM KUPISZ                     00080001
      *                                                                 00090001
      *    WARNING                                                      00100001
      *          CODE WAS COMPILED AND RUN                              00110001
      *          WRITTEN IN LEGACY VSCODE WITHOUT GNUCOBOL EXTENSION    00130001
      ******************************************************************00140001
      *                                                                 00150001
      *    PROJECT CONTAINS:                                            00160001
      *          JCL JOB           OPERQUIZ.JCL   JCL WITH PARAMS       00170001
      *          MAIN PGM          OPERQUIZ.CBL   INIT                  00180001
      *          SUB PGM MODULES   ORQMOD01.CBL   WELCOME TEXT FOR CONS 00190001
      *                            ORQMOD02.CBL   QUIZ PART             00200001
      *          COBYBOOKS         CPBQAC01       QUESTIONS AND ANSWERS 00210001
      *                            CPBQAC02       VER2 OF Q&A           00220001
      *                                                                 00230001
      ******************************************************************00240001
       DATA DIVISION.                                                   00250001
       WORKING-STORAGE SECTION.                                         00260001
       01 WS-QA-TABLE.                                                  00270001
        04 WS-RECORD02 OCCURS 5 TIMES INDEXED BY I.                     00280001
         05 WS-Q           PIC   X(50).                                 00290001
         05 WS-A           PIC   X(40).                                 00300001
         05 WS-C           PIC   A.                                     00310001
       01 INR              PIC   9  USAGE IS COMP.                      00311003
      ******************************************************************00320001
       LOCAL-STORAGE SECTION.                                           00330001
       01 LS-ALL.                                                       00340001
         05 LS-INPUT       PIC   X        VALUE 'Q'.                    00350001
         05 LS-RES1        PIC   9(3)     VALUE 0.                      00360001
         05 LS-RES2        COMP-2         VALUE 0.                      00370001
         05 LS-Q-AMOUNT    PIC   999      VALUE 5.                      00380001
       01 LS-QAC-BOOK.                                                  00390001
           COPY CPBQAC02. *> PREV V1 CPBQAC01                           00400001
      ******************************************************************00410001
       LINKAGE SECTION.                                                 00420001
       01 WS-HLINE                       PIC   X(80).                   00430001
       01 PARM-BUFFER.                                                  00440001
        05 PARM-LENGTH                   PIC   S9(4) COMP.              00450001
        05 PARM-DATA                     PIC   X(256).                  00460001
      ******************************************************************00470001
       PROCEDURE DIVISION USING WS-HLINE, PARM-BUFFER.                  00480001
      * --------------------------------------------------------------- 00490001
      *    PART TO ACTIVATE BATCH MODE & TO REUSE CODE                  00500001
      ******************************************************************00510001
           IF (PARM-DATA(1:2) = 'C,')                                   00520001
           AND (PARM-LENGTH - 2 = LS-Q-AMOUNT)                          00530001
           THEN                                                         00540001
           PERFORM PROC-CHECK-ANSWERS                                   00550001
           ELSE                                                         00560001
            DISPLAY 'ERROR: WRONG COUNT OF LETTERS A-D AS ANSWERS'      00570001
            DISPLAY 'ERROR: PGM NEEDS IN JCL ', LS-Q-AMOUNT, ' LETTERS',00580002
            ' AFTER , SIGN'                                             00590001
      D     DISPLAY 'DEBUG: IN JCL PARM-LENGTH:  ', PARM-LENGTH         00600001
      D     DISPLAY 'DEBUG: NUMBER OF QUESTIONS: ', LS-Q-AMOUNT         00610001
      *IMPL. RC IN RETURN                                               00620001
           GOBACK                                                       00630001
      * --------------------------------------------------------------- 00640001
           END-IF                                                       00650001
           *>                                                           00660001
           ACCEPT LS-INPUT                                              00670001
      D    DISPLAY 'DEBUG: LS-INPUT=', LS-INPUT                         00680001
           MOVE FUNCTION UPPER-CASE(LS-INPUT) TO LS-INPUT               00690001
           IF LS-INPUT = 'Y' THEN                                       00700001
            PERFORM PROC-CHECK-ANSWERS                                  00710001
           END-IF.                                                      00720001
           DISPLAY WS-HLINE                                             00730001
           DISPLAY 'BYE, BYE :)'                                        00740001
           GOBACK.                                                      00750001
      ******************************************************************00760001
       PROC-CHECK-ANSWERS.                                              00770001
           SET I TO 1                                                   00780001
           MOVE 1 TO INR                                                00781003
           MOVE LS-QAC-BOOK TO WS-RECORD02(I)                           00790003
      *    WS-QA-TABLE *>NEEDS CHECK AFTER COMPILE                      00800001
      *    LOOP FOR 5 QUESTIONS IN LS-Q-AMOUNT VARIABLE                 00810001
           PERFORM VARYING I                                            00820001
            FROM 1 BY 1                                                 00830001
            UNTIL I > LS-Q-AMOUNT *> 5 = NR OF QUESTIONS                00840001
            IF PARM-DATA(1:2) = 'C,' THEN                               00850001
            PERFORM PROC-RESPONSE-BATCH                                 00860001
            ELSE                                                        00870001
      D      DISPLAY 'DEBUG: CONSOLE ROAD.'                             00880001
             PERFORM PROC-ASK                                           00890003
             PERFORM PROC-RESPONSE                                      00900001
            END-IF                                                      00910001
            COMPUTE INR = INR + 1                                       00911003
           END-PERFORM                                                  00920001
           PERFORM PROC-SHOW-RESULT                                     00930001
           EXIT.                                                        00940001
      ******************************************************************00950001
       PROC-SHOW-RESULT.                                                00960001
           COMPUTE LS-RES2 = (LS-RES1 / LS-Q-AMOUNT) * 100              00970001
           DISPLAY '*** YOUR SCORE IS ',                                00980003
            LS-RES1, ' ANSWERS CORRECT FROM ', LS-Q-AMOUNT ' TOTAL.'    00990003
           DISPLAY '*** ITS ', LS-RES2, '%'                             01000001
           EXIT.                                                        01010001
      ******************************************************************01020001
       PROC-ASK.                                                        01030001
           DISPLAY WS-HLINE                                             01040001
           DISPLAY WS-HLINE(1:2),                                       01050001
           ' QUESTION-', INR, ': ', WS-Q(I)                             01060003
           DISPLAY ' ', WS-A(I)                                         01070002
           DISPLAY 'CHOOSE THE CORRECT ANSWER'                          01080001
           EXIT.                                                        01090001
      ******************************************************************01100001
       PROC-RESPONSE.                                                   01110001
           ACCEPT LS-INPUT                                              01120001
      D    DISPLAY 'DEBUG: LS-INPUT=', LS-INPUT                         01130001
           MOVE FUNCTION UPPER-CASE(LS-INPUT) TO LS-INPUT               01140001
           IF LS-INPUT = WS-C(I) THEN                                   01150001
              COMPUTE LS-RES1 = LS-RES1 + 1                             01160001
           END-IF.                                                      01170001
           EXIT.                                                        01180001
      ******************************************************************01190001
       PROC-RESPONSE-BATCH.                                             01200001
           IF PARM-DATA(2 + INR:1) = WS-C(I) THEN                       01210003
              COMPUTE LS-RES1 = LS-RES1 + 1                             01220001
           END-IF.                                                      01230001
           EXIT.                                                        01240001
       END PROGRAM ORQMOD02.                                            01250003
