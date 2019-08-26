function varargout = champion(varargin)
% CHAMPION MATLAB code for champion.fig
%      CHAMPION, by itself, creates a new CHAMPION or raises the existing
%      singleton*.
%
%      H = CHAMPION returns the handle to a new CHAMPION or the handle to
%      the existing singleton*.
%
%      CHAMPION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHAMPION.M with the given input arguments.
%
%      CHAMPION('Property','Value',...) creates a new CHAMPION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before champion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to champion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help champion

% Last Modified by GUIDE v2.5 31-Aug-2012 02:59:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @champion_OpeningFcn, ...
                   'gui_OutputFcn',  @champion_OutputFcn, ...
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


% --- Executes just before champion is made visible.
function champion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to champion (see VARARGIN)

% Choose default command line output for champion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes champion wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = champion_OutputFcn(hObject, eventdata, handles) 
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
handles.output=hObject;
[a b]=uigetfile({'*.*'});
img=imread([b a]);
grayy=rgb2gray(img);
gr=graythresh(grayy);
handles.bw=im2bw(grayy,gr);
imshow(img,'parent',handles.axes1);
guidata(hObject,handles);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output=hObject;
inverse_binary=not(handles.bw);
[handles.L handles.num_object]=bwlabel(inverse_binary);
set(handles.text3,'string',handles.num_object);
imshow(handles.L,'parent',handles.axes2);
