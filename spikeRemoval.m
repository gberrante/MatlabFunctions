function x=spikeRemoval(x,mu)
    %this function removes spikes that go over the threshold value mu
    %each array element that is over mu is averaged between previous and subsequent element
    %if spikes occur in the first or last element of the array, it filters it using the nearest value

    %%% Example:
    %clear
    %clc
    %x=0.1*sin(2*pi*2*[0:0.01:20])+0.2*sin(2*pi*4*[0:0.01:20]);
    %r=randi([1 length(x)],20,1);
    %mu=2*std(x);
    %x(r)=0.5;
    %x(1)=1.5;
    %x(end)=2;
    %plot(x)
    %hold on
    %plot(spikeRemoval(x,mu),'r')
    %hold off
    %grid on
    %%%

    if x(1)>mu
        x(1)=x(2);
    end
    if x(end)>mu
        x(end)=x(end-1);
    end
    for i=2:length(x)-1
        if x(i)>mu
            x(i)=mean([x(i-1),x(i+1)]);
        end
    end

end