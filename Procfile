web: bundle exec puma -t ${MAX_THREADS:-4}:${MAX_THREADS:-4} -p ${PORT:-3000} -e ${RACK_ENV:-development}
worker: bundle exec sidekiq -e ${RACK_ENV:-development} -q default -q mailers
