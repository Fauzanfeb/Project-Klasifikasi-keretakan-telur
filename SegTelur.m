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


% --- Executes just before SegTelur is made visible.
function SegTelur_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SegTelur (see VARARGIN)

% Choose default command line output for SegTelur
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SegTelur wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SegTelur_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[name_file1,name_path1] = uigetfile('*.jpg');
if ~isequal(name_file1,0)
    
handles.data1 = imread(fullfile(name_path1,name_file1))
;
guidata(hObject,handles);
axes(handles.axes1);
imshow(handles.data1),title ('Original Image');
else
return;
end     

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

image1 = handles.data1;
gray = rgb2gray(image1);
axes(handles.axes2);
imshow(gray);
handles.data2 = gray;
guidata(hObject,handles);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

image1 = handles.data1;
gray = rgb2gray(image1);
thresh=graythresh(gray);
imbw=im2bw(gray,thresh);
axes(handles.axes3);
imshow(imbw);
handles.data4 = imbw;
guidata(hObject,handles); 

% --- Executes on button press in pushbutton3.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

imbw = handles.data4;
renoise=filter2(fspecial('average',3),imbw)/255;
renoise1=medfilt2(imbw,[3,3]);
axes(handles.axes4);
imshow(renoise1)
handles.data4 = renoise1;
guidata(hObject,handles);

% --- Executes on button press in pushbutton3.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

renoise1= handles.data4;
renoise1invers=~renoise1;
axes(handles.axes5);
imshow(renoise1invers);
handles.data5 = renoise1invers;
guidata(hObject,handles);

% --- Executes on button press in pushbutton3.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

renoise1invers=handles.data5;
[m,n]=size(renoise1invers)
count=0;
for i=1:m;
for j=1:n;
if renoise1invers(i,j)==1;
 count=count+1
else,
end
end
end
if count>300000;
 count='Rusak';
else,
 count='Baik';
end
 handles.count=count;
count=handles.count;
set(handles.edit1,'string',count);
guidata(hObject,handles);




% --- Executes during object creation, after setting all properties.
function axes8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes8
imshow ('Background.png')
