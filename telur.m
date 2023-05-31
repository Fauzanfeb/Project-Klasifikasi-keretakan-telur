function varargout = SegTelur(varargin)
% SEGTELUR MATLAB code for SegTelur.fig
%      SEGTELUR, by itself, creates a new SEGTELUR or raises the existing
%      singleton*.
%
%      H = SEGTELUR returns the handle to a new SEGTELUR or the handle to
%      the existing singleton*.
%
%      SEGTELUR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SEGTELUR.M with the given input arguments.
%
%      SEGTELUR('Property','Value',...) creates a new SEGTELUR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SegTelur_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SegTelur_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SegTelur

% Last Modified by GUIDE v2.5 15-Oct-2022 11:01:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SegTelur_OpeningFcn, ...
                   'gui_OutputFcn',  @SegTelur_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT