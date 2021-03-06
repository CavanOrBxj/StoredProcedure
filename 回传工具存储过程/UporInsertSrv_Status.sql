set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

ALTER  PROCEDURE  [dbo].[UporInsertSrv_Status] @PCODE CHAR(50),@Powersupplystatus CHAR(50),@Powervoltage CHAR(50),@Controlfrequency CHAR(50),@Cflevel CHAR(50),@Audiofrequency CHAR(50),@Aflevel CHAR(50),@Devlogicid CHAR(50),@Devphyid CHAR(50),@Srv_time CHAR(50)
As
    begin
       set xact_abort on;
       begin try
           begin tran
IF EXISTS(SELECT * FROM dbo.Srv_Status WHERE srv_physical_code = @PCODE)  
BEGIN  
UPDATE dbo.Srv_Status SET powersupplystatus=@Powersupplystatus,powervoltage=@Powervoltage,controlfrequency=@Controlfrequency,cflevel=@Cflevel,audiofrequency=@Audiofrequency,aflevel=@Aflevel,devlogicid=@Devlogicid,devphyid=@Devphyid,srv_time=@Srv_time WHERE srv_physical_code = @PCODE  
END  
ELSE  
BEGIN  
INSERT INTO dbo.Srv_Status  
                            ( powersupplystatus ,powervoltage,controlfrequency,cflevel,audiofrequency,aflevel,devlogicid,devphyid,srv_time,srv_physical_code)   
VALUES  ( @Powersupplystatus ,   
          @Powervoltage ,   
		   @Controlfrequency , 
           @Cflevel , 
		   @Audiofrequency , 
           @Aflevel ,  
		   @Devlogicid , 
           @Devphyid ,
		   @Srv_time ,   
           @PCODE  
        )  
        END 
           commit tran
       end try
       begin catch
           --在此可以使用xact_state()来判断是否有不可提交的事务,不可提交的事务
           --表示在事务内部发生错误了。Xact_state()有三种值：-1.事务不可提交；
           --1.事务可提交；0.表示没有事务，此时commit或者rollback会报错。
           if xact_state()=-1
              rollback tran;
       end catch
end

