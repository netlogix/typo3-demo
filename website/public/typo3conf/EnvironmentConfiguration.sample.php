<?php

use TYPO3\CMS\Core\Core\Environment;

call_user_func(function () {
    $isDevelopment = Environment::getContext()->isDevelopment();
    $GLOBALS['TYPO3_CONF_VARS']['BE']['installToolPassword'] = '$argon2i$v=19$m=65536,t=16,p=2$eUZ2dnNPd21PaEUxc3kyZg$vbV54mCNc6PSZ7AKrRSIJ1Xt5JAWUS+f4d/0yL7BuKQ';
    $GLOBALS['TYPO3_CONF_VARS']['BE']['warning_email_addr'] = '';
    $GLOBALS['TYPO3_CONF_VARS']['BE']['debug'] = $isDevelopment;

    $GLOBALS['TYPO3_CONF_VARS']['FE']['debug'] = $isDevelopment;
    $GLOBALS['TYPO3_CONF_VARS']['SYS']['displayErrors'] = (int)$isDevelopment;

    $GLOBALS['TYPO3_CONF_VARS']['HTTP']['ssl_verify_peer'] = false;
    $GLOBALS['TYPO3_CONF_VARS']['HTTP']['ssl_verify_host'] = false;
    $GLOBALS['TYPO3_CONF_VARS']['HTTP']['verify'] = false;
});
