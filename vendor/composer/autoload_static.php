<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit4d0e68273b7c2729c9c8f230e427c354
{
    public static $classMap = array (
        'Facebook\\AutoloadMap\\ComposerPlugin' => __DIR__ . '/..' . '/hhvm/hhvm-autoload/src/ComposerPlugin.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->classMap = ComposerStaticInit4d0e68273b7c2729c9c8f230e427c354::$classMap;

        }, null, ClassLoader::class);
    }
}