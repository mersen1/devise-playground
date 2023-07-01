Rails.application.config.session_store(:redis_store,
                                       url: 'redis://localhost:6379/0/sessions',
                                       secure: Rails.env.production?,
                                       expire_after: 1.hour, # Session expiration time
                                       key: '_devise-playground_session' # Session key
)
