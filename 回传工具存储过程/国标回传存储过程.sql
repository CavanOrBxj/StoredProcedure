set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

ALTER  PROCEDURE  [dbo].[UporInsertSrv_Status_Nation] @ResourceCode CHAR(50),@TerminalVolume CHAR(50),@TerminalAddressInfo CHAR(50),@RebackInfo CHAR(50),@srv_physical_code CHAR(50),@WorkStatus CHAR(50),@FaultCode CHAR(50),@DeviceTypeCode CHAR(50),@HardwareVersionNum CHAR(50),@SoftwareVersionNum CHAR(50),@FMStatus CHAR(50),@DVBCStatus CHAR(50),@DTMBStatus CHAR(50),@DVBC_FreqInfo CHAR(50),@DTMB_FreqInfo CHAR(50),@FM_FreqScanList CHAR(255),@FM_CurrentFreqInfo CHAR(50),@FM_KeepOrderInfo CHAR(50)
As
    begin
       set xact_abort on;
       begin try
           begin tran
IF EXISTS(SELECT * FROM dbo.srvStatus_national WHERE ResourceCode = @ResourceCode)  
BEGIN  
UPDATE dbo.srvStatus_national SET TerminalVolume=@TerminalVolume,TerminalAddressInfo=@TerminalAddressInfo,RebackInfo=@RebackInfo,srv_physical_code=@srv_physical_code,WorkStatus=@WorkStatus,FaultCode=@FaultCode,DeviceTypeCode=@DeviceTypeCode,HardwareVersionNum=@HardwareVersionNum,SoftwareVersionNum=@SoftwareVersionNum,FMStatus=@FMStatus,DVBCStatus=@DVBCStatus,DTMBStatus=@DTMBStatus,DVBC_FreqInfo=@DVBC_FreqInfo,DTMB_FreqInfo=@DTMB_FreqInfo,FM_FreqScanList=@FM_FreqScanList,FM_CurrentFreqInfo=@FM_CurrentFreqInfo,FM_KeepOrderInfo=@FM_KeepOrderInfo WHERE ResourceCode = @ResourceCode  
END  
ELSE  
BEGIN  
INSERT INTO dbo.srvStatus_national  
                            ( ResourceCode,TerminalVolume ,TerminalAddressInfo,RebackInfo,srv_physical_code,WorkStatus,FaultCode,DeviceTypeCode,HardwareVersionNum,SoftwareVersionNum,FMStatus,DVBCStatus,DTMBStatus,DVBC_FreqInfo,DTMB_FreqInfo,FM_FreqScanList,FM_CurrentFreqInfo,FM_KeepOrderInfo)   
VALUES  ( @ResourceCode ,   
          @TerminalVolume ,   
		   @TerminalAddressInfo , 
           @RebackInfo , 
		   @srv_physical_code , 
           @WorkStatus ,  
		   @FaultCode , 
           @DeviceTypeCode ,
		   @HardwareVersionNum ,   
           @SoftwareVersionNum,  
			@FMStatus,  
			@DVBCStatus,  
			@DTMBStatus,  
			@DVBC_FreqInfo,  
			@DTMB_FreqInfo,  
			@FM_FreqScanList,  
			@FM_CurrentFreqInfo,  
			@FM_KeepOrderInfo  

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

