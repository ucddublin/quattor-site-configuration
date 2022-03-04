unique template common/versions/gcc;

final variable GCC_VERSION_OS_MAP = dict(
    '7x', dict(
        'default', '4.8.5',
        'gcc8', '8.3.1',
        'gcc9', '9.1.1',
    ),

    '8x', dict(
        'default', '8.5.0',
        'gcc8', '8.5.0',
        'gcc9', undef,
    ),
);
