from django.db import models
from django.core.validators import MinLengthValidator
from .choix import choix_publication, choix_status

# Create your models here.
class Utilisateur(models.Model):
    Nom_Complet = models.CharField(max_length=150, default="user")
    Image_profil = models.ImageField()
    Age = models.IntegerField(null=True)
    Email = models.EmailField()
    Departement = models.CharField(max_length=50)
    Fonction = models.CharField(max_length=50)
    Username = models.CharField(max_length=50, unique=True)
    Password = models.CharField(max_length=50, validators=[MinLengthValidator(8)])
    Status = models.CharField(max_length=20, choices=choix_status, default = 'Utilisateur Simple')
    
    def __str__(self):
        return self.Nom_Complet
    
class Commentaires(models.Model):
    Titre_pub = models.CharField(max_length=150)
    Auteur_Comment_pub = models.ForeignKey(Utilisateur, on_delete=models.CASCADE)
    Comment_pub = models.TextField(max_length=255)
    Date_Comment_pub = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return self.Titre_pub
    
    
class Ressources(models.Model):
    Titre_Ressource = models.CharField(max_length=50)
    Description_Ressource = models.TextField(max_length=255)
    Fichier_Ressource = models.FileField()
    Date_pub_Ressource = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return self.Titre_Ressource

class Message(models.Model):
    User_send_msg = models.ForeignKey(Utilisateur, on_delete=models.CASCADE)
    Object_msg = models.CharField(max_length=150, blank=True)
    Content_msg = models.TextField(max_length=255)
    Date_send_msg = models.DateTimeField(auto_now=True)
    Status_msg = models.CharField(max_length=150)
    
    def __str__(self):
        return self.Object_msg

class Room(models.Model):
    Theme = models.CharField(max_length=150, blank=True)
    
    def __str__(self):
        return self.Theme
    
class Private_Message(models.Model):
    User = models.ForeignKey(Utilisateur, on_delete=models.CASCADE)
    Message = models.CharField(max_length=1000)
    Date = models.DateTimeField(auto_now=True)
    Room = models.CharField(max_length=150, blank=True)
    
    def __str__(self):
        return self.Message


class Manage_Stress(models.Model):
    Titre_MS = models.CharField(max_length=50)
    Description_MS = models.TextField(max_length=255)
    Date_pub_MS = models.DateTimeField(auto_now=True)
    Fichier_MS = models.FileField()
        
class News_Post(models.Model):
    Titre = models.CharField(max_length=50)
    Contenu = models.TextField(max_length=100000)
    Date_pub = models.DateTimeField(auto_now=True)
    Type = models.CharField(max_length=5, choices=choix_publication, default='Posts')
    Fichier = models.ImageField()
    Like = models.ManyToManyField(Utilisateur, default=None, blank=True, related_name='Reaction_Utilisateur')
    Auteur_pub = models.ForeignKey(Utilisateur, on_delete=models.CASCADE)
    
    def __str__(self):
        return self.Titre
    
class Assistance(models.Model):
    Cas = models.ForeignKey(Message, on_delete=models.CASCADE)
    Suivi = models.ForeignKey(Utilisateur, on_delete=models.CASCADE)
    