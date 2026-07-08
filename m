Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774C8405C30
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 10:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783508369; cv=none; b=Q3cRzvsKpNzUNMY4qENZYA9BPxC78lIpLpSOb2ysOEz9IPqzu/6y5GSQx1nhjpT4QicfxXXrsVxjNucGZ5CjkAbFRAzvPOlm1VRnizqx8aVuzxJzuhV/BF8Ha6QBSro7GXyo9vTQZJfO7neHc4atvgJC/wMycU4yLCZkLPparXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783508369; c=relaxed/simple;
	bh=NFroFX5L47tzT5lUjRdEpTIj20bWWs2qlriH2hOmBBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CZyRTTSndq8tYIm/zo76XMSKOA9f8ol+XA/oCXKxpoed8Kl5GvPUwIu/R9wGpfe/w5XE9KLBiZipxPnAm9bIc283NU3NeWRbT/irBUcblwfKxqWsA9eyPXlpsjSATY48tWTDnyWGO1KpZqr/F+q5BEA6NL6RRteAFZS8tU0bEkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWBSHCf2; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWBSHCf2"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-381891a9525so676570a91.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 03:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783508363; x=1784113163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bikp1xGXJkxccYxznAEASXFZtMNyKcxCQ1sq/BOiCcc=;
        b=VWBSHCf28o7VqtA1PxjH9BcFW+Oa8QlkpHd3Eg3Pzf1XleNMCBGFtdp0rD01hxO7x/
         OmUeLePDYt8vpb7+hiMliSsy/QSKpxuYRPAalh/zMzD15/gKdXf4cD5SZtz7ogt6XWYc
         XIIVi/wfDOMUU+oOfXYpGT659TmqvcJNt9ld9/aZmlQkyQ2IIS22avxBkOLcoA2vDkfQ
         mrnyqwJXv1pQM5xlLHthqDuXTAM8iw/rEZcofvAOMzynKDGTRcIARqRgvXuO/HRIPrK/
         LfwwT9kO/yBR3WNFSINk7S74KpMiggfzFe/D7ojQZeBT1ZBLmVU1EMcFvLdTGpMKopjZ
         vWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783508363; x=1784113163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bikp1xGXJkxccYxznAEASXFZtMNyKcxCQ1sq/BOiCcc=;
        b=UNPErAFs6ebf0TBveRKQFvV7y7zfAZpSkKYijl7u4DACkMle/cT4dyXlCRbrRDmp0a
         7r5X9nlJ7o5wxW+1NtDyOVbx2aIYUltHYipnG1nLSUlihmYcyfP6RZ0Jbps7IzVc35qi
         Ti+sSPS9USSMrkPdWo6IxGY770S3JNELwYjuyHOMobslRvqrurgMs9m12RqYw/worSta
         u0fygCpxFdxOhAjaH8vMex1382F8mSEYdujL3rquiGYw0GMfZXZX+mEG1wRl7xrb/uiY
         LCEr/SJIjUc9zBRiXq6nn7A4mTLc/EwtQPwvdZmGqGzGesd2KhidOTzS9ThBwWXMA4tf
         I9pA==
X-Forwarded-Encrypted: i=1; AHgh+Rra3y/8/zz5pWbgMtUtArkOw++i75aT0Q3OTYTYQzFBaT+ks9LQCXM0wkxUFSgv9I3UfPNitrETHFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX4ZjUeuTlRtUOButETBIpUpjK9iDj9oMVf76pzcrvC7AF12I+
	4f13qHZk44XoU3C38N98MzR93zECO689nW1OtxNFLP/8mufmnXK0YHzj
X-Gm-Gg: AfdE7cmKAxUV6MjLr/L9829WctFV56iQTjurtle5NBl4E8XtPHWTLae+PJQAq4Fti6p
	xW90YJdcU2Dj4YKeouAQsyArY9U13R6IsVeH5ay9ur6JLmnDXMctTCp3XJMtNqht52P4HHCCpAG
	3YGOyjcb4e2/hPiOhEYz63J7e99Ko3xEvxqjK97ICDr1Zfhv/YKiyAXHXrgZqrXiCwQjo5QS4dt
	vHaJcQUsqHXCLDImwtFwR6aljB4T9vm436NJp9wbmLbXaWuTtNycKPlrsS+4uQnvrwb8buLMpdJ
	oybteeNtP6XSR9ShXHMj1bg4X2T+c6N8cSsFflsH2XQ1TFfkFZeB00BPaturpVVPHw10tAZGuMc
	BhSNck8l4/09O9BvFAj8Otcg8Q3U+Rgh+02YaRAzI3qtze1FF4095igijTwOirzJLH9uwOqnwhZ
	R5xBvbj7plMusRHqSpLZSZcQpm3dkQJEtmWFxhbablg/NgbOEU/KAxUhy59rly
X-Received: by 2002:a17:90b:57ee:b0:380:a5a9:7586 with SMTP id 98e67ed59e1d1-3893f693819mr2200362a91.6.1783508362994;
        Wed, 08 Jul 2026 03:59:22 -0700 (PDT)
Received: from ubuntu-2404.. (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d17e9ff3sm2558148a91.7.2026.07.08.03.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 03:59:22 -0700 (PDT)
From: Akira Yokosawa <akiyks@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH] docs/ja_JP: submitting-patches: Refine wording etc for "splitting changes" and later
Date: Wed,  8 Jul 2026 19:59:03 +0900
Message-ID: <20260708105906.40954-1-akiyks@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
---
Kurita-san,

If you find some of my word choices strange, please submit a patch
on top of this change.

Thanks,
Akira

.../ja_JP/process/submitting-patches.rst      | 150 +++++++++---------
 1 file changed, 75 insertions(+), 75 deletions(-)

diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rst b/Documentation/translations/ja_JP/process/submitting-patches.rst
index d31d469909e4..fa794a44d8c4 100644
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
+数週間後に、サブジェクト (訳註: subject line) に "RESEND" を追加して、
+パッチまたはパッチシリーズを再送しても構いません::
 
    [PATCH Vx RESEND] sub/sys: Condensed patch summary
 
-パッチまたはパッチシリーズの修正版を投稿する場合は、"RESEND" を
-追加しないでください。"RESEND" は、前回の投稿から一切変更していない
-パッチまたはパッチシリーズを再送する場合にのみ使います。
+ただし、パッチまたはパッチシリーズの修正版を投稿する際には "RESEND"
+を追加しないでください。
+"RESEND" は、前回の投稿から一切変更のないパッチまたはパッチシリーズの
+再送だけに当てはまります。

base-commit: 2933b82083e758fe6cfff570143541d4dba672c3
-- 
2.43.0

