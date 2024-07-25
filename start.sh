# npm run start:prod > app.log 2>&1 &
# APP_PID=$!
# echo "Application started with PID $APP_PID"

# # Monitor the log file
# tail -f app.log &

# # Wait for the application to run for a specified time
# sleep 40

# curl --retry 5 --retry-delay 5 --max-time 10 http://localhost:3000/health || exit 1


# kill $APP_PID
# echo "Application terminated."



npm run start:prod > app.log 2>&1 &
APP_PID=$!
echo $APP_PID
echo "Application started with PID $APP_PID"
sleep 30 # Wait for the application to start
tail -f app.log &
# Check application status with curl
if curl --retry 5 --retry-delay 5 --max-time 10 http://localhost:3000/health; then
    echo "Application is up and running."
else
    echo "Application failed to start. Logs:"
    cat app.log
    echo "Exiting workflow due to application failure."
    kill $APP_PID
    exit 1
fi

# Optionally, terminate the application after the check
kill $APP_PID
echo "Application terminated."