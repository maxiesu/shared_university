% calculate complex permettivity from complex refractive index

clc;
clear all;
close all;

load('/home/massimo/Documents/MATLAB/TiN_refractive_index_Schnabel_2018.mat')

wavelength = TiNrefractiveindexSchnabel2018.Wavelength;
n = TiNrefractiveindexSchnabel2018.n;
k = TiNrefractiveindexSchnabel2018.k;

% wavelength-frequency conversion
c = 299792458; % m * s-1
f = c ./ wavelength;  % wavelength in micron, frequency in MHz
f = f * 1e-6; % frequency in THz

% refractive index- permittivity conversion
% complex refractive index = n + ik
% eps = eps_re + i * eps_im = (n + ik)^2

eps_re = n.^2 - k.^2;
eps_im = 2 .* n .* k;

f1 = figure;
figure(f1);
plot(f, eps_re)

f2 = figure;
figure(f2);
plot(f, eps_im, 'r')


T = table(f, eps_re, eps_im);
% Write data to text file
writetable(T, 'TiN_permittivity.txt', 'Delimiter',' ')