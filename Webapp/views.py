from django.forms import EmailField
from django.shortcuts import render,redirect
from .models import *

# Create your views here.
def index_admin(request):
    return render(request,'index_admin.html')

def user_admin(request):
    Users = User.objects.all
    
    context = {
        'Users' : Users,
    }
    return render(request,'user_admin.html',context)

def manage_stress_admin(request):
    return render(request,'manage_stress_admin.html')

def news_post_admin(request):
    return render(request,'news_post.html')

def ressources_admin(request):
    return render(request,'ressources_admin.html')

def login(request):
    return render(request,'login.html')

def create_user_admin(request):
    print(request.POST)
    nom_Complet = request.GET['Nom_Complet']
    email = request.GET['Email']
    adresse = request.GET['Adresse']
    profession = request.GET['Profession']
    status = request.GET['Status']
    create_user = User(Nom_Complet = nom_Complet,Email = email, Adresse = adresse, Profession = profession, Status = status)
    create_user.save()
    return redirect('/user_admin')