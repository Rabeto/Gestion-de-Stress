from django.contrib import admin
from .models import Utilisateur, News_Post, Ressources, Manage_Stress,Commentaires, Message

# Register your models here.
admin.site.register(Utilisateur)
admin.site.register(News_Post)
admin.site.register(Manage_Stress)
admin.site.register(Ressources)
admin.site.register(Commentaires)
admin.site.register(Message)