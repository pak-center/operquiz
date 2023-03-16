//OPRQUIZ1 JOB OPERQUIZ,CLASS=A,MSGCLASS=Y,REGION=0M,NOTIFY=&SYSUID
//* *******************************************************************
//*             JCL TO RUN OPERQUIZ COBOL OBJECT MEMBER               *
//*             THIS JCL CODE WAS NOT SYNTAX CHECKED OR SUBMITTED     *
//*             DO THIS BY YOURSELF BEFORE SUBMITTING                 *
//*             COPYRIGHT:  GNU GPLV2 LICENSE 2023                    *
//*             AUTHOR:     PRZEMYSLAW ADAM KUPISZ                    *
//*             VERSION:    2                                         *
//* *******************************************************************
//*             PLEASE CHOOSE ONLY ONE PARAMETER
//* OPERATOR        FOR CONSOLE OPERATOR INTERACTION
//* BATCH           BATCH TO PRINT QUESTIONS AND ABCD ANSWERS PROPOSAL
//* C,ABCDA         TO PRINT THE CORRECT ANSWERS SUMMARY
//*   -----  , WHERE ABCDA IS A USER ANSWER FOR 5 QUESTIONS
//*
//* *******************************************************************
//          SET USERP1='OPERATOR'
//**        SET USERP1='BATCH'
//**        SET USERP1='C,-----'
//* -------------------------------------------------------------------
//STEP1 EXEC PGM=OPERQUIZ,PARM='&USERP1'
//*STEPLIB   DD DSN= ,DISP=SHR
//* -------------------------------------------------------------------
//* BELOW DEFAULT SETTINGS
//SYSPRINT DD SYSOUT=*
//SYSOUT DD SYSOUT=*
//SYSDUMP DD SYSOUT=*
//
