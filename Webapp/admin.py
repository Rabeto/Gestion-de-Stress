from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(Utilisateur)
admin.site.register(News_Post)
admin.site.register(Manage_Stress)
admin.site.register(Ressources)
admin.site.register(Commentaires)
admin.site.register(Message)
admin.site.register(Assistance)
admin.site.register(Like_Post)