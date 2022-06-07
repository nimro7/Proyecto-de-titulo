from rest_framework.views import APIView
from rest_framework.response import Response
from django.contrib.auth.models import User

from .helpers import *
from django.contrib.auth import authenticate , login

class LoginView(APIView):
    
    def post(self , request):
        response = {}
        response['status'] = 500
        response['message'] = 'Algo salio mal'
        try:
            data = request.data
            
            if data.get('username') is None:
                response['message'] = 'key username not found'
                raise Exception('key username not found')
            
            if data.get('password') is None:
                response['message'] = 'key password not found'
                raise Exception('key password not found')
            
            
            check_user = User.objects.filter(username = data.get('username')).first()
            
            if check_user is None:
                response['message'] = 'Nombre de usuario invalido'
                raise Exception('Nombre de usuario invalido')
                
            
            user_obj = authenticate(username = data.get('username') , password = data.get('password'))
            if user_obj:
                login(request, user_obj)
                response['status'] = 200
                response['message'] = 'Welcome'
            else:
                response['message'] = 'Contraseña incorrecta'
                raise Exception('Contraseña incorrecta')
                
            
        except Exception as e :
            print(e)
            
        return Response(response)
            
                
    
    
LoginView = LoginView.as_view()


class RegisterView(APIView):
    
    def post(self , request):
        response = {}
        response['status'] = 500
        response['message'] = 'Algo salio mal'
        try:
            data = request.data
            
            if data.get('username') is None:
                response['message'] = 'key username not found'
                raise Exception('key username not found')
            
            if data.get('password') is None:
                response['message'] = 'key password not found'
                raise Exception('key password not found')
            
            
            check_user = User.objects.filter(username = data.get('username')).first()
            
            if check_user:
                response['message'] = 'Nombre de usuario ya existente, elija otro'
                raise Exception('Nombre de usuario ya existente, elija otro')
                
            
            user_obj = User.objects.create(username = data.get('username'))
            user_obj.set_password(data.get('password'))
            user_obj.save()
            response['message'] = 'Usuario creado'
            response['status'] = 200
            if user_obj:
                
                response['status'] = 200
                response['message'] = 'Usuario creado'
            else:
                response['message'] = 'invalid password'
                raise Exception('invalid password')
                
            
        except Exception as e :
            print(e)
            
        return Response(response)
            
                
    
    
RegisterView = RegisterView.as_view()