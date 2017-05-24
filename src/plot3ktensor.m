function [  ] = plot3ktensor (xvector, inputTensor, dimOut, nOut )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


%     ndim = size(inputTensor);
%     figure
%     hold on
%     for i=1:nOut
%        iOut = floor( i/nOut*ndim(3) );
%        h_t(i) = pcolor (xvector{1},xvector{2}, inputTensor(:,:,iOut)');
%        set(h_t(i), 'EdgeColor', 'none');
%        set(h_t(i),'ZData',i*ones(ndim(2),ndim(1)))
%        set(h_t(i),'FaceAlpha',0.1)
%     end
%     colorbar
    

    ndim = size(inputTensor);
    f= figure
    h_t = pcolor (xvector{1},xvector{2}, inputTensor(:,:,1)');
    set(h_t, 'EdgeColor', 'none');
    axis ([0,25,0,25,0,nOut])
    view([-37.5 -30])
    caxis([0 0.020])
    colorbar
    
    callbackSliderAA = @(source,event) callbackSlider(source,event,h_t,ndim);
    
    b = uicontrol('Parent',f,'Style','slider','Position',[81,54,419,23],...
              'value',ndim(3)/2, 'min',0, 'max',nOut, 'Callback', callbackSliderAA);
          
    %b.Callback = @(es,ed) set(h_t, 'CData' ,inputTensor(:,:,floor( es.value/nOut*ndim(3) ))'); 
%     for i=1:nOut
%        iOut = floor( i/nOut*ndim(3) );
%        iOut
%        set(h_t, 'CData' ,  inputTensor(:,:,iOut)' );
%        
%        set(h_t,'ZData',i*ones(ndim(2),ndim(1)))
%        %set(h_t,'FaceAlpha',0.1)
%        drawnow;
%        pause(1.0/30.0);
%     end
     
    function callbackSlider(source,event,h_t,ndim)
        val = source.Value;
        iOut = floor( val/nOut*ndim(3) );
        set(h_t, 'CData' ,  inputTensor(:,:,iOut)' );
        set(h_t,'ZData',val*ones(ndim(2),ndim(1)))
    end
        
        
    

end

