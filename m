Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE863331A63
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 11:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115400; cv=none; b=AB1FX4vyOnOG8GxRd3rg+vDzSVT58C3NRKCn/US9wzuM2dn2ubgARNhV/jlgxL9m4siMRSviDmlbY/ZfqhahjSmz4rJSOgT1abdE5nnwEUktkS7q7PjFrBRzWbTfuGAKdPykCNRvFEV/7p1l4D00KRonBc4pF24oktQmNmoGfzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115400; c=relaxed/simple;
	bh=MMMl8hkvNXHGIjAcNd5VnOWQqCUC39kXkyqVusSsOKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GC/HlwjyKUvfuRaajnBR4D/y72+iykZGt73NaJC4p8HcI+I7YhWjGmZL50enJasnN36M4Qg20TALzP/2Ym0R02OUIYHJWMUTl3/P1qAURQVfqimtuWkx+T1qTbfKPviEneE+j0GDKL3kO1P9gtRlve9WiZZYpNvrNUzYypiGtdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pcgqycd2; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pcgqycd2"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8453427d3f4so4728833b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 04:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784115398; x=1784720198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q1rkqxv4ZGoC3acW8/iHr6X+BxLK+1G+X2EMHAFXZfA=;
        b=Pcgqycd2S33G4Mgx/7g8WQ1oCsBBOx5sh99XEQNmaSbExC3Yp0GtLmgkeHZFHrW5AG
         IKn4RkUsd2bt9CMu5TXZ5b922VQHiHG9F0TlaB+qJ5+fsJsywt+e9/4xuMiBpnVGyXYB
         2V489bGz/Ze/jpH6d4IA6EdnvdSu0EoU8XtHVtIUVx/peIKu6yK2iU7RtHRzG9ZSCQWW
         rb4Uz9aJiwrks3E3+n5/J0mMmg7R50myQQq4b9iMuK0lVd42wU0F6LPBGEKovyi5/8Hs
         TSAqqkYdGGjycTEhr0iEUI3Tracz6a6dtNohoS/kBQxiKEvbDm2FE0HW0oonAusKNfZo
         MtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115398; x=1784720198;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q1rkqxv4ZGoC3acW8/iHr6X+BxLK+1G+X2EMHAFXZfA=;
        b=s2ts2n5cZe8DMsgkrlr6Bcm3nu6kWkYJCj0yMa/lXtmDf8ieUISqkoKZzipI/JhXOE
         1Vv94ag42lyUBQim29iIXGU3ADuWnmoDIs3Et4hC8oJG68yEALatMhkrtSFnfT6NKVeD
         S/PW3af9GYr6YdIZHYRkhvyR93bFKmrYv0QvxpZwc8qxrV3YSAHBj+L5KOTV3u9ibP81
         aUzxZS9bsxfaVKCThCE5t6v67YBgwuN6MMuukN+LK0V5gcHqqECDZHnrppsk1GEbuYuT
         HkH8JLS9RK6xvYNDEeZ5JNKmCvgaeSfK5gVcmNoRCKLuC8Hfagp7lOWTEbtP/Vp+iTSQ
         vPfQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3EI4KGjJaXCpZN3BxK2z0+VuMSqyThhAcQ30bggtUmux9oxsTeCPdsUrxIHxRBQ+2C5BJZhWQf90=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn+Mrmz91asifpjsT4t4lotibuI9B624YSmu4llAO9meTQmjEm
	kMNfaSJ4feAVS+p1G0jkSP8vJFXdugZYwIFbwgytg9OTQSWjmnt7cwIyj2186g==
X-Gm-Gg: AfdE7clQSeGXrtxX34JWWGa/cat2YfMDsRl6mGdayn3GjmMMDiBv2ZvAL8ZiXUAQBKD
	/1HdEX3H/Nf/8z+L2qF/+1rgROjZ9LWMFNBOKNhst7+aWOOfpUSoP67NMl2fD3OiM6ns6pg7zvM
	gsFqE3oH4klLiYB3L+dUzR/vOtLE5JrMlq5mZHJu4eBzFngMwY5LF9t2b07W+zztX+rlBw/dl7X
	37tl2R2K9QQbTJWRdbNmrEwiVcpjOXjI7cmGOrRr/Bfxn4QCawWWtdiXelMLj9kSwfrmNFWU8Po
	iAkMIFmUSyKuwAgvMdGndo0cM7ZLGTgjhkR2T3CWW4v3eACC7M6fTKnk1VQb9j5Y0NebmLbBAVA
	syBGuOXglpyf8JEUB+tQwX3qpAWWyTP3+npavIaVJrySVikFxix6dQxBcBnVx2OBdSVuDT2MQKS
	N1jW6RvtcheEVRbcoiBE530WhuxJgs9DJKUklVdX6oH9JclJrU1Iw61JA7uFcI
X-Received: by 2002:a05:6a00:2448:b0:848:4859:a45 with SMTP id d2e1a72fcca58-84a671da508mr2180810b3a.2.1784115397796;
        Wed, 15 Jul 2026 04:36:37 -0700 (PDT)
Received: from ubuntu-2404.. (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6be668sm3032869b3a.35.2026.07.15.04.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:36:37 -0700 (PDT)
From: Akira Yokosawa <akiyks@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH v2] docs/ja_JP: submitting-patches: Refine wording etc for "splitting changes" and later
Date: Wed, 15 Jul 2026 20:36:16 +0900
Message-ID: <20260715113616.94305-1-akiyks@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Resolve rough edges in translation text added since commit 61e4155c81d1
("docs/ja_JP: translate more of submitting-patches.rst").

As with commit 999084ee0b11 ("docs/ja_JP: submitting-patches: Amend
"Describe your changes""), do the following tweaks:

- Rewording and rephrasing.
- Suppress extra white spaces rendered before and after strong emphasis
  in HTML and PDF by using espcaped spaces.
- Provide translation words for "embargo", "word-wrap", "top-posting",
  etc.
- Rather than keep "interleaved replies", use only 「インライン返信」
  ("inline reply"), which is a popular term in Japanese.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Akiyoshi Kurita <weibu@redadmin.org>

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
v2: Use 「件名」 for "subject line".
    (Inspired by Kurita-san's submission at:
        https://lore.kernel.org/20260712210535.161387-1-weibu@redadmin.org/
    , "[PATCH v3] docs/ja_JP: translate submitting-patches.rst (sign-off)")
--
 .../ja_JP/process/submitting-patches.rst      | 150 +++++++++---------
 1 file changed, 75 insertions(+), 75 deletions(-)

diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rst b/Documentation/translations/ja_JP/process/submitting-patches.rst
index d31d469909e4..d8ee82ba790b 100644
--- a/Documentation/translations/ja_JP/process/submitting-patches.rst
+++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
@@ -182,7 +182,7 @@ URL は禁止です。
 変更を分割する
 --------------
 
-各 **論理的な変更** は、個別のパッチに分けてください。
+それぞれの\ **論理的な変更**\ は、個別のパッチに分けてください。
 
 たとえば、単一のドライバに対する変更にバグ修正と性能改善の
 両方が含まれるなら、それらは 2 つ以上のパッチに分けてください。
@@ -208,7 +208,7 @@ URL は禁止です。
 ことがあります。途中でバグを持ち込めば、彼らに感謝されることは
 ないでしょう。
 
-パッチセットをこれ以上小さくできないなら、一度に投稿するのは
+パッチセットをそれ以上小さくできないなら、一度に投稿するのは
 15 個程度までにして、レビューと統合を待ってください。
 
 
@@ -220,18 +220,17 @@ Documentation/process/coding-style.rst を参照してください。
 これを怠ると、単にレビューアの時間を無駄にするだけでなく、
 パッチはおそらく読まれもせずに却下されます。
 
-大きな例外が 1 つあります。コードをあるファイルから別の
-ファイルへ移動する場合です。このときは、コードを移動する
-その同じパッチの中で、移動したコードを一切変更してはいけません。
-そうすることで、コードの移動という行為と、あなたの変更とを
-明確に区別できます。これは実際の差分のレビューを大いに助け、
-ツールがコード自体の履歴をより適切に追跡できるようにします。
+一つの重要な例外は、コードをあるファイルから別のファイルへ移動する場合です。
+その際は、コードを移動するその同じパッチの中で、一切コードを変更しては
+いけません。これにより、コードの移動という行為と、コードの変更とが
+明確に区別されます。これは実際の差分のレビューを大いに助け、また、ツールを
+使ったコード変更の履歴の追跡を容易にします。
 
 提出前に、パッチスタイルチェッカー
 (``scripts/checkpatch.pl``) でパッチを確認してください。
-ただし、スタイルチェッカーは指針として見るべきであり、
+ただし、スタイルチェッカーは指針にすぎず、
 人間の判断に取って代わるものではないことに注意してください。
-違反があっても、その方がコードの見栄えがよいなら、
+違反が指摘されるままのコードの方が見栄えがよいなら、おそらく
 そのままにしておくのが最善でしょう。
 
 チェッカーは 3 つのレベルで報告します:
@@ -240,8 +239,7 @@ Documentation/process/coding-style.rst を参照してください。
  - WARNING: 慎重なレビューを要するもの
  - CHECK: 検討を要するもの
 
-パッチに残した違反については、すべて理由を説明できなければ
-なりません。
+パッチに違反を残す場合は、そのすべてを正当化できなければなりません。
 
 
 パッチの宛先を選択する
@@ -256,8 +254,8 @@ Documentation/process/coding-style.rst を参照してください。
 サブシステムのメンテナが見つからない場合は、Andrew Morton
 (akpm@linux-foundation.org) が最後の手段となるメンテナです。
 
-すべてのパッチでは、デフォルトで linux-kernel@vger.kernel.org を
-使うべきですが、このリストの流量が多いため、目を通さなくなった
+すべてのパッチは、デフォルトで linux-kernel@vger.kernel.org にも
+送られるべきですが、このリストは流量が多く、目を通さなくなった
 開発者も少なくありません。とはいえ、無関係なメーリングリストや
 無関係な人々にスパムを送らないでください。
 
@@ -268,103 +266,104 @@ Documentation/process/coding-style.rst を参照してください。
 Linux カーネルに採用されるすべての変更の最終的な裁定者は
 Linus Torvalds です。彼のメールアドレスは
 <torvalds@linux-foundation.org> です。Linus は大量のメールを
-受け取っており、現時点では彼に直接届くパッチはごくわずかなので、
-通常は彼にメールを送ることを極力避けてください。
+受け取っており、現時点では直接彼を経由するパッチはごくわずかなので、
+通常は彼にメールを送ることを極力\ **避けて**\ ください。
 
-悪用可能なセキュリティバグを修正するパッチがあるなら、
-そのパッチを security@kernel.org に送ってください。深刻なバグに
+悪用可能なセキュリティバグを修正するパッチの場合は、
+それを security@kernel.org に送ってください。深刻なバグに
 ついては、ディストリビュータがユーザーにパッチを配布できるよう、
-短期間の embargo が検討される場合があります。そのような場合、
-そのパッチを公開メーリングリストに送るべきではありません。
+短期間の秘匿措置 (訳註: embargo) が検討される可能性があります。
+ですので、その種のパッチを公開メーリングリストに送らないでください。
 Documentation/process/security-bugs.rst も参照してください。
 
 リリース済みカーネルの深刻なバグを修正するパッチは、次のような行を
-パッチの sign-off 欄に入れることで、stable メンテナへ向けてください::
+パッチの sign-off 欄に入れることで、stable メンテナに知らせてください。
+(メールの宛先ではないことに注意。) ::
 
   Cc: stable@vger.kernel.org
 
-これはメールの受信者ではないことに注意してください。また、
-この文書に加えて Documentation/process/stable-kernel-rules.rst も
-読んでください。
+また、この文書に加えて Documentation/process/stable-kernel-rules.rst
+も読んでください。
 
 変更がユーザーランドとカーネルのインターフェースに影響する場合は、
 MAINTAINERS ファイルに記載されている MAN-PAGES メンテナに
-man-pages パッチ、少なくとも変更の通知を送って、情報が
-マニュアルページに反映されるようにしてください。ユーザー空間 API の
+マニュアルページのパッチ、もしくは少なくとも変更の通知を送って、情報が
+そちらにも反映されるようにしてください。ユーザー空間 API の
 変更は、linux-api@vger.kernel.org にも Cc してください。
 
 MIME・リンク・圧縮・添付なし、プレーンテキストのみ
 ----------------------------------------------------
 
 Linus や他のカーネル開発者は、あなたが投稿する変更を読み、
-コメントできる必要があります。カーネル開発者が標準的な
-メールツールを使ってあなたの変更を「引用」し、コードの特定の
-箇所についてコメントできることが重要です。
+コメントできる必要があります。カーネル開発者にとって、コードの特定の
+箇所について、標準的なメールツールを使ってあなたの変更を「引用」し、
+コメントできることが重要です。
 
-このため、すべてのパッチはメール本文中に ``inline`` で投稿すべきです。
+このため、すべてのパッチはメール本文中に「インライン」で投稿すべきです。
 これを行う最も簡単な方法は ``git send-email`` を使うことであり、
 強く推奨されます。``git send-email`` の対話型チュートリアルは
-https://git-send-email.io で利用できます。
+https://git-send-email.io にあります。
 
-``git send-email`` を使わないことを選ぶ場合:
+``git send-email`` を使わない場合:
 
 .. warning::
 
-  パッチをコピー＆ペーストする場合は、エディタの word-wrap によって
-  パッチが壊れないよう注意してください。
+  パッチをコピー＆ペーストする際に、エディタによる自動改行で
+  パッチが壊されないよう注意してください。
 
 圧縮の有無にかかわらず、パッチを MIME 添付ファイルとして添付しては
-いけません。多くの一般的なメールアプリケーションは、MIME 添付
-ファイルを常にプレーンテキストとして送信するとは限らず、あなたの
-コードにコメントできなくなります。MIME 添付ファイルは Linus が
-処理するのにも少し余分な時間がかかるため、MIME 添付された変更が
-受け入れられる可能性を下げます。
+いけません。よく使われるメールアプリケーションの多くは、MIME 添付
+ファイルをプレーンテキストとして送信するとは限らず、あなたのコードに
+対するコメントを妨げます。MIME 添付ファイルは Linus (訳補: をはじめ
+とする開発者）が処理するのに余分な手間がかかるため、MIME 添付すると
+その変更が受け入れられる可能性を下げることになります。
 
-例外:  メーラがパッチを壊してしまう場合は、誰かから MIME を使って
-再送するよう求められることがあります。
+例外:  パッチがメーラーによって壊されている場合に、MIME による再送
+を求められることがあります。
 
-パッチを変更せずに送信するようメールクライアントを設定するための
-ヒントについては、Documentation/process/email-clients.rst を参照してください。
+改変なしにパッチを送信するためのメールクライアント設定のヒントは、
+Documentation/process/email-clients.rst を参照してください。
 
 
-レビューコメントに返答する
+レビューコメントに応答する
 --------------------------
 
-あなたのパッチには、ほぼ確実に、パッチを改善する方法について
-レビューアからコメントが付きます。それは、あなたのメールへの返信という
-形で届きます。それらのコメントには必ず返答してください。レビューアを
-無視することは、こちらも無視されるためのよい方法です。コメントに
-答えるには、単にそのメールへ返信すれば構いません。コード変更に
+あなたのパッチには、ほぼ確実に、その改善に向けてレビューアから
+コメントが付きます。それは、あなたのメールへの返信という
+形で届きます。それらのコメントには必ず応答してください。レビューアを
+無視することは、あなたが無視されることにつながります。コメントに
+答えるには、単にそのメールへ返信すればよいです。コード変更に
 つながらないレビューコメントや質問であっても、次のレビューアが状況を
-よりよく理解できるように、ほぼ確実にコメントまたは changelog エントリに
-反映すべきです。
-
-どのような変更を行うのかをレビューアに必ず伝え、時間を割いてくれた
-ことに感謝してください。コードレビューは疲れる、時間のかかる作業であり、
-レビューアが不機嫌になることもあります。そのような場合であっても、
-丁寧に返答し、指摘された問題に対応してください。次の版を送るときは、
-cover letter または個々のパッチに ``patch changelog`` を追加し、前回の
+よりよく理解できるよう、多くの場合、コメントまたは changelog エントリ
+として残すべきです。
+
+どのような変更を行うのかを忘れずにレビューアに伝えてください。そして
+時間を割いてくれることへの感謝を忘れないでください。
+コードレビューは疲れる、時間のかかる作業であり、
+ときにはレビューアが機嫌を損ねることもあります。そのような場合でも、
+丁寧に応答し、指摘された問題に対応してください。次の版を送る際には、
+カバーレターまたは個々のパッチに ``patch changelog`` を追加し、前回の
 投稿との差分を説明してください。詳細は原文の該当節
 ("The canonical patch format") を参照してください。
 
 .. TODO: Convert to file-local cross-reference when the destination is
    translated.
 
-あなたのパッチにコメントした人には、パッチの Cc リストに追加して、
-新しい版を知らせてください。
+あなたのパッチにコメントしてくれた人たちは、パッチの Cc リストに追加して
+新しい版について知らせてください。
 
 メールクライアントとメーリングリストでの作法についての推奨事項は、
 Documentation/process/email-clients.rst を参照してください。
 
-メール議論では不要な引用を削った interleaved replies を使う
-------------------------------------------------------------
+要点に絞ったインライン返信での議論
+---------------------------------------
 
-Linux カーネル開発の議論では、top-posting は強く非推奨とされています。
-Interleaved replies、または ``inline`` replies を使うと、会話の流れを
-ずっと追いやすくなります。詳細は次を参照してください:
+Linux カーネル開発の議論では、全文引用 (訳註: top-posting) は強く非推奨です。
+インライン返信 (訳註: interleaved reples or "inline" replies) を使うと、
+会話の流れをずっと追いやすくなります。詳細は次を参照してください:
 https://en.wikipedia.org/wiki/Posting_style#Interleaved_style
 
-メーリングリストでは、よく次のように引用されます::
+これについて、メーリングリストでは、次の引用をしばしば目にします::
 
   A: http://en.wikipedia.org/wiki/Top_post
   Q: Where do I find info about this thing called top-posting?
@@ -381,24 +380,25 @@ https://en.wikipedia.org/wiki/Posting_style#Interleaved_style
   Q: Should I include quotations after my reply?
 
 
-落胆しない、そして急がない
---------------------------
+落胆しない - いらいらしない
+---------------------------
 
 変更を投稿した後は、辛抱強く待ってください。レビューアは忙しい人たちであり、
-あなたのパッチをすぐに見られるとは限りません。
+あなたのパッチにすぐに取りかかれるとは限りません。
 
 かつては、パッチが何のコメントもなく虚空へ消えていくこともありましたが、
 現在の開発プロセスはそれよりも円滑に機能しています。数週間以内、
 通常は 2〜3 週間以内にコメントを受け取るはずです。そうならない場合は、
 パッチを正しい場所へ送ったか確認してください。再投稿したりレビューアに
-ping したりする前に、少なくとも 1 週間は待ってください。merge window の
-ような忙しい時期には、さらに長く待つ方がよい場合もあります。
+ping したりする前に、少なくとも 1 週間は待ってください。マージ期間
+(訳註: merge window) のような忙しい時期には、さらに長く待ちましょう。
 
-数週間後に、subject line に "RESEND" を追加して、パッチまたは
-パッチシリーズを再送しても構いません::
+数週間後に、件名に "RESEND" を追加したパッチまたはパッチシリーズを
+再送することは構いません::
 
    [PATCH Vx RESEND] sub/sys: Condensed patch summary
 
-パッチまたはパッチシリーズの修正版を投稿する場合は、"RESEND" を
-追加しないでください。"RESEND" は、前回の投稿から一切変更していない
-パッチまたはパッチシリーズを再送する場合にのみ使います。
+ただし、パッチまたはパッチシリーズの修正版を投稿する際には "RESEND"
+を追加しないでください。
+"RESEND" は、前回の投稿から一切変更のないパッチまたはパッチシリーズの
+再送だけに当てはまります。

base-commit: 4108b688d3a456ee1d04c15fa09bcd1cfa9bc425
-- 
2.43.0

