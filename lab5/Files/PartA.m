clear variables
close all
clc
%% SimscapeCrane_MPC_start;
load('Params_Simscape.mat');
load('SSmodelParams.mat');
%% Set sample period and prediction horizon
Ts=1/10;
Tf=1.5; % duration of prediction horizon in seconds
N=ceil(Tf/Ts); % ceiling to ensure horizon length N is an integer
%% Load the dynamics matrices using a solution from last assignment
[A,B,C,~] = genCraneODE(m,M,MR,r,g,Tx,Ty,Vm,Ts);