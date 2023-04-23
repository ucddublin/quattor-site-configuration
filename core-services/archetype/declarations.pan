declaration template archetype/declarations;

final variable ARCHETYPE = 'core-services';

final variable QUATTOR_RELEASE = '21.12.0';

variable LOADPATH = prepend(SELF, format('template-library/%s/core', QUATTOR_RELEASE));
variable LOADPATH = prepend(SELF, format('template-library/%s/standard', QUATTOR_RELEASE));
variable LOADPATH = prepend(SELF, format('%s/core', ARCHETYPE));
variable LOADPATH = prepend(SELF, format('%s/standard', ARCHETYPE));
