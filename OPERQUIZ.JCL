//OPRQUIZ1 JOB OPERQUIZ,CLASS=A,MSGCLASS=Y,REGION=0M,NOTIFY=&SYSUID     00010000
//* ******************************************************************* 00020000
//*             JCL TO RUN OPERQUIZ COBOL OBJECT MEMBER               * 00030000
//*             THIS JCL CODE WAS SYNTAX CHECKED AND SUBMITTED        * 00040000
//*             COPYRIGHT:  GNU GPLV2 LICENSE 2023                    * 00060000
//*             AUTHOR:     PRZEMYSLAW ADAM KUPISZ                    * 00070000
//*             VERSION:    2                                         * 00080000
//* ******************************************************************* 00090000
//STEP1    EXEC IGYWCL,                                                 00100016
//         PARM.COBOL='RMODE(ANY),NODYNAM'                              00110021
//COBOL.SYSIN  DD DSN=&SYSUID..OPERQUIZ.GITHUB.SRC(OPERQUIZ),DISP=SHR   00120020
// DD DSN=&SYSUID..OPERQUIZ.GITHUB.SRC(ORQMOD01),DISP=SHR               00121021
// DD DSN=&SYSUID..OPERQUIZ.GITHUB.SRC(ORQMOD02),DISP=SHR               00122021
//COBOL.SYSLIB DD DSN=&SYSUID..OPERQUIZ.GITHUB.SRC,DISP=SHR             00130021
//LKED.SYSLMOD DD DSN=&SYSUID..OPERQUIZ.LIB.LOAD(OPERQUIZ),DISP=OLD     00140017
//*           DISP=(MOD,PASS),SPACE=(CYL,(3,1),RLSE),                   00150016
//*           DSNTYPE=LIBRARY                                           00160017
//*SYSPRINT DD SYSOUT=*                                                 00170012
//*SYSOUT   DD SYSOUT=*                                                 00180012
//*SYSDUMP  DD SYSOUT=*                                                 00190014
//*IFOK     IF (RC < 4) THEN                                            00200007
//*             PLEASE CHOOSE ONLY ONE PARAMETER                        00210000
//* OPERATOR        FOR CONSOLE OPERATOR INTERACTION                    00220000
//* BATCH           BATCH TO PRINT QUESTIONS AND ABCD ANSWERS PROPOSAL  00230000
//* C,ABCDA         TO PRINT THE CORRECT ANSWERS SUMMARY                00240000
//*   -----  , WHERE ABCDA IS A USER ANSWER FOR 5 QUESTIONS             00250000
//*                                                                     00260000
//* ******************************************************************* 00270000
//**       SET USERP1='OPERATOR'                                        00280022
//         SET USERP1='BATCH'                                           00290022
//**       SET USERP1='C,-----'                                         00300022
//* ------------------------------------------------------------------- 00310000
//STEP2    EXEC PGM=OPERQUIZ,PARM='&USERP1'                             00320020
//STEPLIB  DD DSN=&SYSUID..OPERQUIZ.LIB.LOAD,DISP=SHR                   00330020
//* ------------------------------------------------------------------- 00340000
//* BELOW DEFAULT SETTINGS                                              00350000
//SYSPRINT DD SYSOUT=(*)                                                00360020
//SYSOUT DD SYSOUT=*                                                    00370020
//*ENDIF    ENDIF                                                       00380007
//                                                                      00390001
