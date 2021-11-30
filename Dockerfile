# Select a proper base image to run the python application
FROM python:3.8-slim

# Create a user to run the application on that user
RUN useradd exercise

# Switch to the Home Directory of the User
WORKDIR /home/exercise

# Copy the Requirements File
COPY requirements.txt requirements.txt
# Create a python virtual environment
RUN python -m venv venv
# Upgrade Pip
RUN venv/bin/pip install pip --upgrade
# Install the requirements from the Requirements File
RUN venv/bin/pip install -r requirements.txt

# Copy the app folder
COPY app app
# Copy the Exercise.py and boot.sh
COPY Exercise.py boot.sh ./
RUN chmod +x boot.sh

RUN chown -R exercise:exercise ./

# Switch to the User
USER exercise

# Expose the Flask Port 5000
EXPOSE 5000

# Add the Entrypoint to run the boot.sh script
ENTRYPOINT [ "./boot.sh" ]