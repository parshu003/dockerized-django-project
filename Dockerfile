FROM python:3.11-slim

# set working directory
WORKDIR /app

# install system dependencies
RUN apt-get update && apt-get install -y gcc libpq-dev && rm -rf /var/lib/apt/lists/*

# copy requirements
COPY requirements.txt .


# install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# copy project
COPY . .

# expose port
EXPOSE 8000

# start app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
