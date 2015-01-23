%The follow function will plot the smoothed signal and the MAD*2.91 of the time signal
%time vector is the vector of times for data points
%signal is your data c(1).data.raw or whatever, for example
%time span is the time interval you collected data 
 
 function realData=normSlope(channel_1,channel_2)
		
		
	y=(channel_2-median(channel_2))/median(channel_2);
    x=(channel_1-median(channel_1))/median(channel_1);
        
    function normSignal=resamp (signal,noise,Fs,S,fsResamp)
		
		    t = (0:numel(signal)-1) / Fs;

        plot(t,noise,'red')
        hold on
        plot(t,signal,'green')
        hold on
        plot(t,signal-(sgolayfilt(noise,1,S)));
        hold on
        plot(t,sgolayfilt(noise,1,S),'cyan')
        
        normSignal=signal-sgolayfilt(noise,1,S);
    end
       
    normalized_1=resamp(x,y,381.6793893,3001,400);
    filtered_normalized = sgolayfilt(normalized_1,1,3001);
       

    realData = normalized_1-filtered_normalized;
    hold on 
    plot(t,realData,'yellow')    
end
 