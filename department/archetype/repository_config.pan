template archetype/repository_config;

include 'pan/functions';

# Process repository list and actually add repositories
'/software/repositories' = add_repositories(OS_REPOSITORY_LIST);
