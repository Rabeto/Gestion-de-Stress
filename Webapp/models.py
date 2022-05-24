from django.db import models

# Create your models here.
class Utilisateur(models.Model):
    Nom = models.CharField(max_length=50)
    Prenom = models.CharField(max_length=50)
    Age = models.IntegerField(null=True)
    Email = models.EmailField()
    Departement = models.CharField(max_length=50)
    Profession = models.CharField(max_length=50)
    Username = models.CharField(max_length=50)
    Password = models.CharField(max_length=50)
    Status = models.CharField(max_length=20)
    
class Ressources(models.Model):
    Titre_Ressource = models.CharField(max_length=50)
    Description_Ressource = models.CharField(max_length=255)
    Fichier_Ressource = models.FileField()
    Date_pub_Ressource = models.DateTimeField(auto_now=True)

class Message(models.Model):
    User_send = models.CharField(max_length=50)
    User_received = models.CharField(max_length=50)
    Date_send_msg = models.DateTimeField(auto_now=True)
    Content_msg = models.CharField(max_length=255)
    
class Manage_Stress(models.Model):
    Titre_MS = models.CharField(max_length=50)
    Description_MS = models.CharField(max_length=255)
    Date_pub_MS = models.DateTimeField(auto_now=True)
    Fichier_MS = models.FileField()
    
class News_Post(models.Model):
    Titre = models.CharField(max_length=50)
    Contenu = models.CharField(max_length=255)
    Date_pub = models.DateTimeField(auto_now=True)
    Type = models.CharField(max_length=5)
    Fichier = models.ImageField()

    