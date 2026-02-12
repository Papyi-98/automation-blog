---
title: "Sign In"
layout: "baseof"
---

<div class="min-h-screen flex items-center justify-center bg-gray-50 dark:bg-gray-900 py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full space-y-8">
        <div>
            <div class="flex justify-center">
                <div class="inline-flex items-center justify-center w-20 h-20 rounded-full bg-primary/10 text-primary text-3xl">
                    <i class="fas fa-lock"></i>
                </div>
            </div>
            <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900 dark:text-white">
                Sign in to continue
            </h2>
            <p class="mt-2 text-center text-sm text-gray-600 dark:text-gray-400">
                You need to sign in to view project details
            </p>
        </div>
        
        <!-- Login Button - Opens Netlify Identity Widget -->
        <div>
            <button id="netlify-login-btn" class="group relative w-full flex justify-center py-3 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-primary hover:bg-primary-dark focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary">
                <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                    <i class="fas fa-sign-in-alt"></i>
                </span>
                Sign in with Netlify Identity
            </button>
        </div>
        
        <div class="text-center text-sm text-gray-600 dark:text-gray-400">
            <p>No account? Click sign in and choose "Sign up"</p>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const netlifyIdentity = window.netlifyIdentity;
        const loginBtn = document.getElementById('netlify-login-btn');
        
        if (netlifyIdentity) {
            loginBtn.addEventListener('click', function(e) {
                e.preventDefault();
                netlifyIdentity.open('login');
            });
            
            // On successful login, redirect back to projects page
            netlifyIdentity.on('login', function(user) {
                console.log('Logged in as:', user.email);
                netlifyIdentity.close();
                window.location.href = '/projects/';
            });
            
            // Initialize the widget
            netlifyIdentity.init();
        }
    });
</script>
