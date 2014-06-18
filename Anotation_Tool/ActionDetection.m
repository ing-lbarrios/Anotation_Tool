function varargout = ActionDetection(varargin)
% ACTIONDETECTION MATLAB code for ActionDetection.fig
%      ACTIONDETECTION, by itself, creates a new ACTIONDETECTION or raises the existing
%      singleton*.
%
%      H = ACTIONDETECTION returns the handle to a new ACTIONDETECTION or the handle to
%      the existing singleton*.
%
%      ACTIONDETECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ACTIONDETECTION.M with the given input arguments.
%
%      ACTIONDETECTION('Property','Value',...) creates a new ACTIONDETECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ActionDetection_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ActionDetection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ActionDetection

% Last Modified by GUIDE v2.5 12-Jun-2014 10:11:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @ActionDetection_OpeningFcn, ...
    'gui_OutputFcn',  @ActionDetection_OutputFcn, ...
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

% --- Executes just before ActionDetection is made visible.
function ActionDetection_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ActionDetection (see VARARGIN)

global fila
global columna
fila=200;
%Positioning the window
set(0,'Units','pixels')
screen_resolution = get(0,'ScreenSize');

left_margin = (screen_resolution (3) - 960)/2;
botton_margin = (screen_resolution(4) - 640)/2;
set (handles.figure1,'Position',[left_margin botton_margin 960 640])

%Positioning the axes
set (handles.axes1,'Units','pixels','Position',[60 300 240 240])
set (handles.axes4,'Units','pixels','Position',[300 300 240 240])
%set axes visibility
coloraxes_ = [0.94,0.94,0.94];
set (handles.axes1,'Color','k','Visible','on','DrawMode','fast')
set (handles.axes1,'ycolor',coloraxes_,'xcolor',coloraxes_,'zcolor',coloraxes_)

set (handles.axes4,'Color','k','Visible','on','DrawMode','fast')
set (handles.axes4,'ycolor',coloraxes_,'xcolor',coloraxes_,'zcolor',coloraxes_)

%Auxiliar axes to make notes intuitives
set (handles.axes2,'Units','pixels')
set (handles.axes2,'Position',[570 360 180 180],'Color','k','DrawMode','fast')
set (handles.axes2,'ycolor',coloraxes_,'xcolor',coloraxes_,'zcolor',coloraxes_)

set (handles.axes3,'Units','pixels')
set (handles.axes3,'Position',[750 360 180 180],'Color','k','DrawMode','fast')
set (handles.axes3,'ycolor',coloraxes_,'xcolor',coloraxes_,'zcolor',coloraxes_)

%Change string to provide more info to User
set (handles.video_location,'Units','pixels','Position',[60 570 690 30])
set (handles.video_location,'String','Press Load and Select a Valid File (Esqueleto.csv)');

%Position of Load button
set (handles.cargar,'units','pixels','Position',[800 560 80 49])

%Position of checkboxes
%set (handles.checkbox1,'units','pixels','Position',[450 115 75 23])
%set (handles.checkbox2,'units','pixels','Position',[450 87 75 23])
%set (handles.checkbox3,'units','pixels','Position',[630 115 75 23])
%set (handles.checkbox4,'units','pixels','Position',[630 87 75 23])


%uipanel position
set (handles.uipanel1,'Units','pixels')
set (handles.uipanel1,'Position',[210 110 191 75])
set (handles.uipanel2,'Units','pixels')
set (handles.uipanel2,'Position',[137 130 184 40])

set (handles.uipanel6,'Units','pixels')
set (handles.uipanel6,'Position',[62 300 138 160])
set (handles.uipanel6,'Visible','off')
%set controls invisble to avoid the control by the user after the correct
%condition be true
set (handles.uipanel1,'Visible','on')
set (handles.uipanel2,'Visible','off')

set (handles.uipanel4,'Units','pixels')
set (handles.uipanel4,'Position',[600 110 300 110])

%set visibilty of sliders to choose video player
steps_ = 1/200;
set (handles.slider2,'units','pixels','Position',[60 230 445 10],'Visible','on')
set (handles.slider1,'units','pixels','Position',[60 250 445 10],'Visible','on')
set (handles.slider1,'SliderStep',[steps_,steps_],'max',fila);
set (handles.slider2,'SliderStep',[steps_,steps_],'max',fila,'value',fila);
set(handles.slider2_text, 'units','pixels','String',get (handles.slider2,'value')+1,...
    'Position',[505 230 48 12],'Visible','on','FontName','Segoe UI Light')
set(handles.slider1_text,'units','pixels','String',get (handles.slider1,'value')+1,...
    'Position',[505 250 48 12],'Visible','on','FontName','Segoe UI Light')

%Set Format for Visual Frame Num
set (handles.fnumshow,'units','pixels','Position',[210 300 80 20],'ForegroundColor','w',...
    'BackgroundColor','k','FontName','Segoe UI Bold','FontSize',12,'String','0')
%Button Label
%set (handles.label_edit,'units','pixels','Position',[480 315 70 48],'FontName',...
%    'Segoe UI Bold','FontSize',10,'String',upper('label'),'Visible','on')
%set (handles.Delete_Label,'units','pixels','Visible','on',...
%    'Position',[590 315 70 48],'String',upper('Delete'),'FontName','Segoe UI Bold','FontSize',10)
%Popupmenuconfig
%set (handles.popupmenu1,'Units','pixels','Visible','on','Position',[500 500 200 50])
set (handles.uitable1,'Units','pixels','Position',[570 240 360 102],'FontName','Segoe UI Light',...
    'FontSize',10)


% Choose default command line output for ActionDetection
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ActionDetection wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ActionDetection_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in cargar.
function cargar_Callback(hObject, eventdata, handles)
% hObject    handle to cargar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fila
global columna
global skeleton_path
global toDraw
[skeleton_location,skeleton_path] = uigetfile ('Esqueleto.csv;*.txt','Select 3D skeleton File',...
    getVideoFolderdir);
location.path = skeleton_path;
set (handles.video_location,'UserData',location);
%===================================================
% set (handles.label_edit,'Visible','off')
% set (handles.Delete_Label,'visible','off')
%====================================================
%Axes First State
delete(get(handles.axes1,'Children'))
delete(get(handles.axes2,'Children'))
delete(get(handles.axes3,'Children'))
delete(get(handles.axes4,'Children'))
validation = strcmp (skeleton_location,'Esqueleto.csv');
if  validation == 0
    set (handles.video_location,'String','Not a valid file');
    errordlg ('You Select a invalid 3D skeleton, Try Again!','Bad File');
else
    A = cell (4,7);
    set (handles.uitable1,'Data',A)
    
 
    %Flag to  play
    data.stop = false;
    set (handles.axes1,'UserData',data)
    %Info about Time and Skeleton
    dataskeltime.currentime = 1;
    dataFile = [skeleton_path skeleton_location];
    [fila columna]=size(xlsread(dataFile));
    
    Image_path = strcat(skeleton_path,'Color\');
    Rgb_images = dir(Image_path);
    for i=1:fila
        orderedColorImages{i} = Rgb_images(i+2).name;
    end
    [toDraw,toDrawIndex] = sortn(orderedColorImages);

    %Slider First State
    set (handles.slider1,'max',fila);
    set (handles.slider2,'max',fila-1,'value',fila-1);
    set (handles.slider1,'value',0)
    set (handles.slider1_text,'String',get(handles.slider1,'Value')+1)
    set (handles.slider2_text,'String',get(handles.slider2,'Value')+1)
    
    dataskeltime.this_skeleton =joint_structure (dataFile, fila, columna);
    set (handles.fnumshow,'UserData',dataskeltime);
    %Buttons State
    set (handles.video_location,'String',dataFile)
    set (handles.uipanel1,'Visible','on');
    set (handles.playb,'visible','on','Enable','on')
    set (handles.replayb,'visible','off','Enable','off')
    set (handles.replayb2,'visible','off','Enable','off')
    set (handles.pauseb,'Visible','on','Enable','off')
    set (handles.stopb,'Visible','on','Enable','off')
    set (handles.slider1,'Visible','on')
    set (handles.slider2,'visible','on')
    set (handles.slider1_text,'Visible','on')
    set (handles.slider2_text,'Visible','on')
    set (handles.popupmenu1,'Visible','on')
    
    valor_sl1 = get (handles.slider2,'Value');
    valor_sl1 = ceil(valor_sl1 + 1);
    variables = get (handles.fnumshow,'UserData');
    delete(get(handles.axes3,'Children'))
    xyz = variables.this_skeleton (valor_sl1);
    skelDraw3Dtiny (xyz,handles.axes3);
    
    valor_sl2 = get (handles.slider1,'Value');
    valor_sl2 = ceil(valor_sl2 + 1);
    variables2 = get (handles.fnumshow,'UserData');
    delete(get(handles.axes2,'Children'))
    xyz = variables2.this_skeleton (valor_sl2);
    skelDraw3Dtiny (xyz,handles.axes2);
    
    %xyz = variables.this_skeleton (1);
    %Image2draw = fullfile(Image_path, toDraw{1});
    %skelDraw3D (xyz,handles.axes1,Image2draw,handles.axes4);
    
end

% --- Executes on button press in playb.
function playb_Callback(hObject, eventdata, handles)
% hObject    handle to playb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiresume
global fila
global skeleton_path
global toDraw

colorSwt = 0;
fileview = [skeleton_path,'action_stamp.txt'];
if exist(fileview,'file')
    fid3 = fopen (fileview);
    tline = fgetl (fid3);
    if tline ~= -1
        colorSwt = 1;
        aux = 1;
        while ischar (tline)
            stamp_info{aux}  = textscan  (tline, '%d %d %d %d %d %d %s','delimiter','\n');
            aux = aux+1;
            tline = fgetl(fid3);
        end
        fclose (fid3);
        hasta = size (stamp_info,2);
        datos = {'Begin' 'End' 'TL' 'BL' 'TR' 'BR' 'Label'};
        B = {};
        for j = 1: hasta
            datos{j,1} = stamp_info {1,j}{1,1};
            datos{j,2} = stamp_info {1,j}{1,2};
            datos{j,3} = stamp_info {1,j}{1,3};
            datos{j,4} = stamp_info {1,j}{1,4};
            datos{j,5} = stamp_info {1,j}{1,5};
            datos{j,6} = stamp_info {1,j}{1,6};
            datos{j,7} = stamp_info {1,j}{1,7};
            B = [B;datos{j,:}];
        end
        
        set (handles.uitable1,'Data',B);
    end
end

variables = get (handles.fnumshow,'UserData');
set (handles.pauseb,'Visible','on','Enable','on');
set (handles.playb,'Enable','off','Visible','off');
set (handles.replayb,'Enable','off','Visible', 'on');
set (handles.replayb2,'Enable','off','visible','off');
set (handles.stopb,'Enable','on','visible','on');
playtime = str2double(get (handles.slider1_text,'String'));
playend = str2double(get (handles.slider2_text,'String'));

if playtime > playend
    temporal = playend;
    playend = playtime;
    playtime = temporal;
end
playspeed = 0.0003;
data.stop = false;
set (handles.axes1,'UserData',data)
keep_running = true;
%-----------------------------------------------------------------
if colorSwt == 1;
    numberOfStamps = numel(stamp_info);
    initialEndTime = []
    for i = 1:numberOfStamps
        Labels(i) = stamp_info{i}{7};
        initialEndTime = [initialEndTime ; stamp_info{i}{1} stamp_info{i}{2}];
    end
    [~,idx] = unique(Labels,'first');
    numberOfLabels = Labels(sort(idx));
    numberOfColors = numel(numberOfLabels);
    colorsToUse = uniqueColors(1,numberOfColors+1);
    initialEndTime = sort(unique(initialEndTime(:)'));
    for i = 1:numel(initialEndTime)-1
        constrainedColors = zeros(4,3);
        for j = 1:numberOfStamps
            bodyParts = [0 0 0 0];
            coloredBodyPart = zeros(4,3);
            if ((stamp_info{j}{1})>=initialEndTime(i))&&((stamp_info{j}{1})<initialEndTime(i+1))||...
                    ((stamp_info{j}{2})>initialEndTime(i))&&((stamp_info{j}{2})<=initialEndTime(i+1))||...
                    ((stamp_info{j}{1})<initialEndTime(i))&&((stamp_info{j}{2})>initialEndTime(i+1))
                bodyParts = double([(stamp_info{j}{3}) (stamp_info{j}{4}) (stamp_info{j}{5}) (stamp_info{j}{6})]);
                match = strmatch(stamp_info{j}{7},numberOfLabels);
                coloredBodyPart = bodyParts'*(colorsToUse(match(1)+1,:));
            end
            constrainedColors = (constrainedColors + coloredBodyPart);
        end
        idle = find(sum(constrainedColors') == 0);
        newIdle = repmat(colorsToUse(1,:),(numel(idle)),1);
        if ~isempty(idle)
            constrainedColors(idle,:) = constrainedColors(idle,:) + newIdle;
        end
        arrayOfColors{i} = constrainedColors;
    end
else
    arrayOfColors{1} = [1 0 0; 1 0 0; 1 0 0; 1 0 0];
    numberOfColors = 0;
    initialEndTime = 10000;
end
%----------------------------------------------------------------
set (handles.uipanel6,'Visible','off')
set (handles.text5,'string','idle','Visible','on');
set (handles.pushbutton19,'backgroundColor',[1 0 0],'Visible','on');
indexText = 5;
indexButton = 19;
if numberOfColors ~= 0
    for i = 1:numberOfColors
        textToUse = strcat('text',num2str(indexText+i));
        buttonToUse = strcat('pushbutton',num2str(indexButton+i));
        set (handles.(textToUse),'string',numberOfLabels(i),'Visible','on');
        set (handles.(buttonToUse),'backgroundColor',colorsToUse(i+1,:),'Visible','on');
    end
    if numberOfColors<9
        for i = numberOfColors+1:9
            textToUse = strcat('text',num2str(indexText+i));
            buttonToUse = strcat('pushbutton',num2str(indexButton+i));
            set (handles.(textToUse),'Visible','off');
            set (handles.(buttonToUse),'Visible','off');
        end
    end
else
    for i = 1:9
        textToUse = strcat('text',num2str(indexText+i));
        buttonToUse = strcat('pushbutton',num2str(indexButton+i));
        set (handles.(textToUse),'Visible','off');
        set (handles.(buttonToUse),'Visible','off');
    end
end
set (handles.uipanel6,'Visible','on')
%-----------------------------------------------------------------
while (playtime<=playend && keep_running)
    set (handles.fnumshow,'String',[num2str(playtime) '/' num2str(fila)])
    %tstart = tic;
    variables.currentime = playtime;
    delete(get(handles.axes1,'Children'))
    xyz = variables.this_skeleton (variables.currentime);
    Image_path = strcat(skeleton_path,'Color\');
    Images = toDraw{playtime};
    Image2draw = fullfile(Image_path, Images);
    colorIndex = playtime<=initialEndTime; 
    colorIndex = sum(colorIndex(:)==0);
    if colorIndex == 0
        colorIndex = 1;
    end
    frameColor = cell2mat(arrayOfColors(colorIndex));
    skelDraw3D (xyz,handles.axes1,Image2draw,handles.axes4,frameColor);
    data = get (handles.axes1,'UserData');
    if (data.stop == true)
        keep_running = false;
    end
    drawnow
    %pause (playspeed)
    playtime = playtime + 1;
    %toc (tstart)
end
variables.currentime = 1;
set (handles.pauseb,'Visible','on','Enable','off');
set (handles.playb,'Enable','on','Visible','on');
set (handles.replayb,'Enable','off','Visible', 'off');
set (handles.replayb2,'Enable','off','Visible', 'off');
set (handles.stopb,'Visible','on','Enable','off')

% --- Executes on button press in pauseb.
function pauseb_Callback(hObject, eventdata, handles)
% hObject    handle to pauseb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set (handles.pauseb,'Enable','off','visible','on');
set (handles.stopb,'Enable','on','visible','on');
set (handles.replayb2,'Enable','off','visible','off');
set (handles.replayb,'Enable','on','visible','on');
set (handles.playb,'Enable','off','visible','off');
uiwait;

% --- Executes on button press in stopb.
function stopb_Callback(hObject, eventdata, handles)
% hObject    handle to stopb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiresume
variables = get (handles.fnumshow,'UserData');
variables.currentime = 1;
set (handles.fnumshow,'UserData',variables);
delete(get(handles.axes1,'Children'))
set (handles.stopb,'Visible','on','Enable','off')
set (handles.pauseb,'Visible','on','Enable','off')
set (handles.playb,'Visible','off','Enable','off')
set (handles.replayb,'Visible','off','Enable','off')
set (handles.replayb2,'Visible','on','Enable','on')
data.stop = true;
set(handles.axes1,'UserData',data);


% --- Executes on button press in replayb.
function replayb_Callback(hObject, eventdata, handles)
% hObject    handle to replayb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiresume
set (handles.pauseb,'Visible','on','Enable','on');
set (handles.playb,'Enable','off','Visible','off');
set (handles.replayb,'Enable','off','Visible', 'on');
set (handles.replayb2,'Enable','off','visible','off')
set (handles.stopb,'Enable','on','visible','on');


% --- Executes on button press in slow_b.
function slow_b_Callback(hObject, eventdata, handles)
% hObject    handle to slow_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in normalb.
function normalb_Callback(hObject, eventdata, handles)
% hObject    handle to normalb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in replayb2.
function replayb2_Callback(hObject, eventdata, handles)
% hObject    handle to replayb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global currentime this_skeleton;
playb_Callback (hObject,eventdata,handles)


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
data.stop = true;
set(handles.axes1,'UserData',data);
valor = get (handles.slider1,'Value');
valor = ceil(valor + 1);
set (handles.slider1_text,'String',num2str(valor));
variables = get (handles.fnumshow,'UserData');
delete(get(handles.axes2,'Children'))
xyz = variables.this_skeleton (valor);
skelDraw3Dtiny (xyz,handles.axes2);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
data.stop = true;
set(handles.axes1,'UserData',data);
valor = get (handles.slider2,'Value');
valor = ceil(valor + 1);
set (handles.slider2_text,'String',num2str(valor));
variables = get (handles.fnumshow,'UserData');
delete(get(handles.axes3,'Children'))
xyz = variables.this_skeleton (valor);
skelDraw3Dtiny (xyz,handles.axes3);

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in label_edit.
function label_edit_Callback(hObject, eventdata, handles)
% hObject    handle to label_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
artic1=0;
artic2=0;
artic3=0;
artic4=0;
ruta = get (handles.video_location,'UserData');
fid = fopen ([ruta.path 'action_stamp.txt'],'at+');
value1 = str2double(get (handles.slider1_text,'String'));
value2 = str2double(get(handles.slider2_text,'String'));
if value1 > value2
    temporal = value1;
    value1 = value2;
    value2 = temporal;
end
actiontostamp = get (handles.popupmenu1,'UserData');
topleft=get(handles.checkbox1,'value');
bottomleft=get(handles.checkbox2,'value');
topright= get(handles.checkbox3,'value');
bottomright=get(handles.checkbox4,'value');
if topleft==1
    artic1=1;
end
if bottomleft==1
    artic2=1;
end
if topright==1
    artic3=1;
end
if bottomright==1
    artic4=1;
end
stamp_label = [value1 value2 artic1 artic2 artic3 artic4];
fprintf (fid,'%d %d %d %d %d %d %s\n',[stamp_label actiontostamp]);
fclose (fid);
fid2 = fopen ([ruta.path 'action_stamp.txt']);
tline = fgetl (fid2);
aux = 1;
while ischar (tline)
    stamp_info{aux}  = textscan  (tline, '%d %d %d %d %d %d %s','delimiter','\n')
    aux = aux+1;
    tline = fgetl(fid);
end
fclose (fid2);
hasta = size (stamp_info,2);
datos = {'Begin' 'End' 'TL' 'BL' 'TR' 'BR' 'Label'};
B = {};
for j = 1: hasta
    datos{j,1} = stamp_info {1,j}{1,1};
    datos{j,2} = stamp_info {1,j}{1,2};
    datos{j,3} = stamp_info {1,j}{1,3};
    datos{j,4} = stamp_info {1,j}{1,4};
    datos{j,5} = stamp_info {1,j}{1,5};
    datos{j,6} = stamp_info {1,j}{1,6};
    datos{j,7} = stamp_info {1,j}{1,7};
    B = [B;datos{j,:}];
end

set (handles.uitable1,'Data',B);


% --- Executes on button press in Delete_Label.
function Delete_Label_Callback(hObject, eventdata, handles)
% hObject    handle to Delete_Label (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fclose all;
ruta = get (handles.video_location,'UserData');
fullpath = [ruta.path 'action_stamp.txt'];
fid2 = fopen (fullpath,'r');
tline = fgetl (fid2);
aux = 1;
while ischar (tline)
    stamp_info{aux}  = textscan  (tline, '%d %d %d %d %d %d %s','delimiter','\n')
    aux = aux+1;
    tline = fgetl(fid2);
end
fclose (fid2);
fid2 = fopen (fullpath,'wt+');
for i = 1:numel(stamp_info)-1
    fprintf (fid2,'%d %d %d %d %d %d %s\n',...
        [stamp_info{i}{1} stamp_info{i}{2} stamp_info{i}{3} stamp_info{i}{4} stamp_info{i}{5}...
        stamp_info{i}{6} stamp_info{i}{7}{1}]);
end
fclose (fid2);
fid2 = fopen (fullpath);
tline = fgetl (fid2);
aux = 1;
while ischar (tline)
    stamp_info{aux}  = textscan  (tline, '%d %d %d %d %d %d %s','delimiter','\n')
    aux = aux+1;
    tline = fgetl(fid2);
end
fclose (fid2);
hasta = size (stamp_info,2);
datos = {'Begin' 'End' 'TL' 'BL' 'TR' 'BR' 'Label'};
B = {};
for j = 1: hasta-1
    datos{j,1} = stamp_info {1,j}{1,1};
    datos{j,2} = stamp_info {1,j}{1,2};
    datos{j,3} = stamp_info {1,j}{1,3};
    datos{j,4} = stamp_info {1,j}{1,4};
    datos{j,5} = stamp_info {1,j}{1,5};
    datos{j,6} = stamp_info {1,j}{1,6};
    datos{j,7} = stamp_info {1,j}{1,7};
    B = [B;datos{j,:}];
end
set (handles.uitable1,'Data',B);



% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
set (handles.label_edit,'Visible','off')
set (handles.Delete_Label,'visible','off')
value_popup = get (handles.popupmenu1,'Value');
action_stamp = stamp_action (value_popup);
set (handles.popupmenu1,'UserData',action_stamp);
if ischar (action_stamp)
    set (handles.label_edit,'Visible','on')
    set (handles.Delete_Label,'visible','on')
else
    errordlg ('Select a valid Action Stamp','Bad Stamp')
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
