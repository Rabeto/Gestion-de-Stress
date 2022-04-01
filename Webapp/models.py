from django.db import models
from sqlalchemy import false

# Create your models here.
class User(models.Model):
    Nom_Complet = models.CharField(max_length=150)
    Email = models.EmailField(null=false)
    Adresse = models.CharField(max_length=150)
    Profession = models.CharField(max_length=60)
    Status = models.CharField(max_length=20)
    
class Ressources(models.Model):
    Titre_Ressource = models.CharField(max_length=50)
    Description_Ressource = models.CharField(max_length=255)
    Fichier_Ressource = models.FileField()
    Image_Ressource = models.ImageField()
    Date_pub_ressource = models.DateField()
    
class Message(models.Model):
    User_send = models.CharField(max_length=50)
    User_received = models.CharField(max_length=50)
    Date_send_msg = models.DateTimeField()
    Content_msg = models.CharField(max_length=255)
    
class Manage_Stress(models.Model):
    Titre_MS = models.CharField(max_length=50)
    Description = models.CharField(max_length=255)
    Date_pub_MS = models.DateField()
    Image_MS = models.ImageField()
    Fichier_MS = models.FileField()
    
class News_Post(models.Model):
    Titre = models.CharField(max_length=50)
    Contenu = models.CharField(max_length=255)
    Date_pub = models.DateField()
    Type = models.CharField(max_length=5)
    Fichier = models.FileField()