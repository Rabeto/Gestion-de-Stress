from pyexpat import model
import uuid
from django.db import models

# Create your models here.
class Utilisateur(models.Model):
    Nom_Complet = models.CharField(max_length=150, default="user")
    Image_profil = models.ImageField()
    Age = models.IntegerField(null=True)
    Email = models.EmailField()
    Departement = models.CharField(max_length=50)
    Profession = models.CharField(max_length=50)
    Username = models.CharField(max_length=50, unique=True)
    Password = models.CharField(max_length=50)
    Status = models.CharField(max_length=20)
    
class Commentaires(models.Model):
    Titre_pub = models.CharField(max_length=150)
    Auteur_Comment_pub = models.ForeignKey(Utilisateur, on_delete=models.CASCADE)
    Comment_pub = models.TextField(max_length=255)
    Date_Comment_pub = models.DateTimeField(auto_now=True)
    
    
class Ressources(models.Model):
    Titre_Ressource = models.CharField(max_length=50)
    Description_Ressource = models.TextField(max_length=255)
    Fichier_Ressource = models.FileField()
    Date_pub_Ressource = models.DateTimeField(auto_now=True)

class Message(models.Model):
    User_send = models.CharField(max_length=50)
    User_received = models.CharField(max_length=50)
    Date_send_msg = models.DateTimeField(auto_now=True)
    Content_msg = models.CharField(max_length=255)
    
class Manage_Stress(models.Model):
    Titre_MS = models.CharField(max_length=50)
    Description_MS = models.TextField(max_length=255)
    Date_pub_MS = models.DateTimeField(auto_now=True)
    Fichier_MS = models.FileField()
    
class News_Post(models.Model):
    Titre = models.CharField(max_length=50)
    Contenu = models.TextField(max_length=255)
    Date_pub = models.DateTimeField(auto_now=True)
    Type = models.CharField(max_length=5)
    Fichier = models.ImageField()
    Auteur_pub = models.ForeignKey(Utilisateur, on_delete=models.CASCADE)

    