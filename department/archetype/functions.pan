unique template archetype/functions;

function max = {
    a = to_long(ARGV[0]);
    b = to_long(ARGV[1]);
    if (a >= b) {
        a;
    }
    else {
        b;
    }
};

function min = {
    a = to_long(ARGV[0]);
    b = to_long(ARGV[1]);
    if (a <= b) {
        a;
    }
    else {
        b;
    }
};

function zip = {
    a = ARGV[0];
    b = ARGV[1];
    result = list();
    if (is_list(a) && is_list(b)) {
        if (length(a) == length(b)) {
            for (i = 0; i < length(a); i = i + 1) {
                result[i] = list(a[i], b[i]);
            };
        }
        else {
            error('both lists provides to zip must be of equal size');
        };
    }
    else {
        error('zip takes two lists as arguments');
    };
    result;
};

function zip_dict = {
    result = dict();
    zipped = zip(ARGV[0], ARGV[1]);
    foreach (i; v; zipped) {
        result[v[0]] = v[1];
    };
    result;
};

function filter_hosts_by_personality = {
    hosts = ARGV[0];
    personality = ARGV[1];
    result = list();
    if (is_list(hosts)) {
        if (is_string(personality)) {
            foreach (i; v; hosts) {
                p = if (path_exists(format('%s:/system/personality/name', v))) {
                    value(format('%s:/system/personality/name', v))
                }
                else {
                    '';
                };
                if (p == personality) {
                    result = append(SELF, v);
                };
            };
        }
        else {
            error('The second argument to filter_hosts_by_personality must be the name of a personality');
        };
    }
    else {
        error('The first argument to filter_hosts_by_personality must be a list of hostnames');
    };
    result;
};

function get_ips_from_host_profiles = {
    hosts = ARGV[0];
    result = dict();
    if (is_list(hosts)) {
        foreach (i; v; hosts) {
            result[v] = value(format('%s:/system/network/primary_ip', v));
        };
    }
    else {
        error('The first argument to filter_hosts_by_personality must be a list of hostnames');
    };
    result;
};
