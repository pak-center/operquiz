       IDENTIFICATION DIVISION.                                         00010001
       PROGRAM-ID. ORQMOD01.                                            00020001
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
       LINKAGE SECTION.                                                 00260001
       01 WS-HLINE    PIC  X(80).                                       00270001
       PROCEDURE DIVISION USING WS-HLINE.                               00280001
           DISPLAY WS-HLINE                                             00290001
           DISPLAY WS-HLINE(1:1),                                       00300001
           'OPERATOR CONSOLE & SCREEN QUIZ ABOUT MAINFRAME VER-2'       00310001
           , WS-HLINE(1:1)                                              00320001
           DISPLAY WS-HLINE(1:1),                                       00330001
           'RULES: 1 QUESTION AND 4 ANSWERS, CHOOSE A,B,C OR D'         00340001
           , WS-HLINE(1:1)                                              00350001
           DISPLAY WS-HLINE(1:1),                                       00360001
           'AUTHOR NAME: PRZEMYSLAW ADAM KUPISZ'                        00370001
           , WS-HLINE(1:1)                                              00380001
           DISPLAY WS-HLINE(1:1),                                       00390001
           'COPYRIGHTS: GNU GPL2 2023'                                  00400001
           , WS-HLINE(1:1)                                              00410001
           DISPLAY WS-HLINE                                             00420001
           DISPLAY 'PRESS Y TO START OR ANY OTHER KEY TO QUIT'          00430001
           GOBACK.                                                      00440001
        END PROGRAM ORQMOD01.                                           00450003
