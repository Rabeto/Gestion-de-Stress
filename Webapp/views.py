from aiohttp import request
from django import urls
from django.forms import EmailField
from django.shortcuts import render,redirect
from .models import *

# Create your views here.
def login(request):
    return render(request,'login.html')

def index_app(request):
    return render(request,'index_app.html')

def index_admin(request):
    user_S = User.objects.filter(Status = "Utilisateur Simple").count()
    user_P = User.objects.filter(Status = "Psychologue").count()
    nbr_MS = Manage_Stress.objects.count()
    nbr_RS = Ressources.objects.count()
    nbr_NP = News_Post.objects.count()
    context = {
        'user_S' : user_S,
        'user_P' : user_P,
        'nbr_MS' : nbr_MS,
        'nbr_RS' : nbr_RS,
        'nbr_NP': nbr_NP,
    }
    return render(request,'index_admin.html',context)


def manage_stress_admin(request):
    MS = Manage_Stress.objects.all()
    context = {
        'MS' : MS,
    }
    return render(request,'manage_stress_admin.html',context)

def add_manage_stress_admin(request):
    return render(request,'add_manage_stress_admin.html')

def edit_manage_stress_admin(request,id):
    MS = Manage_Stress.objects.get(pk=id)
    context = {
        'MS' : MS,
    }
    return render(request,'edit_manage_stress_admin.html',context)

def delete_manage_stress_admin(request,id):
    MS = Manage_Stress.objects.get(pk=id)
    MS.delete()
    return redirect('/manage_stress_admin')

def create_manage_stress_admin(request):
    print(request.POST)
    titre_MS = request.POST['Titre_MS']
    description_MS = request.POST['Description_MS']
    fichier_MS = request.FILES.get('Fichier_MS')
    create_MS = Manage_Stress(Titre_MS = titre_MS, Description_MS = description_MS, Fichier_MS = fichier_MS)
    create_MS.save()
    return redirect('/manage_stress_admin')

def update_manage_stress_admin(request,id):
    update_MS = Manage_Stress.objects.get(pk=id)
    update_MS.Titre_MS = request.GET['Titre_MS']
    update_MS.Description_MS = request.GET['Description_MS']
    update_MS.Fichier_MS = request.FILES.get('Fichier_MS')
    update_MS.save()
    return redirect('/manage_stress_admin')
    

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
    #print(request.POST)
    Titre_R = request.POST['Titre_Ressource']
    Description_R = request.POST['Description_Ressource']
    Fichier_R = request.FILES.get('Fichier_Ressource')
    create_R = Ressources(Titre_Ressource = Titre_R, Description_Ressource = Description_R, Fichier_Ressource = Fichier_R)
    create_R.save()
    return redirect('/ressources_admin')

def update_ressource_admin(request,id):
    update_R = Ressources.objects.get(pk=id)
    update_R.Titre_Ressource = request.GET['Titre_Ressource']
    update_R.Description_R = request.GET['Description_Ressource']
    update_R.Fichier_R = request.FILES.get('Fichier_Ressource')
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
    #print(request.POST, request.FILES)
    titre = request.POST['Titre']
    contenu = request.POST['Contenu']
    type = request.POST['Type']
    fichier = request.FILES.get('Fichier')
    create_np = News_Post(Titre = titre, Contenu = contenu, Type = type, Fichier = fichier)
    create_np.save()
        
    return redirect('/news_post_admin')

def edit_news_post_admin(request, id):
    NP = News_Post.objects.get(pk=id)
    context = {
        'NP' : NP,
    }
    return render(request,'edit_news_post.html',context)

def update_news_post_admin(request, id):
    update_NP = News_Post.objects.get(pk=id)
    update_NP.Titre = request.GET['Titre']
    update_NP.Contenu = request.GET['Contenu']
    update_NP.Type = request.GET['Type']
    update_NP.Fichier = request.FILES.get('Fichier')
    update_NP.save()
    return redirect('/news_post_admin')

def delete_news_post_admin(request, id):
    delete_NP = News_Post.objects.get(pk=id)
    delete_NP.delete()
    return redirect('/news_post_admin')
