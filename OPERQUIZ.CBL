       IDENTIFICATION DIVISION.                                         00010003
       PROGRAM-ID. OPERQUIZ.                                            00020003
      ******************************************************************00030003
      *    OPERATOR CONSOLE & SCREEN QUIZ ABOUT MAINFRAME               00040003
      ******************************************************************00050003
      *                                                                 00060003
      *          COPYRIGHT:  GNU GPLV2 LICENSE 2023                     00070003
      *          AUTHOR:     PRZEMYSLAW ADAM KUPISZ                     00080003
      *          VERSION:    2                                          00090003
      *                                                                 00100003
      *    WARNING                                                      00110003
      *          CODE WAS COMPILED AND RUN                              00120003
      *          WRITTEN IN LEGACY VSCODE WITHOUT GNUCOBOL EXTENSION    00140003
      *                                                                 00150003
      *    PURPOSE                                                      00160003
      *          TRAINING AND COGNITIVE OBJECTIVES OF COBOL             00170003
      *                                                                 00180003
      *    INFO                                                         00190003
      *          PGM TAKES PARMS FROM JCL TO SELECT OPERATION MODE      00200003
      *          OPERATOR (C)ONSOLE OR (B)ATCH                          00210003
      *          FOR BATCH WRITE JCL PARM TO COMMAND PGM FLOW           00220003
      *          BATCH = PRINTS 5 QUESTIONS AND ABCD ANSWERS PROPOSAL   00230003
      *          C,ABCDA = CHECKS CORRECT ANSWERS AND PRINTS SUMMARY    00240003
      *          ('ABCDA' IS AN EXAMPLE LIKE 'BBBCC')                   00250003
      *                                                                 00260003
      *          VER-2 IMPL. START/STOP, ELAPSED TIME                   00270003
      *                                                                 00280003
      *    TODO                                                         00290003
      *          VER-3 IMPL. PSEUDO-RANDOM ORDER OF QUESTIONS DISPL     00300003
      *                                                                 00310003
      ******************************************************************00320003
      *                                                                 00330003
      *    PROJECT CONTAINS:                                            00340003
      *          JCL JOB           OPERQUIZ.JCL   JCL WITH PARMS        00350003
      *          MAIN PGM          OPERQUIZ.CBL   INIT                  00360003
      *          SUB PGM MODULES   ORQMOD01.CBL   WELCOME TEXT FOR CONS 00370003
      *                            ORQMOD02.CBL   QUIZ PART             00380003
      *          COBYBOOKS         CPBQAC01       QUESTIONS AND ANSWERS 00390003
      *                            CPBQAC02       VER2 OF Q&A           00400003
      *                                                                 00410003
      ******************************************************************00420003
       DATA DIVISION.                                                   00430003
       WORKING-STORAGE SECTION.                                         00440003
       01 WS-OPER-VIEW.                                                 00450003
        05 WS-HLINE    PIC   X(80) VALUE ALL '*'.                       00460005
      * --------------------------------------------------------------- 00470003
       01 WS-DATES.             *> 1 AT START, 2 AT STOP                00480003
        03 WS-DATE-DATA OCCURS 2 TIMES INDEXED BY INDX-T.               00490003
        05 WS-DATE.                                                     00500010
         10  WS-Y                           PIC    9(4).                00510010
         10  WS-M                           PIC    9(2).                00520010
         10  WS-D                           PIC    9(2).                00530010
        05 WS-TIME.                                                     00540010
         10  WS-H                           PIC    9(2).                00550010
         10  WS-MN                          PIC    9(2).                00560010
         10  WS-S                           PIC    9(2).                00570010
         10  WS-MS                          PIC    9(2).                00580010
        05 ws-sign                          pic   s9(1).                00590010
        05 ws-diff-from-gmt                 pic   s9(4).                00600010
      *01 ws-date-t1                        pic   9(8).                 00610011
      *01 ws-date-t2                        pic   9(8).                 00620011
      *01 ws-date-c                         pic   s9(9).                00630011
      *01 ws-date-b                         pic   s9(9).                00640011
      *01 ws-date-e                         pic   s9(9).                00650011
      ******************************************************************00660003
      * LOCAL-STORAGE SECTION.                                          00670003
       LINKAGE SECTION.                                                 00680003
       01 PARM-BUFFER.                                                  00690003
           05 PARM-LENGTH                   PIC    S9(4) COMP.          00700003
           05 PARM-DATA                     PIC    X(256).              00710003
      ******************************************************************00720003
       PROCEDURE DIVISION USING PARM-BUFFER.                            00730003
           INITIALIZE WS-DATES                                          00740006
           MOVE FUNCTION CURRENT-DATE TO WS-DATE-DATA(1)                00750003
                                                                        00760003
           IF PARM-LENGTH > 0                                           00770003
              PERFORM PROC-READ-PARAM                                   00780003
           ELSE                                                         00790003
              DISPLAY 'WARNING: JCL PARM IS EMPTY'                      00800003
              MOVE 1 TO RETURN-CODE                                     00810003
           END-IF                                                       00820003
                                                                        00830003
           PERFORM PROC-ELAPSED-TIME.                                   00840003
      D    DISPLAY 'DEBUG: RC=', RETURN-CODE                            00850003
           STOP RUN.                                                    00860003
      ******************************************************************00870003
      *    PGM STOP                                                     00880003
      ******************************************************************00890003
       PROC-READ-PARAM.                                                 00900003
           MOVE FUNCTION UPPER-CASE(PARM-DATA) TO PARM-DATA             00910003
           EVALUATE PARM-DATA(1:1)                                      00920011
              WHEN 'O'                                                  00930003
                 PERFORM PROC-OPER                                      00940003
                 *>MOVE 0 TO RETURN-CODE                                00950003
              WHEN 'B'                                                  00960003
                 PERFORM PROC-BATCH-Q                                   00970003
              WHEN 'C'                                                  00980003
                 PERFORM PROC-BATCH-C                                   00990003
              WHEN OTHER                                                01000003
                 DISPLAY 'WARNING: JCL PARM NAME IS INVALID'            01010003
                 MOVE 1 TO RETURN-CODE                                  01020003
           END-EVALUATE                                                 01030003
           EXIT.                                                        01040003
      ******************************************************************01050003
       PROC-OPER.                                                       01060003
           CALL 'ORQMOD01' USING WS-HLINE *> WELCOME MSG SCREEN         01070003
           CALL 'ORQMOD02' USING WS-HLINE *> QUIZ CODE FOR CONSOLE      01080003
           MOVE 0 TO RETURN-CODE                                        01090003
           EXIT.                                                        01100003
      ******************************************************************01110003
       PROC-BATCH-Q.                                                    01120003
           DISPLAY 'MSGINFO: FEATURE NOT IMPLEMENTED YET'               01130003
      D    DISPLAY 'PRINT ALL QUESTIONS AND ABCD ANSWERS'               01140004
           CALL 'ORQMOD01' USING WS-HLINE                               01150003
           CALL 'ORQMOD02' USING WS-HLINE, PARM-BUFFER *>parm not used  01160003
           MOVE 0 TO RETURN-CODE                                        01170003
           EXIT.                                                        01180003
      ******************************************************************01190003
       PROC-BATCH-C.                                                    01200003
       *> ARG CHECK FOR C,ABCDA                                         01210003
      D    DISPLAY 'READ ANSWERS FROM PARM=(C,*) , WHERE * IS A-D',     01220003
      D    'E.G. (C,ABCDA) FOR 5 QUESTIONS'                             01230003
           CALL 'ORQMOD01' USING WS-HLINE                               01240003
      D    DISPLAY 'DEBUG: PARM-BUFFER= ', PARM-BUFFER                  01250003
           CALL 'ORQMOD02' USING WS-HLINE, PARM-BUFFER                  01260003
           EXIT.                                                        01270003
      ******************************************************************01280003
       PROC-ELAPSED-TIME.                                               01290003
           MOVE FUNCTION CURRENT-DATE TO WS-DATE-DATA(2)                01300003
           SET INDX-T TO 1                                              01310003
           PERFORM 2 TIMES                                              01320003
           DISPLAY WS-HLINE                                             01330003
           IF INDX-T IS EQUAL 1                                         01340003
            DISPLAY '* PGM STARTED AT: '                                01350003
            ELSE                                                        01360003
            DISPLAY '* PGM ENDED AT:   '                                01370003
           END-IF                                                       01380003
                                                                        01390003
           PERFORM PROC-TIME-DISPL                                      01400003
           SET INDX-T UP BY 1                                           01410003
           END-PERFORM                                                  01420003
      *                                                                 01430011
      *    DISPLAY WS-HLINE                                             01440011
      *    DISPLAY '* PGM ELAPSED TIME: '                               01450011
      *    SUBTRACT WS-DATE-DATA(2) FROM WS-DATE-DATA(1)                01460008
      *    move ws-date(1) to ws-date-t1                                01470011
      *    move ws-date(2) to ws-date-t2                                01480011
      *    compute ws-date-e = function integer-of-date(ws-date-t1)     01490011
      *    compute ws-date-b = function integer-of-date(ws-date-t2)     01500011
      *    compute ws-date-c = ws-date-e - ws-date-b                    01510011
      *    change from int date to yymmdd format fction below           01520009
      *    compute ws-date-t1 = function day-of-integer(ws-date-c)      01530011
      *    move ws-date-t1 to ws-date(1)                                01540011
      *    date proceed, now time                                       01550010
      *    compute ws-date(1) = ws-date(1) - ws-date(2)                 01560010
      * quite not correct in all cases                                  01570011
      * needed routine to change time to seconds since midnight         01580011
      * or Assembler macro to count time:-)                             01590011
      *    compute ws-h(1) = ws-h(1) - ws-h(2)                          01600011
      *    compute ws-mn(1) = ws-mn(1) - ws-mn(2)                       01610011
      *    compute ws-s(1) = ws-s(1) - ws-s(2)                          01620011
      *    compute ws-ms(1) = ws-ms(1) - ws-ms(2)                       01630011
      *                                                                 01640010
           SET INDX-T TO 1                                              01650003
           PERFORM PROC-TIME-DISPL                                      01660003
           DISPLAY WS-HLINE                                             01670003
           DISPLAY WS-HLINE                                             01680003
           EXIT.                                                        01690003
      ******************************************************************01700003
       PROC-TIME-DISPL.                                                 01710003
           DISPLAY 'DATE: ',                                            01720003
           WS-Y(INDX-T), '/', WS-M(INDX-T), '/', WS-D(INDX-T), ' ',     01730011
           'TIME: ', WS-H(INDX-T), ':', WS-MN(INDX-T),                  01740011
           ':', WS-S(INDX-T), ':', WS-MS(INDX-T), 'MS'                  01750011
           EXIT.                                                        01760003
       END PROGRAM OPERQUIZ.                                            01770012
