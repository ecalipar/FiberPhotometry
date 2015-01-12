%The follow function will plot the smoothed signal and the MAD*2.91 of the time signal
%time vector is the vector of times for data points
%signal is your data c(1).data.raw or whatever, for example
%time span is the time interval you collected data 
 
 
%function output = LowPass(input,sf,cutoff)
 
%[b, a] = butter(6, cutoff*2/sf,'low');
%output = filter(b,a, input);
%end
 
%nornalization as outlined in the email
function realData=normSlope(channel_1,channel_2)
		
		
		y=(channel_2-median(channel_2))/median(channel_2);
        x=(channel_1-median(channel_1))/median(channel_1);
        
        function normSignal=resamp (signal,noise,Fs,S,fsResamp)
		
		t = (0:numel(signal)-1) / Fs;
		%plot(t,signal); 
		%title('Noisey Signal')
 
		%plot(t,sgolayfilt(signal,1,S));
		%title('Smoothed')
        
        %function normSlope = getSlope(a,b)
            
           % plot(a,b)
         %   slope=polyfit(a,b,1);
            
          %  normSlope = +slope(1);
        %end
        
        
        plot(t,noise,'red')
        hold on
        plot(t,signal,'green')
        hold on
        plot(t,signal-(sgolayfilt(noise,1,S)));
        hold on
        plot(t,sgolayfilt(noise,1,S),'cyan')
        
        normSignal=signal-sgolayfilt(noise,1,S);
        
		%vResamp = resample(signal, fsResamp, Fs);
		%tResamp = (0:numel(vResamp)-1) / fsResamp;
		%vAvgResamp = sgolayfilt(vResamp,1,S);
		%plot(tResamp,vAvgResamp);
		%title('Resampled')
   
        end
       
       normalized_1=resamp(x,y,381.6793893,3001,400);
       filtered_normalized = sgolayfilt(normalized_1,1,3001);
       
       realData = normalized_1-filtered_normalized;
       hold on 
       plot(t,realData,'yellow')
        %hold
        %plot(y)
		%plot(x,y)
		%slope=polyfit(x,y,1);
		%tmp_x = slope + x
		%yo=y-tmp_x
        
end
 