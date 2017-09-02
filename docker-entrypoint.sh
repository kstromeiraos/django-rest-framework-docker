#!/bin/sh

if [ ! -f "/app/manage.py" ]
then    
	if [ -z ${project} ]    
	then        
		echo "Please, provide a project name using -e project=DJANGO_PROJECT_NAME or mount a volume for with code using -v DJANGO_PROJECT:/app or "        
		exit 1    
	else        
		echo "Creating Django project (Project name: ${project})"        
		django-admin.py startproject ${project} /
		mv /${project} /manage.py /app
	fi
fi

exec python3 manage.py "$@"