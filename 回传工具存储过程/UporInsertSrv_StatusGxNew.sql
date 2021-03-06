set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

ALTER  PROCEDURE  [dbo].[UporInsertSrv_StatusGxNew] @PCODE CHAR(50),@Broadcaststate CHAR(50),@Voltage220 CHAR(50),@Fm_frelist1 CHAR(50),@Fm_signalstrength1 CHAR(50),@Fm_frelist2 CHAR(50),@Fm_signalstrength2 CHAR(50),@Logicaladdress CHAR(50),@Physicaladdress CHAR(50),@Srv_time CHAR(50),@Playtype CHAR(50),@Versions CHAR(50),@Digitaltv_radiofrequencymode CHAR(50),@Digitaltv_radiofrequencyfre CHAR(50),@Broadcast_volume CHAR(50),@Currentmode_signalquality CHAR(50),@Currentmode_signalstrength CHAR(50),@Remotecontrolcenter_ip CHAR(50),@Remotecontrolcenter_port CHAR(50),@Audioserver_ip CHAR(50),@Audioserver_port CHAR(50),@Callway CHAR(50),@Filename CHAR(50),@Recording_duration CHAR(50),@Packs_totalnumber CHAR(50),@Rebackfiletype CHAR(50),@Packstartindex CHAR(50),@Lastpacksnumber CHAR(50),@Terminaltype CHAR(50),@Longitude CHAR(50),@Latitude CHAR(50),@Rebackmode CHAR(50),@Networkmode CHAR(50),@Voltage24 CHAR(50),@Voltage12 CHAR(50),@Amplifierelectric_current CHAR(50),@Localhost CHAR(50),@Subnetmask CHAR(50),@Defaultgateway CHAR(50),@Manufacturer_information CHAR(50) 
As
    begin
       set xact_abort on;
       begin try
           begin tran
IF EXISTS(SELECT * FROM dbo.Srv_StatusGxNew WHERE srv_physical_code = @PCODE)  
BEGIN  
UPDATE dbo.Srv_StatusGxNew SET broadcaststate=@Broadcaststate,voltage220=@Voltage220,fm_frelist1=@Fm_frelist1,fm_signalstrength1=@Fm_signalstrength1,fm_frelist2=@Fm_frelist2,fm_signalstrength2=@Fm_signalstrength2,logicaladdress=@Logicaladdress,physicaladdress=@Physicaladdress,srv_time=@Srv_time,playtype=@Playtype,versions=@Versions,digitaltv_radiofrequencymode=@Digitaltv_radiofrequencymode,digitaltv_radiofrequencyfre=@Digitaltv_radiofrequencyfre,broadcast_volume=@Broadcast_volume,currentmode_signalquality=@Currentmode_signalquality,currentmode_signalstrength=@Currentmode_signalstrength,remotecontrolcenter_ip=@Remotecontrolcenter_ip,remotecontrolcenter_port=@Remotecontrolcenter_port,audioserver_ip=@Audioserver_ip,audioserver_port=@Audioserver_port,callway=@Callway,filename=@Filename,recording_duration=@Recording_duration,packs_totalnumber=@Packs_totalnumber,rebackfiletype=@Rebackfiletype,packstartindex=@Packstartindex,lastpacksnumber=@Lastpacksnumber,terminaltype=@Terminaltype,longitude=@Longitude,latitude=@Latitude,rebackmode=@Rebackmode,networkmode=@Networkmode,voltage24=@Voltage24,voltage12=@Voltage12,amplifierelectric_current=@Amplifierelectric_current,localhost=@Localhost,subnetmask=@Subnetmask,defaultgateway=@Defaultgateway,manufacturer_information=@Manufacturer_information WHERE srv_physical_code = @PCODE  
END  
ELSE  
BEGIN  
INSERT INTO dbo.Srv_StatusGxNew  
                            ( broadcaststate ,voltage220,fm_frelist1,fm_signalstrength1,fm_frelist2,fm_signalstrength2,logicaladdress,physicaladdress,srv_time,playtype,versions,digitaltv_radiofrequencymode,digitaltv_radiofrequencyfre,broadcast_volume,currentmode_signalquality,currentmode_signalstrength,remotecontrolcenter_ip,remotecontrolcenter_port,audioserver_ip,audioserver_port,callway,filename,recording_duration,packs_totalnumber,rebackfiletype,packstartindex,lastpacksnumber,terminaltype,longitude,latitude,rebackmode,networkmode,voltage24,voltage12,amplifierelectric_current,localhost,subnetmask,defaultgateway,manufacturer_information,srv_physical_code)   
VALUES  ( @Broadcaststate ,   
          @Voltage220 ,   
		   @Fm_frelist1 , 
           @Fm_signalstrength1 , 
		   @Fm_frelist2 , 
           @Fm_signalstrength2 ,  
		   @Logicaladdress , 
           @Physicaladdress ,
		   @Srv_time ,   
           @Playtype , 
           @Versions ,
           @Digitaltv_radiofrequencymode , 
		   @Digitaltv_radiofrequencyfre ,  
           @Broadcast_volume , 
		   @Currentmode_signalquality , 
           @Currentmode_signalstrength ,   
		   @Remotecontrolcenter_ip , 
           @Remotecontrolcenter_port ,
		   @Audioserver_ip , 
           @Audioserver_port ,
           @Callway , 
           @Filename ,    
		   @Recording_duration , 
           @Packs_totalnumber ,   
		   @Rebackfiletype ,  
           @Packstartindex ,   
		   @Lastpacksnumber ,  
           @Terminaltype , 
		   @Longitude ,  
           @Latitude , 
		   @Rebackmode , 
           @Networkmode ,   
		   @Voltage24 , 
           @Voltage12 ,  
		   @Amplifierelectric_current , 
           @Localhost ,   
		   @Subnetmask , 
           @Defaultgateway , 
		   @Manufacturer_information ,  
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

