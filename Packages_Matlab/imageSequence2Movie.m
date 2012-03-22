function M = imageSequence2Movie( iseq, cmap )
%imageSequence2Movie converts an image sequence to a movie
%
% Arguments:
%   iseq      : image sequence according to readImageSequence()
%   cmap      : arg to colormap() (optional), examples: ['default', gray(256)]
%               used only for indexed images
%
% Default-Arguments:
%   cmap      : colormap;
%
% Attention:
%   1) the size of the frames captured is limited to the maximal size of an image 
%   displayable on the respective screen that is used.
%   2) the matlab window must not be hidden during capturing.
% 
%   Copyright 2004 ClS 
%   $Revision: 1.0 $  $Date: 2004/09/07 $

if nargin > 2
  error( 'imageSequence2Movie(): one or two arguments needed' )
elseif ndims( iseq ) ~= 3  &  ndims( iseq ) ~= 4          %Grau- oder Farbbild
  error( 'imageSequence2Movie(): no images in iseq' )
end

if nargin < 2
  cmap = colormap;
end

for t = 1:size(iseq,1)
  b = getImOfSeq(iseq,t);
  imshow( b, cmap );
  M(t) = getframe();
end
