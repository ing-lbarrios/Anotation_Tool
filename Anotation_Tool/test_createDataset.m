clear all; close all; fclose all; clc
%==========================================================================
%ReadDataset>>getDataset>>dirFolder => Crea una lista de la ruta de todos
%los videos.
%datos2angulos => convierte todos los videos a una matriz de ángulos
%==========================================================================
tic
dLocation = getVideoFolderdir; %Obiene la ruta del Dataset
lista_acciones = dirFolder (dLocation); %Crea una lista de las carpetas del dataset
[m,~] = size (lista_acciones);

%Convert to Cell list of actors and apply strtrim
actions = cell (m,1);
for i = 1: m
    actions{i} = strtrim (lista_acciones(i,:));
end

%la mejor forma es leer cada carpeta a ver si poseen los mismos actores
miData = strcat(dLocation,filesep,lista_acciones(1,:)); %Una accion al azar
%ya que todas las acciones fueron grabadaspara todos los actores
lista_actores = dirFolder (miData); %encuentra la lista de actores
[n,~] = size (lista_actores); %numero de actores

actors = cell (n,1);
for j = 1:n
    actors{j} = strtrim (lista_actores(j,:));
end
%==========================================================================
disp ('DataSet Scan is in progress...')
S = struct ('dirname',{},'action',{},'actor',{},'DataSet',dLocation);
no_info = struct ('action',{},'actor',{});
aux = 1;
acu = 0;
tscan =tic;
for i = 1: m
    for j = 1:n
        %Ruta de cada actor dentro del Dataset
        miData = strcat(dLocation,filesep,actions{i},filesep,actors{j});
        %Videos grabados para cada acción por actor
        lista_grabado = dirFolder (miData);
        o = size(lista_grabado,1); %cuantos archivos contiene
        if (o > 0)
            %ESTE FOR RECORRE LAS CARPETAS INTERIORES Y LAS ALMACENA
            for kl = 1 : o
                
                S (aux).dirname = strtrim(lista_grabado (kl,:));
                S (aux).actor = actors{j};
                S (aux).action = actions{i};
                S (aux).DataSet = dLocation;
                
                aux = aux + 1;
            end
        else
            acu = acu + 1;
            no_info (acu).actor = actors{j};
            no_info (acu).action = actions{i};
        end
    end
end
toc (tscan)
%=========================Copy Dataset=====================================
if ~exist('DataSet_Skel','dir')
    mkdir ('DataSet_Skel');
end
total_videos = size (S,2);

original_Datas = [S(1).DataSet,filesep];
copy_Datas = ['DataSet_Skel',filesep];
tcreate = tic;
how_much_videos = 0;
no_stamp_info = struct ('action',{},'actor',{},'dirname',{});
for i = 1:total_videos
    tbucle = tic;
    dir_path = [S(i).action,filesep,S(i).actor,filesep,S(i).dirname];
    mkdir ('DataSet_Skel',dir_path);
    dir_original = [original_Datas,dir_path,filesep];
    dir_copy = [copy_Datas,dir_path,filesep];
    copyfile ([dir_original,'Esqueleto.csv'],dir_copy)
    action_stamp_file = [dir_original,'action_stamp.txt'];
    if exist (action_stamp_file,'file')
        copyfile (action_stamp_file,dir_copy)
    else
        how_much_videos = how_much_videos + 1;
        no_stamp_info(how_much_videos).action = S(i).action;
        no_stamp_info(how_much_videos).actor = S(i).actor;
        no_stamp_info(how_much_videos).dirname = S(i).dirname;
    end
    toc (tbucle)
end
toc (tcreate)
