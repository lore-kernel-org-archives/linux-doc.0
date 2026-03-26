Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7944B3F660C
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 11:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774525633; cv=none; b=Fb0VaBMtpmVYm3zrri/kaoMzYD81KoXJkqvZzZi2ht9Lv+gtIlDi3sIKloP6bkieQ8KZy00Kdw1ugGwXn/3mFg4YX2I/dOZVYJaw41VKmU6lLGhG3EiodOduwiMauMcIk3rZyfmQj4+wxN2DOmMhHAhCfCwxT/ETB/6Hd3gAOmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774525633; c=relaxed/simple;
	bh=iLyZFRFMTpQXNzB1dFThVYw5WC1CJ1xiMkuu8TZ9J3g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sWgHGDYIDMSVOWxTSSxdtx7ImmO/HCvXWvwmpWbjFcOGC+VtlUXqe97eMtj3sr/e4tGOyx3LzBVMlNQNaSgE8P1hIR3mkzN//soWPWSMRCI5D6rvzNOyJ1E5Hwfj6xc6YmPjJDFpHZEdUakgyBXyS3ycmj9BkI/Xdb+BAcIm3Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBd+CK7K; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBd+CK7K"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2aaf43014d0so5949245ad.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 04:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774525621; x=1775130421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YMJcHYjT/sXHIxRcVKCCK3KogdB61CgOYofy1GIKypI=;
        b=lBd+CK7KtUJAm0hYj6AkWgv4XH2r5BXppcdPR//T1sb5HhW1HMJ1Gz7T3jhGFi7Jrh
         +lOYH8Z0Sp3EAOrmVXek+UZUYHv1S0qq0MIfA1FRCFZ7tgIOK8Xv+lO3O5MA7mCm2aCK
         YML0pad01E3lTSBvK8MEN3E/cKlXUq+hYYOhh06yf3LZZ9OvrM3i7E7eVhh2FX9tO3ST
         dRedJUIfe+UUgMwDAwPEsbiu+sD1nixvLnDx/bfwmA1V4Rjn0OCYAu1QaRR+66iNrhlb
         QaTyTSutQYSzND5DkBruZDlVzC+67S9tPXtglMQa2r8N4ZpTpOoPYsCi4nvHc6kDO1kj
         W5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774525621; x=1775130421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMJcHYjT/sXHIxRcVKCCK3KogdB61CgOYofy1GIKypI=;
        b=hZp9HX8s1H3dOnSYivwtQKIRmyET4ahBV2CQMCGi74YDnVLd06UmJhx2Fkn0NVHxuN
         yGLA7zmdiplLbVtLkdoIeAOdNKs9DAsvtKXRys2ta+m7tSHFBc4DSgHIeY076IostakS
         YgttKGDgWyzQlzNBMRcmXhN3PP2CnvkoPyEoPGv5mbVJtve0eG3zgyA/9NkSycbROp5H
         K1hoyWKl9v1RqZB1CIj5bNpNMqIR6qEtc5pD5yuZME/fvAOZJ9HUUSf7sZ4rXrEmGxpG
         60ZbbUJ7E9bG8msd2KKu3P0Ut7oggZ7Za6F1lYxaUspldxOGOmwr5GXiFJmv94iugbId
         A6bQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0EZfS3lSDSuVvFWjEZhkWvswu0bI4lvhJQcB+76IMN5XVZH5tlhTVIDDYZrxTHguAQnj8tdgWnz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsS3uMAELPJjdRG1qN9gVkc+jUbUn9iGCrMwjs15x/GeFEyL7M
	fOC5yq0RpLtcEY4oaijzzU+2tYz7EZRv4RH3LOA+8ZR8y8wOvNzf7Fz9
X-Gm-Gg: ATEYQzyUIBpLM5ZdJlTpveVTRNN+DNCVts+BEqGg8KynNXCQEOXOZreHA4NaJG8aQzR
	5qPsyEAl0f46Epv1YOcqWOgac+508k/MBs1y56UhLr0dplhcfhDm+MVt01UWT44lzPqeeVrLUln
	KOIeiEk2xnVO6q77n0tqKxjr4UHXX0ZL78VuvAn6sTWLHxbA8o0VhVbu93TSKS5p7V66EM+p9S9
	Bj30CZaF4jp+B+pxMe+5ObchzLrEt2qO/E7p+3W0ZnQPIDGXbSYZFGKRRF2rbUJDqvyXHPk6kO5
	zRk+yBUwVzYgxbANrXB49jP9Jlnhsc8m34iTIQm2HYBG8Am7sf2rMIZKeIccSzvgXJEMcrqkc0v
	ZnSu6LlkhVcJbXAPes0K8Du4gCZCFPYh8mXfi8lpKf0e02Uf6j174tgr82+Kj12IkaGx1toH/Hy
	B31PL86tAb92SrnRed2UC42U3pUtPGPtMrv3NFrTXWJO4Grzoz30TljjhUMdzDos/I6F4/2sg=
X-Received: by 2002:a17:903:2309:b0:2b0:c403:5554 with SMTP id d9443c01a7336-2b0c40361a8mr16852485ad.0.1774525620749;
        Thu, 26 Mar 2026 04:47:00 -0700 (PDT)
Received: from ubuntu-2404.. (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc76b6casm28925795ad.16.2026.03.26.04.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:46:59 -0700 (PDT)
From: Akira Yokosawa <akiyks@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Akiyoshi Kurita <weibu@redadmin.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] docs/ja_JP: submitting-patches: Amend "Describe your changes"
Date: Thu, 26 Mar 2026 20:46:37 +0900
Message-ID: <20260326114637.144601-1-akiyks@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

To make the translation of "Describe your changes" (into
"変更内容を記述する") easier to follow, do some rewording and
rephrasing, as well as fixing a couple of mistranslations.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
.../ja_JP/process/submitting-patches.rst      | 107 +++++++++---------
 1 file changed, 53 insertions(+), 54 deletions(-)

diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rst b/Documentation/translations/ja_JP/process/submitting-patches.rst
index 3bb2383871e1..9d63220abd15 100644
--- a/Documentation/translations/ja_JP/process/submitting-patches.rst
+++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
@@ -55,67 +55,66 @@ Documentation/process/maintainer-handbooks.rst.
 変更内容を記述する
 ------------------
 
-問題を記述してください。あなたのパッチが 1 行のバグ修正であっても、
+まず問題点を記べてください。あなたのパッチが 1 行のバグ修正であっても、
 5000 行の新機能であっても、それを行う動機となった根本的な問題が
-必ずあるはずです。修正すべき価値のある問題が存在し、レビューアが
-最初の段落以降を読む意味があることを納得させてください。
+必ずあるはずです。レビューアが、修正すべき問題がたしかに存在し、冒頭の
+段落の続きを読むべきだと納得できるように書いてください。
 
-ユーザーから見える影響を記述してください。クラッシュやロックアップは
+次にユーザーから見える影響を記述してください。クラッシュやロックアップは
 分かりやすいですが、すべてのバグがそこまで露骨とは限りません。
 たとえコードレビュー中に見つかった問題であっても、ユーザーに
 どのような影響があり得るかを記述してください。
 Linux の多くの環境は、上流から特定のパッチだけを取り込む二次的な
 安定版ツリーや、ベンダー／製品固有のツリーのカーネルで動いています。
-したがって、変更を下流へ適切に流す助けになる情報（発生条件、dmesg
+したがって、変更を適切に下流へ流す助けになる情報（発生条件、dmesg
 の抜粋、クラッシュ内容、性能劣化、レイテンシのスパイク、
 ロックアップ等）があれば記載してください。
 
-最適化とトレードオフを定量的に示してください。パフォーマンス、
+次に最適化とトレードオフを定量的に示してください。パフォーマンス、
 メモリ消費量、スタックフットプリント、バイナリサイズの改善を主張する
 場合は、それを裏付ける数値を記載してください。
-また、目に見えないコストについても記述してください。最適化は通常
-無料ではなく、CPU・メモリ・可読性の間でのトレードオフになります。
-ヒューリスティクスの場合は、異なるワークロード間でのトレードオフに
+また、目に見えないコストについても記述してください。多くの場合、
+最適化は CPU・メモリ・可読性の間でのトレードオフとなります。
+ヒューリスティクスの場合は、異なるワークロード間でのトレードオフと
 なります。レビューアがコストとメリットを比較検討できるよう、
-最適化によって予想されるデメリットも記述してください。
+最適化に伴って想定されるデメリットも記述してください。
 
-問題を明確にできたら、実際にどのような対策を講じているかを技術的に
-詳しく記述してください。レビューアがコードが意図したとおりに動作して
-いるかを確認できるよう、変更内容を平易な言葉で書き下すことが重要です。
+問題点の明確化が済んだら、実際にどのような対策を講じているかを技術的に
+詳しく説明してください。コードが意図したとおりに動作していることを
+レビューアが確認できるよう、変更内容を平易な言葉で書き下すことが重要です。
 
-パッチ説明を Linux のソースコード管理システム ``git`` の
-「コミットログ」としてそのまま取り込める形で書けば、メンテナは
-助かります。詳細は原文の該当節を参照してください。
+パッチの説明が Linux のソースコード管理システム ``git`` の「コミットログ」
+としてそのまま取り込める形で書かれていれば、メンテナは助かります。
+詳細は原文の該当節 ("The canonical patch format") を参照してください。
 
 .. TODO: Convert to file-local cross-reference when the destination is
    translated.
 
 1 つのパッチでは 1 つの問題だけを解決してください。記述が長くなり
-始めたら、パッチを分割すべきサインです。詳細は原文の該当節を参照
-してください。
+始めたら、それはパッチを分割すべきサインです。
+詳細は原文の該当節 ("Separate your changes") を参照してください。
 
 .. TODO: Convert to file-local cross-reference when the destination is
    translated.
 
 パッチまたはパッチシリーズを投稿／再投稿する際は、その完全な
-説明と、それを正当化する理由を含めてください。単に、これが
-パッチ（シリーズ）のバージョン N であるとだけ書かないでください。
-サブシステムメンテナが以前のパッチ版や参照先 URL をさかのぼって
-パッチ説明を探し、それをパッチに補うことを期待してはいけません。
+説明と、それを正当化する理由を含めてください。単に「これはパッチ
+（シリーズ）のバージョン N です」とだけ書くのは避けてください。
+サブシステムメンテナが以前のパッチバージョンや参照先 URL をさかのぼって
+パッチ記述を探し、それをパッチに補うことを期待してはいけません。
 つまり、パッチ（シリーズ）とその説明は、それだけで完結しているべき
 です。これはメンテナとレビューアの双方に有益です。レビューアの
-中には、以前のパッチ版を受け取っていない人もいるでしょう。
+中には、以前のパッチバージョンを受け取っていない人もいるでしょう。
 
-変更内容は命令形で記述してください。たとえば、
-「make xyzzy do frotz」とし、
-「[This patch] makes xyzzy do frotz」や
-「[I] changed xyzzy to do frotz」
-のようには書かないでください。あたかもコードベースに対して、
-その振る舞いを変えるよう命令しているかのように書いてください。
+変更内容は、あたかもコードベースに対してその振る舞いを変えるように
+命令するかの如く、（訳補: 英語の）命令形で記述してください。たとえば、
+"[This patch] makes xyzzy do frotz" や
+"[I] changed xyzzy to do frotz" のような言い回しを避け、
+"make xyzzy do frotz" のように書いてください。
 
-特定のコミットに言及したい場合は、コミットの SHA-1 ID だけを
-書かないでください。レビューアがそれが何についてのものかを
-把握しやすくなるよう、コミットの 1 行要約も含めてください。例::
+特定のコミットに言及したい場合に、コミットの SHA-1 ID だけを
+書くのは避けてください。レビューアがそれが何についてのものかを
+把握しやすいよう、コミットの 1 行要約も含めてください。例::
 
 	Commit e21d2170f36602ae2708 ("video: remove unnecessary
 	platform_set_drvdata()") removed the unnecessary
@@ -123,28 +122,29 @@ Linux の多くの環境は、上流から特定のパッチだけを取り込
 	delete it.
 
 また、SHA-1 ID は少なくとも先頭 12 文字を使うようにしてください。
-カーネルのリポジトリには非常に多くのオブジェクトがあるため、
-それより短い ID では衝突が現実に起こり得ます。いま 6 文字の ID に
-衝突がなくても、5 年後もそうだとは限らないことに注意してください。
+カーネルのリポジトリには\ **非常に多くの**\ オブジェクトがあるため、
+それより短い ID では衝突が現実問題となります。6 文字の ID が今現在
+衝突しないからといって、5 年後もそうであるとは限らないことを念頭に
+置いてください。
 
 変更に関連する議論や、その背景情報が Web 上で参照できる場合は、
-それを指す ``Link:`` タグを追加してください。パッチが過去の
-メーリングリストでの議論や、Web に記録された何かの結果であるなら、
+それを指す 'Link:' タグを追加してください。過去のメーリングリスト
+での議論や、Web に記録された何かに由来するパッチならば、
 それを示してください。
 
-メーリングリストのアーカイブへリンクする場合は、できれば
-lore.kernel.org のメッセージアーカイブサービスを使ってください。
-リンク URL を作るには、そのメッセージの ``Message-ID`` ヘッダの内容
-から、前後の山括弧を取り除いたものを使います。例::
+メーリングリストのアーカイブへリンクする場合は、できれば lore.kernel.org
+のメッセージアーカイブサービスを使ってください。リンク URL を作るには、
+そのメッセージの ``Message-ID`` ヘッダの内容から、前後の山括弧を取り除いた
+ものを使います。例::
 
     Link: https://lore.kernel.org/30th.anniversary.repost@klaava.Helsinki.FI
 
 実際にリンクが機能し、該当するメッセージを指していることを
-確認してください。ただし、外部リソースを見なくても説明が理解できる
-ようにするよう努めてください。
+確認してください。
 
+ただし、外部リソースを見なくても説明が理解できるようにするよう努めてください。
 メーリングリストのアーカイブやバグへの URL を示すだけでなく、
-投稿されたパッチに至った議論の要点も要約してください。
+投稿されたパッチに至った議論のポイントも要約してください。
 
 パッチがバグを修正するものであれば、メーリングリストのアーカイブや
 公開バグトラッカー上の報告を指す URL を付けて、``Closes:`` タグを
@@ -153,23 +153,22 @@ lore.kernel.org のメッセージアーカイブサービスを使ってくだ
     Closes: https://example.com/issues/1234
 
 このようなタグ付きのコミットが適用されたとき、自動的に issue を
-閉じられるバグトラッカーもあります。メーリングリストを監視している
+閉じるバグトラッカーもあります。メーリングリストを監視している
 ボットの中には、そのようなタグを追跡して一定の動作を行うものも
-あります。非公開のバグトラッカーや無効な URL は禁止です。
+あります。ただし、非公開バグトラッカーの（訳補: 部外者が）閲覧できない
+URL は禁止です。
 
-パッチが特定のコミットに含まれるバグを修正するものであれば、
-たとえば ``git bisect`` で問題を見つけた場合には、SHA-1 ID の
-先頭少なくとも 12 文字と 1 行要約を含めて、``Fixes:`` タグを
+パッチが特定のコミットに含まれるバグを修正するもの、たとえば
+``git bisect`` で問題を見つけたものの場合には、SHA-1 ID の
+先頭少なくとも 12 文字と 1 行要約を含めて 'Fixes:' タグを
 使ってください。タグを複数行に分割してはいけません。タグは
 解析スクリプトを単純にするため、「75 桁で折り返す」規則の
-例外です。
-
-例::
+例外です。例::
 
     Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the number of pages it actually freed")
 
-上の形式を ``git log`` や ``git show`` で出力しやすくするために、
-次の ``git config`` 設定を使えます::
+``git log`` や ``git show`` の出力を上の形式で整形させるには、
+次の ``git config`` 設定が使えます::
 
     [core]
         abbrev = 12

base-commit: 0a4f3ef9880e505d41817419b0255d6552776143
-- 
2.43.0

