function [] = skelDraw3Dtiny (xyz,figureHandle)
%==============Debug Info =================================================
% clear all; close all; fclose all;clc
% dataFile = 'D:\Videos\DataSet\agacharse\Jaison Gonzales\95838 2482012\Esqueleto.csv';
% 
% skel_joints = joint_structure (dataFile);
% totalframes = size (skel_joints,2);
% fnum = 1;
% xyz = skel_joints (fnum);
%==========================================================================
axes (figureHandle)
set(figureHandle,'Visible','on','DrawMode','fast');
ylim ([-1.1,1.5])
axis equal  
LineWidth_ = 2; LineColor_ = [0, 0.6667, 0.8941];
% axes (figureHandle);
hold on
%Parte central
line ([xyz.hip_center(1),xyz.torso(1)],[xyz.hip_center(2),xyz.torso(2)],[xyz.hip_center(3),xyz.torso(3)],'LineWidth',LineWidth_,'Color',LineColor_)
line ([xyz.torso(1),xyz.neck(1)],[xyz.torso(2),xyz.neck(2)],[xyz.torso(3),xyz.neck(3)],'LineWidth',LineWidth_,'Color',LineColor_)
line ([xyz.neck(1),xyz.head(1)],[xyz.neck(2),xyz.head(2)],[xyz.neck(3),xyz.head(3)],'LineWidth',LineWidth_,'Color',LineColor_)
%Brazo Izquierdo
line ([xyz.neck(1),xyz.left_shoulder(1)],[xyz.neck(2),xyz.left_shoulder(2)],[xyz.neck(3),xyz.left_shoulder(3)],'LineWidth',LineWidth_,'Color',LineColor_)
line ([xyz.left_shoulder(1),xyz.left_elbow(1)],[xyz.left_shoulder(2),xyz.left_elbow(2)],[xyz.left_shoulder(3),xyz.left_elbow(3)],'LineWidth',LineWidth_,'Color',LineColor_)
line ([xyz.left_elbow(1),xyz.left_wrist(1)],[xyz.left_elbow(2),xyz.left_wrist(2)],[xyz.left_elbow(3),xyz.left_wrist(3)],'LineWidth',LineWidth_,'Color',LineColor_)
line ([xyz.left_wrist(1),xyz.left_hand(1)],[xyz.left_wrist(2),xyz.left_hand(2)],[xyz.left_wrist(3),xyz.left_hand(3)],'LineWidth',LineWidth_,'Color',LineColor_)
%Brazo Derecho
line ([xyz.neck(1),xyz.right_shoulder(1)],[xyz.neck(2),xyz.right_shoulder(2)],[xyz.neck(3),xyz.right_shoulder(3)],'LineWidth',LineWidth_,'Color',LineColor_)
line ([xyz.right_shoulder(1),xyz.right_elbow(1)],[xyz.right_shoulder(2),xyz.right_elbow(2)],[xyz.right_shoulder(3),xyz.right_elbow(3)],'LineWidth',LineWidth_,'Color',LineColor_)
line ([xyz.right_elbow(1),xyz.right_wrist(1)],[xyz.right_elbow(2),xyz.right_wrist(2)],[xyz.right_elbow(3),xyz.right_wrist(3)],'LineWidth',LineWidth_,'Color',LineColor_)
line ([xyz.right_wrist(1),xyz.right_hand(1)],[xyz.right_wrist(2),xyz.right_hand(2)],[xyz.right_wrist(3),xyz.right_hand(3)],'LineWidth',LineWidth_,'Color',LineColor_)
%Pierna Izquierda
line ([xyz.hip_center(1),xyz.left_hip(1)],[xyz.hip_center(2),xyz.left_hip(2)],[xyz.hip_center(3),xyz.left_hip(3)],'LineWidth',LineWidth_,'Color',LineColor_)
line ([xyz.left_hip(1),xyz.left_knee(1)],[xyz.left_hip(2),xyz.left_knee(2)],[xyz.left_hip(3),xyz.left_knee(3)],'LineWidth',LineWidth_,'Color',LineColor_)
line ([xyz.left_knee(1),xyz.left_ankle(1)],[xyz.left_knee(2),xyz.left_ankle(2)],[xyz.left_knee(3),xyz.left_ankle(3)],'LineWidth',LineWidth_,'Color',LineColor_)
line ([xyz.left_ankle(1),xyz.left_foot(1)],[xyz.left_ankle(2),xyz.left_foot(2)],[xyz.left_ankle(3),xyz.left_foot(3)],'LineWidth',LineWidth_,'Color',LineColor_)
%Pierna Derecha
line ([xyz.hip_center(1),xyz.right_hip(1)],[xyz.hip_center(2),xyz.right_hip(2)],[xyz.hip_center(3),xyz.right_hip(3)],'LineWidth',LineWidth_,'Color',LineColor_)
line ([xyz.right_hip(1),xyz.right_knee(1)],[xyz.right_hip(2),xyz.right_knee(2)],[xyz.right_hip(3),xyz.right_knee(3)],'LineWidth',LineWidth_,'Color',LineColor_)
line ([xyz.right_knee(1),xyz.right_ankle(1)],[xyz.right_knee(2),xyz.right_ankle(2)],[xyz.right_knee(3),xyz.right_ankle(3)],'LineWidth',LineWidth_,'Color',LineColor_)
line ([xyz.right_ankle(1),xyz.right_foot(1)],[xyz.right_ankle(2),xyz.right_foot(2)],[xyz.right_ankle(3),xyz.right_foot(3)],'LineWidth',LineWidth_,'Color',LineColor_)

dataFields = fieldnames (xyz);
%Joints Plot
for j = 1: 20
    x=xyz.(dataFields{j})(1);
    y=xyz.(dataFields{j})(2);
    z=xyz.(dataFields{j})(3);
    plot3 (x,y,z,'g.','MarkerSize',10);
end

end