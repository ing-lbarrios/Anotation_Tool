function [skeleton, jointskel] = readSkeleton (dataFile, fila, columna)
%readSkeleton read a *.csv File containing the stimation of 3D skeleton by
%C# + SDK v1.5 Kinect.

%It returns a matrix containing the skeleton stimation in one video, also
%the skeleton sorted as joints.

%============debug Info=======================
% clear all; close all; fclose all;
% dataFile = 'D:\Videos\DataSet\agacharse\Jaison Gonzales\95838 2482012\Esqueleto.csv';
%==========================================
if ~exist(dataFile,'file'),
    error('FILE DOES NOT EXIST! CHECK FILE PATH AND FILE NAME!');
else
    %There are 61 features in the stimation of skeleton.
    tstart = tic;
    skeleton = zeros (fila,columna);
    jointskel = zeros (20,fila*3);
    fid = fopen (dataFile);
    tline = fgetl (fid);
    i = 0;
    %Reading .csv file contains Skeleton stimation.
    while ischar(tline)
        i = i + 1;
        fixnotation = strrep (tline,',','.');
        fixseparator = strrep (fixnotation,';',',');
        C = textscan (fixseparator, '%f',columna,'delimiter',',');
        xyz = reshape(C{1}(2:end),3,20)';
        jointskel(:,3*(i-1)+1:3*i) = xyz;
        skeleton(i,:) = C{1};
        tline = fgetl(fid);
    end
    fclose (fid);
    toc (tstart);
end
end