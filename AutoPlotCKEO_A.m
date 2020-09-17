clear all
% MediumBlue = [0,0,205]/256;
B = [0,0,153]/256;
% Tomato = [255,99,71]/256;
R = [204,51,0]/256;
load NCV_blu_red


%%% CKEO-A-01 load
load CKEO-A-01-AIRMAR.mat
%--------AIRMAR
% 1.ʱ��	2.����	3.γ��	4.��Ϣ���	5.1/3����	6.1/3������	7.1/10����	8.1/10������	
% 9.��󲨸�	10.�������	11.ƽ������	12.ƽ��������	13.ӿ�˲���	14.ӿ�˲�����	15.����	
% 16.����	17.����	18.�¶�	19.��ѹ	20.CTD�¶ȡ�	21.CTD�絼��S/m	22.CTDѹ��db	23.CTD�ζ�PSU	24.��ѹֵ

%---��һ����Ч���� BJ 2019/11/6 1:15:32
%---���һ����Ч���� BJ 2020/4/11 21:49:59  ֮ǰ���ݶϵ��Ѿ�������

%----output QC !!!!!!!!!!!
output(output==0)=nan;
indBF = datenum([2019,11,6,1,15,32]);
indAFT = datenum([2020,4,11,21,49,59]);
ind = find(output(:,1) >= indBF & output(:,1) <= indAFT);
%---DateNum
DateNum_CKEO_A_01_AIRMAR=output(ind,1)-8./24;  %---ת��ΪUTCʱ��
%---Lon Lat
Lon_CKEO_A_01_AIRMAR=output(ind,2);
Lat_CKEO_A_01_AIRMAR=output(ind,3);
%---QC position
Lon_CKEO_A_01_AIRMAR(Lon_CKEO_A_01_AIRMAR>146.8)=nan;
Lon_CKEO_A_01_AIRMAR(Lon_CKEO_A_01_AIRMAR<146.4)=nan;
Lat_CKEO_A_01_AIRMAR(Lat_CKEO_A_01_AIRMAR>35.2)=nan;
Lat_CKEO_A_01_AIRMAR(Lat_CKEO_A_01_AIRMAR<34.8)=nan;
%---Wave
WaveH_third_CKEO_A_01_AIRMAR=output(ind,5);
WaveP_third_CKEO_A_01_AIRMAR=output(ind,6);
WaveH_tenth_CKEO_A_01_AIRMAR=output(ind,7);
WaveP_tenth_CKEO_A_01_AIRMAR=output(ind,8);
WaveH_max_CKEO_A_01_AIRMAR=output(ind,9);
WaveP_max_CKEO_A_01_AIRMAR=output(ind,10);
WaveH_mean_CKEO_A_01_AIRMAR=output(ind,11);
WaveP_mean_CKEO_A_01_AIRMAR=output(ind,12);
WaveDir_CKEO_A_01_AIRMAR=output(ind,15);  %-----wave dir  is wrong!
%---Wind
WindSpeed_CKEO_A_01_AIRMAR=output(ind,16);  
WindSpeed_CKEO_A_01_AIRMAR(WindSpeed_CKEO_A_01_AIRMAR>40)=nan;
WindDir_CKEO_A_01_AIRMAR=output(ind,17);
%---AirT/P
AirTemp_CKEO_A_01_AIRMAR=output(ind,18);
AirPress_CKEO_A_01_AIRMAR=output(ind,19)*1000;  %----hPa
AirPress_CKEO_A_01_AIRMAR(AirPress_CKEO_A_01_AIRMAR>1050)=nan;
%---CTD:T/C/S/V
CTD_SST_CKEO_A_01_AIRMAR=output(ind,20);
CTD_SST_CKEO_A_01_AIRMAR(CTD_SST_CKEO_A_01_AIRMAR>40)=nan;
CTD_Cond_CKEO_A_01_AIRMAR=output(ind,21)*10;  %---unit: mS/cm 
CTD_SSS_CKEO_A_01_AIRMAR=output(ind,23);
CTD_SSS_CKEO_A_01_AIRMAR(CTD_SSS_CKEO_A_01_AIRMAR<33.5)=nan;
Voltage_CKEO_A_01_AIRMAR=output(ind,24);
% CTD QC
CTD_SSS_CKEO_A_01_AIRMAR = SmoothQC(CTD_SSS_CKEO_A_01_AIRMAR,5,.98);
CTD_Cond_CKEO_A_01_AIRMAR= SmoothQC(CTD_Cond_CKEO_A_01_AIRMAR,5,.98);


%-------------CR
% 1.ʱ��	2.����	3.γ��	4.��Ϣ���	5.CR�ɼ����¶�	6.CR�����¶�avg	7.CR����ʪ��avg	8.CRˮ��ѹavg	9.CR��ѹavg	
% 10.CR��Է���avg	11.CR��Է���avg	12.CRʵ�ʷ���avg��knots��	13.CRʵ�ʷ���avg��m/s��	14.CRʵ�ʷ���avg���㣩	
% 15.CR��������avg	16.CR�ܷ���avg	17.CR�ܷ���acc	18.CR����acc	19.GMX����	20.GMX����	21.GMXУ�������	22.GMXУ�������	
% 23.GMX����avg	24.GMX����avg	25.GMXУ�������avg	26.GMXУ�������avg	27.GMX�¶�	28.GMX���ʪ��	29.GMX¶���¶�	
% 30.GMX��ѹ	31.GMXƽ��γ������	32.GMXƽ��γ�ȷ���	33.GMXƽ����������	34.GMXƽ�����ȷ���	35.GMXƽ������	
% 36.GMX����	37.GMX������	38.GMX�����ܶ�	39.GMXγ��	40.GMX����	41.GMX����





%---��һ����Ч���� BJ 2019/11/6 1:22:06
%---���һ����Ч���� BJ 2020/4/11 21:45:05  ֮ǰ���ݶϵ��Ѿ�������
load CKEO-A-01-CR1000.mat
indBF = datenum([2019,11,6,1,22,06]);
indAFT = datenum([2020,4,11,21,45,5]);
ind = find(output(:,1) >= indBF & output(:,1) <= indAFT);
%---DateNum
DateNum_CKEO_A_01_CR1000=output(ind,1)-8./24;  %---ת��ΪUTCʱ��

%---CR �ɼ����м��ж�ʱ��T��RH��������
AirTemp_CR_CKEO_A_01_CR1000=output(ind,6);
RH_CR_CKEO_A_01_CR1000=output(ind,7);
Long_CKEO_A_01_CR1000=output(ind,15); 
Long_CKEO_A_01_CR1000(Long_CKEO_A_01_CR1000>1000)=nan;
Long_CKEO_A_01_CR1000(Long_CKEO_A_01_CR1000<=100)=nan;  
Short_CKEO_A_01_CR1000=output(ind,16);
Short_CKEO_A_01_CR1000(Short_CKEO_A_01_CR1000>2000)=nan;
Short_CKEO_A_01_CR1000(Short_CKEO_A_01_CR1000<0.1)=nan;
%---Gill
WindSpeed_GMX_CKEO_A_01_CR1000=output(ind,20);%---�ǽ�����ķ��٣�����
WindDir_GMX_CKEO_A_01_CR1000=output(ind,21);  %---������ķ���
AirPress_GMX_CKEO_A_01_CR1000=output(ind,30);
RH_GMX_CKEO_A_01_CR1000=output(ind,28);
AirTemp_GMX_CKEO_A_01_CR1000=output(ind,27);
Precip_GMX_CKEO_A_01_CR1000=output(ind,36); %---������
Precip_50202_CKEO_A_01_CR1000=output(ind,18); %---������ 
%%% CKEO-A-02 load

%%% GMX %%%
% 1.ʱ��	2.����	3.γ��	4.GMX����	5.GMX����	6.GMXУ�������	7.GMXУ�������	
% 8.GMX�¶�	9.GMX���ʪ��	10.GMX¶���¶� 11.GMX��ѹ	12.GMX����	13.GMX�����ܶ�	14.GMX����	
% 15.SPP�̲�����Wm^-2	16.PIR��������Wm^-2	17.50203����mm	18.HMP�¶ȡ�	19.HMPʪ��%RH	20.CO2-ppm
CKEO_update(95,365*2,'CKEO-A-02-GMX.mat');
load CKEO-A-02-GMX.mat
% FirstData: 2020.6.10  0:00 BJ
indBF = datenum([2020,6,10,0,0,00]);
indAFT = now;
ind = find(output(:,1) >= indBF & output(:,1) <= indAFT);

%---DateNum
DateNum_CKEO_A_02_GMX=output(ind,1)-8./24;  %---ת��ΪUTCʱ��

%---Gill
WindDir_GMX_CKEO_A_02_GMX=output(ind,6);  %---������ķ���
WindSpeed_GMX_CKEO_A_02_GMX=output(ind,7);%---������ķ���
AirTemp_GMX_CKEO_A_02_GMX=output(ind,8);
RH_GMX_CKEO_A_02_GMX=output(ind,9);
AirPress_GMX_CKEO_A_02_GMX=output(ind,11);
Precip_GMX_CKEO_A_02_GMX=output(ind,12); %---����
PrecipDens_GMX_CKEO_A_02_GMX=output(ind,13); %---�����ܶ�
Precip_50203_CKEO_A_02_GMX=output(ind,17); %---����


%---CR
Short_CKEO_A_02_GMX=output(ind,15);
% Short_CKEO_A_02_GMX(Short_CKEO_A_02_GMX>2000)=nan;
Short_CKEO_A_02_GMX(Short_CKEO_A_02_GMX<0.1)=nan;

Long_CKEO_A_02_GMX=output(ind,16);
% Long_CKEO_A_02_GMX(Long_CKEO_A_02_GMX>600)=nan;
indLongErr = find(Long_CKEO_A_02_GMX>600);
Long_CKEO_A_02_GMX(indLongErr(1):end)=NaN;
% Long_CKEO_A_02_GMX(Long_CKEO_A_02_GMX<0.1)=nan;

% AirTemp_CR_CKEO_A_02_GMX=output(ind,18);
% RH_CR_CKEO_A_02_GMX=output(ind,19);
% CO2_CKEO_A_02_GMX=output(ind,20); %---CO2 ppm

%%% AIRMAR %%%
% 1.ʱ��	2.����	3.γ��	4.1/3����	5.1/3������	6.1/10����	7.1/10������	8.��󲨸�	9.�������	10.ƽ������	11.ƽ��������	12.����	
% 13.PTB210ѹ��hPa	14.CTD�¶ȡ�	15.CTD�絼��S/m	16.CTDѹ��db	17.CTD�ζ�PSU	18.����	19.����	20.�¶�	21.��ѹ	22.��ѹֵ

CKEO_update(94,365*2,'CKEO-A-02-AIRMAR.mat');
load CKEO-A-02-AIRMAR.mat
% FirstData: 2020.6.10  0:00 BJ
indBF = datenum([2020,6,10,0,0,00]);
indAFT = now;
ind = find(output(:,1) >= indBF & output(:,1) <= indAFT);

%---DateNum
DateNum_CKEO_A_02_AIRMAR=output(ind,1)-8./24;  %---ת��ΪUTCʱ��
%---Lon Lat
Lon_CKEO_A_02_AIRMAR=output(ind,2);
Lat_CKEO_A_02_AIRMAR=output(ind,3);

% %---QC position
% Lon_CKEO_A_02_AIRMAR(Lon_CKEO_A_02_AIRMAR>146.8)=nan;
% Lon_CKEO_A_02_AIRMAR(Lon_CKEO_A_02_AIRMAR<146.4)=nan;
% Lat_CKEO_A_02_AIRMAR(Lat_CKEO_A_02_AIRMAR>35.2)=nan;
% Lat_CKEO_A_02_AIRMAR(Lat_CKEO_A_02_AIRMAR<34.8)=nan;

%---Wave
WaveH_third_CKEO_A_02_AIRMAR=output(ind,4);WaveH_third_CKEO_A_02_AIRMAR(WaveH_third_CKEO_A_02_AIRMAR<0.1) = NaN;
WaveP_third_CKEO_A_02_AIRMAR=output(ind,5);WaveP_third_CKEO_A_02_AIRMAR(WaveP_third_CKEO_A_02_AIRMAR<0.1) = NaN;
WaveH_tenth_CKEO_A_02_AIRMAR=output(ind,6);
WaveP_tenth_CKEO_A_02_AIRMAR=output(ind,7);
WaveH_max_CKEO_A_02_AIRMAR=output(ind,8);
WaveP_max_CKEO_A_02_AIRMAR=output(ind,9);
WaveH_mean_CKEO_A_02_AIRMAR=output(ind,10);
WaveP_mean_CKEO_A_02_AIRMAR=output(ind,11);
WaveDir_CKEO_A_02_AIRMAR=output(ind,12);  

%---Wind
WindSpeed_CKEO_A_02_AIRMAR=output(ind,18);  
WindSpeed_CKEO_A_02_AIRMAR(WindSpeed_CKEO_A_02_AIRMAR>40)=nan;
WindDir_CKEO_A_02_AIRMAR=output(ind,19);

%---AirT/P
AirTemp_CKEO_A_02_AIRMAR=output(ind,20);
AirPress_CKEO_A_02_AIRMAR=output(ind,21)*1000;  %----hPa
AirPress_CKEO_A_02_AIRMAR(AirPress_CKEO_A_02_AIRMAR>1050)=nan;

%---CTD:T/C/S/V
CTD_SST_CKEO_A_02_AIRMAR=output(ind,14);
CTD_SST_CKEO_A_02_AIRMAR(CTD_SST_CKEO_A_02_AIRMAR>40 | CTD_SST_CKEO_A_02_AIRMAR<0.1)=nan;
CTD_Cond_CKEO_A_02_AIRMAR=output(ind,15)*10;  %---unit: mS/cm 
CTD_Cond_CKEO_A_02_AIRMAR(CTD_Cond_CKEO_A_02_AIRMAR<15)=nan;
CTD_SSS_CKEO_A_02_AIRMAR=output(ind,17);
CTD_SSS_CKEO_A_02_AIRMAR(CTD_SSS_CKEO_A_02_AIRMAR<33.5)=nan;
Voltage_CKEO_A_02_AIRMAR=output(ind,22);
Voltage_CKEO_A_02_AIRMAR(Voltage_CKEO_A_02_AIRMAR<12)=nan;
% % CTD QC
CTD_SSS_CKEO_A_02_AIRMAR = SmoothQC(CTD_SSS_CKEO_A_02_AIRMAR,5,.98);
% CTD_Cond_CKEO_A_02_AIRMAR= SmoothQC(CTD_Cond_CKEO_A_02_AIRMAR,5,.98);



%%%ADCP%%
%  1.ʱ�� 2.���� 3.γ�� 
% % % % %  UV������ǿ�� % % % % % %
%      U            V           ��(m)
%  4.E/W3-mm/s  5.N/S3-mm/s 18
%  6.E/W4-mm/s  7.N/S4-mm/s 24
%  8.E/W5-mm/s  9.N/S5-mm/s 30
% 10.E/W6-mm/s 11.N/S6-mm/s 36
% 12.E/W7-mm/s 13.N/S7-mm/s 42
% 14.E/W9-mm/s 15.N/S9-mm/s 54
% 16.E/W10-mm/s 17.N/S10-mm/s 60
% 18.E/W11-mm/s 19.N/S11-mm/s 66
% 20.E/W13-mm/s 21.N/S13-mm/s 78
% 22.E/W15-mm/s 23.N/S15-mm/s 90
% 24.E/W17-mm/s 25.N/S17-mm/s 102
% 26.E/W20-mm/s 27.N/S20-mm/s 120
% 28~39.ECHO ��Ӧ��Ļ���ǿ��
% % % % % % % % % % % % % % % % % % 

CKEO_update(96,365*2,'CKEO-A-02-ADCP.mat');
load CKEO-A-02-ADCP.mat

%----2020.6.21 21:00 start
indBF = datenum([2020,6,21,21,0,00]);
indAFT = now;
ind = find(output(:,1) >= indBF & output(:,1) <= indAFT);

ADCP=output(ind,:);
ADCP(ADCP==-32768)=nan;
DateNum_CKEO_A_02_ADCP = ADCP(:,1)-8./24;
u=ADCP(:,4:2:26)/1000;v=ADCP(:,5:2:27)/1000;

%---smooth
for d = 1 : size(u,2)-1
    uSM(:,d) = smooth(u(:,d),8);
    vSM(:,d) = smooth(v(:,d),8);
end
uSM(:,12) = u(:,12);
vSM(:,12) = v(:,12);
echo60=mean(ADCP(:,32:35),2);
uu=flipud(u');vv=flipud(v');  %---- 1:120m .... 12:18m
uu=flipud(uSM');vv=flipud(vSM');  %---- 1:120m .... 12:18m


depUV=flipud([18;24;30;36;42;54;60;66;78;90;102;120]);
[X,Y]=meshgrid(ADCP(:,1),depUV);



DateEnd = datevec(max(DateNum_CKEO_A_02_AIRMAR(end),DateNum_CKEO_A_02_GMX(end)));
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
    plot(DateNum_CKEO_A_01_CR1000,WindSpeed_GMX_CKEO_A_01_CR1000,'color',B,'linewidth',1)
    plot(DateNum_CKEO_A_02_GMX,WindSpeed_GMX_CKEO_A_02_GMX,'color',R,'linewidth',1)
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
    plot(DateNum_CKEO_A_01_CR1000,AirTemp_GMX_CKEO_A_01_CR1000,'color',B,'linewidth',1)
    plot(DateNum_CKEO_A_02_GMX,AirTemp_GMX_CKEO_A_02_GMX,'color',R,'linewidth',1)
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
    plot(DateNum_CKEO_A_01_CR1000,RH_GMX_CKEO_A_01_CR1000,'color',B,'linewidth',1)
    plot(DateNum_CKEO_A_02_GMX,RH_GMX_CKEO_A_02_GMX,'color',R,'linewidth',1)
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
    plot(DateNum_CKEO_A_01_CR1000,AirPress_GMX_CKEO_A_01_CR1000,'color',B,'linewidth',1)
    plot(DateNum_CKEO_A_02_GMX,AirPress_GMX_CKEO_A_02_GMX,'color',R,'linewidth',1)
    datetick('x','mmm')
    if iSub ~= nSub
        set(gca,'xTickLabel',[])
    end
    dim = [.1-.01, 1-HeightPercentBlankUp*iSub-HeightPercentSub*(iSub-1)+p10*2, p10,p10];
    str = 'Air Pressure [hPa]';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    set(gca,'TickDir','out','fontsize',10)
%%% year
    dim = [.07,1-(HeightPercentSub+HeightPercentBlankUp)*iSub-p10*3,p10,p10];
    str = '2019';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    dim = [.5,1-(HeightPercentSub+HeightPercentBlankUp)*iSub-p10*3,p10,p10];
    str = '2020';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
set(gcf,'position',[100,100,WidthFigure,HeightFigure])


set(gcf,'visible','off')
print(gcf,'CKEO_A_Fig_1','-dpng','-r600')
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
    plot(DateNum_CKEO_A_01_CR1000,Precip_GMX_CKEO_A_01_CR1000,'color',B,'linewidth',1)
    plot(DateNum_CKEO_A_02_GMX,Precip_GMX_CKEO_A_02_GMX,'color','none','linewidth',1)
    
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
    plot(DateNum_CKEO_A_01_CR1000,Long_CKEO_A_01_CR1000,'color',B,'linewidth',1)
    plot(DateNum_CKEO_A_02_GMX,Long_CKEO_A_02_GMX,'color',R,'linewidth',1)
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
    plot(DateNum_CKEO_A_01_CR1000,Short_CKEO_A_01_CR1000,'color',B,'linewidth',1)
    plot(DateNum_CKEO_A_02_GMX,Short_CKEO_A_02_GMX,'color',R,'linewidth',1)
    datetick('x','mmm')
    if iSub ~= nSub
        set(gca,'xTickLabel',[])
    end
    dim = [.1-.01, 1-HeightPercentBlankUp*iSub-HeightPercentSub*(iSub-1)+p10*2, p10,p10];
    str = 'Shortwave Radiation [W m^-^2]';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    set(gca,'TickDir','out','fontsize',10)
%%% year
    dim = [.07,1-(HeightPercentSub+HeightPercentBlankUp)*iSub-p10*3,p10,p10];
    str = '2019';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    dim = [.7,1-(HeightPercentSub+HeightPercentBlankUp)*iSub-p10*3,p10,p10];
    str = '2020';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
set(gcf,'position',[100,100,WidthFigure,HeightFigure])
set(gcf,'visible','off')
print(gcf,'CKEO_A_Fig_2','-dpng','-r600')
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
    plot(DateNum_CKEO_A_01_AIRMAR,CTD_SST_CKEO_A_01_AIRMAR,'color',B,'linewidth',1)
    plot(DateNum_CKEO_A_02_AIRMAR,CTD_SST_CKEO_A_02_AIRMAR,'color',R,'linewidth',1)
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
    plot(DateNum_CKEO_A_01_AIRMAR,CTD_SSS_CKEO_A_01_AIRMAR,'color',B,'linewidth',1)
    plot(DateNum_CKEO_A_02_AIRMAR,CTD_SSS_CKEO_A_02_AIRMAR,'color',R,'linewidth',1)
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
    plot(DateNum_CKEO_A_01_AIRMAR,CTD_Cond_CKEO_A_01_AIRMAR,'color',B,'linewidth',1)
    plot(DateNum_CKEO_A_02_AIRMAR,CTD_Cond_CKEO_A_02_AIRMAR,'color',R,'linewidth',1)
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
    plot(DateNum_CKEO_A_01_AIRMAR,Voltage_CKEO_A_01_AIRMAR,'color','none','linewidth',1)
    plot(DateNum_CKEO_A_02_AIRMAR,Voltage_CKEO_A_02_AIRMAR,'color',R,'linewidth',1)
    datetick('x','mmm')
    if iSub ~= nSub
        set(gca,'xTickLabel',[])
    end
    dim = [.1-.01, 1-HeightPercentBlankUp*iSub-HeightPercentSub*(iSub-1)+p10*2, p10,p10];
    str = 'Voltage [V]';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    set(gca,'TickDir','out','fontsize',10)
%%% year
    dim = [.07,1-(HeightPercentSub+HeightPercentBlankUp)*iSub-p10*3,p10,p10];
    str = '2019';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    dim = [.7,1-(HeightPercentSub+HeightPercentBlankUp)*iSub-p10*3,p10,p10];
    str = '2020';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
set(gcf,'position',[100,100,WidthFigure,HeightFigure])
set(gcf,'visible','off')
print(gcf,'CKEO_A_Fig_3','-dpng','-r600')
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
    plot(DateNum_CKEO_A_01_AIRMAR,WaveH_third_CKEO_A_01_AIRMAR,'color',B,'linewidth',1)
    plot(DateNum_CKEO_A_02_AIRMAR,WaveH_third_CKEO_A_02_AIRMAR,'color',R,'linewidth',1)
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
    plot(DateNum_CKEO_A_01_AIRMAR,WaveP_third_CKEO_A_01_AIRMAR,'color',B,'linewidth',1)
    plot(DateNum_CKEO_A_02_AIRMAR,WaveP_third_CKEO_A_02_AIRMAR,'color',R,'linewidth',1)
    datetick('x','mmm')
    if iSub ~= nSub
        set(gca,'xTickLabel',[])
    end
    dim = [.1-.01, 1-HeightPercentBlankUp*iSub-HeightPercentSub*(iSub-1)+p10*2, p10,p10];
    str = 'Significant Wave Period [s]';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    set(gca,'TickDir','out','fontsize',10)
%%% year
    dim = [.07,1-(HeightPercentSub+HeightPercentBlankUp)*iSub-p10*3,p10,p10];
    str = '2019';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    dim = [.7,1-(HeightPercentSub+HeightPercentBlankUp)*iSub-p10*3,p10,p10];
    str = '2020';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
set(gcf,'position',[100,100,WidthFigure,HeightFigure])
set(gcf,'visible','off') 
print(gcf,'CKEO_A_Fig_4','-dpng','-r600')
close gcf

%% Fig.5 :sub3(U/V/ECHO)
rgb20 = rgb(round(linspace(1,256,20)),:);
nSub = 3;
WidthFigure = 600;
HeightFigure = 500;

WidthSub = 480;
HeightSub = 120;
HeightBlankUp = 30;

WidthPercentSub = WidthSub/WidthFigure;
HeightPercentSub = HeightSub/HeightFigure;
HeightPercentBlankUp = HeightBlankUp/HeightFigure;
p10 = 10/HeightFigure;



figure
iSub = 1;
    SubPos = [.1, 1-(HeightPercentSub+HeightPercentBlankUp)*iSub, WidthPercentSub, HeightPercentSub];
    ax1 = subplot('position',SubPos);
    hold on
    box on
    contourf(X,Y,uu,[-1:.1:1],'linestyle','none')
    contour(X,Y,uu,[0,0],'k')
    datetick('x','mmm','keeplimits')
    xLimOri = get(gca,'xLim');
    xLimAdj = [xLimOri(1)-1,xLimOri(2)+1];
    xlim(xLimAdj)
    datetick('x','mmm','keeplimits')
    if iSub ~= nSub
        set(gca,'xTickLabel',[])
    end
    cbPos = [.93,1-(HeightPercentSub+HeightPercentBlankUp)*(iSub+1),.02,HeightPercentSub*2+HeightPercentBlankUp];

    cb = colorbar('position',cbPos);
    cb.Title.String = '[m s^-^1]';
    caxis([-1 1]);
    set(cb,'yTick',[-1:.5:1])
    colormap(ax1,rgb20);
    ylim([15,120])
    set(gca,'ydir','reverse')
    ylabel('Depth [m]')

    dim = [.1-.01, 1-HeightPercentBlankUp*iSub-HeightPercentSub*(iSub-1)+p10*2, p10,p10];
    str = 'U'; %Meridional
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    set(gca,'TickDir','out','fontsize',10)
    
    
    L0 = axes('position',cbPos);
    set(L0,'color','none','YAxisLocation','right','xTick',[],'yLim',[-1,1],'yTick',[0],'yTickLabel',[],'TickLength',[0.042,1])
    
    
iSub = 2;
    SubPos = [.1, 1-(HeightPercentSub+HeightPercentBlankUp)*iSub, WidthPercentSub, HeightPercentSub];
    ax2 = subplot('position',SubPos);
    hold on
    box on
    contourf(X,Y,vv,[-1:.1:1],'linestyle','none')
    contour(X,Y,vv,[0,0],'k')
    datetick('x','mmm','keeplimits')
    xLimOri = get(gca,'xLim');
    xLimAdj = [xLimOri(1)-1,xLimOri(2)+1];
    xlim(xLimAdj)
    datetick('x','mmm','keeplimits')
    if iSub ~= nSub
        set(gca,'xTickLabel',[])
    end
%     L1 = colorbar('position',[.93,1-(HeightPercentSub+HeightPercentBlankUp)*iSub,.02,HeightPercentSub]);
%     L1.Title.String = '[cm s^-^1]';
    caxis([-1 1]);
    colormap(ax2,rgb20);
%     colormap(ax2,m_colmap('diverging',20));
    ylim([15,120])
    set(gca,'ydir','reverse')
    ylabel('Depth [m]')
    dim = [.1-.01, 1-HeightPercentBlankUp*iSub-HeightPercentSub*(iSub-1)+p10*2, p10,p10];
    str = 'V'; %Meridional
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    set(gca,'TickDir','out','fontsize',10)
    
iSub = 3;
    SubPos = [.1, 1-(HeightPercentSub+HeightPercentBlankUp)*iSub, WidthPercentSub, HeightPercentSub];
    ax3 = subplot('position',SubPos);
    hold on
    box on
    grid on
    plot(DateNum_CKEO_A_02_ADCP,echo60,'color',B,'linewidth',1)
    datetick('x','mmm','keeplimits')
    xlim(xLimAdj)
    datetick('x','mmm','keeplimits')
    if iSub ~= nSub
        set(gca,'xTickLabel',[])
    end
    dim = [.1-.01, 1-HeightPercentBlankUp*iSub-HeightPercentSub*(iSub-1)+p10*2, p10,p10];
    str = 'ECHO at 60m';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    set(gca,'TickDir','out','fontsize',10)
%%% year
%     dim = [.07,1-(HeightPercentSub+HeightPercentBlankUp)*iSub-p10*3,p10,p10];
%     str = '2019';
%     annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
    dim = [.43,1-(HeightPercentSub+HeightPercentBlankUp)*iSub-p10*3,p10,p10];
    str = '2020';
    annotation('textbox',dim,'String',str,'FitBoxToText','on','linestyle','none','fontsize',12);
set(gcf,'position',[100,100,WidthFigure,HeightFigure])
set(gcf,'visible','off')
print(gcf,'CKEO_A_Fig_5','-dpng','-r600')
close gcf


