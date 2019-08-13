#!/usr/bin/env hhvm
/*
 *  Copyright (c) 2018-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HackTest;

<<__EntryPoint>>
async function hack_test_main_async(): Awaitable<noreturn> {
  $root = \realpath(__DIR__.'/..');
  $found_autoloader = false;
  while (true) {
    $autoloader = $root.'/vendor/autoload.hack';
    if (\file_exists($autoloader)) {
      $found_autoloader = true;
      require_once($autoloader);
      \Facebook\AutoloadMap\initialize();
      break;
    }
    if ($root === '') {
      break;
    }
    $parts = \explode('/', $root);
    \array_pop(&$parts);
    $root = \implode('/', $parts);
  }

  if (!$found_autoloader) {
    \fprintf(\STDERR, "Failed to find autoloader.\n");
    exit(1);
  }

  $exit_code = await HackTestCLI::runAsync();
  exit($exit_code);
}
