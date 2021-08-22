# Getting started

Install [vagrant](https://www.vagrantup.com/) and [virtualbox](https://www.virtualbox.org/).

After you are done you can spin up the virtual machine:

```bash
vagrant up
```

Add dummy database:
```bash
mysql -u typo3 -ptypo3 -h 172.28.128.188 typo3 < provision/data/database.sql
```

Install TYPO3 with composer
```bash
cd website && composer install
```

Add the following line to you `/etc/hosts` file:
```bash
172.28.128.188 typo3.local www.typo3.local
```

Now login to TYPO3 [Backend](http://typo3.local/typo3/) with `admin / Test1122!!`
