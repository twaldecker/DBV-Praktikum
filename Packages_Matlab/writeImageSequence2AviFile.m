function writeImageSequence2AviFile( iseq, fname, cmap, compr, fps, quality )
%imageSequence2AviFile writes an image sequence to an AVI-File
%
% Arguments:
%   iseq      : image sequence according to readImageSequence
%   fname     : AVI-Filename
%   cmap      : arg to colormap() (optional), examples: ['default', gray(256)]
%   compr     : arg to avifile() (optional), examples: ['None', 'Cinepak']
%   fps       : frames per sec.  (optional)
%   quality   : quality in compression (optional)
%
% Default-Arguments:
%   cmap = colormap
%   compr = 'Cinepak'
%   fps = 1;
%   quality = 100;
%
% Attention:
%   1) the size of the frames captured is limited to the maximal size of an image 
%   displayable on the respective screen that is used.
%   2) the matlab window must not be hidden during capturing.
% 
%   Copyright 2004 ClS 
%   $Revision: 1.0 $  $Date: 2004/09/07 $

if nargin <= 0 | nargin >= 7
  error( 'writeImageSequence2AviFile(): two to six arguments needed' )
elseif ndims( iseq ) ~= 3  &  ndims( iseq ) ~= 4          %Grau- oder Farbbild
  error( 'writeImageSequence2AviFile(): wrong image class' )
end

if nargin < 6,  quality = 100;      end
if nargin < 5,  fps = 1      ;      end
if nargin < 4,  compr = 'Cinepak';  end
if nargin < 3,  cmap = colormap;   end

try,
  aviobj = avifile( fname, 'colormap', cmap, 'compression', compr, ...
                    'fps', fps, 'quality', quality );
catch,
  error( 'writeImageSequence2AviFile(): error opening the avifile' )
end

try,
  for t = 1:size(iseq,1)
    b = getImOfSeq(iseq,t);
    h = imshow( b, cmap );
    set( h, 'EraseMode', 'xor' );
    frame = getframe( gca );
    aviobj = addframe( aviobj, frame );
  end,
catch,
  aviobj = close( aviobj );
  error( 'writeImageSequence2AviFile(): error while writing in avifile' )
end

aviobj = close( aviobj );
