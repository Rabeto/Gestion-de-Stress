from django.shortcuts import render,redirect

# Create your views here.
def index_admin(request):
    return render(request,'index_admin.html')

def user_admin(request):
    return render(request,'user_admin.html')

def manage_stress_admin(request):
    return render(request,'manage_stress.html')

def news_post_admin(request):
    return render(request,'news_post.html')

def ressources_admin(request):
    return render(request,'ressources_admin.html')
