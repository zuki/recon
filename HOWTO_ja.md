# 新しいアプリケーションの作成方法

```bash
$ cd intelFPGA_lite/18.1/nios2eds
$ ./nios2_command_shell.sh
------------------------------------------------
Altera Nios2 Command Shell [GCC 4]
  Version 18.1, Build 625
------------------------------------------------
$ cd recon/sw/recon_?
$ make new_bsp
$ make generate_lib
$ make generate_app APP_NAME={app name}
$ vi {app name}/src/app.cpp
$ make app APP_NAME={app name}
$ make pof APP_NAME={app name}
```

# NIOS2 コアの再構築の方法

1.  Quartusで`recon/hw/recon_?/max1000`にある`recon_?.qpf`を開く
2.  `recon_?.qsys`を開き、Platform Designerを開く
3.  Platform Designerで [Tools -> Options] を開く
4.  `IP Search Path`に`recon/hw/cmn/`ディレクトリを追加する
5.  Platform Designerを保存する
6.  Quartusに戻り、コンパイルする
7.  **[不要]** `recon/hw/recon_?/max1000/output_files`ディレクトリにある`recon_?.sof`ファイルを`recon/hw/recon_?/max1000/release`ディレクトリにコピーする（必要であれば、旧recon_?.sofをバックアップする）
