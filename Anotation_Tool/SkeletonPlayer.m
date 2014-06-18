function [i] = SkeletonPlayer (skel_joints,axesHandle_,playstart,playstop,playspeed)

%====================DEBUG INFO=================================
% clear all; close all; fclose all;clc
% dataFile = 'D:\Videos\DataSet\agacharse\Jaison Gonzales\95838 2482012\Esqueleto.csv';
% axesHandle_ = axes;
% playstart = 67;
% playstop = 90;
% playspeed = 0.05;
%================================================================

for i = playstart: playstop
    tstart = tic;
    delete(get(axesHandle_,'Children'))
    xyz = skel_joints (i);
    skelDraw3D (xyz,axesHandle_);
    pause (playspeed)
    toc (tstart)
end
end