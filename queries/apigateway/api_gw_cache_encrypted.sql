select
    *
from
    api_gateway_method_settings
where
    stage_caching_enabled is true
    or (
        caching_enabled is true
        and cache_data_encrypted is not true
    );
