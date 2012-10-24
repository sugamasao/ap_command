# ApCommand [![Build Status](https://secure.travis-ci.org/sugamasao/ap_command.png)](http://travis-ci.org/sugamasao/ap_command) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/sugamasao/ap_command)

JSON file to awesome print for command line tool.

dependency [awesome_print](https://github.com/michaeldv/awesome_print)

※標準出力周りのテストが書けないのでだれか助けて!

## Installation

Require ruby version >= 1.9.2

install it yourself as:

    $ gem install ap_command

## Usage

using `ap` command.

    % ap /tmp/hoge.json
    {
      "hoge" => [
        [0] 1,
        [1] 2,
        [2] 3,
        [3] "fuga"
      ]
    }


## Copyright
MIT License.

See LICENSE.txt file for details.

