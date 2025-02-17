Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4556C372
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 06:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739772114; cv=none; b=TVVRk/SPL6X2n/KptcR32GrIpWEm4jb7lid6Gf0lJeJOcauX2k4AJE1aoaE9dgEz5nc/5ohZ85TlWpQwPn0klZVXRorRX8KrzHgMY3noJ8b0YHQR3jRuZDv3m5Xa1ytgu3Uwu6DA6fqbCinwnxZ+FcNv7rn0tognLiRuUR2yLs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739772114; c=relaxed/simple;
	bh=G9Uhnmmy2dJ7NMJvPxXHoz2LspstgY7Y8D91MOJ556I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mQyTK/NXWSq1zmRYLY5zhmNYXaaBrChW2tmj3DGIUSmdqMp4sfwggDcY1rFHqH8PdpKCjp7zu918Y0/FhZH7Yv17Kvg45U1ovaz+MB/qbWsHPwKyIpph+ZLw44stEHjmttzI+2SCTe5/29E6CrX+jFQtdpblxPeiKh/ffXmFnkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fb6vdEZ8; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fb6vdEZ8"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220c8eb195aso82962335ad.0
        for <linux-doc@vger.kernel.org>; Sun, 16 Feb 2025 22:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739772111; x=1740376911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRMHWbgdEtC0lh/fbrNaHxz7SZukKOSPNVboqBmtRZw=;
        b=Fb6vdEZ8Lgi2ZMwT/dW6EfIiuhraY+YvtBhObMRV7tke4fMm7WX2sFggWnOkr9Qsw+
         f46udJmTDk1lQxM2FAbuj95jAamnqtn++B63tXL88R3QGz0uTd5WN5vgZltTDuSrEpRL
         yMz7mmoJhiS9jPGB+DACEnvn5T9fPDo7MK5p7iqEprFHbVOkOqpI2PhWjf7n1DksfddT
         FqWAbR7lDS8u1MkC9wCvp5QikZ1NKJN8xWfyV+ko+ErWlly7K+l/TWyvACYJHavX2DcM
         HUwTdlmsSa/ZOczcM3JWhBTjCYQb3mWT+jXXxLscHF4MeXGYwi3ulBySsEipvCGKQ7X3
         S4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739772111; x=1740376911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRMHWbgdEtC0lh/fbrNaHxz7SZukKOSPNVboqBmtRZw=;
        b=FepXqvcLNMprn+Elqp61D8ZeuLj2B4FxQrZTv5pk7ZtZzRsBNTZrX1m6DYEhBNh67Q
         3iR9FyqhB8JGvRoOEGEh/it3fFeBMFtrRfaZ86KHF4/FqtAhOqB5VUXp/HkiV00P4NkB
         uaTbe1Bm4Iu3cgOY/TM6S05mZAfxkKm8SSkVHvlSXl/G1z2oSihe0adAShl9LKmAKdwx
         8VM3rKZo4tmEcfMVoUilNUBuCHt+Pq8pP0eOb8m1x5Lb6FtFAkuXeJXHZnV5UY3Og2wg
         wgJyXpwW8XIWdRjxPLGWf0VqVq7wJezYDH/kTP7VrupY1Z7wP3lSBd8a+l84qHrVX/1a
         x4ag==
X-Gm-Message-State: AOJu0Yx3xtZGNAHgSEmIsSwP0oV95hQYOcnfu/TgAaLaFWSqtn0yam9R
	4KGvFLPFIRcLoIWoSDRAZj+skCe0zGT80711lsk7Uca3nqrvEBm2
X-Gm-Gg: ASbGncsvHYPL5qEFUCo+uyzNCJxvy4Q79RhgNRq5d3z8l7zzhvyuKwlFhO/Vyz6uVE4
	CHeeAU7fyIOin7Tqi39hjJSR730mW+BWQVF0MeWsO+5tE8UdgfiejqUfYFcaxOEkPC31/aUgMRh
	CBeZHcuDrLaEbL5KB6dFafRnw5jSXXbyTjLaUCgITz28gDte2hW2IUCrDQ5CTSqmPuKrJKr0XwO
	IT/n5hd7srV4LRC5oi4J87bdYNgCT0UXPzcvO0mdDxJujYEAfGtUETmGXlZbj8CfXhIgB02jocf
	okiEuPnh0DzkQrARHycnLz3Nw0SkrFZqAw0qJy72cd/Qt87LnviQmKjPcq7evrdU
X-Google-Smtp-Source: AGHT+IEdiloE3U4tqR2o5cPPSLL4093y9cw5klErjCsrL5G4DxFyEVIUXgrDTUVzb/pecxrl4QB1PQ==
X-Received: by 2002:a05:6a00:39a6:b0:732:23ed:9457 with SMTP id d2e1a72fcca58-732617c2dfcmr11328705b3a.12.1739772111083;
        Sun, 16 Feb 2025 22:01:51 -0800 (PST)
Received: from ubuntu-2204.. (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7326bff59f1sm2807556b3a.116.2025.02.16.22.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 22:01:50 -0800 (PST)
From: Akira Yokosawa <akiyks@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>,
	Tsugikazu Shibata <shibata@linuxfoundation.org>
Subject: [PATCH v2] docs/ja_JP: Convert SubmitChecklist into reST with belated updates
Date: Mon, 17 Feb 2025 15:01:32 +0900
Message-Id: <20250217060132.64670-1-akiyks@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a brand-new translation against
commit 2783096fb1dd ("docs: submit-checklist: Expand on build tests
against different word sizes"), rather than an update of
ja_JP/SubmitChecklist, which has never updated since 2008 except for
trivial changes not involving translation.

As we now have two reST contents under the ja_JP translation,
to avoid duplicated boiler plates, split out ja_JP's own disclaimer
part into a new section and put a reference to it at the beginning of
each doc.

As there is no prospect of ja_JP to have a lot of translated docs,
keep those .rst files in the toctree of ja_JP/index.rst.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Tsugikazu Shibata <shibata@linuxfoundation.org>
---
Changes since v1 [1]:

- Include the change in commit 2783096fb1dd ("docs: submit-checklist:
  Expand on build tests against different word sizes").

- To weaken possible overbearing nuance in the translation, treat the
  patch or its change as an implicit subject of each item and describe
  its recommended state, as far as such wording is possible.

  v1 used a style of questions you should ask yourself before submitting.
  Shibata-san pointed out it can sound like "questioning" or
  "interrogation" to unprepared readers, [2].

- Remove a note on translation terms at the bottom of submit-checklist.rst.
  Instead, show English words in the form of inline notes as
  "誤り注入 (訳註: fault injection)" etc., where transliteration would
  be too long (such as "フォールトインジェクション") or ambiguous (such
  as "ビルドファーム", which can be transliterated back into "build firm"
  rather than "build farm").

- Remove a note on current status of ja_JP translation in
  disclaimer-ja_JP.rst, which was more of my personal opinion rather than
  a consensus.

- Other minor tweaks here and there ...

[1]: https://lore.kernel.org/20250128102805.112691-1-akiyks@gmail.com/
[2]: quoted in https://lore.kernel.org/de5014ae-a311-4842-8a26-8f1a27016e52@gmail.com/
---
 .../translations/ja_JP/SubmitChecklist        | 105 ------------
 .../translations/ja_JP/disclaimer-ja_JP.rst   |  24 +++
 Documentation/translations/ja_JP/index.rst    |   2 +
 .../translations/ja_JP/process/howto.rst      |  37 ++--
 .../ja_JP/process/submit-checklist.rst        | 162 ++++++++++++++++++
 5 files changed, 198 insertions(+), 132 deletions(-)
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
index 000000000000..46a026000407
--- /dev/null
+++ b/Documentation/translations/ja_JP/disclaimer-ja_JP.rst
@@ -0,0 +1,24 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _translations_ja_JP_disclaimer:
+
+==========================
+免責条項 (Disclaimer) 抄訳
+==========================
+
+.. note:: 【訳註】
+   この文書は、
+   :ref:`Disclaimer (英語版) <translations_disclaimer>`
+   の一部を翻訳したものです。全文は英語版を参照願います。
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
index d9ba40588e46..5e307f90982c 100644
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
 
+.. note:: 【訳註】
+   この文書は、
+   Documentation/process/howto.rst
+   の翻訳です。
+   免責条項については、
+   :ref:`免責条項の抄訳 <translations_ja_JP_disclaimer>` および、
+   :ref:`Disclaimer (英語版) <translations_disclaimer>` を参照してください。
+
 これは上のトピック( Linux カーネル開発のやり方)の重要な事柄を網羅した
 ドキュメントです。ここには Linux カーネル開発者になるための方法とLinux
 カーネル開発コミュニティと共に活動するやり方を学ぶ方法が含まれています。
diff --git a/Documentation/translations/ja_JP/process/submit-checklist.rst b/Documentation/translations/ja_JP/process/submit-checklist.rst
new file mode 100644
index 000000000000..20a952cf82f9
--- /dev/null
+++ b/Documentation/translations/ja_JP/process/submit-checklist.rst
@@ -0,0 +1,162 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. Translated by Akira Yokosawa <akiyks@gmail.com>
+
+.. An old translation of this document of a different origin was at
+   Documentation/translations/ja_JP/SubmitChecklist, which can be found
+   in the pre-v6.14 tree if you are interested.
+   Please note that this translation is independent of the previous one.
+
+======================================
+Linux カーネルパッチ投稿チェックリスト
+======================================
+
+.. note:: 【訳註】
+   この文書は、
+   Documentation/process/submit-checklist.rst
+   の翻訳です。
+   免責条項については、
+   :ref:`免責条項の抄訳 <translations_ja_JP_disclaimer>` および、
+   :ref:`Disclaimer (英語版) <translations_disclaimer>` を参照してください。
+
+以下は、カーネルパッチの投稿時に、そのスムーズな受け入れのために心がける
+べき基本的な事項です。
+
+これは、 Documentation/process/submitting-patches.rst およびその他の
+Linux カーネルパッチ投稿に関する文書を踏まえ、それを補足するものです。
+
+.. note:: 【訳註】
+   可能な項目については、パッチもしくはパッチ内の更新を暗黙の主語として、
+   その望ましい状態を表す文体とします。その他、原義を損なわない範囲で
+   係り結びを調整するなど、簡潔で把握しやすい箇条書きを目指します。
+
+
+コードのレビュー
+================
+
+1) 利用する機能について、その機能を定義・宣言しているファイルを
+   ``#include`` している。
+   他のヘッダーファイル経由での取り込みに依存しない。
+
+2) Documentation/process/coding-style.rst に詳述されている一般的なスタイル
+   についてチェック済み。
+
+3) メモリバリアー (例, ``barrier()``, ``rmb()``, ``wmb()``) について、
+   そのすべてに、作用と目的、及び必要理由についての説明がソースコード内の
+   コメントとして記述されている。
+
+
+Kconfig 変更のレビュー
+======================
+
+1) 新規の、もしくは変更された ``CONFIG`` オプションについて、それが関係する
+   コンフィグメニューへの悪影響がない。また、
+   Documentation/kbuild/kconfig-language.rst の
+   "Menu attibutes: default value" に記載の例外条件を満たす場合を除き、
+   そのデフォルトが無効になっている。
+
+2) 新規の ``Kconfig`` オプションにヘルプテキストがある。
+
+3) 妥当な ``Kconfig`` の組み合わせについて注意深くレビューされている。
+   これをテストでやり切るのは困難で、知力が決め手となる。
+
+ドキュメンテーションの作成
+==========================
+
+1) グローバルなカーネル API が  :ref:`kernel-doc <kernel_doc>` の形式で
+   ドキュメント化されている (静的関数には求められないが、付けてもよい)。
+
+2) 新規 ``/proc`` エントリーが、すべて ``Documentation/`` 以下に記載されて
+   いる。
+
+3) 新規カーネル・ブート・パラメータが、すべて
+   ``Documentation/admin-guide/kernel-parameters.rst`` に記載されている。
+
+4) 新規モジュール・パラメータが、すべて ``MODULE_PARM_DESC()`` によって記述
+   されている。
+
+5) 新規ユーザースペース・インターフェースが、すべて ``Documentaion/ABI/``
+   以下に記載されている。詳しくは、 ``Documentation/ABI/README`` を参照。
+   ユーザースペース・インターフェースを変更するパッチは、
+   linux-api@vger.kernel.org にも CC すべし。
+
+6) なんらかの ioctl を追加するパッチは、
+   ``Documentation/userspace-api/ioctl/ioctl-number.rst``
+   の更新を伴う。
+
+ツールによるコードのチェック
+============================
+
+1) スタイル・チェッカー (``scripts/checkpatch.pl``) によって、犯しがちな
+   パッチ・スタイルの違反がないことを確認済み。
+   指摘される違反を残す場合は、それを正当化できること。
+
+2) sparse により入念にチェック済み。
+
+3) ``make checkstack`` で指摘される問題があれば、それが修正済み。
+   ``checkstack`` は問題点を明示的には指摘しないが、 スタック消費が
+   512 バイトを越える関数は見直しの候補。
+
+コードのビルド
+==============
+
+1) 以下の条件でクリーンにビルドできる。
+
+   a) 適用可能な、および ``=y``, ``=m``, ``=n`` を変更した ``CONFIG``
+      オプションでのビルド。
+      ``gcc`` およびリンカーからの警告・エラーがないこと。
+
+   b) ``allnoconfig`` と ``allmodconfig`` がパス
+
+   c) ``O=builddir`` を指定してのビルド
+
+   d) Documentation/ 以下の変更に関して、ドキュメントのビルドで新たな警告や
+      エラーが出ない。
+      ``make htmldocs`` または ``make pdfdocs`` でビルドし、問題があれば修正。
+
+2) ローカルのクロス・コンパイル・ツール、その他のビルド環境 (訳註: build farm)
+   を使って、複数の CPU アーキテクチャ向けにビルドできる。
+   特に、ワードサイズ (32 ビットと 64 ビット) やエンディアン (ビッグとリトル)
+   の異なるアーキテクチャを対象とするテストは、表現可能数値範囲・データ整列・
+   エンディアンなどについての誤った仮定に起因する様々な移植上の問題を捕える
+   のに効果的。
+
+3) 新規に追加されたコードについて (``make KCFLAGS=-W`` を使って)
+   ``gcc -W`` でコンパイル。
+   これは多くのノイズを伴うが、
+   ``warning: comparison between signed and unsigned``
+   の類いのバグをあぶり出すのに効果的。
+
+4) 変更されるソースコードが、下記の ``Kconfig`` シンボルに関連するカーネル
+   API や機能に依存 (もしくは利用) する場合、それらの ``Kconfig`` シンボルが、
+   無効、および (可能なら) ``=m`` の場合を組み合わせた複数のビルドを
+   (全部まとめてではなく、いろいろなランダムの組み合わせで) テスト済み。
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
+   同時に有効にしてのテスト済み。
+
+2) ``CONFIG_SMP`` と ``CONFIG_PREEMPT`` が有効と無効の場合について、ビルドと
+   ランタイムのテスト済み。
+
+3) lockdep の機能をすべて有効にしての実行で、すべてのコード経路が確認済み。
+
+4) 最低限、slab と ページ・アロケーションの失敗に関する誤り注入
+   (訳註: fault injection) によるチェック済み。
+   詳しくは、 Documentation/fault-injection/index.rst を参照。
+   新規のコードが多い場合は、サブシステム対象の誤り注入を追加するのが望ましい
+   可能性あり。
+
+5) linux-next の最新タグに対するテストにより、他でキューイングされている
+   パッチや、VM、VFS、その他のサブシステム内のすべての変更と組み合わせての
+   動作を確認済み。

base-commit: 629ecd68ccde7fc7aa518c24827c571220c0fa3f
-- 
2.34.1

