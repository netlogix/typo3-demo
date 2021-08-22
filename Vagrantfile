
SYNCED_FOLDER_OPTIONS = { type: 'nfs', nfs_export: true, nfs_udp: false, mount_options: ['nolock', 'actimeo=3', 'fsc', 'noatime', 'async'] }
if defined? NLX_SYNCED_FOLDER_OPTIONS
    SYNCED_FOLDER_OPTIONS = NLX_SYNCED_FOLDER_OPTIONS
end

Vagrant.configure("2") do |config|
    config.vm.box = "bento/ubuntu-20.04"

    # Choose a custom IP so this doesn't collide with other Vagrant boxes
    config.vm.network "private_network", ip: "172.28.128.188"

    # Execute shell script(s)
    config.vm.provision :shell, path: "provision/components/apache.sh"
    config.vm.provision :shell, path: "provision/components/php.sh"
    config.vm.provision :shell, path: "provision/components/mysql.sh"
    config.vm.provision :shell, path: "provision/components/chromium.sh"

    config.vm.define "web", primary: true do |web|
        web.vm.provider :virtualbox do |virtualbox|
            virtualbox.name = "web-typo3"
            virtualbox.memory = 2048
            virtualbox.cpus = 2
        end

        web.vm.synced_folder "website", "/var/www/", SYNCED_FOLDER_OPTIONS
        web.vm.synced_folder ".", "/vagrant/" , :disabled => true
    end
end
