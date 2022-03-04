structure template hardware/card/gpu/nvidia/tesla_p40;

'manufacturer' = 'nvidia';
'name' = 'tesla_p40';
'model' = 'GP102';
'power' = 250; # TDP in watts
'bus' = 'PCIe';
'type' = 'pascal'; # Nvidia codename
'version' = '61'; # CUDA streaming multiprocessor and compute capability x10

'ram/size' = 24576; # MB
'ram/bus' = '384-bit';
'ram/type' = 'GDDR5';

'pci/class' = 0x0302; # Display controller, 3D controller.
'pci/vendor' = 0x10de; # nVidia Corporation
'pci/device' = 0x1b38;
