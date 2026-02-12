---
title: "Test Protected Page"
layout: "baseof"
---

<div class="container mx-auto px-4 py-16 text-center">
    <div class="max-w-2xl mx-auto">
        <div class="inline-flex items-center justify-center w-20 h-20 rounded-full bg-green-100 text-green-600 text-3xl mb-6">
            <i class="fas fa-check-circle"></i>
        </div>
        
        <h1 class="text-4xl font-bold mb-4 text-gray-900 dark:text-white">
            Authentication Successful!
        </h1>
        
        <p class="text-xl text-gray-600 dark:text-gray-300 mb-8">
            You are now logged in and can view protected content.
        </p>
        
        <div class="bg-gray-50 dark:bg-gray-800 rounded-2xl p-6 mb-8">
            <h3 class="text-lg font-semibold mb-4 text-gray-900 dark:text-white">What's next?</h3>
            <ul class="text-left space-y-3 text-gray-600 dark:text-gray-300">
                <li class="flex items-start">
                    <i class="fas fa-project-diagram text-primary mt-1 mr-3"></i>
                    <span>Browse all <a href="/projects/" class="text-primary hover:underline">projects</a></span>
                </li>
                <li class="flex items-start">
                    <i class="fas fa-folder text-primary mt-1 mr-3"></i>
                    <span>View projects by category</span>
                </li>
                <li class="flex items-start">
                    <i class="fas fa-plus-circle text-primary mt-1 mr-3"></i>
                    <span>Add new projects (admin only)</span>
                </li>
            </ul>
        </div>
        
        <a href="/projects/" class="inline-flex items-center justify-center px-6 py-3 bg-primary hover:bg-primary-dark text-white rounded-lg font-medium transition-colors">
            <i class="fas fa-arrow-right mr-2"></i>
            Go to Projects
        </a>
    </div>
</div>
