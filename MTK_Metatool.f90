program PNA
implicit real*8(a,b,d-h,j-z) !, complex*16(c)
!dimension freq(1000),S11(1000,3),S12(1000,3),S21(1000,3),S22(1000,3)
character(len=200) dumA,dumB,dumC,dumD,dumE,dumF,dumG,dumH,dumI
!integer i, ij, number1, number2

!indata=801
!start_f=30d9
!stop_f=40d9
!!start_f=start_f/1d9  ! GHz
!!stop_f=stop_f/1d9    ! GHz
!del_f=(stop_f-start_f)/(indata-1)
!ij_jump=int(0.1d9/del_f)

open(7,file='XB82M_42K3457Z00280_5.csv')
open(17,file='WCDMA_1258_NSFT.txt')

write(17,'(5(1x,a25))') 'B1','Cable Loss (dB) = -0.8'
write(17,'(50(1x,a25))')&
& 'UL_UARFCN','DL_UARFCN','Max_Power_(dBm)','EVM_(%)','Freq_Error_(Hz)','Origin_Offset_(dB)','PCDE_(dB)','OBW_(MHz)',&
& 'ACLR_-5M_(dB)','ACLR_+5M_(dB)','ACLR_-10M_(dB)','ACLR_+10M_(dB)',&
& 'SEM[0]_Margin','SEM[1]_Margin','SEM[2]_Margin','SEM[3]_Margin','Min_Power_(dBm)','BER_(%)','Pre-Burst_Power_(dBm)','Burst_Power_(dBm)',&
& 'Post-Burst_Power_(dBm)','Burst_Power_Error_(dB)','Main_Ant_RSSI_1_(dBm)','Main_Ant_RSSI_2_(dBm)','Main_Ant_RSSI_3_(dBm)'

do i = 1,4
  read (7,*)
enddo

!===============B1 Low Channel===============!
!===============iULUARFCN iDLUARFCN===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'Uplink')
read(dumA(in+14:in+17),'(a)') dumB
read(dumB,*) iULUARFCN

in = index(dumA,'Downlink')
read(dumA(in+16:in+20),'(a)') dumB
read(dumB,*) iDLUARFCN

!write(*,'(1(1x,i5),1(1x,i5))') iULUARFCN, iDLUARFCN

!===============Max Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'(dBm)')
read(dumA(in+6:in+11),'(a)') dumB
read(dumB,*) maxpower

!write(*,'(1(1x,i2),1(1x,a25))') in, dumB
!write(*,'(1x,f6.2)') maxpower

!===============EVM (%)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'EVM')
read(dumA(in+8:in+13),'(a)') dumB
read(dumB,*) EVM

!write(*,'(1x,f6.2)') EVM

!===============Freq. Error (Hz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'Hz')
read(dumA(in+4:in+9),'(a)') dumB
read(dumB,*) freqerr

!write(*,'(1x,f6.2)') freqerr

!===============Origin Offset (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) oriofset

!write(*,'(1x,f6.2)') oriofset

!===============PCDE (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) PCDE

!write(*,'(1x,f6.2)') PCDE

!===============ACLR -5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmf

!write(*,'(1x,f6.2)') ACLRmf

!===============ACLR +5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpf

!write(*,'(1x,f6.2)') ACLRpf

!===============ACLR -10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmt

!write(*,'(1x,f6.2)') ACLRmt

!===============ACLR +10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpt

!write(*,'(1x,f6.2)') ACLRpt

!===============OBW (MHz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) OBW

!write(*,'(1x,f6.2)') OBW

!===============SEM[0] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM0

!write(*,'(1x,f6.2)') SEM0

!===============SEM[1] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM1

!write(*,'(1x,f6.2)') SEM1

!===============SEM[2] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM2

!write(*,'(1x,f6.2)') SEM2

!===============SEM[3] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM3

!write(*,'(1x,f6.2)') SEM3

!===============Min Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) minpower

!write(*,'(1x,f6.2)') minpower

!===============BER (%)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+3),'(a)') dumB
read(dumB,*) BER

!write(*,'(1x,f6.2)') BER

!===============Pre-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) prebupower

!write(*,'(1x,f6.2)') prebupower

!===============Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) bupower

!write(*,'(1x,f6.2)') bupower

!===============Post-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) pobupower

!write(*,'(1x,f6.2)') pobupower

!===============Burst Power Error (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) bupowererr

!write(*,'(1x,f6.2)') bupowererr

!===============Main Ant RSSI 1 (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI1

!write(*,'(1x,f6.2)') RSSI1

!===============Main Ant RSSI 2 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI2

!write(*,'(1x,f6.2)') RSSI2

!===============Main Ant RSSI 3 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI3

!write(*,'(1x,f23.2)') RSSI3


write(17,'(2(1x,i25),50(1x,f25.2))')&
& iULUARFCN,iDLUARFCN,maxpower,EVM,freqerr,oriofset,PCDE,OBW,&
& ACLRmf,ACLRpf,ACLRmt,ACLRpt,&
& SEM0,SEM1,SEM2,SEM3,minpower,BER,prebupower,bupower,&
& pobupower,bupowererr,RSSI1,RSSI2,RSSI3

!write(17,'(50(1x,a25))')&
!& 'UL_UARFCN','DL_UARFCN','Max_Power_(dBm)','EVM_(%)','Freq_Error_(Hz)','Origin_Offset_(dB)','PCDE_(dB)','OBW_(MHz)',&
!& 'ACLR_-5M_(dB)','ACLR_+5M_(dB)','ACLR_-10M_(dB)','ACLR_+10M_(dB)',&
!& 'SEM[0]_Margin','SEM[1]_Margin','SEM[2]_Margin','SEM[3]_Margin','Min_Power_(dBm)','BER_(%)','Pre-Burst_Power_(dBm)','Burst_Power_(dBm)',&
!& 'Post-Burst_Power_(dBm)','Burst_Power_Error_(dB)','Main_Ant_RSSI_1_(dBm)','Main_Ant_RSSI_2_(dBm)','Main_Ant_RSSI_3_(dBm)'

!===============B1 Middle Channel===============!
!===============iULUARFCN iDLUARFCN===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,'Uplink')
read(dumA(in+14:in+17),'(a)') dumB
read(dumB,*) iULUARFCN

in = index(dumA,'Downlink')
read(dumA(in+16:in+20),'(a)') dumB
read(dumB,*) iDLUARFCN

!write(*,'(1(1x,i5),1(1x,i5))') iULUARFCN, iDLUARFCN

!===============Max Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'(dBm)')
read(dumA(in+6:in+11),'(a)') dumB
read(dumB,*) maxpower

!write(*,'(1(1x,i2),1(1x,a25))') in, dumB
!write(*,'(1x,f6.2)') maxpower

!===============EVM (%)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'EVM')
read(dumA(in+8:in+13),'(a)') dumB
read(dumB,*) EVM

!write(*,'(1x,f6.2)') EVM

!===============Freq. Error (Hz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'Hz')
read(dumA(in+4:in+9),'(a)') dumB
read(dumB,*) freqerr

!write(*,'(1x,f6.2)') freqerr

!===============Origin Offset (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) oriofset

!write(*,'(1x,f6.2)') oriofset

!===============PCDE (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) PCDE

!write(*,'(1x,f6.2)') PCDE

!===============ACLR -5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmf

!write(*,'(1x,f6.2)') ACLRmf

!===============ACLR +5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpf

!write(*,'(1x,f6.2)') ACLRpf

!===============ACLR -10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmt

!write(*,'(1x,f6.2)') ACLRmt

!===============ACLR +10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpt

!write(*,'(1x,f6.2)') ACLRpt

!===============OBW (MHz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) OBW

!write(*,'(1x,f6.2)') OBW

!===============SEM[0] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM0

!write(*,'(1x,f6.2)') SEM0

!===============SEM[1] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM1

!write(*,'(1x,f6.2)') SEM1

!===============SEM[2] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM2

!write(*,'(1x,f6.2)') SEM2

!===============SEM[3] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM3

!write(*,'(1x,f6.2)') SEM3

!===============Min Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) minpower

!write(*,'(1x,f6.2)') minpower

!===============BER (%)===============!
do i = 1,7
  read(7,*)
enddo
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+3),'(a)') dumB
read(dumB,*) BER

!write(*,'(1x,f6.2)') BER

!===============Pre-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) prebupower

!write(*,'(1x,f6.2)') prebupower

!===============Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) bupower

!write(*,'(1x,f6.2)') bupower

!===============Post-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) pobupower

!write(*,'(1x,f6.2)') pobupower

!===============Burst Power Error (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) bupowererr

!write(*,'(1x,f6.2)') bupowererr

!===============Main Ant RSSI 1 (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI1

!write(*,'(1x,f6.2)') RSSI1

!===============Main Ant RSSI 2 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI2

!write(*,'(1x,f6.2)') RSSI2

!===============Main Ant RSSI 3 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI3

!write(*,'(1x,f23.2)') RSSI3


write(17,'(2(1x,i25),50(1x,f25.2))')&
& iULUARFCN,iDLUARFCN,maxpower,EVM,freqerr,oriofset,PCDE,OBW,&
& ACLRmf,ACLRpf,ACLRmt,ACLRpt,&
& SEM0,SEM1,SEM2,SEM3,minpower,BER,prebupower,bupower,&
& pobupower,bupowererr,RSSI1,RSSI2,RSSI3
!pause

!===============B1 High Channel===============!
!===============iULUARFCN iDLUARFCN===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,'Uplink')
read(dumA(in+14:in+17),'(a)') dumB
read(dumB,*) iULUARFCN

in = index(dumA,'Downlink')
read(dumA(in+16:in+20),'(a)') dumB
read(dumB,*) iDLUARFCN

!write(*,'(1(1x,i5),1(1x,i5))') iULUARFCN, iDLUARFCN

!===============Max Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'(dBm)')
read(dumA(in+6:in+11),'(a)') dumB
read(dumB,*) maxpower

!write(*,'(1(1x,i2),1(1x,a25))') in, dumB
!write(*,'(1x,f6.2)') maxpower

!===============EVM (%)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'EVM')
read(dumA(in+8:in+13),'(a)') dumB
read(dumB,*) EVM

!write(*,'(1x,f6.2)') EVM

!===============Freq. Error (Hz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'Hz')
read(dumA(in+4:in+9),'(a)') dumB
read(dumB,*) freqerr

!write(*,'(1x,f6.2)') freqerr

!===============Origin Offset (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) oriofset

!write(*,'(1x,f6.2)') oriofset

!===============PCDE (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) PCDE

!write(*,'(1x,f6.2)') PCDE

!===============ACLR -5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmf

!write(*,'(1x,f6.2)') ACLRmf

!===============ACLR +5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpf

!write(*,'(1x,f6.2)') ACLRpf

!===============ACLR -10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmt

!write(*,'(1x,f6.2)') ACLRmt

!===============ACLR +10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpt

!write(*,'(1x,f6.2)') ACLRpt

!===============OBW (MHz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) OBW

!write(*,'(1x,f6.2)') OBW

!===============SEM[0] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM0

!write(*,'(1x,f6.2)') SEM0

!===============SEM[1] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM1

!write(*,'(1x,f6.2)') SEM1

!===============SEM[2] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM2

!write(*,'(1x,f6.2)') SEM2

!===============SEM[3] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM3

!write(*,'(1x,f6.2)') SEM3

!===============Min Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) minpower

!write(*,'(1x,f6.2)') minpower

!===============BER (%)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+3),'(a)') dumB
read(dumB,*) BER

!write(*,'(1x,f6.2)') BER

!===============Pre-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) prebupower

!write(*,'(1x,f6.2)') prebupower

!===============Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) bupower

!write(*,'(1x,f6.2)') bupower

!===============Post-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) pobupower

!write(*,'(1x,f6.2)') pobupower

!===============Burst Power Error (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) bupowererr

!write(*,'(1x,f6.2)') bupowererr

!===============Main Ant RSSI 1 (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI1

!write(*,'(1x,f6.2)') RSSI1

!===============Main Ant RSSI 2 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI2

!write(*,'(1x,f6.2)') RSSI2

!===============Main Ant RSSI 3 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI3

!write(*,'(1x,f23.2)') RSSI3


write(17,'(2(1x,i25),50(1x,f25.2))')&
& iULUARFCN,iDLUARFCN,maxpower,EVM,freqerr,oriofset,PCDE,OBW,&
& ACLRmf,ACLRpf,ACLRmt,ACLRpt,&
& SEM0,SEM1,SEM2,SEM3,minpower,BER,prebupower,bupower,&
& pobupower,bupowererr,RSSI1,RSSI2,RSSI3

!write(17,'(50(1x,a25))')&
!& 'UL_UARFCN','DL_UARFCN','Max_Power_(dBm)','EVM_(%)','Freq_Error_(Hz)','Origin_Offset_(dB)','PCDE_(dB)','OBW_(MHz)',&
!& 'ACLR_-5M_(dB)','ACLR_+5M_(dB)','ACLR_-10M_(dB)','ACLR_+10M_(dB)',&
!& 'SEM[0]_Margin','SEM[1]_Margin','SEM[2]_Margin','SEM[3]_Margin','Min_Power_(dBm)','BER_(%)','Pre-Burst_Power_(dBm)','Burst_Power_(dBm)',&
!& 'Post-Burst_Power_(dBm)','Burst_Power_Error_(dB)','Main_Ant_RSSI_1_(dBm)','Main_Ant_RSSI_2_(dBm)','Main_Ant_RSSI_3_(dBm)'


write(17,*)
write(17,'(5(1x,a25))') 'B2','Cable Loss (dB) = -0.8'
write(17,'(50(1x,a25))')&
& 'UL_UARFCN','DL_UARFCN','Max_Power_(dBm)','EVM_(%)','Freq_Error_(Hz)','Origin_Offset_(dB)','PCDE_(dB)','OBW_(MHz)',&
& 'ACLR_-5M_(dB)','ACLR_+5M_(dB)','ACLR_-10M_(dB)','ACLR_+10M_(dB)',&
& 'SEM[0]_Margin','SEM[1]_Margin','SEM[2]_Margin','SEM[3]_Margin','Min_Power_(dBm)','BER_(%)','Pre-Burst_Power_(dBm)','Burst_Power_(dBm)',&
& 'Post-Burst_Power_(dBm)','Burst_Power_Error_(dB)','Main_Ant_RSSI_1_(dBm)','Main_Ant_RSSI_2_(dBm)','Main_Ant_RSSI_3_(dBm)'
!===============B2 Low Channel===============!
!===============iULUARFCN iDLUARFCN===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,'Uplink')
read(dumA(in+14:in+17),'(a)') dumB
read(dumB,*) iULUARFCN

in = index(dumA,'Downlink')
read(dumA(in+16:in+20),'(a)') dumB
read(dumB,*) iDLUARFCN

!write(*,'(1(1x,i5),1(1x,i5))') iULUARFCN, iDLUARFCN

!===============Max Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'(dBm)')
read(dumA(in+6:in+11),'(a)') dumB
read(dumB,*) maxpower

!write(*,'(1(1x,i2),1(1x,a25))') in, dumB
!write(*,'(1x,f6.2)') maxpower

!===============EVM (%)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'EVM')
read(dumA(in+8:in+13),'(a)') dumB
read(dumB,*) EVM

!write(*,'(1x,f6.2)') EVM

!===============Freq. Error (Hz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'Hz')
read(dumA(in+4:in+9),'(a)') dumB
read(dumB,*) freqerr

!write(*,'(1x,f6.2)') freqerr

!===============Origin Offset (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) oriofset

!write(*,'(1x,f6.2)') oriofset

!===============PCDE (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) PCDE

!write(*,'(1x,f6.2)') PCDE

!===============ACLR -5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmf

!write(*,'(1x,f6.2)') ACLRmf

!===============ACLR +5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpf

!write(*,'(1x,f6.2)') ACLRpf

!===============ACLR -10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmt

!write(*,'(1x,f6.2)') ACLRmt

!===============ACLR +10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpt

!write(*,'(1x,f6.2)') ACLRpt

!===============OBW (MHz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) OBW

!write(*,'(1x,f6.2)') OBW

!===============SEM[0] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM0

!write(*,'(1x,f6.2)') SEM0

!===============SEM[1] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM1

!write(*,'(1x,f6.2)') SEM1

!===============SEM[2] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM2

!write(*,'(1x,f6.2)') SEM2

!===============SEM[3] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM3

!write(*,'(1x,f6.2)') SEM3

!===============Min Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) minpower

!write(*,'(1x,f6.2)') minpower

!===============BER (%)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+3),'(a)') dumB
read(dumB,*) BER

!write(*,'(1x,f6.2)') BER

!===============Pre-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) prebupower

!write(*,'(1x,f6.2)') prebupower

!===============Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) bupower

!write(*,'(1x,f6.2)') bupower

!===============Post-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) pobupower

!write(*,'(1x,f6.2)') pobupower

!===============Burst Power Error (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) bupowererr

!write(*,'(1x,f6.2)') bupowererr

!===============Main Ant RSSI 1 (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI1

!write(*,'(1x,f6.2)') RSSI1

!===============Main Ant RSSI 2 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI2

!write(*,'(1x,f6.2)') RSSI2

!===============Main Ant RSSI 3 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI3

!write(*,'(1x,f23.2)') RSSI3


write(17,'(2(1x,i25),50(1x,f25.2))')&
& iULUARFCN,iDLUARFCN,maxpower,EVM,freqerr,oriofset,PCDE,OBW,&
& ACLRmf,ACLRpf,ACLRmt,ACLRpt,&
& SEM0,SEM1,SEM2,SEM3,minpower,BER,prebupower,bupower,&
& pobupower,bupowererr,RSSI1,RSSI2,RSSI3

!write(17,'(50(1x,a25))')&
!& 'UL_UARFCN','DL_UARFCN','Max_Power_(dBm)','EVM_(%)','Freq_Error_(Hz)','Origin_Offset_(dB)','PCDE_(dB)','OBW_(MHz)',&
!& 'ACLR_-5M_(dB)','ACLR_+5M_(dB)','ACLR_-10M_(dB)','ACLR_+10M_(dB)',&
!& 'SEM[0]_Margin','SEM[1]_Margin','SEM[2]_Margin','SEM[3]_Margin','Min_Power_(dBm)','BER_(%)','Pre-Burst_Power_(dBm)','Burst_Power_(dBm)',&
!& 'Post-Burst_Power_(dBm)','Burst_Power_Error_(dB)','Main_Ant_RSSI_1_(dBm)','Main_Ant_RSSI_2_(dBm)','Main_Ant_RSSI_3_(dBm)'

!===============B2 Middle Channel===============!
!===============iULUARFCN iDLUARFCN===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,'Uplink')
read(dumA(in+14:in+17),'(a)') dumB
read(dumB,*) iULUARFCN

in = index(dumA,'Downlink')
read(dumA(in+16:in+20),'(a)') dumB
read(dumB,*) iDLUARFCN

!write(*,'(1(1x,i5),1(1x,i5))') iULUARFCN, iDLUARFCN

!===============Max Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'(dBm)')
read(dumA(in+6:in+11),'(a)') dumB
read(dumB,*) maxpower

!write(*,'(1(1x,i2),1(1x,a25))') in, dumB
!write(*,'(1x,f6.2)') maxpower

!===============EVM (%)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'EVM')
read(dumA(in+8:in+13),'(a)') dumB
read(dumB,*) EVM

!write(*,'(1x,f6.2)') EVM

!===============Freq. Error (Hz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'Hz')
read(dumA(in+4:in+9),'(a)') dumB
read(dumB,*) freqerr

!write(*,'(1x,f6.2)') freqerr

!===============Origin Offset (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) oriofset

!write(*,'(1x,f6.2)') oriofset

!===============PCDE (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) PCDE

!write(*,'(1x,f6.2)') PCDE

!===============ACLR -5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmf

!write(*,'(1x,f6.2)') ACLRmf

!===============ACLR +5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpf

!write(*,'(1x,f6.2)') ACLRpf

!===============ACLR -10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmt

!write(*,'(1x,f6.2)') ACLRmt

!===============ACLR +10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpt

!write(*,'(1x,f6.2)') ACLRpt

!===============OBW (MHz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) OBW

!write(*,'(1x,f6.2)') OBW

!===============SEM[0] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM0

!write(*,'(1x,f6.2)') SEM0

!===============SEM[1] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM1

!write(*,'(1x,f6.2)') SEM1

!===============SEM[2] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM2

!write(*,'(1x,f6.2)') SEM2

!===============SEM[3] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM3

!write(*,'(1x,f6.2)') SEM3

!===============Min Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) minpower

!write(*,'(1x,f6.2)') minpower

!===============BER (%)===============!
do i = 1,7
  read(7,*)
enddo
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+3),'(a)') dumB
read(dumB,*) BER

!write(*,'(1x,f6.2)') BER

!===============Pre-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) prebupower

!write(*,'(1x,f6.2)') prebupower

!===============Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) bupower

!write(*,'(1x,f6.2)') bupower

!===============Post-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) pobupower

!write(*,'(1x,f6.2)') pobupower

!===============Burst Power Error (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) bupowererr

!write(*,'(1x,f6.2)') bupowererr

!===============Main Ant RSSI 1 (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI1

!write(*,'(1x,f6.2)') RSSI1

!===============Main Ant RSSI 2 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI2

!write(*,'(1x,f6.2)') RSSI2

!===============Main Ant RSSI 3 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI3

!write(*,'(1x,f23.2)') RSSI3


write(17,'(2(1x,i25),50(1x,f25.2))')&
& iULUARFCN,iDLUARFCN,maxpower,EVM,freqerr,oriofset,PCDE,OBW,&
& ACLRmf,ACLRpf,ACLRmt,ACLRpt,&
& SEM0,SEM1,SEM2,SEM3,minpower,BER,prebupower,bupower,&
& pobupower,bupowererr,RSSI1,RSSI2,RSSI3
!pause

!===============B2 High Channel===============!
!===============iULUARFCN iDLUARFCN===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,'Uplink')
read(dumA(in+14:in+17),'(a)') dumB
read(dumB,*) iULUARFCN

in = index(dumA,'Downlink')
read(dumA(in+16:in+20),'(a)') dumB
read(dumB,*) iDLUARFCN

!write(*,'(1(1x,i5),1(1x,i5))') iULUARFCN, iDLUARFCN

!===============Max Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'(dBm)')
read(dumA(in+6:in+11),'(a)') dumB
read(dumB,*) maxpower

!write(*,'(1(1x,i2),1(1x,a25))') in, dumB
!write(*,'(1x,f6.2)') maxpower

!===============EVM (%)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'EVM')
read(dumA(in+8:in+13),'(a)') dumB
read(dumB,*) EVM

!write(*,'(1x,f6.2)') EVM

!===============Freq. Error (Hz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'Hz')
read(dumA(in+4:in+9),'(a)') dumB
read(dumB,*) freqerr

!write(*,'(1x,f6.2)') freqerr

!===============Origin Offset (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) oriofset

!write(*,'(1x,f6.2)') oriofset

!===============PCDE (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) PCDE

!write(*,'(1x,f6.2)') PCDE

!===============ACLR -5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmf

!write(*,'(1x,f6.2)') ACLRmf

!===============ACLR +5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpf

!write(*,'(1x,f6.2)') ACLRpf

!===============ACLR -10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmt

!write(*,'(1x,f6.2)') ACLRmt

!===============ACLR +10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpt

!write(*,'(1x,f6.2)') ACLRpt

!===============OBW (MHz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) OBW

!write(*,'(1x,f6.2)') OBW

!===============SEM[0] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM0

!write(*,'(1x,f6.2)') SEM0

!===============SEM[1] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM1

!write(*,'(1x,f6.2)') SEM1

!===============SEM[2] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM2

!write(*,'(1x,f6.2)') SEM2

!===============SEM[3] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM3

!write(*,'(1x,f6.2)') SEM3

!===============Min Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) minpower

!write(*,'(1x,f6.2)') minpower

!===============BER (%)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+3),'(a)') dumB
read(dumB,*) BER

!write(*,'(1x,f6.2)') BER

!===============Pre-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) prebupower

!write(*,'(1x,f6.2)') prebupower

!===============Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) bupower

!write(*,'(1x,f6.2)') bupower

!===============Post-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) pobupower

!write(*,'(1x,f6.2)') pobupower

!===============Burst Power Error (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) bupowererr

!write(*,'(1x,f6.2)') bupowererr

!===============Main Ant RSSI 1 (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI1

!write(*,'(1x,f6.2)') RSSI1

!===============Main Ant RSSI 2 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI2

!write(*,'(1x,f6.2)') RSSI2

!===============Main Ant RSSI 3 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI3

!write(*,'(1x,f23.2)') RSSI3


write(17,'(2(1x,i25),50(1x,f25.2))')&
& iULUARFCN,iDLUARFCN,maxpower,EVM,freqerr,oriofset,PCDE,OBW,&
& ACLRmf,ACLRpf,ACLRmt,ACLRpt,&
& SEM0,SEM1,SEM2,SEM3,minpower,BER,prebupower,bupower,&
& pobupower,bupowererr,RSSI1,RSSI2,RSSI3

!write(17,'(50(1x,a25))')&
!& 'UL_UARFCN','DL_UARFCN','Max_Power_(dBm)','EVM_(%)','Freq_Error_(Hz)','Origin_Offset_(dB)','PCDE_(dB)','OBW_(MHz)',&
!& 'ACLR_-5M_(dB)','ACLR_+5M_(dB)','ACLR_-10M_(dB)','ACLR_+10M_(dB)',&
!& 'SEM[0]_Margin','SEM[1]_Margin','SEM[2]_Margin','SEM[3]_Margin','Min_Power_(dBm)','BER_(%)','Pre-Burst_Power_(dBm)','Burst_Power_(dBm)',&
!& 'Post-Burst_Power_(dBm)','Burst_Power_Error_(dB)','Main_Ant_RSSI_1_(dBm)','Main_Ant_RSSI_2_(dBm)','Main_Ant_RSSI_3_(dBm)'


write(17,*)
write(17,'(5(1x,a25))') 'B5','Cable Loss (dB) = -0.6'
write(17,'(50(1x,a25))')&
& 'UL_UARFCN','DL_UARFCN','Max_Power_(dBm)','EVM_(%)','Freq_Error_(Hz)','Origin_Offset_(dB)','PCDE_(dB)','OBW_(MHz)',&
& 'ACLR_-5M_(dB)','ACLR_+5M_(dB)','ACLR_-10M_(dB)','ACLR_+10M_(dB)',&
& 'SEM[0]_Margin','SEM[1]_Margin','SEM[2]_Margin','SEM[3]_Margin','Min_Power_(dBm)','BER_(%)','Pre-Burst_Power_(dBm)','Burst_Power_(dBm)',&
& 'Post-Burst_Power_(dBm)','Burst_Power_Error_(dB)','Main_Ant_RSSI_1_(dBm)','Main_Ant_RSSI_2_(dBm)','Main_Ant_RSSI_3_(dBm)'
!===============B5 Low Channel===============!
!===============iULUARFCN iDLUARFCN===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,'Uplink')
read(dumA(in+14:in+17),'(a)') dumB
read(dumB,*) iULUARFCN

in = index(dumA,'Downlink')
read(dumA(in+16:in+20),'(a)') dumB
read(dumB,*) iDLUARFCN

!write(*,'(1(1x,i5),1(1x,i5))') iULUARFCN, iDLUARFCN

!===============Max Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'(dBm)')
read(dumA(in+6:in+11),'(a)') dumB
read(dumB,*) maxpower

!write(*,'(1(1x,i2),1(1x,a25))') in, dumB
!write(*,'(1x,f6.2)') maxpower

!===============EVM (%)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'EVM')
read(dumA(in+8:in+13),'(a)') dumB
read(dumB,*) EVM

!write(*,'(1x,f6.2)') EVM

!===============Freq. Error (Hz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'Hz')
read(dumA(in+4:in+9),'(a)') dumB
read(dumB,*) freqerr

!write(*,'(1x,f6.2)') freqerr

!===============Origin Offset (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) oriofset

!write(*,'(1x,f6.2)') oriofset

!===============PCDE (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) PCDE

!write(*,'(1x,f6.2)') PCDE

!===============ACLR -5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmf

!write(*,'(1x,f6.2)') ACLRmf

!===============ACLR +5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpf

!write(*,'(1x,f6.2)') ACLRpf

!===============ACLR -10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmt

!write(*,'(1x,f6.2)') ACLRmt

!===============ACLR +10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpt

!write(*,'(1x,f6.2)') ACLRpt

!===============OBW (MHz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) OBW

!write(*,'(1x,f6.2)') OBW

!===============SEM[0] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM0

!write(*,'(1x,f6.2)') SEM0

!===============SEM[1] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM1

!write(*,'(1x,f6.2)') SEM1

!===============SEM[2] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM2

!write(*,'(1x,f6.2)') SEM2

!===============SEM[3] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM3

!write(*,'(1x,f6.2)') SEM3

!===============Min Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) minpower

!write(*,'(1x,f6.2)') minpower

!===============BER (%)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+3),'(a)') dumB
read(dumB,*) BER

!write(*,'(1x,f6.2)') BER

!===============Pre-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) prebupower

!write(*,'(1x,f6.2)') prebupower

!===============Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) bupower

!write(*,'(1x,f6.2)') bupower

!===============Post-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) pobupower

!write(*,'(1x,f6.2)') pobupower

!===============Burst Power Error (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) bupowererr

!write(*,'(1x,f6.2)') bupowererr

!===============Main Ant RSSI 1 (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI1

!write(*,'(1x,f6.2)') RSSI1

!===============Main Ant RSSI 2 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI2

!write(*,'(1x,f6.2)') RSSI2

!===============Main Ant RSSI 3 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI3

!write(*,'(1x,f23.2)') RSSI3


write(17,'(2(1x,i25),50(1x,f25.2))')&
& iULUARFCN,iDLUARFCN,maxpower,EVM,freqerr,oriofset,PCDE,OBW,&
& ACLRmf,ACLRpf,ACLRmt,ACLRpt,&
& SEM0,SEM1,SEM2,SEM3,minpower,BER,prebupower,bupower,&
& pobupower,bupowererr,RSSI1,RSSI2,RSSI3

!write(17,'(50(1x,a25))')&
!& 'UL_UARFCN','DL_UARFCN','Max_Power_(dBm)','EVM_(%)','Freq_Error_(Hz)','Origin_Offset_(dB)','PCDE_(dB)','OBW_(MHz)',&
!& 'ACLR_-5M_(dB)','ACLR_+5M_(dB)','ACLR_-10M_(dB)','ACLR_+10M_(dB)',&
!& 'SEM[0]_Margin','SEM[1]_Margin','SEM[2]_Margin','SEM[3]_Margin','Min_Power_(dBm)','BER_(%)','Pre-Burst_Power_(dBm)','Burst_Power_(dBm)',&
!& 'Post-Burst_Power_(dBm)','Burst_Power_Error_(dB)','Main_Ant_RSSI_1_(dBm)','Main_Ant_RSSI_2_(dBm)','Main_Ant_RSSI_3_(dBm)'

!===============B5 Middle Channel===============!
!===============iULUARFCN iDLUARFCN===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,'Uplink')
read(dumA(in+14:in+17),'(a)') dumB
read(dumB,*) iULUARFCN

in = index(dumA,'Downlink')
read(dumA(in+16:in+20),'(a)') dumB
read(dumB,*) iDLUARFCN

!write(*,'(1(1x,i5),1(1x,i5))') iULUARFCN, iDLUARFCN

!===============Max Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'(dBm)')
read(dumA(in+6:in+11),'(a)') dumB
read(dumB,*) maxpower

!write(*,'(1(1x,i2),1(1x,a25))') in, dumB
!write(*,'(1x,f6.2)') maxpower

!===============EVM (%)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'EVM')
read(dumA(in+8:in+13),'(a)') dumB
read(dumB,*) EVM

!write(*,'(1x,f6.2)') EVM

!===============Freq. Error (Hz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'Hz')
read(dumA(in+4:in+9),'(a)') dumB
read(dumB,*) freqerr

!write(*,'(1x,f6.2)') freqerr

!===============Origin Offset (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) oriofset

!write(*,'(1x,f6.2)') oriofset

!===============PCDE (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) PCDE

!write(*,'(1x,f6.2)') PCDE

!===============ACLR -5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmf

!write(*,'(1x,f6.2)') ACLRmf

!===============ACLR +5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpf

!write(*,'(1x,f6.2)') ACLRpf

!===============ACLR -10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmt

!write(*,'(1x,f6.2)') ACLRmt

!===============ACLR +10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpt

!write(*,'(1x,f6.2)') ACLRpt

!===============OBW (MHz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) OBW

!write(*,'(1x,f6.2)') OBW

!===============SEM[0] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM0

!write(*,'(1x,f6.2)') SEM0

!===============SEM[1] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM1

!write(*,'(1x,f6.2)') SEM1

!===============SEM[2] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM2

!write(*,'(1x,f6.2)') SEM2

!===============SEM[3] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM3

!write(*,'(1x,f6.2)') SEM3

!===============Min Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) minpower

!write(*,'(1x,f6.2)') minpower

!===============BER (%)===============!
do i = 1,7
  read(7,*)
enddo
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+3),'(a)') dumB
read(dumB,*) BER

!write(*,'(1x,f6.2)') BER

!===============Pre-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) prebupower

!write(*,'(1x,f6.2)') prebupower

!===============Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) bupower

!write(*,'(1x,f6.2)') bupower

!===============Post-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) pobupower

!write(*,'(1x,f6.2)') pobupower

!===============Burst Power Error (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) bupowererr

!write(*,'(1x,f6.2)') bupowererr

!===============Main Ant RSSI 1 (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI1

!write(*,'(1x,f6.2)') RSSI1

!===============Main Ant RSSI 2 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI2

!write(*,'(1x,f6.2)') RSSI2

!===============Main Ant RSSI 3 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI3

!write(*,'(1x,f23.2)') RSSI3


write(17,'(2(1x,i25),50(1x,f25.2))')&
& iULUARFCN,iDLUARFCN,maxpower,EVM,freqerr,oriofset,PCDE,OBW,&
& ACLRmf,ACLRpf,ACLRmt,ACLRpt,&
& SEM0,SEM1,SEM2,SEM3,minpower,BER,prebupower,bupower,&
& pobupower,bupowererr,RSSI1,RSSI2,RSSI3
!pause

!===============B5 High Channel===============!
!===============iULUARFCN iDLUARFCN===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,'Uplink')
read(dumA(in+14:in+17),'(a)') dumB
read(dumB,*) iULUARFCN

in = index(dumA,'Downlink')
read(dumA(in+16:in+20),'(a)') dumB
read(dumB,*) iDLUARFCN

!write(*,'(1(1x,i5),1(1x,i5))') iULUARFCN, iDLUARFCN

!===============Max Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'(dBm)')
read(dumA(in+6:in+11),'(a)') dumB
read(dumB,*) maxpower

!write(*,'(1(1x,i2),1(1x,a25))') in, dumB
!write(*,'(1x,f6.2)') maxpower

!===============EVM (%)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'EVM')
read(dumA(in+8:in+13),'(a)') dumB
read(dumB,*) EVM

!write(*,'(1x,f6.2)') EVM

!===============Freq. Error (Hz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'Hz')
read(dumA(in+4:in+9),'(a)') dumB
read(dumB,*) freqerr

!write(*,'(1x,f6.2)') freqerr

!===============Origin Offset (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) oriofset

!write(*,'(1x,f6.2)') oriofset

!===============PCDE (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) PCDE

!write(*,'(1x,f6.2)') PCDE

!===============ACLR -5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmf

!write(*,'(1x,f6.2)') ACLRmf

!===============ACLR +5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpf

!write(*,'(1x,f6.2)') ACLRpf

!===============ACLR -10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmt

!write(*,'(1x,f6.2)') ACLRmt

!===============ACLR +10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpt

!write(*,'(1x,f6.2)') ACLRpt

!===============OBW (MHz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) OBW

!write(*,'(1x,f6.2)') OBW

!===============SEM[0] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM0

!write(*,'(1x,f6.2)') SEM0

!===============SEM[1] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM1

!write(*,'(1x,f6.2)') SEM1

!===============SEM[2] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM2

!write(*,'(1x,f6.2)') SEM2

!===============SEM[3] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM3

!write(*,'(1x,f6.2)') SEM3

!===============Min Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) minpower

!write(*,'(1x,f6.2)') minpower

!===============BER (%)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+3),'(a)') dumB
read(dumB,*) BER

!write(*,'(1x,f6.2)') BER

!===============Pre-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) prebupower

!write(*,'(1x,f6.2)') prebupower

!===============Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) bupower

!write(*,'(1x,f6.2)') bupower

!===============Post-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) pobupower

!write(*,'(1x,f6.2)') pobupower

!===============Burst Power Error (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) bupowererr

!write(*,'(1x,f6.2)') bupowererr

!===============Main Ant RSSI 1 (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI1

!write(*,'(1x,f6.2)') RSSI1

!===============Main Ant RSSI 2 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI2

!write(*,'(1x,f6.2)') RSSI2

!===============Main Ant RSSI 3 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI3

!write(*,'(1x,f23.2)') RSSI3


write(17,'(2(1x,i25),50(1x,f25.2))')&
& iULUARFCN,iDLUARFCN,maxpower,EVM,freqerr,oriofset,PCDE,OBW,&
& ACLRmf,ACLRpf,ACLRmt,ACLRpt,&
& SEM0,SEM1,SEM2,SEM3,minpower,BER,prebupower,bupower,&
& pobupower,bupowererr,RSSI1,RSSI2,RSSI3

!write(17,'(50(1x,a25))')&
!& 'UL_UARFCN','DL_UARFCN','Max_Power_(dBm)','EVM_(%)','Freq_Error_(Hz)','Origin_Offset_(dB)','PCDE_(dB)','OBW_(MHz)',&
!& 'ACLR_-5M_(dB)','ACLR_+5M_(dB)','ACLR_-10M_(dB)','ACLR_+10M_(dB)',&
!& 'SEM[0]_Margin','SEM[1]_Margin','SEM[2]_Margin','SEM[3]_Margin','Min_Power_(dBm)','BER_(%)','Pre-Burst_Power_(dBm)','Burst_Power_(dBm)',&
!& 'Post-Burst_Power_(dBm)','Burst_Power_Error_(dB)','Main_Ant_RSSI_1_(dBm)','Main_Ant_RSSI_2_(dBm)','Main_Ant_RSSI_3_(dBm)'


write(17,*)
write(17,'(5(1x,a25))') 'B8','Cable Loss (dB) = -0.6'
write(17,'(50(1x,a25))')&
& 'UL_UARFCN','DL_UARFCN','Max_Power_(dBm)','EVM_(%)','Freq_Error_(Hz)','Origin_Offset_(dB)','PCDE_(dB)','OBW_(MHz)',&
& 'ACLR_-5M_(dB)','ACLR_+5M_(dB)','ACLR_-10M_(dB)','ACLR_+10M_(dB)',&
& 'SEM[0]_Margin','SEM[1]_Margin','SEM[2]_Margin','SEM[3]_Margin','Min_Power_(dBm)','BER_(%)','Pre-Burst_Power_(dBm)','Burst_Power_(dBm)',&
& 'Post-Burst_Power_(dBm)','Burst_Power_Error_(dB)','Main_Ant_RSSI_1_(dBm)','Main_Ant_RSSI_2_(dBm)','Main_Ant_RSSI_3_(dBm)'
!===============B8 Low Channel===============!
!===============iULUARFCN iDLUARFCN===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,'Uplink')
read(dumA(in+14:in+17),'(a)') dumB
read(dumB,*) iULUARFCN

in = index(dumA,'Downlink')
read(dumA(in+16:in+20),'(a)') dumB
read(dumB,*) iDLUARFCN

!write(*,'(1(1x,i5),1(1x,i5))') iULUARFCN, iDLUARFCN

!===============Max Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'(dBm)')
read(dumA(in+6:in+11),'(a)') dumB
read(dumB,*) maxpower

!write(*,'(1(1x,i2),1(1x,a25))') in, dumB
!write(*,'(1x,f6.2)') maxpower

!===============EVM (%)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'EVM')
read(dumA(in+8:in+13),'(a)') dumB
read(dumB,*) EVM

!write(*,'(1x,f6.2)') EVM

!===============Freq. Error (Hz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'Hz')
read(dumA(in+4:in+9),'(a)') dumB
read(dumB,*) freqerr

!write(*,'(1x,f6.2)') freqerr

!===============Origin Offset (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) oriofset

!write(*,'(1x,f6.2)') oriofset

!===============PCDE (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) PCDE

!write(*,'(1x,f6.2)') PCDE

!===============ACLR -5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmf

!write(*,'(1x,f6.2)') ACLRmf

!===============ACLR +5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpf

!write(*,'(1x,f6.2)') ACLRpf

!===============ACLR -10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmt

!write(*,'(1x,f6.2)') ACLRmt

!===============ACLR +10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpt

!write(*,'(1x,f6.2)') ACLRpt

!===============OBW (MHz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) OBW

!write(*,'(1x,f6.2)') OBW

!===============SEM[0] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM0

!write(*,'(1x,f6.2)') SEM0

!===============SEM[1] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM1

!write(*,'(1x,f6.2)') SEM1

!===============SEM[2] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM2

!write(*,'(1x,f6.2)') SEM2

!===============SEM[3] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM3

!write(*,'(1x,f6.2)') SEM3

!===============Min Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) minpower

!write(*,'(1x,f6.2)') minpower

!===============BER (%)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+3),'(a)') dumB
read(dumB,*) BER

!write(*,'(1x,f6.2)') BER

!===============Pre-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) prebupower

!write(*,'(1x,f6.2)') prebupower

!===============Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) bupower

!write(*,'(1x,f6.2)') bupower

!===============Post-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) pobupower

!write(*,'(1x,f6.2)') pobupower

!===============Burst Power Error (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) bupowererr

!write(*,'(1x,f6.2)') bupowererr

!===============Main Ant RSSI 1 (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI1

!write(*,'(1x,f6.2)') RSSI1

!===============Main Ant RSSI 2 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI2

!write(*,'(1x,f6.2)') RSSI2

!===============Main Ant RSSI 3 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI3

!write(*,'(1x,f23.2)') RSSI3


write(17,'(2(1x,i25),50(1x,f25.2))')&
& iULUARFCN,iDLUARFCN,maxpower,EVM,freqerr,oriofset,PCDE,OBW,&
& ACLRmf,ACLRpf,ACLRmt,ACLRpt,&
& SEM0,SEM1,SEM2,SEM3,minpower,BER,prebupower,bupower,&
& pobupower,bupowererr,RSSI1,RSSI2,RSSI3

!write(17,'(50(1x,a25))')&
!& 'UL_UARFCN','DL_UARFCN','Max_Power_(dBm)','EVM_(%)','Freq_Error_(Hz)','Origin_Offset_(dB)','PCDE_(dB)','OBW_(MHz)',&
!& 'ACLR_-5M_(dB)','ACLR_+5M_(dB)','ACLR_-10M_(dB)','ACLR_+10M_(dB)',&
!& 'SEM[0]_Margin','SEM[1]_Margin','SEM[2]_Margin','SEM[3]_Margin','Min_Power_(dBm)','BER_(%)','Pre-Burst_Power_(dBm)','Burst_Power_(dBm)',&
!& 'Post-Burst_Power_(dBm)','Burst_Power_Error_(dB)','Main_Ant_RSSI_1_(dBm)','Main_Ant_RSSI_2_(dBm)','Main_Ant_RSSI_3_(dBm)'

!===============B8 Middle Channel===============!
!===============iULUARFCN iDLUARFCN===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,'Uplink')
read(dumA(in+14:in+17),'(a)') dumB
read(dumB,*) iULUARFCN

in = index(dumA,'Downlink')
read(dumA(in+16:in+20),'(a)') dumB
read(dumB,*) iDLUARFCN

!write(*,'(1(1x,i5),1(1x,i5))') iULUARFCN, iDLUARFCN

!===============Max Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'(dBm)')
read(dumA(in+6:in+11),'(a)') dumB
read(dumB,*) maxpower

!write(*,'(1(1x,i2),1(1x,a25))') in, dumB
!write(*,'(1x,f6.2)') maxpower

!===============EVM (%)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'EVM')
read(dumA(in+8:in+13),'(a)') dumB
read(dumB,*) EVM

!write(*,'(1x,f6.2)') EVM

!===============Freq. Error (Hz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'Hz')
read(dumA(in+4:in+9),'(a)') dumB
read(dumB,*) freqerr

!write(*,'(1x,f6.2)') freqerr

!===============Origin Offset (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) oriofset

!write(*,'(1x,f6.2)') oriofset

!===============PCDE (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) PCDE

!write(*,'(1x,f6.2)') PCDE

!===============ACLR -5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmf

!write(*,'(1x,f6.2)') ACLRmf

!===============ACLR +5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpf

!write(*,'(1x,f6.2)') ACLRpf

!===============ACLR -10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmt

!write(*,'(1x,f6.2)') ACLRmt

!===============ACLR +10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpt

!write(*,'(1x,f6.2)') ACLRpt

!===============OBW (MHz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) OBW

!write(*,'(1x,f6.2)') OBW

!===============SEM[0] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM0

!write(*,'(1x,f6.2)') SEM0

!===============SEM[1] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM1

!write(*,'(1x,f6.2)') SEM1

!===============SEM[2] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM2

!write(*,'(1x,f6.2)') SEM2

!===============SEM[3] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM3

!write(*,'(1x,f6.2)') SEM3

!===============Min Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) minpower

!write(*,'(1x,f6.2)') minpower

!===============BER (%)===============!
do i = 1,7
  read(7,*)
enddo
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+3),'(a)') dumB
read(dumB,*) BER

!write(*,'(1x,f6.2)') BER

!===============Pre-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) prebupower

!write(*,'(1x,f6.2)') prebupower

!===============Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) bupower

!write(*,'(1x,f6.2)') bupower

!===============Post-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) pobupower

!write(*,'(1x,f6.2)') pobupower

!===============Burst Power Error (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) bupowererr

!write(*,'(1x,f6.2)') bupowererr

!===============Main Ant RSSI 1 (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI1

!write(*,'(1x,f6.2)') RSSI1

!===============Main Ant RSSI 2 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI2

!write(*,'(1x,f6.2)') RSSI2

!===============Main Ant RSSI 3 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI3

!write(*,'(1x,f23.2)') RSSI3


write(17,'(2(1x,i25),50(1x,f25.2))')&
& iULUARFCN,iDLUARFCN,maxpower,EVM,freqerr,oriofset,PCDE,OBW,&
& ACLRmf,ACLRpf,ACLRmt,ACLRpt,&
& SEM0,SEM1,SEM2,SEM3,minpower,BER,prebupower,bupower,&
& pobupower,bupowererr,RSSI1,RSSI2,RSSI3
!pause

!===============B8 High Channel===============!
!===============iULUARFCN iDLUARFCN===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,'Uplink')
read(dumA(in+14:in+17),'(a)') dumB
read(dumB,*) iULUARFCN

in = index(dumA,'Downlink')
read(dumA(in+16:in+20),'(a)') dumB
read(dumB,*) iDLUARFCN

!write(*,'(1(1x,i5),1(1x,i5))') iULUARFCN, iDLUARFCN

!===============Max Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'(dBm)')
read(dumA(in+6:in+11),'(a)') dumB
read(dumB,*) maxpower

!write(*,'(1(1x,i2),1(1x,a25))') in, dumB
!write(*,'(1x,f6.2)') maxpower

!===============EVM (%)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'EVM')
read(dumA(in+8:in+13),'(a)') dumB
read(dumB,*) EVM

!write(*,'(1x,f6.2)') EVM

!===============Freq. Error (Hz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'Hz')
read(dumA(in+4:in+9),'(a)') dumB
read(dumB,*) freqerr

!write(*,'(1x,f6.2)') freqerr

!===============Origin Offset (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) oriofset

!write(*,'(1x,f6.2)') oriofset

!===============PCDE (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'dB')
read(dumA(in+4:in+10),'(a)') dumB
read(dumB,*) PCDE

!write(*,'(1x,f6.2)') PCDE

!===============ACLR -5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmf

!write(*,'(1x,f6.2)') ACLRmf

!===============ACLR +5M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpf

!write(*,'(1x,f6.2)') ACLRpf

!===============ACLR -10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRmt

!write(*,'(1x,f6.2)') ACLRmt

!===============ACLR +10M (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,'M')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) ACLRpt

!write(*,'(1x,f6.2)') ACLRpt

!===============OBW (MHz)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) OBW

!write(*,'(1x,f6.2)') OBW

!===============SEM[0] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM0

!write(*,'(1x,f6.2)') SEM0

!===============SEM[1] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM1

!write(*,'(1x,f6.2)') SEM1

!===============SEM[2] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM2

!write(*,'(1x,f6.2)') SEM2

!===============SEM[3] Margin===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,':')
read(dumA(in+1:in+6),'(a)') dumB
read(dumB,*) SEM3

!write(*,'(1x,f6.2)') SEM3

!===============Min Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) minpower

!write(*,'(1x,f6.2)') minpower

!===============BER (%)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+3),'(a)') dumB
read(dumB,*) BER

!write(*,'(1x,f6.2)') BER

!===============Pre-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) prebupower

!write(*,'(1x,f6.2)') prebupower

!===============Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) bupower

!write(*,'(1x,f6.2)') bupower

!===============Post-Burst Power (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+8),'(a)') dumB
read(dumB,*) pobupower

!write(*,'(1x,f6.2)') pobupower

!===============Burst Power Error (dB)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+9),'(a)') dumB
read(dumB,*) bupowererr

!write(*,'(1x,f6.2)') bupowererr

!===============Main Ant RSSI 1 (dBm)===============!
do i = 1,1
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI1

!write(*,'(1x,f6.2)') RSSI1

!===============Main Ant RSSI 2 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI2

!write(*,'(1x,f6.2)') RSSI2

!===============Main Ant RSSI 3 (dBm)===============!
do i = 1,1
  read(7,*)
  read(7,'(a)') dumA
enddo

in = index(dumA,')')
read(dumA(in+2:in+7),'(a)') dumB
read(dumB,*) RSSI3

!write(*,'(1x,f23.2)') RSSI3


write(17,'(2(1x,i25),50(1x,f25.2))')&
& iULUARFCN,iDLUARFCN,maxpower,EVM,freqerr,oriofset,PCDE,OBW,&
& ACLRmf,ACLRpf,ACLRmt,ACLRpt,&
& SEM0,SEM1,SEM2,SEM3,minpower,BER,prebupower,bupower,&
& pobupower,bupowererr,RSSI1,RSSI2,RSSI3

!write(17,'(50(1x,a25))')&
!& 'UL_UARFCN','DL_UARFCN','Max_Power_(dBm)','EVM_(%)','Freq_Error_(Hz)','Origin_Offset_(dB)','PCDE_(dB)','OBW_(MHz)',&
!& 'ACLR_-5M_(dB)','ACLR_+5M_(dB)','ACLR_-10M_(dB)','ACLR_+10M_(dB)',&
!& 'SEM[0]_Margin','SEM[1]_Margin','SEM[2]_Margin','SEM[3]_Margin','Min_Power_(dBm)','BER_(%)','Pre-Burst_Power_(dBm)','Burst_Power_(dBm)',&
!& 'Post-Burst_Power_(dBm)','Burst_Power_Error_(dB)','Main_Ant_RSSI_1_(dBm)','Main_Ant_RSSI_2_(dBm)','Main_Ant_RSSI_3_(dBm)'


































!	  do j=1,indata 
!	  freq(j)=start_f+del_f*(j-1)
!	  S11(j,3)=10.d0*dlog10(S11(j,1)**2+S11(j,2)**2)
!	  S21(j,3)=10.d0*dlog10(S21(j,1)**2+S21(j,2)**2)
!	  S12(j,3)=10.d0*dlog10(S12(j,1)**2+S12(j,2)**2)
!	  S22(j,3)=10.d0*dlog10(S22(j,1)**2+S22(j,2)**2)
!	  enddo
!
!	  do j=1,indata
!	  write(17,'(5(1x,1pd16.9))') freq(j),S11(j,3),S21(j,3),S12(j,3),S22(j,3)
!	  write(*,'(5(1x,1pd16.9))') freq(j),S11(j,3),S21(j,3),S12(j,3),S22(j,3)
!	  enddo


!do ij=1,indata,ij_jump  !30~40GHz !ij=1,801,8 
!freq(ij)=start_f+del_f*(ij-1)
!S21(ij,3)=S21(ij,1)
!!S11(ij,3)=10.d0*dlog10(S11(ij,1)**2+S11(ij,2)**2)
!!S21(ij,3)=10.d0*dlog10(S21(ij,1)**2+S21(ij,2)**2)
!!S12(ij,3)=10.d0*dlog10(S12(ij,1)**2+S12(ij,2)**2)
!!S22(ij,3)=10.d0*dlog10(S22(ij,1)**2+S22(ij,2)**2)
!enddo

!do ij=1,indata,ij_jump  !30~40GHz !ij=1,801,8 
!!write(17,'(5(1x,1pd16.9))') freq(ij),S21(ij,3) !,S21(ij,3),S12(ij,3),S22(ij,3)
!!write(*,'(5(1x,1pd16.9))') freq(ij),S21(ij,3) !,S21(ij,3),S12(ij,3),S22(ij,3)
!enddo

stop
end


