structure template hardware/machine/raspberry-pi/4b-4gb;

'model' = '4b-4gb';
'manufacturer' = 'raspberry-pi';
'vendor' = 'farnell';
'type' = 'service';

'harddisks' = dict(
    'mmcblk0', create('hardware/harddisk/generic/sdcard', 'capacity', 29664 * MB, 'boot', true),
);
