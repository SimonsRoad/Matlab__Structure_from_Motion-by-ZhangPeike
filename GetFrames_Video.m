%2016��8��3��10:33:18
%ΪORB-SLAM�ṩ���ݼ���tum���ݼ���ʽ
%VFR=vision.VideoFileReader('H:\Interactivity\New Aerial Film\20160801������λ��ʵ��\DJI_0047.mp4');
%% Get frame from video
clc;
clear;
%% ��ȡ��Ƶ
 video_file='G:\ComputerVision2016\3D Program\DataSet\MyDataset\Cellphone\VID_20170115_141356.mp4';
 video=VideoReader(video_file);
 frame_number=floor(video.Duration * video.FrameRate);
%% ��ȡ
GETFRAME=true;
fid=fopen('rgb.txt','wt');
if(~GETFRAME)
fprintf(fid,'%s\n','# ZhangPeike 2016��8��3��11:23:33');
fprintf(fid,'%s\n','# DJI 0047');
fprintf(fid,'%s\n','timestamp name');
end
 for i=1:frame_number
     image_name=num2str(i);
     image_name=strcat(image_name,'.jpg');
     %����ͼƬ
     I=read(video,i);
     if GETFRAME
     %дͼƬ���ֱ���0.5, �������������1.5                           
     imwrite(imresize(I,0.5),image_name,'jpeg');
     I=[];
     else
        disp(video.CurrentTime);
        image_name=strcat('rgb/',image_name);
        fprintf(fid,'%.7f %s\n',video.CurrentTime,image_name);
     end
 end
fclose(fid);
