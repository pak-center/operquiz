//OPRQUIZ1 JOB OPERQUIZ,CLASS=A,MSGCLASS=Y,REGION=0M,NOTIFY=&SYSUID
//* *******************************************************************
//*             JCL TO RUN OPERQUIZ COBOL OBJECT MEMBER               *
//*             THIS JCL CODE WAS NOT SYNTAX CHECKED OR SUBMITTED     *
//*             DO THIS BY YOURSELF BEFORE SUBMITTING                 *
//*             COPYRIGHT:  GNU GPLV2 LICENSE 2023                    *
//*             AUTHOR:     PRZEMYSLAW ADAM KUPISZ                    *
//*             VERSION:    1                                         *
//* *******************************************************************
//*             PLEASE CHOOSE ONLY ONE PARAMETER
//* OPERATOR        FOR CONSOLE OPERATOR INTERACTION
//* SCREEN          FOR INTERACTION WITH SCREENS (NOT IMPLEMENTED YET) 
//*
//          SET USERP1=OPERATOR
//**        SET USERP1=SCREEN
//STEP1 EXEC PGM=OPERQUIZ,PARM='&USERP1'
//* BELOW DEFAULT SETTINGS
//SYSPRINT DD SYSOUT=*
//SYSOUT DD SYSOUT=*
//SYSDUMP DD SYSOUT=*
//