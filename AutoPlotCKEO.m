clear all
% MediumBlue = [0,0,205]/256;
B = [0,0,153]/256;
% Tomato = [255,99,71]/256;
R = [204,51,0]/256;
load NCV_blu_red


%%% CKEO-01 
load CKEO-01-AIRMAR.mat
%--------AIRMAR
% 1.ʱ��	2.����	3.γ��	4.1/3����	5.1/3������	6.1/10����	7.1/10������	8.��󲨸�	9.�������	
% 10.ƽ������	11.ƽ��������	12.����	13.����	14.����	15.�¶�	16.��ѹ	
% 17.CTD�¶ȡ�	18.CTD�絼��S/m	19.CTD�ζ�PSU	20.��ѹֵ

%---��һ����Ч���� BJ 2019/9/7 4:09:04
%---���һ����Ч���� BJ 2019/11/25 22:07:00

%----output QC 
output(output==0)=nan;
indBF = datenum([2019,9,7,4,9,4]);
indAFT = datenum([2019,11,25,22,07,00]);
ind = find(output(:,1) >= indBF & output(:,1) <= indAFT);
%---DateNum
DateNum_CKEO_01_AIRMAR=output(ind,1)-8./24;  %---ת��ΪUTCʱ��
%---Lon Lat
Lon_CKEO_01_AIRMAR=output(ind,2);
Lat_CKEO_01_AIRMAR=output(ind,3);
%---QC position
% Lon_CKEO_01_AIRMAR(Lon_CKEO_01_AIRMAR>146.8)=nan;
% Lon_CKEO_01_AIRMAR(Lon_CKEO_01_AIRMAR<146.4)=nan;
% Lat_CKEO_01_AIRMAR(Lat_CKEO_01_AIRMAR>35.2)=nan;
% Lat_CKEO_01_AIRMAR(Lat_CKEO_01_AIRMAR<34.8)=nan;
%---Wave
WaveH_third_CKEO_01_AIRMAR=output(ind,4);
WaveP_third_CKEO_01_AIRMAR=output(ind,5);
WaveH_tenth_CKEO_01_AIRMAR=output(ind,6);
WaveP_tenth_CKEO_01_AIRMAR=output(ind,7);
WaveH_max_CKEO_01_AIRMAR=output(ind,8);
WaveP_max_CKEO_01_AIRMAR=output(ind,9);
WaveH_mean_CKEO_01_AIRMAR=output(ind,10);
WaveP_mean_CKEO_01_AIRMAR=output(ind,11);
WaveDir_CKEO_01_AIRMAR=output(ind,12);  %-----wave dir  is wrong!
%---Wind
WindSpeed_CKEO_01_AIRMAR=output(ind,13);  
WindSpeed_CKEO_01_AIRMAR(WindSpeed_CKEO_01_AIRMAR>40)=nan;
WindDir_CKEO_01_AIRMAR=output(ind,14);
%---AirT/P
AirTemp_CKEO_01_AIRMAR=output(ind,15);
AirPress_CKEO_01_AIRMAR=output(ind,16)*1000;  %----hPa
AirPress_CKEO_01_AIRMAR(AirPress_CKEO_01_AIRMAR>1050)=nan;
%---CTD:T/C/S/V
CTD_SST_CKEO_01_AIRMAR=output(ind,17);
CTD_SST_CKEO_01_AIRMAR(CTD_SST_CKEO_01_AIRMAR>40)=nan;
CTD_Cond_CKEO_01_AIRMAR=output(ind,18)*10;  %---unit: mS/cm 
CTD_SSS_CKEO_01_AIRMAR=output(ind,19);
CTD_SSS_CKEO_01_AIRMAR(CTD_SSS_CKEO_01_AIRMAR<33.5)=nan;
Voltage_CKEO_01_AIRMAR=output(ind,20);
% CTD QC
CTD_SSS_CKEO_01_AIRMAR = SmoothQC(CTD_SSS_CKEO_01_AIRMAR,5,.98);
CTD_Cond_CKEO_01_AIRMAR= SmoothQC(CTD_Cond_CKEO_01_AIRMAR,5,.98);


%-------------CR
% 1.ʱ��	2.����	3.γ��	4.CR�ɼ����¶�	5.CR�����¶�avg	6.CR����ʪ��avg	7.CRˮ��ѹavg	8.CR��ѹavg	
% 9.CR��Է���avg	10.CR��Է���avg	11.CRʵ�ʷ���avg��knots��	12.CRʵ�ʷ���avg��m/s��	13.CRʵ�ʷ���avg���㣩	
% 14.CR��������avg	15.CR�ܷ���avg	16.CR�ܷ���acc	17.CR����acc	18.GMX����	19.GMX����	20.GMXУ�������	
% 21.GMX��ѹ	22.GMX���ʪ��	23.GMX�¶�	24.GMX¶���¶�	25.GMX����	26.GMX�����ܶ�
%---��һ����Ч���� BJ 2019/9/7 4:10
%---���һ����Ч���� BJ 2020/6/15 23:53 
load CKEO-01-CR1000.mat
indBF = datenum([2019,9,7,4,10,00]);
indAFT = datenum([2020,6,15,23,53,00]); % ����01������һ�����ݵ�ʱ��
indAFT = datenum([2020,6,10,0,0,00]);   % ����02��һ������ʱ�䡣Ǩ�������
ind = find(output(:,1) >= indBF & output(:,1) <= indAFT);
%---DateNum
DateNum_CKEO_01_CR1000=output(ind,1)-8./24;  %---ת��ΪUTCʱ��

%---CR �ɼ����м��ж�ʱ��T��RH��������
AirTemp_CR_CKEO_01_CR1000=output(ind,5);
RH_CR_CKEO_01_CR1000=output(ind,6);
Long_CKEO_01_CR1000=output(ind,14); 
Long_CKEO_01_CR1000(Long_CKEO_01_CR1000>1000)=nan;
Long_CKEO_01_CR1000(Long_CKEO_01_CR1000<=300)=nan;  
Short_CKEO_01_CR1000=output(ind,15);
Short_CKEO_01_CR1000(Short_CKEO_01_CR1000>2000)=nan;
Short_CKEO_01_CR1000(Short_CKEO_01_CR1000<0.1)=nan;
%---Gill
WindSpeed_GMX_CKEO_01_CR1000=output(ind,19);%---�ǽ�����ķ��٣�����
WindDir_GMX_CKEO_01_CR1000=output(ind,20);  %---������ķ���
AirPress_GMX_CKEO_01_CR1000=output(ind,21);
RH_GMX_CKEO_01_CR1000=output(ind,22);
AirTemp_GMX_CKEO_01_CR1000=output(ind,23);
Precip_GMX_CKEO_01_CR1000=output(ind,25); %---������  ��λ?
Precip_50202_CKEO_01_CR1000=output(ind,17);
AirPress_GMX_CKEO_01_CR1000(AirPress_GMX_CKEO_01_CR1000<500)=NaN;
AirTemp_GMX_CKEO_01_CR1000(AirTemp_GMX_CKEO_01_CR1000<-30)=NaN;
RH_GMX_CKEO_01_CR1000(RH_GMX_CKEO_01_CR1000<40)=NaN;
%%% CKEO-02 load

%%% GMX %%%
% 1.ʱ��	2.����	3.γ��	4.GMX����	5.GMX����	6.GMXУ�������	7.GMXУ�������	
% 8.GMX�¶�	9.GMX���ʪ��	10.GMX¶���¶� 11.GMX��ѹ	12.GMX����	13.GMX�����ܶ�	14.GMX����	
% 15.SPP�̲�����Wm^-2	16.PIR��������Wm^-2	17.50203����mm	18.HMP�¶ȡ�	19.HMPʪ��%RH	20.CO2-ppm

CKEO_update(110,365*2,'CKEO-02-GMX.mat');
load CKEO-02-GMX.mat
% FirstData: 2020.6.10  0:00 BJ
indBF = datenum([2020,6,10,0,0,00]); 
indAFT = now;
ind = find(output(:,1) >= indBF & output(:,1) <= indAFT);

%---DateNum
DateNum_CKEO_02_GMX=output(ind,1)-8./24;  %---ת��ΪUTCʱ��

%---Gill
WindDir_GMX_CKEO_02_GMX=output(ind,6);  %---������ķ���
WindSpeed_GMX_CKEO_02_GMX=output(ind,7);%---������ķ���
AirTemp_GMX_CKEO_02_GMX=output(ind,8);
RH_GMX_CKEO_02_GMX=output(ind,9);
AirPress_GMX_CKEO_02_GMX=output(ind,11);
Precip_GMX_CKEO_02_GMX=output(ind,12); %---����
PrecipDens_GMX_CKEO_02_GMX=output(ind,13); %---�����ܶ�
Precip_50203_GMX_CKEO_02_GMX=output(ind,17); %---����

Short_CKEO_02_GMX=output(ind,15);
% Short_CKEO_02_GMX(Short_CKEO_02_GMX>2000)=nan;
Short_CKEO_02_GMX(Short_CKEO_02_GMX<0.1)=nan;

Long_CKEO_02_GMX=output(ind,16);
% Long_CKEO_02_GMX(Long_CKEO_02_GMX>600)=nan;
indLongErr = find(Long_CKEO_02_GMX>600);
Long_CKEO_02_GMX(indLongErr(1):end)=NaN;
Long_CKEO_02_GMX(Long_CKEO_02_GMX<0.1)=nan;

% AirTemp_CR_CKEO_02_GMX=output(ind,18);
% RH_CR_CKEO_02_GMX=output(ind,19);
% CO2_CKEO_02_GMX=output(ind,20); %---CO2 ppm

%%% AIRMAR %%%
% 1.ʱ��	2.����	3.γ��	4.1/3����	5.1/3������	6.1/10����	7.1/10������	8.��󲨸�	9.�������	10.ƽ������	11.ƽ��������	12.����	
% 13.PTB210ѹ��hPa	14.CTD�¶ȡ�	15.CTD�絼��S/m	16.CTDѹ��db	17.CTD�ζ�PSU	18.����	19.����	20.�¶�	21.��ѹ	22.��ѹֵ

CKEO_update(109,365*2,'CKEO-02-AIRMAR.mat');
load CKEO-02-AIRMAR.mat

% FirstData: 2020.6.10  0:00 BJ
indBF = datenum([2020,6,10,0,0,00]);
indAFT = now;
ind = find(output(:,1) >= indBF & output(:,1) <= indAFT);

%---DateNum
DateNum_CKEO_02_AIRMAR=output(ind,1)-8./24;  %---ת��ΪUTCʱ��
%---Lon Lat
Lon_CKEO_02_AIRMAR=output(ind,2);
Lat_CKEO_02_AIRMAR=output(ind,3);

% %---QC position
% Lon_CKEO_02_AIRMAR(Lon_CKEO_02_AIRMAR>146.8)=nan;
% Lon_CKEO_02_AIRMAR(Lon_CKEO_02_AIRMAR<146.4)=nan;
% Lat_CKEO_02_AIRMAR(Lat_CKEO_02_AIRMAR>35.2)=nan;
% Lat_CKEO_02_AIRMAR(Lat_CKEO_02_AIRMAR<34.8)=nan;

%---Wave
WaveH_third_CKEO_02_AIRMAR=output(ind,4);WaveH_third_CKEO_02_AIRMAR(WaveH_third_CKEO_02_AIRMAR<0.1) = NaN;
WaveP_third_CKEO_02_AIRMAR=output(ind,5);WaveP_third_CKEO_02_AIRMAR(WaveP_third_CKEO_02_AIRMAR<0.1) = NaN;
WaveH_tenth_CKEO_02_AIRMAR=output(ind,6);
WaveP_tenth_CKEO_02_AIRMAR=output(ind,7);
WaveH_max_CKEO_02_AIRMAR=output(ind,8);
WaveP_max_CKEO_02_AIRMAR=output(ind,9);
WaveH_mean_CKEO_02_AIRMAR=output(ind,10);
WaveP_mean_CKEO_02_AIRMAR=output(ind,11);
WaveDir_CKEO_02_AIRMAR=output(ind,12);  

%---Wind
WindSpeed_CKEO_02_AIRMAR=output(ind,18);  
WindSpeed_CKEO_02_AIRMAR(WindSpeed_CKEO_02_AIRMAR>40)=nan;
WindDir_CKEO_02_AIRMAR=output(ind,19);

%---AirT/P
AirTemp_CKEO_02_AIRMAR=output(ind,20);
AirPress_CKEO_02_AIRMAR=output(ind,21)*1000;  %----hPa
AirPress_CKEO_02_AIRMAR(AirPress_CKEO_02_AIRMAR>1050)=nan;

%---CTD:T/C/S/V
CTD_SST_CKEO_02_AIRMAR=output(ind,14);
CTD_SST_CKEO_02_AIRMAR(CTD_SST_CKEO_02_AIRMAR>40 | CTD_SST_CKEO_02_AIRMAR<0.1)=nan;
CTD_Cond_CKEO_02_AIRMAR=output(ind,15)*10;  %---unit: mS/cm 
CTD_Cond_CKEO_02_AIRMAR(CTD_Cond_CKEO_02_AIRMAR<15)=nan;
CTD_SSS_CKEO_02_AIRMAR=output(ind,17);
CTD_SSS_CKEO_02_AIRMAR(CTD_SSS_CKEO_02_AIRMAR<33.5)=nan;
Voltage_CKEO_02_AIRMAR=output(ind,22);
Voltage_CKEO_02_AIRMAR(Voltage_CKEO_02_AIRMAR<12)=nan;
% % CTD QC
CTD_SSS_CKEO_02_AIRMAR = SmoothQC(CTD_SSS_CKEO_02_AIRMAR,5,.98);
% CTD_Cond_CKEO_02_AIRMAR= SmoothQC(CTD_Cond_CKEO_02_AIRMAR,5,.98);

DateEnd = datevec(max(DateNum_CKEO_02_AIRMAR(end),DateNum_CKEO_02_GMX(end)));
UpDate = datestr([DateEnd(1:4),0,0],31);

%% Fig.1 : sub4(wind/airT/rh/airP by GMX)
nSub = 4;

WidthFigure = 600;
HeightFigure = 500;

WidthSub = 480;
HeightSub = 80;
HeightBlankUp = 30;


WidthPercentSub = WidthSub/WidthFigure;
HeightPercentSub = HeightSub/HeightFigure;
HeightPercentBlankUp = HeightBlankUp/HeightFigure;
p10 = 10/HeightFigure;
figure

iSub = 1;
    SubPos = [.1, 1-(HeightPercentSub+HeightPercentBlankUp)*iSub, WidthPercentSub, HeightPercentSub];
    subplot('position',SubPos)
    hold on
    box on
    grid on
    plot(DateNum_CKEO_01_CR1000,WindSpeed_GMX_CKEO_01_CR1000,'color',B,'linewidth',1)
    plot(DateNum_CKEO_02_GMX,WindSpeed_GMX_CKEO_02_GMX,'color',R,'linewidth',1)
    datetick('x','mmm')
    if iSub ~= nSub
        set(gca,'xTickLabel',[])
    end
    dim = [.1-.01, 1-HeightPercentBlankUp*iSub-HeightPercentSub*(iSub-1)+p10*2, p10,p10];
    str = 'Wind Speed [m s^-^1]';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
%%% update time
    dim = [.4321, 1-HeightPercentBlankUp*iSub-HeightPercentSub*(iSub-1)+p10*2, p10,p10];
    str = ['(Update to ',UpDate,')'];
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',14);
    
    set(gca,'TickDir','out','fontsize',10)
iSub = 2;
    SubPos = [.1, 1-(HeightPercentSub+HeightPercentBlankUp)*iSub, WidthPercentSub, HeightPercentSub];
    subplot('position',SubPos)
    hold on
    box on
    grid on
    plot(DateNum_CKEO_01_CR1000,AirTemp_GMX_CKEO_01_CR1000,'color',B,'linewidth',1)
    plot(DateNum_CKEO_02_GMX,AirTemp_GMX_CKEO_02_GMX,'color',R,'linewidth',1)
    datetick('x','mmm')
    if iSub ~= nSub
        set(gca,'xTickLabel',[])
    end
    dim = [.1-.01, 1-HeightPercentBlankUp*iSub-HeightPercentSub*(iSub-1)+p10*2, p10,p10];
    str = 'Air Temperature [^oC]';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    set(gca,'TickDir','out','fontsize',10)
% %     
iSub = 3;
    SubPos = [.1, 1-(HeightPercentSub+HeightPercentBlankUp)*iSub, WidthPercentSub, HeightPercentSub];
    subplot('position',SubPos)
    hold on
    box on
    grid on
    plot(DateNum_CKEO_01_CR1000,RH_GMX_CKEO_01_CR1000,'color',B,'linewidth',1)
    plot(DateNum_CKEO_02_GMX,RH_GMX_CKEO_02_GMX,'color',R,'linewidth',1)
    datetick('x','mmm')
    if iSub ~= nSub
        set(gca,'xTickLabel',[])
    end
    dim = [.1-.01, 1-HeightPercentBlankUp*iSub-HeightPercentSub*(iSub-1)+p10*2, p10,p10];
    str = 'Relative Humidity [%]';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    set(gca,'TickDir','out','fontsize',10)
iSub = 4;
    SubPos = [.1, 1-(HeightPercentSub+HeightPercentBlankUp)*iSub, WidthPercentSub, HeightPercentSub];
    subplot('position',SubPos)
    hold on
    box on
    grid on
    plot(DateNum_CKEO_01_CR1000,AirPress_GMX_CKEO_01_CR1000,'color',B,'linewidth',1)
    plot(DateNum_CKEO_02_GMX,AirPress_GMX_CKEO_02_GMX,'color',R,'linewidth',1)
    datetick('x','mmm')
    if iSub ~= nSub
        set(gca,'xTickLabel',[])
    end
    dim = [.1-.01, 1-HeightPercentBlankUp*iSub-HeightPercentSub*(iSub-1)+p10*2, p10,p10];
    str = 'Air Pressure [hPa]';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    set(gca,'TickDir','out','fontsize',10)
%%% year
    dim = [.1,1-(HeightPercentSub+HeightPercentBlankUp)*iSub-p10*3,p10,p10];
    str = '2019';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    dim = [.5,1-(HeightPercentSub+HeightPercentBlankUp)*iSub-p10*3,p10,p10];
    str = '2020';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);

set(gcf,'position',[100,100,WidthFigure,HeightFigure])


set(gcf,'visible','off')
print(gcf,'CKEO_Fig_1','-dpng','-r600')
close gcf

%% Fig.2 : sub3(prep/LW/SW)

nSub = 3;

WidthFigure = 600;
HeightFigure = 380;

WidthSub = 480;
HeightSub = 80;
HeightBlankUp = 30;

WidthPercentSub = WidthSub/WidthFigure;
HeightPercentSub = HeightSub/HeightFigure;
HeightPercentBlankUp = HeightBlankUp/HeightFigure;
p10 = 10/HeightFigure;
figure
iSub = 1;
    SubPos = [.1, 1-(HeightPercentSub+HeightPercentBlankUp)*iSub, WidthPercentSub, HeightPercentSub];
    subplot('position',SubPos)
    hold on
    box on
    grid on
    plot(DateNum_CKEO_01_CR1000,Precip_GMX_CKEO_01_CR1000,'color',B,'linewidth',1)
    plot(DateNum_CKEO_02_GMX,Precip_GMX_CKEO_02_GMX,'color','none','linewidth',1)
    
    datetick('x','mmm')
    if iSub ~= nSub
        set(gca,'xTickLabel',[])
    end
    dim = [.1-.01, 1-HeightPercentBlankUp*iSub-HeightPercentSub*(iSub-1)+p10*2, p10,p10];
    str = 'Precipitation [mm/h]';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    set(gca,'TickDir','out','fontsize',10)
iSub = 2;
    SubPos = [.1, 1-(HeightPercentSub+HeightPercentBlankUp)*iSub, WidthPercentSub, HeightPercentSub];
    subplot('position',SubPos)
    hold on
    box on
    grid on
    plot(DateNum_CKEO_01_CR1000,Long_CKEO_01_CR1000,'color',B,'linewidth',1)
    plot(DateNum_CKEO_02_GMX,Long_CKEO_02_GMX,'color',R,'linewidth',1)
%     ylim([350,550])
    datetick('x','mmm')
    if iSub ~= nSub
        set(gca,'xTickLabel',[])
    end
    dim = [.1-.01, 1-HeightPercentBlankUp*iSub-HeightPercentSub*(iSub-1)+p10*2, p10,p10];
    str = 'Longwave Radiation [W m^-^2]';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    set(gca,'TickDir','out','fontsize',10)
% %     
iSub = 3;
    SubPos = [.1, 1-(HeightPercentSub+HeightPercentBlankUp)*iSub, WidthPercentSub, HeightPercentSub];
    subplot('position',SubPos)
    hold on
    box on
    grid on
    plot(DateNum_CKEO_01_CR1000,Short_CKEO_01_CR1000,'color',B,'linewidth',1)
    plot(DateNum_CKEO_02_GMX,Short_CKEO_02_GMX,'color',R,'linewidth',1)
    datetick('x','mmm')
    if iSub ~= nSub
        set(gca,'xTickLabel',[])
    end
    dim = [.1-.01, 1-HeightPercentBlankUp*iSub-HeightPercentSub*(iSub-1)+p10*2, p10,p10];
    str = 'Shortwave Radiation [W m^-^2]';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    set(gca,'TickDir','out','fontsize',10)
%%% year
    dim = [.1,1-(HeightPercentSub+HeightPercentBlankUp)*iSub-p10*3,p10,p10];
    str = '2019';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    dim = [.7,1-(HeightPercentSub+HeightPercentBlankUp)*iSub-p10*3,p10,p10];
    str = '2020';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
set(gcf,'position',[100,100,WidthFigure,HeightFigure])
set(gcf,'visible','off')
print(gcf,'CKEO_Fig_2','-dpng','-r600')
close gcf


%% Fig.3 : sub4(CTD:T/S/C/V)
nSub = 4;

WidthFigure = 600;
HeightFigure = 500;

WidthSub = 480;
HeightSub = 80;
HeightBlankUp = 30;

WidthPercentSub = WidthSub/WidthFigure;
HeightPercentSub = HeightSub/HeightFigure;
HeightPercentBlankUp = HeightBlankUp/HeightFigure;
p10 = 10/HeightFigure;
figure

iSub = 1;
    SubPos = [.1, 1-(HeightPercentSub+HeightPercentBlankUp)*iSub, WidthPercentSub, HeightPercentSub];
    subplot('position',SubPos)
    hold on
    box on
    grid on
    plot(DateNum_CKEO_01_AIRMAR,CTD_SST_CKEO_01_AIRMAR,'color',B,'linewidth',1)
    plot(DateNum_CKEO_02_AIRMAR,CTD_SST_CKEO_02_AIRMAR,'color',R,'linewidth',1)
    datetick('x','mmm')
    if iSub ~= nSub
        set(gca,'xTickLabel',[])
    end
    dim = [.1-.01, 1-HeightPercentBlankUp*iSub-HeightPercentSub*(iSub-1)+p10*2, p10,p10];
    str = 'CTD Temperature [^oC]';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    set(gca,'TickDir','out','fontsize',10)
iSub = 2;
    SubPos = [.1, 1-(HeightPercentSub+HeightPercentBlankUp)*iSub, WidthPercentSub, HeightPercentSub];
    subplot('position',SubPos)
    hold on
    box on
    grid on
    plot(DateNum_CKEO_01_AIRMAR,CTD_SSS_CKEO_01_AIRMAR,'color',B,'linewidth',1)
    plot(DateNum_CKEO_02_AIRMAR,CTD_SSS_CKEO_02_AIRMAR,'color',R,'linewidth',1)
    datetick('x','mmm')
    if iSub ~= nSub
        set(gca,'xTickLabel',[])
    end
    dim = [.1-.01, 1-HeightPercentBlankUp*iSub-HeightPercentSub*(iSub-1)+p10*2, p10,p10];
    str = 'CTD Salinity [PSU]';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    set(gca,'TickDir','out','fontsize',10)
% %     
iSub = 3;
    SubPos = [.1, 1-(HeightPercentSub+HeightPercentBlankUp)*iSub, WidthPercentSub, HeightPercentSub];
    subplot('position',SubPos)
    hold on
    box on
    grid on
    plot(DateNum_CKEO_01_AIRMAR,CTD_Cond_CKEO_01_AIRMAR,'color',B,'linewidth',1)
    plot(DateNum_CKEO_02_AIRMAR,CTD_Cond_CKEO_02_AIRMAR,'color',R,'linewidth',1)
    datetick('x','mmm')
    if iSub ~= nSub
        set(gca,'xTickLabel',[])
    end
    dim = [.1-.01, 1-HeightPercentBlankUp*iSub-HeightPercentSub*(iSub-1)+p10*2, p10,p10];
    str = 'Conductivity [mS/cm]';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    set(gca,'TickDir','out','fontsize',10)
iSub = 4;
    SubPos = [.1, 1-(HeightPercentSub+HeightPercentBlankUp)*iSub, WidthPercentSub, HeightPercentSub];
    subplot('position',SubPos)
    hold on
    box on
    grid on
    plot(DateNum_CKEO_01_AIRMAR,Voltage_CKEO_01_AIRMAR,'color','none','linewidth',1)
    plot(DateNum_CKEO_02_AIRMAR,Voltage_CKEO_02_AIRMAR,'color',R,'linewidth',1)
    datetick('x','mmm')
    if iSub ~= nSub
        set(gca,'xTickLabel',[])
    end
    dim = [.1-.01, 1-HeightPercentBlankUp*iSub-HeightPercentSub*(iSub-1)+p10*2, p10,p10];
    str = 'Voltage [V]';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    set(gca,'TickDir','out','fontsize',10)
%%% year
    dim = [.1,1-(HeightPercentSub+HeightPercentBlankUp)*iSub-p10*3,p10,p10];
    str = '2019';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    dim = [.7,1-(HeightPercentSub+HeightPercentBlankUp)*iSub-p10*3,p10,p10];
    str = '2020';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
set(gcf,'position',[100,100,WidthFigure,HeightFigure])
set(gcf,'visible','off')
print(gcf,'CKEO_Fig_3','-dpng','-r600')
close gcf

%% Fig.4 : sub2(1/3 wave H/P)

nSub = 2;

WidthFigure = 600;
HeightFigure = 280;

WidthSub = 480;
HeightSub = 80;
HeightBlankUp = 30;


WidthPercentSub = WidthSub/WidthFigure;
HeightPercentSub = HeightSub/HeightFigure;
HeightPercentBlankUp = HeightBlankUp/HeightFigure;
p10 = 10/HeightFigure;

figure

iSub = 1;
    SubPos = [.1, 1-(HeightPercentSub+HeightPercentBlankUp)*iSub, WidthPercentSub, HeightPercentSub];
    subplot('position',SubPos)
    hold on
    box on
    grid on
    plot(DateNum_CKEO_01_AIRMAR,WaveH_third_CKEO_01_AIRMAR,'color',B,'linewidth',1)
    plot(DateNum_CKEO_02_AIRMAR,WaveH_third_CKEO_02_AIRMAR,'color',R,'linewidth',1)
    datetick('x','mmm')
    if iSub ~= nSub
        set(gca,'xTickLabel',[])
    end
    dim = [.1-.01, 1-HeightPercentBlankUp*iSub-HeightPercentSub*(iSub-1)+p10*2, p10,p10];
    str = 'Significant Wave Height [m]';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    set(gca,'TickDir','out','fontsize',10)
iSub = 2;
    SubPos = [.1, 1-(HeightPercentSub+HeightPercentBlankUp)*iSub, WidthPercentSub, HeightPercentSub];
    subplot('position',SubPos)
    hold on
    box on
    grid on
    plot(DateNum_CKEO_01_AIRMAR,WaveP_third_CKEO_01_AIRMAR,'color',B,'linewidth',1)
    plot(DateNum_CKEO_02_AIRMAR,WaveP_third_CKEO_02_AIRMAR,'color',R,'linewidth',1)
    datetick('x','mmm')
    if iSub ~= nSub
        set(gca,'xTickLabel',[])
    end
    dim = [.1-.01, 1-HeightPercentBlankUp*iSub-HeightPercentSub*(iSub-1)+p10*2, p10,p10];
    str = 'Significant Wave Period [s]';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    set(gca,'TickDir','out','fontsize',10)
%%% year
    dim = [.1,1-(HeightPercentSub+HeightPercentBlankUp)*iSub-p10*3,p10,p10];
    str = '2019';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    dim = [.7,1-(HeightPercentSub+HeightPercentBlankUp)*iSub-p10*3,p10,p10];
    str = '2020';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
set(gcf,'position',[100,100,WidthFigure,HeightFigure])
set(gcf,'visible','off') 
print(gcf,'CKEO_Fig_4','-dpng','-r600')
close gcf


%% Fig.5 �հ�ADCPͼ
figure

WidthFigure = 600;
HeightFigure = 500;
set(gcf,'position',[100,100,WidthFigure,HeightFigure])
set(gcf,'visible','off')
print(gcf,'CKEO_Fig_5','-dpng','-r600')
close gcf
