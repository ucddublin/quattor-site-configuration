structure template hardware/card/gpu/nvidia/geforce_gtx1060;

'manufacturer' = 'nvidia';
'name' = 'geforce_gtx1060';
'model' = 'GP106';
'power' = 120; # TDP in watts
'bus' = 'PCIe';
'type' = 'pascal'; # Nvidia codename
'version' = '6.1'; # CUDA streaming multiprocessor and compute capability x10

'ram/size' = 6144; # MB
'ram/bus' = '192-bit';
'ram/type' = 'GDDR5';

'pci/class' = 0x030000; # Display controller, VGA compatible controller.
'pci/vendor' = 0x10de; # nVidia Corporation
'pci/device' = 0x1c03;
