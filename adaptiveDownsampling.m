function [x_final,y_final] = adaptiveDownsampling(x,y,threshold)
%This function uses the derivative and the standard deviation to remove
%less significant samples fron long arrays

%%% Example:
% clear all
% clc
% 
% y=0.5*sin(0.5*pi*[0:0.01:10*pi])+0.5;
% y=[y,zeros(1,500),ones(1,500),zeros(1,500)];
% x=0:length(y)-1;
% 
% [x_final,y_final] = adaptiveDownsampling(x,y,0.001);
% 
% plot(x,y);
% hold on
% plot(x_final,y_final);
% grid on
%%%
if length(x)~=length(y)
    error('different length arrays');
end
if iscolumn(x)
    x=x';
end
if iscolumn(y)
    y=y';
end


der=abs(diff(y)./diff(x));
x_tmp=x;
y_tmp=y;
x_tmp(der<threshold)=[];
y_tmp(der<threshold)=[];
for i=2:length(y)-1
    if der(i)>std(der)
        x_tmp=horzcat(x_tmp,x(i+1),x(i-1));
        y_tmp=horzcat(y_tmp,y(i+1),y(i-1));
    end
end
M=sortrows([x_tmp',y_tmp'],1);
x_final=M(:,1)';
y_final=M(:,2)';
end

