# Collaboration on Code Exercise

## 1. Create a Docker Container
Fill out the provided Dockerfile Template to create a Docker Container
Hint: Create the Docker container with `docker build -t <name:tag> .`
## 2. Run the Container
Run the Container that you build in Step 1.
Hint: Remember to map the Exposed Port with the `-p <localport>:<remoteport>`
## 3. Test the Endpoint
Test that you could access the following two endpoints of the Application.
- /greeting
- /greeting/\<text\>

For this you could use your Browser or run the following command:

`curl localhost:<port>/greeting` 

`curl localhost:<port>/greeting/<name>`

## 4. Create a CI/CD Pipeline
Fill out the provided `.gitlab-ci.yml` file to provide a CI/CD Testpipeline for the Application.

## 5. Test the created Image
Test that the Container was successfully put to the Gitlab Docker Registry

## (Optional) 6. Create a new Endpoint 
Create an additional Endpoint `/square/<number>` which returns the square of the given number by following these steps:
1. Create a test `test_square_of_4_returns_16(self)`
2. Check that the test pass by running `python -m unittest -v`
3. Commit your changes
4. Push the Changes to the repository
5. Check the output of the CI/CD Pipeline
6. Test the Endpoint with the Container created from the CI/CD Pipeline