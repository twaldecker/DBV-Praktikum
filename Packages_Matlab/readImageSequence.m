function iseq = readImageSequence( filenames, path )
% readImageSequence reads multiple images and returns an image sequence
% returns
%   iseq(t,y,x) for a gray-valued image   or
%   iseq(t,y,x,colour) for a RGB-image
%
%   accessing the first image: 
%       gray-valued image: squeeze( iseq(1,:,:) )   or getImOfSeq( iseq, 1 )
%       RGB-image:         squeeze( iseq(1,:,:,:) ) or getImOfSeq( iseq, 1 )
%
% Arguments:
%   filenames : array of strings
%   path      : path incl. appending '/' (optional)
%
% Default-Arguments:
%   path = ''
%
% Example:
%   iseq = readImageSequence( ls('../Bildfolgen/motion*.tiff'), '../Bildfolgen/' )
%
%   Copyright 2004 ClS 
%   $Revision: 1.0 $  $Date: 20040907 $

sifi = size( filenames ); sifi = sifi(1);
  
if nargin <= 0 & nargin >= 3
    error( 'readImageSequence(): one or two arguments needed' )
elseif ndims( filenames ) ~= 2
    error( 'readImageSequence(): filenames must be a list of strings' )
elseif sifi(1) == 0
    error( 'readImageSequence(): filenames must not be empty' )
elseif ~isstr( filenames(1,:) )
    error( 'readImageSequence(): filenames must be a list of strings' )
end

if nargin == 1
    path = '';
end

iseq = imread( [path, filenames(1,:)] );           % iseq still single image
switch ndims(iseq)
    case 2, rgb = false;,
    case 3, rgb = true;,
    otherwise error( 'readImageSequence(): image class not supported' )
end
        
for i = 2:sifi
    pathfile = [path, filenames(i,:)];
    if ~rgb, iseq(:,:,i) = imread( pathfile );     % extending iseq
    else iseq(:,:,:,i) = imread( pathfile );
    end
end
if ~rgb, iseq = shiftdim( iseq, 2 );
else iseq = shiftdim( iseq, 3 );
end
