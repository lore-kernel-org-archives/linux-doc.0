Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC12B19CC06
	for <linux-doc@vger.kernel.org>; Tue, 28 Jan 2025 10:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738060703; cv=none; b=Sco74wqcxVUtvbx/emSMQ2II8xwWqXosZJvSFkkfe1zfe78FILYcbsHpXMeBl4z7Mhkyw2Fm/SmO68ujAaY8aVlxilM0ZB6+Ovny7VUOXB8mbfW8jULSPcHbUS63H11W1ptGo+q9Mr4vvwimf46e1AAVkLoaChRMK2d/ENHPA3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738060703; c=relaxed/simple;
	bh=su33/zKHFg4vBZIgydm6o87yX4GaNWF3oeCccC8Fz+c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=qcowZwqxDazgA7mFxVvVjfdNFeEYoXF91KktyNzLa3c+dySIPODzF4bpH98oxZ7uDwjs8Xe6HY0cBMzZzS67dk6DJNz2ikIjvs6sjzvojvpurY0+TwyBxqF88KqGO5vt7xTUTemYE/Vc4amu3IX5kmOLR49FmWAeQ33HRJEJHRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmtk36OP; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmtk36OP"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-215770613dbso67728245ad.2
        for <linux-doc@vger.kernel.org>; Tue, 28 Jan 2025 02:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738060701; x=1738665501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hqWXHL4Qi2+TFi6EG+XEQ6fPHB2qjAn1S9I6jR03bjU=;
        b=dmtk36OPPbSPDMZ3HlWDTLvyYrYp0FO+TW/6S7HSsyJopnMZxDbWPzZ6KfK3PTwOJK
         m+JakCIaFlkJTIPd5zUoYyGxwJZgN6kEnmq083TAIP3SHAPqjlzF7Qsuiz1BMZOhcT3r
         F472c6Mcp4ea9gKZ/P2ozmykzdLW/Qlyt7owjXsKkjXWXZjzhonGnrZHrz9bDFW9rCTK
         l4s4uZLRFEurnH2GummJYO3AT7aO//t/51n6FhrYrL1qFwRzSnKKM5jcWGyCJxq62peQ
         At7HPxhlM3DEQE1Q8j1XVMji2eHb5HOYiaC9USXgghB3WN9r6Cm8gb9E5AYVXR/iHbxY
         aVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738060701; x=1738665501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqWXHL4Qi2+TFi6EG+XEQ6fPHB2qjAn1S9I6jR03bjU=;
        b=K89VqA8NhsJGQdTBUwkrMixu1zU7lniOjIdOvlgXY54nb8IGIp4j/SspfHpyYRRjUk
         gcvcLSSh+aY5gcT95MKhNExYJU9A1BcaQ3QQjU+hwehuVe1VFu2YmdJas2omGrtgAGIZ
         CpWu5Tk2zK9jPr40HFsaYsfRH4RogwHJZ5vcSA2rdJ676TiyKMQ+yhv20jM9Jk8On5vv
         yQEWzRT6lHuLN0joZWMAjkxEnmwaa1JAl78jdhoWWRBUtESEid5zsLFkQLashF+c8eN8
         WAQ7segbmSuqyVG83ljxjYTxrnEDNscJMst862kIfuVLnCmcA8J6xXQvjuPdN5rnlz/h
         v3wA==
X-Forwarded-Encrypted: i=1; AJvYcCWOymIPBqLSrwaV79OQJeLTDT445Ayzk/tOLprymhKbpeswm+IsUH7kTzbgoKpDXiYThdc3icrahTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDFcmGLRMi9cKB0frtW6JMpzDjP8BzhLLiLnyRrl2GlHS1B1WZ
	5qDAKo9t8FTaU8CmqaGI3soBdk6+aejKLCJvSjaA6zzy3Y01KrGhWVpfbA==
X-Gm-Gg: ASbGncs5tyDFD88oUNkqSlIz1LRMvB+VHnOQUhSKAHGGONjfXfSA2D+pXTYLSI6EiQ+
	kTCvopmpQznnFmqNe7Hags7T9xvjPpqWhkgL94ZIGtKpJYX8jOGwQrAlIVU91wpsncARplYXO3y
	MT9y1fuY2mqF22El8AJ85fyeXc2hlcaFU///g+pbGxpXxUttPa395RDF4rN/SVUI2zrbkXFfRvI
	LeCnXp7vkY5+deEv7SVd9JvnI4Xyq6ORGanPFf9AYjXhC2D9DF2DeRPCEyXC2jSflEjDzln+F/x
	9lHfYL+Ekq5yCGYbzahRMuAF0S2mIOb4dQi5bbfeulP9v1Gx8EDG776i6Jzs/6ip
X-Google-Smtp-Source: AGHT+IE8BLraAHUjDSwlmXejodRK21qwNatTiZ32U5J4l76oxQsFkQ5CgV//4KtWx5xKEj4vO9OUig==
X-Received: by 2002:a05:6a20:6a28:b0:1e6:8f30:df53 with SMTP id adf61e73a8af0-1eb214a0655mr62017550637.16.1738060700721;
        Tue, 28 Jan 2025 02:38:20 -0800 (PST)
Received: from ubuntu-2204.. (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a763468sm8973518b3a.106.2025.01.28.02.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 02:38:20 -0800 (PST)
From: Akira Yokosawa <akiyks@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>,
	Tsugikazu Shibata <shibata@linuxfoundation.org>
Subject: [PATCH 1/2] docs/ja_JP: Convert SubmitChecklist into reST with belated updates
Date: Tue, 28 Jan 2025 19:28:04 +0900
Message-Id: <20250128102805.112691-1-akiyks@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is actually a brand-new translation against
commit 47c67ec1e8ef ("docs: submit-checklist: use subheadings"),
rather than an update of existing SubmitChecklist.

As we now have two reST contents under the ja_JP translation,
to avoid duplicated boiler plates, split out the disclaimer part
into a new section and put reference to it at the beginning of each
doc.

As there is no prospect of ja_JP to have a lot of translated docs,
keep those .rst files in the toctree of ja_JP/index.rst.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Tsugikazu Shibata <shibata@linuxfoundation.org>
---
 .../translations/ja_JP/SubmitChecklist        | 105 -----------
 .../translations/ja_JP/disclaimer-ja_JP.rst   |  22 +++
 Documentation/translations/ja_JP/index.rst    |   2 +
 .../translations/ja_JP/process/howto.rst      |  37 ++--
 .../ja_JP/process/submit-checklist.rst        | 165 ++++++++++++++++++
 5 files changed, 199 insertions(+), 132 deletions(-)
 delete mode 100644 Documentation/translations/ja_JP/SubmitChecklist
 create mode 100644 Documentation/translations/ja_JP/disclaimer-ja_JP.rst
 create mode 100644 Documentation/translations/ja_JP/process/submit-checklist.rst

diff --git a/Documentation/translations/ja_JP/SubmitChecklist b/Documentation/translations/ja_JP/SubmitChecklist
deleted file mode 100644
index 1759c6b452d6..000000000000
--- a/Documentation/translations/ja_JP/SubmitChecklist
+++ /dev/null
@@ -1,105 +0,0 @@
-NOTE:
-This is a version of Documentation/process/submit-checklist.rst into Japanese.
-This document is maintained by Takenori Nagano <t-nagano@ah.jp.nec.com>
-and the JF Project team <http://www.linux.or.jp/JF/>.
-If you find any difference between this document and the original file
-or a problem with the translation,
-please contact the maintainer of this file or JF project.
-
-Please also note that the purpose of this file is to be easier to read
-for non English (read: Japanese) speakers and is not intended as a
-fork. So if you have any comments or updates of this file, please try
-to update the original English file first.
-
-Last Updated: 2008/07/14
-==================================
-これは、
-linux-2.6.26/Documentation/process/submit-checklist.rst の和訳です。
-
-翻訳団体： JF プロジェクト < http://www.linux.or.jp/JF/ >
-翻訳日： 2008/07/14
-翻訳者： Takenori Nagano <t-nagano at ah dot jp dot nec dot com>
-校正者： Masanori Kobayashi さん <zap03216 at nifty dot ne dot jp>
-==================================
-
-
-Linux カーネルパッチ投稿者向けチェックリスト
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-本書では、パッチをより素早く取り込んでもらいたい開発者が実践すべき基本的な事柄
-をいくつか紹介します。ここにある全ての事柄は、Documentation/process/submitting-patches.rst
-などのLinuxカーネルパッチ投稿に際しての心得を補足するものです。
-
- 1: 妥当なCONFIGオプションや変更されたCONFIGオプション、つまり =y, =m, =n
-    全てで正しくビルドできることを確認してください。その際、gcc及びリンカが
-    warningやerrorを出していないことも確認してください。
-
- 2: allnoconfig, allmodconfig オプションを用いて正しくビルドできることを
-    確認してください。
-
- 3: 手許のクロスコンパイルツールやOSDLのPLMのようなものを用いて、複数の
-    アーキテクチャにおいても正しくビルドできることを確認してください。
-
- 4: 64bit長の'unsigned long'を使用しているppc64は、クロスコンパイルでの
-    チェックに適当なアーキテクチャです。
-
- 5: カーネルコーディングスタイルに準拠しているかどうか確認してください(!)
-
- 6: CONFIGオプションの追加・変更をした場合には、CONFIGメニューが壊れていない
-    ことを確認してください。
-
- 7: 新しくKconfigのオプションを追加する際には、必ずそのhelpも記述してください。
-
- 8: 適切なKconfigの依存関係を考えながら慎重にチェックしてください。
-    ただし、この作業はマシンを使ったテストできちんと行うのがとても困難です。
-    うまくやるには、自分の頭で考えることです。
-
- 9: sparseを利用してちゃんとしたコードチェックをしてください。
-
-10: 'make checkstack' を利用し、問題が発見されたら修正してください。
-    'make checkstack' は明示的に問題を示しませんが、どれか
-    １つの関数が512バイトより大きいスタックを使っていれば、修正すべき候補と
-    なります。
-
-11: グローバルなkernel API を説明する kernel-doc をソースの中に含めてください。
-    ( staticな関数においては必須ではありませんが、含めてもらっても結構です )
-    そして、'make htmldocs' もしくは 'make mandocs' を利用して追記した
-    ドキュメントのチェックを行い、問題が見つかった場合には修正を行ってください。
-
-12: CONFIG_PREEMPT, CONFIG_DEBUG_PREEMPT, CONFIG_DEBUG_SLAB,
-    CONFIG_DEBUG_PAGEALLOC, CONFIG_DEBUG_MUTEXES, CONFIG_DEBUG_SPINLOCK,
-    CONFIG_DEBUG_ATOMIC_SLEEP これら全てを同時に有効にして動作確認を
-    行ってください。
-
-13: CONFIG_SMP, CONFIG_PREEMPT を有効にした場合と無効にした場合の両方で
-    ビルドした上、動作確認を行ってください。
-
-14: lockdepの機能を全て有効にした上で、全てのコードパスを評価してください。
-
-15: /proc に新しいエントリを追加した場合には、Documentation/ 配下に
-    必ずドキュメントを追加してください。
-
-16: 新しいブートパラメータを追加した場合には、
-    必ずDocumentation/admin-guide/kernel-parameters.rst に説明を追加してください。
-
-17: 新しくmoduleにパラメータを追加した場合には、MODULE_PARM_DESC()を
-    利用して必ずその説明を記述してください。
-
-18: 新しいuserspaceインタフェースを作成した場合には、Documentation/ABI/ に
-    Documentation/ABI/README を参考にして必ずドキュメントを追加してください。
-
-19: 少なくともslabアロケーションとpageアロケーションに失敗した場合の
-    挙動について、fault-injectionを利用して確認してください。
-    Documentation/fault-injection/ を参照してください。
-
-    追加したコードがかなりの量であったならば、サブシステム特有の
-    fault-injectionを追加したほうが良いかもしれません。
-
-20: 新たに追加したコードは、`gcc -W'でコンパイルしてください。
-    このオプションは大量の不要なメッセージを出力しますが、
-    "warning: comparison between signed and unsigned" のようなメッセージは、
-    バグを見つけるのに役に立ちます。
-
-21: 投稿したパッチが -mm パッチセットにマージされた後、全ての既存のパッチや
-    VM, VFS およびその他のサブシステムに関する様々な変更と、現時点でも共存
-    できることを確認するテストを行ってください。
diff --git a/Documentation/translations/ja_JP/disclaimer-ja_JP.rst b/Documentation/translations/ja_JP/disclaimer-ja_JP.rst
new file mode 100644
index 000000000000..9fd06b76598c
--- /dev/null
+++ b/Documentation/translations/ja_JP/disclaimer-ja_JP.rst
@@ -0,0 +1,22 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _translations_ja_JP_disclaimer:
+
+=====================
+免責条項 (DISCLAIMER)
+=====================
+
+Documentation/translations/ja_JP/ 以下のファイルは、対応する
+Documentation/　以下のファイル (原文) の日本語訳です。
+翻訳と原文との違いや翻訳上の問題を見つけたら、
+MAINTAINERS に記載の維持管理者に知らせてください。
+翻訳が原文の更新に追いついていない場合は、それを日本語版に反映するパッチの
+投稿も歓迎です。
+
+なお、この翻訳の目的は非英語 (ここでは日本語) 話者への便宜提供であり、
+フォークを意図したものではない事を念頭においてください。したがって、
+このファイルの内容に対するコメントや更新すべきことがあれば、先に原文の
+更新を検討してください。
+
+日本語訳については、残念ながら、ごく一部の文書しか維持管理されていません。
+翻訳に関心があり、時間的経済的な余裕をお持ちの方は、ぜひ手を貸してください。
diff --git a/Documentation/translations/ja_JP/index.rst b/Documentation/translations/ja_JP/index.rst
index 0b476b429e3b..4159b417bfdd 100644
--- a/Documentation/translations/ja_JP/index.rst
+++ b/Documentation/translations/ja_JP/index.rst
@@ -11,7 +11,9 @@
 .. toctree::
    :maxdepth: 1
 
+   disclaimer-ja_JP
    process/howto
+   process/submit-checklist
 
 .. raw:: latex
 
diff --git a/Documentation/translations/ja_JP/process/howto.rst b/Documentation/translations/ja_JP/process/howto.rst
index d9ba40588e46..6350a6699f5c 100644
--- a/Documentation/translations/ja_JP/process/howto.rst
+++ b/Documentation/translations/ja_JP/process/howto.rst
@@ -1,35 +1,18 @@
-.. raw:: latex
+.. SPDX-License-Identifier: GPL-2.0
 
-	\kerneldocCJKoff
-
-NOTE:
-This is a version of Documentation/process/howto.rst translated into Japanese.
-This document is maintained by Tsugikazu Shibata <tshibata@ab.jp.nec.com>
-If you find any difference between this document and the original file or
-a problem with the translation, please contact the maintainer of this file.
-
-Please also note that the purpose of this file is to be easier to
-read for non English (read: Japanese) speakers and is not intended as
-a fork. So if you have any comments or updates for this file, please
-try to update the original English file first.
-
-----------------------------------
-
-.. raw:: latex
-
-	\kerneldocCJKon
-
-この文書は、
-Documentation/process/howto.rst
-の和訳です。
-
-翻訳者： Tsugikazu Shibata <tshibata@ab.jp.nec.com>
-
-----------------------------------
+.. Originally contributed by Tsugikazu Shibata
 
 Linux カーネル開発のやり方
 ==========================
 
+.. note::
+   この文書は、
+   Documentation/process/howto.rst
+   の翻訳です。
+   免責条項については、
+   :ref:`translations_ja_JP_disclaimer` および
+   :ref:`translations_disclaimer` を参照してください。
+
 これは上のトピック( Linux カーネル開発のやり方)の重要な事柄を網羅した
 ドキュメントです。ここには Linux カーネル開発者になるための方法とLinux
 カーネル開発コミュニティと共に活動するやり方を学ぶ方法が含まれています。
diff --git a/Documentation/translations/ja_JP/process/submit-checklist.rst b/Documentation/translations/ja_JP/process/submit-checklist.rst
new file mode 100644
index 000000000000..b9da826d30ae
--- /dev/null
+++ b/Documentation/translations/ja_JP/process/submit-checklist.rst
@@ -0,0 +1,165 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. Translated by Akira Yokosawa <akiyks@gmail.com>
+
+.. In the past, translation of this document of a different origin was
+   at Documentation/translations/ja_JP/SubmitChecklist, which can be found
+   in the pre-v6.14 tree if you are interested.
+   Please note that this translation is independent of the previous one.
+
+======================================
+Linux カーネルパッチ投稿チェックリスト
+======================================
+
+.. note::
+   この文書は、
+   Documentation/process/submit-checklist.rst
+   の翻訳です。
+   免責条項については、
+   :ref:`translations_ja_JP_disclaimer` および
+   :ref:`translations_disclaimer` を参照してください。
+
+以下は、カーネルパッチの投稿時に、そのスムーズな受け入れのために心がける
+べき基本的な事項です。
+
+これは、 Documentation/process/submitting-patches.rst およびその他の
+Linux カーネルパッチ投稿に関する文書を踏まえ、それを補足するものです。
+
+.. note::
+   【訳註】チェックリストらしくするため、問い掛けの語尾を多用します。
+   また、原義を損なわない範囲で、主語の省略、主語に係る修飾子の述語に係る
+   修飾子への変更、能動態への言い換えなどを行い、より簡潔で把握しやすい
+   箇条書きを目指します。
+
+
+コードのレビュー
+================
+
+1) 利用している機能について、その機能が定義・宣言されているファイルを
+   ``#include`` したか。
+   他のヘッダーファイル経由での取り込みに依存しないこと。
+
+2) Documentation/process/coding-style.rst に詳述されている一般的なスタイル
+   についてチェックしたか。
+
+3) すべてのメモリバリアー (例, ``barrier()``, ``rmb()``, ``wmb()``) に、
+   その作用と目的、及び必要理由についてソースコード内にコメントしたか。
+
+Kconfig 変更のレビュー
+======================
+
+1) 新規の、もしくは変更された ``CONFIG`` オプションについて、そのコンフィグ
+   メニューに悪影響がないか。また、
+   Documentation/kbuild/kconfig-language.rst の
+   "Menu attibutes: default value" に記載の例外条件を満たす場合を除き、
+   そのデフォルトを無効としたか。
+
+2) 新規の ``Kconfig`` オプションにヘルプテキストを付けたか。
+
+3) 妥当な ``Kconfig`` の組み合わせについて注意深くレビューしたか。これを
+   テストでやり切るのは困難で、知力が決め手となる。
+
+ドキュメンテーションの作成
+==========================
+
+1) グローバルカーネル API を :ref:`kernel-doc <kernel_doc>` の形式で
+   ドキュメント化したか (静的関数には求められないが、付けてもよい)。
+
+2) 新規 ``/proc`` エントリーを、すべて ``Documentation/`` 以下に記載したか。
+
+3) 新規カーネル・ブート・パラメータを、すべて
+   ``Documentation/admin-guide/kernel-parameters.rst`` に記載したか。
+
+4) 新規モジュール・パラメータを、すべて ``MODULE_PARM_DESC()`` によって記述
+   したか。
+
+5) 新規ユーザースペース・インターフェースを、すべて ``Documentaion/ABI/``
+   以下に記載したか。詳しくは、 ``Documentation/ABI/README`` を参照のこと。
+   ユーザースペース・インターフェースを変更するパッチは
+   linux-api@vger.kernel.org にも CC すべし。
+
+6) なんらかの ioctl を追加するパッチは、
+   ``Documentation/userspace-api/ioctl/ioctl-number.rst``
+   も更新したか。
+
+ツールによるコードのチェック
+============================
+
+1) スタイル・チェッカー (``scripts/checkpatch.pl``) によって、犯しがちな
+   パッチ・スタイルの違反を確認したか。
+   指摘される違反を残す場合は、それが正当化できるか。
+
+2) sparse で入念なチェックをしたか。
+
+3) ``make checkstack`` で指摘された問題は修正済みか。
+   ``checkstack`` は問題点を明示的には指摘しないが、 スタック消費が
+   512 バイトを越える関数は見直しの候補。
+
+コードのビルド
+==============
+
+1) 以下の条件でクリーンにビルドできるか。
+
+   a) 適用可能な、および ``=y``, ``=m``, ``=n`` を変更した ``CONFIG``
+      オプションのビルド。
+      ``gcc`` およびリンカーからの警告・エラーがないこと。
+
+   b) ``allnoconfig`` と ``allmodconfig`` がパス
+
+   c) ``O=builddir`` を指定してのビルド
+
+   d) Documentation/ 以下の変更後、ドキュメントのビルドで新たな警告・エラー
+      が無いこと。
+      ``make htmldocs`` または ``make pdfdocs`` でビルドし、問題があれば修正。
+
+2) ローカルのクロス・コンパイル・ツール、その他のビルド環境を使って、
+   複数の CPU アーキテクチャ向けのビルドができるか。
+   ``unsigned long`` を 64 ビットの数量に対して使ってしまうことが多いという
+   点で ppc64 は、クロス・コンパイルの検査対象として好適である。
+
+3) 新規に追加されたコードについて (``make KCFLAGS=-W`` を使って)
+   ``gcc -W`` でコンパイルしたか。
+   これは多くのノイズを伴うが、
+   ``warning: comparison between signed and unsigned``
+   の類いのバグをあぶり出すのに効果的。
+
+4) 変更したソースコードが、下記の ``Kconfig`` シンボルに関連するカーネル API
+   や機能に依存 (もしくは利用) する場合、それらの ``Kconfig`` シンボルが無効
+   および ``=m`` の場合 (それが可能な場合) を組み合わせた複数のビルドを
+   (一度に全部ではなく、いろいろなランダムの組み合わせで) テストしたか。
+
+   ``CONFIG_SMP``, ``CONFIG_SYSFS``, ``CONFIG_PROC_FS``, ``CONFIG_INPUT``,
+   ``CONFIG_PCI``, ``CONFIG_BLOCK``, ``CONFIG_PM``, ``CONFIG_MAGIC_SYSRQ``,
+   ``CONFIG_NET``, ``CONFIG_INET=n`` (ただし、後者は ``CONFIG_NET=y``
+   との組み合わせ)。
+
+コードのテスト
+==============
+
+1) ``CONFIG_PREEMPT``, ``CONFIG_DEBUG_PREEMPT``,
+   ``CONFIG_SLUB_DEBUG``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
+   ``CONFIG_DEBUG_SPINLOCK``, ``CONFIG_DEBUG_ATOMIC_SLEEP``,
+   ``CONFIG_PROVE_RCU`` および ``CONFIG_DEBUG_OBJECTS_RCU_HEAD`` をすべて
+   同時に有効にしてテストしたか。
+
+2) ``CONFIG_SMP`` と ``CONFIG_PREEMPT`` が有効と無効の場合について、ビルドと
+   ランタイムのテスト済みか。
+
+3) lockdep のすべての機能を有効にしての実行で、すべてのコード経路を確認
+   したか。
+
+4) 最低限、 slab と ページ・アロケーションの誤り注入によるチェックをしたか。
+   詳しくは、 Documentation/fault-injection/index.rst を参照。
+   新規のコードが多い場合は、サブシステム用の誤り注入を追加するのが望ましい
+   可能性あり。
+
+5) 最新の linux-next タグに対してテストし、他でキューイングされているパッチや、
+   VM、VFS、その他のサブシステム内のすべての変更に対しても、依然として動作
+   することを確認したか。
+
+.. note::
+   【訳註】採用した訳語
+
+   - build farm: ビルド環境
+   - brainpower: 知力
+   - fault injection: 誤り注入

base-commit: 66dbcd53241503dc72fe4b876312d59f5c98ec2f
-- 
2.34.1

