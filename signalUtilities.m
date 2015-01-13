function filtercopy = lowPassFilter(signal,Fs,Fc)


end

function signalDerivative(filtered_1,filtered_2)

	signalDiff = filtered_1 - filtered_2
	squaredDiff = signalDiff.^2

end