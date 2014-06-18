function [ milista ] = dirFolder( miData )
%   dirFolder Crea una lista de los archivos de una carpeta
%   Esta funci�n toma como parametro un string que debe ser un folder y
%   genera una lista de los archivos que contiene.
if exist(miData,'file')==0 || isdir(miData)==0
    error('FOLDER DOES NOT EXIST! CHECK FOLDER PATH AND FOLDER NAME!');
else
    s = dir (miData);
    milistatemp = char(s.name);
    milista = milistatemp(3:end,:);
end
end

