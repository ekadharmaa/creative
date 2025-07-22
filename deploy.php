<?php

namespace Deployer;

require 'recipe/laravel.php';

// Config
set('repository', 'git@github.com:ekadharmaa/balicreative.git');

add('shared_files', ['.env']);
add('shared_dirs', ['shared']);
add('writable_dirs', ['shared', 'bootstrap/cache']);

// Hosts
host('103.175.217.35')
    ->set('remote_user', 'nvsgtra')
    ->set('deploy_path', '/home/nvsgtra/balicreative')
    ->set('branch', 'master');

task('npm:build', function () {
    run('cd {{release_path}} && source ~/.nvm/nvm.sh && npm install');
    run('cd {{release_path}} && source ~/.nvm/nvm.sh && npm run build');
});

// Task: Buat symlink di /var/www/balicreative yang menunjuk ke current
task('deploy:symlink_www', function () {
    run('sudo ln -sfn {{deploy_path}}/current /var/www/balicreative');
});

// Task: Jalankan perintah Artisan yang diperlukan
task('artisan:optimize', function () {
    // Generate key, migrasi, dan cache konfigurasi serta route
    run('{{bin/php}} {{release_path}}/artisan key:generate');
    run('{{bin/php}} {{release_path}}/artisan migrate --force');
    run('{{bin/php}} {{release_path}}/artisan config:cache');
    run('{{bin/php}} {{release_path}}/artisan route:cache');
});

// Task: Restart Nginx
task('restart:nginx', function () {
    run('sudo systemctl restart nginx');
});

// Hooks
// Jalankan task npm setelah vendor sudah diinstall (setelah deploy:vendors)
after('deploy:vendors', 'npm:build');

// Setelah deploy:symlink selesai, update symlink www, jalankan artisan, dan restart nginx
after('deploy:symlink', 'deploy:symlink_www');
after('deploy:symlink', 'artisan:optimize');
after('deploy:symlink', 'restart:nginx');

// Jika deployment gagal, buka kunci deployment
after('deploy:failed', 'deploy:unlock');
