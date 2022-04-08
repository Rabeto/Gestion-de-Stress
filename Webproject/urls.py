"""Webproject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from Webapp import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('index_admin/', views.index_admin, name='index_admin'),
    path('login/', views.login, name='login'),
    
    path('news_post_admin/', views.news_post_admin, name='news_post'),
    path('add_news_post_admin', views.add_news_post_admin, name='add_news_post_admin'),
    path('create_news_post_admin/', views.create_news_post_admin, name='creae_news_post_admin'),
    path('edit_news_post_admin/<id>/', views.edit_news_post_admin, name='edit_news_post_admin'),
    path('update_news_post_admin/<id>/', views.update_news_post_admin, name='update_news_post_admin'),
    path('delete_news_post_admin/<id>', views.delete_news_post_admin, name='delete_news_post_admin'),
    
    
    path('ressources_admin/', views.ressources_admin, name='ressources_admin'),
    path('manage_stress_admin/', views.manage_stress_admin, name='manage_stress_admin'),
    
    path('user_admin/', views.user_admin, name='user_admin'),
    path('add_user_admin', views.add_user_admin, name='add_user_admin'),
    path('create_user_admin/', views.create_user_admin, name='create_user_admin'),
    path('edit_user_admin/<id>/', views.edit_user_admin, name='edit_user_admin'),
    path('update_user_admin/<id>/', views.update_user_admin, name='update_user_admin'),
    path('delete_user_admin/<id>/', views.delete_user_admin, name='delete_user_admin'),

]
