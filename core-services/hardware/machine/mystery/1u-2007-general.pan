structure template hardware/machine/mystery/1u-2007-general;

'model' = '1u-2007-general';
'manufacturer' = 'mystery';
'vendor' = 'mystery';
'type' = 'service';

'cards/bmc' = list(
    dict('manufacturer', 'intel'),
);

'cards/raid/_1' = dict(
    'manufacturer', '3ware',
    'name', 'StorSwitch',
    'model', '9550SXU-4LP',
    'bus', 'PCIe',
    'bbu', false,
    'numberports', 4,
    'cache', 112 * MB,
    'ports', dict(
        'sda', create('hardware/harddisk/generic/sata', 'capacity', 152566 * MB, 'boot', true),
    ),
);

'harddisks' = dict(
    'sda', value('cards/raid/_1/ports/sda'),
);
