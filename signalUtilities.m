function filtercopy = lowPassFilter(signal,Fc)

	[b,a]=butter(2,Fc);
	filtercopy=filter(b,a,signal);
end

function derivative = signalDerivative(signal,Fc1,Fc2,time)

	signalDiff = lowPassFilter(signal,Fc1) - filtered_2(signal,Fc2);
	squaredDiff = signalDiff.^2;
	derivative = diff(squareDiff)/diff(time);
end


