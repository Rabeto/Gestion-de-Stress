from aiohttp import request
from django.forms import EmailField
from django.shortcuts import render,redirect
from .models import *


# Create your views here.
def login(request):
    return render(request,'login.html')

def index_admin(request):
    return render(request,'index_admin.html')

def manage_stress_admin(request):
    return render(request,'manage_stress_admin.html')

def ressources_admin(request):
    Src = Ressources.objects.all()
    context = {
        'Src' : Src, 
    }
    return render(request,'ressources_admin.html',context)

def add_ressource_admin(request):
    return render(request,'add_ressource_admin.html')

def edit_ressource_admin(request,id):
    Src = Ressources.objects.get(pk=id)
    context = {
        'Src' : Src
    }
    return render(request,'edit_ressource_admin.html',context)

def delete_ressource_admin(request,id):
    Src = Ressources.objects.get(pk=id)
    Src.delete()
    return redirect('/ressources_admin')

def create_ressource_admin(request):
    print(request.POST)
    Titre_R = request.GET['Titre_Ressource']
    Description_R = request.GET['Description_Ressource']
    Fichier_R = request.GET['Fichier_Ressource']
    create_R = Ressources(Titre_Ressource = Titre_R, Description_Ressource = Description_R, Fichier_Ressource = Fichier_R)
    create_R.save()
    return redirect('/ressources_admin')

def update_ressource_admin(request,id):
    update_R = Ressources.objects.get(pk=id)
    update_R.Titre_Ressource = request.GET['Titre_Ressource']
    update_R.Description_R = request.GET['Description_Ressource']
    update_R.Fichier_R = request.GET['Fichier_Ressource']
    update_R.save()
    return redirect('/ressources_admin')

def user_admin(request):
    Users = User.objects.all
    context = {
        'Users' : Users,
    }
    return render(request,'user_admin.html',context)

def add_user_admin(request):
    return render(request,'add_user_admin.html')

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

def edit_user_admin(request, id):
    Users_e = User.objects.get(pk=id)
    context = {
        'Users_e' : Users_e,
    }
    return render(request,'edit_user_admin.html',context)

def update_user_admin(request, id):
    create_user_edit = User.objects.get(pk=id)
    create_user_edit.Nom_Complet = request.GET['Nom_Complet']
    create_user_edit.Email = request.GET['Email']
    create_user_edit.Adresse = request.GET['Adresse']
    create_user_edit.Profession = request.GET['Profession']
    create_user_edit.Status = request.GET['Status']
    create_user_edit.save()
    return redirect('/user_admin')

def delete_user_admin(request,id):
    Users = User.objects.get(pk=id)
    Users.delete()
    return redirect('/user_admin')


def news_post_admin(request):
    News_Posts = News_Post.objects.all()
    context = {
        'News_Posts' : News_Posts,
    }
    return render(request,'news_post.html',context)

def add_news_post_admin(request):
    return render(request,'add_news_post.html')

def create_news_post_admin(request):
    titre = request.GET['Titre']
    contenu = request.GET['Contenu']
    type = request.GET['Type']
    fichier = request.GET['Fichier']
    create_np = News_Post(Titre = titre, Contenu = contenu, Type = type, Fichier = fichier)
    create_np.save()
    return redirect('/news_post_admin')

def news_edit(f):
    if f == "":
        d = "aucun fichier"
    else:
        d = f
    return d

def edit_news_post_admin(request, id):
    NP = News_Post.objects.get(pk=id)
    data = news_edit(NP.Fichier)
    context = {
        'NP' : NP,
        'data' : data,
    }
    return render(request,'edit_news_post.html',context)

def update_news_post_admin(request, id):
    update_NP = News_Post.objects.get(pk=id)
    update_NP.Titre = request.GET['Titre']
    update_NP.Contenu = request.GET['Contenu']
    update_NP.Type = request.GET['Type']
    update_NP.Fichier = request.GET['Fichier']
    update_NP.save()
    return redirect('/news_post_admin')

def delete_news_post_admin(request, id):
    delete_NP = News_Post.objects.get(pk=id)
    delete_NP.delete()
    return redirect('/news_post_admin')
