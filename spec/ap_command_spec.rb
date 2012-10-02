# encoding:utf-8
require 'spec_helper'
require 'tempfile'

module ApCommand
  describe Application do
    context 'jsonファイルを受け取る' do
      describe '.invoke' do
        before do
          @file = Tempfile.new('ap')
          @file.puts({hoge:[1, 2, '3']}.to_json)
          @file.close
        end

        it { expect {Application.invoke([@file.path])}.to_not raise_error }

        after do
          @file.unlink
        end
      end
    end

    context 'jsonファイルが壊れている' do
      describe '.invoke' do
        before do
          @file = Tempfile.new('ap')
          @file.puts '{"hoge":[}'
          @file.close
        end

        it { expect {Application.invoke([@file.path])}.to raise_error(SystemExit) }

        after do
          @file.unlink
        end
      end
    end

    context 'ファイルが存在しない' do
      describe '.invoke' do
        specify 'ヘルプが出力される' do
          expect { Application.invoke(['/tmp/hoge/fuga/awesome']) }.to raise_error(SystemExit)
        end
      end
    end

    context '引数を省略された' do
      describe '.invoke' do
        specify 'ヘルプが出力される' do
          expect { Application.invoke([]) }.to raise_error(SystemExit)
        end
      end
    end

    context 'ヘルプコマンドを入力された' do
      describe '.invoke' do
        specify 'ヘルプが出力される' do
          expect { Application.invoke(['--help']) }.to raise_error(SystemExit)
          expect { Application.invoke(['-h']) }.to raise_error(SystemExit)
        end
      end
    end

    context 'versionを入力された' do
      describe '.invoke' do
        specify 'versionが出力される' do
          expect { Application.invoke(['--version']) }.to raise_error(SystemExit)
          expect { Application.invoke(['-v']) }.to raise_error(SystemExit)
        end
      end
    end

  end
end
