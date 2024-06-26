function lct = direct_method1d(samples, T, a, b, d)
% Written by Gerard Murphy
% Function to numerically calculate the LCT of a given set of samples using
% the spectral method.
% For algorithm breakdown see paper -
% "Space and width ratio as a means of choosing between Fresnel and other
% linear canonical transform algorithms" J.J Healy + J Sheridan

nSamp = length(samples);    % get the number of samples

row = -(nSamp-1)/2:1:(nSamp-1)/2;   % For use to generate chirp multiplications

chirp1 = exp(1i*pi*((row*T).^2)*a/(b));     % first chirp
chirp2 = exp(1i*pi*((row*(b/(nSamp*T))).^2)*d/(b));     % second chirp

% final computation of LCT
lct = fftshift(fft(fftshift(samples.*chirp1))).*chirp2;