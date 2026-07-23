Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B924379EE4
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 12:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810523; cv=none; b=qGs/VgzOhERlPFk9RtOapPOpk8AI199zV93zExo9GHtNTPpSW3FuJoRiFUQHr2yUPyU9N1RTq43QF+I/0pI9ZA4JbbuRkPt3k6SQdFwOng6z0Zwzu2i15lVefAi8qlQy8J/6xnZbhMyia43RpgPjAtnx9Rwn1RWwpV29wpdGee4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810523; c=relaxed/simple;
	bh=yWRZZx48/1+QRaV01xDx2WyFeNnvYgY8OCFiVylVp4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=fIiRCWR6GOhFj8Lv0ZiqfPC29qpwdCu27mw+xuQzGca6ymVa3zBgowODicEKVlrP7lnE7igDq7BSCOrB0XQ5eKKAgQgcfD5frRtdYrMjdx+U01uTvd/3bAh0pWSfyvjNZXNTjRX3qov4OMtahapB4tBnR1QtdXbyeKc+rUmhEoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OvA7qCTR; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvA7qCTR"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso6502315ad.2
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 05:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784810521; x=1785415321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUoF37NPNyYkQ70X7zrm0/tJvcnz9xdkZRDVuycG4iw=;
        b=OvA7qCTRPklOMxhCaWKYhuHeFx4zj0PHMCTofy6fjPAANEVJ79dGCNZ34NB0G50Ug6
         OMhUt+1zY241ZA0LHkBmK6lqUjVUW8SWG00BXQtjrB2L/mhQZ6E7sB/9TBFn92Gi+njJ
         87oOxTM6FAHJIzMEfC6DgQDDpHeehgv8HJ0E6JrG/koQIPMXfdJ2ccBKRlHFJFqcqV9L
         ja+gFWVhopGbkO692Kt1EDaMkM8yNtUgoIeWhlz9J5XKS4vVmWjodU2ABS0y8Hu4hGEJ
         uzMQz/96qtcaHa1Nx+P0WFOeMmi2EmvSjOk+ui07clNp30mnVuCk+NemUYMHvIEdXsVi
         SVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784810521; x=1785415321;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUoF37NPNyYkQ70X7zrm0/tJvcnz9xdkZRDVuycG4iw=;
        b=l76rojULjk4ZdwSLAQ7iP1w3FhRshcMZMuQ9/emjfXAZ+q7Aert8XHJ3PQ8JeXb7nn
         jiXWFK9h4cpgCgwMq4cIoy20WpGcaTKK3Wj9D4WPKl5hDKtOXA/amZ3H2Ngr72g93rLO
         rz5/6UV2HSK8OVSl1yFUzJW0x9H7CK0VC0JwH2FTvjGJwao1oJRjMGIkW40zAiw+D74O
         UznTQA0WONmrNIpJv3EyLq3ublmgRCqGCZtJ1Geq8lipEIpppSEenltOX7rEUMLkj9T0
         BxmAcdU/oXR4dTLzTb+Yn0FpPyDugI7nD+gbJiX6g5E7ZYSrLCppZvwH6pS1tGsdOSTr
         SOgg==
X-Gm-Message-State: AOJu0YyULkGKYAQIfjJZrmNxgLkaNfF/BcXzGvmOC/acYoEIDfirXVCB
	+5PdJi2Fkv5W+HlNjsF7rvUZTKdXnvuHrYoiwiu7W8WLMhnxOlXdADDb
X-Gm-Gg: AR+sD11BX2IM80djK+1nqXML3SsVo2d+wlTRLu3WTvEyzw7Stypc3MYN24CbVjvR4WX
	j3y7i1FyBojd9dB4Stnt6Twa0FgzfOQPG4NyS7TYZX88ElSGaAjdfmwYpXgGgAMEH+EwdUXPu3H
	dUL0phCznMdy9QOQuQ+gUGB/jeRCf+T8atsTnHOytYYS9GqncnO5MaU0byPNLyupieC+7dAQUTp
	MaLyB7lvm/0S9cRk9jRE8zZrJbACw01dn6qz6mGXv/XphaJVmiP3T1fw2V5xOb7QnZEP3Ky2MJA
	afMl3URfcM6UNQgan9vhLWles2PAGkN8XwlPXnQebXr7mfJxs4AU5XXtH5uHRyDKKAXCMS/aXSB
	Yjv+3FuBPc91YUJAFwxAxmKtfd/cOk7aO7/ssXQS505DmfYTkLDGCPwrIrNOIsWObunN4O905HU
	HAf4KCKjXfoV4V0dEYyRjypu9gYRiyIVYfONXNONkmNnZVTdXIbl5aj5c=
X-Received: by 2002:a17:903:26cf:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2cfa67031b5mr36389815ad.0.1784810520566;
        Thu, 23 Jul 2026 05:42:00 -0700 (PDT)
Received: from ?IPV6:2001:ce8:127:3775:2d97:7c40:61a3:f603? ([2001:ce8:127:3775:2d97:7c40:61a3:f603])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efde5cfsm33119345ad.31.2026.07.23.05.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 05:41:59 -0700 (PDT)
Message-ID: <4eb100d4-8bf5-40b7-ae51-0c736e90901a@gmail.com>
Date: Thu, 23 Jul 2026 21:41:25 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2]docs: ja_JP: Add 1.Intro.rst Japanese Ver
Content-Language: en-US
To: Akira Yokosawa <akiyks@gmail.com>
References: <CAKJLdqb=dqSJ56FSRL2eBJWdtuknjkmDo=+et_BZOmbWUHuKJA@mail.gmail.com>
 <113d2aa0-a4b3-4bda-81ba-9d23cc237d0a@gmail.com>
 <5f24dbf4-d98a-4ab9-8dcf-dcadcf9307cd@gmail.com>
 <c1006587-c2f6-4ae0-948f-217bb0ff3509@gmail.com>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net
From: dayodayo <dayodayo1410@gmail.com>
In-Reply-To: <c1006587-c2f6-4ae0-948f-217bb0ff3509@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


From d4614a0754863767726edf4ae1dba3f058c30d54 Mon Sep 17 00:00:00 2001
From: Sakamoto Yuto <dayodayo1410@gmail.com>
Date: Mon, 20 Jul 2026 09:29:46 +0900
Subject: [PATCH v3] Translate Documentation\process\1.Intro.rst into Japanese
 to Documentation\translations\ja_JP\1.Intro.rst
Signed-off-by: Sakamoto Yuto <dayodayo1410@gmail.com>
---
 .../translations/ja_JP/process/1.Intro.rst    | 176 ++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 Documentation/translations/ja_JP/process/1.Intro.rst
diff --git a/Documentation/translations/ja_JP/process/1.Intro.rst b/Documentation/translations/ja_JP/process/1.Intro.rst
new file mode 100644
index 000000000000..a3d0a12fdf75
--- /dev/null
+++ b/Documentation/translations/ja_JP/process/1.Intro.rst
@@ -0,0 +1,176 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. Originally contributed by Sakamoto Yuto
+
+はじめに
+========
+
+.. note:: 【訳註】
+   この文書は、
+   Documentation/process/howto.rst
+   の翻訳です。
+   免責条項については、
+   :ref:`免責条項の抄訳 <translations_ja_JP_disclaimer>` および、
+   :ref:`Disclaimer (英語版) <translations_disclaimer>` を参照してください。
+
+概要
+----
+
+この章の以下の部分では、カーネル開発プロセスの範疇と開発者やその企業が直面し得る問題に関して、説明を行います。
+カーネルコードは公式(メインライン)カーネルにマージされるべき理由は数多く存在します。
+ユーザーへの自動提供、多様な形態でのコミュニティ支援、かつカーネル開発の方向性に影響を与える等が、例として挙げられます。
+Linuxカーネルに貢献するコードは、必ずGPL互換ライセンスの下、公開してください。
+
+:ref:`development_process` は開発プロセス、カーネルのリリース周期、マージウィンドウの仕組みの三つに関して、説明されています。
+パッチの開発、評価、マージ周期の段階が、説明されています。
+これまで、ツールやメーリングリストに関しての質問や議論が、いくつかありました。
+カーネル開発をしてみたい開発者は、最初の練習としてバグの発見と修正をおすすめします。
+
+:ref:`development_early_stage`はできる限り早期段階での開発者のプロジェクト策定への関与について説明しています。
+
+:ref:`development_coding`はコーディングプロセスに関してであり、他の開発者が遭遇した落とし穴について議論されています。
+パッチに係るいくつかの要件が説明され、そしてパッチの正確性の確認を手助けするツールについて紹介されています。
+
+:ref:`development_posting`はレビューの為のパッチを投稿するプロセスについて、説明しています。
+開発コミュニティにあなたのパッチを真剣に受け取ってもらうには、パッチは適切な構成で記述され、且つ正しい場所に必ず送信されなければなりません。
+このアドバイスに従って頂ければ、あなたの努力は最良の形で受け入れられる事でしょう。
+
+:ref:`development_followthrough`はパッチの投稿後、何が起こるかについて説明しています。作業は評価される迄を以て作業と言うのです。
+レビュアーと共に作業する事は開発プロセスに於いて重要であり、この章ではこの大事な段階に於いて如何に問題を回避するかについていくつかヒントを提供します。
+開発者はメインラインにパッチが統合された時点で作業が完了したと思わない様、注意が必要です。
+
+:ref:`development_advancedtopics`はいくつかの「高度な」トピックを紹介しています。Gitを用いたパッチ管理や他の開発者が投稿したパッチの評価等が、例として挙げられます。
+
+:ref:`development_conclusion`は、カーネル開発者に対する更なる詳細情報へのリンクを含んだ、ドキュメントの締めくくりです。
+
+この文書の内容
+-------------
+
+八百万行を超えるコード、各リリースには千を超えるコントリビューター数を誇るLinuxカーネルは最も巨大、かつ最も活発なフリーソフトウェアプロジェクトです。
+1991年の細やかな始まりから、このカーネルはポケットサイズの音楽プレーヤーからデスクトップPCや最大のスパコンまで、ありとあらゆるシステムで使われる最高のOSコンポーネントへ進化しました。
+このソフトウェアは堅牢、効率、拡張性を兼ね備える、難局へのソリューションとなります。
+
+成長と普及に伴い、年々開発への参加を希望する開発者や会社は増えています。
+ハードウェアベンダーは、Linuxでの自社製品のサポートを確立し、Linuxユーザーにとって自社製品を魅力的なものたらしめたいと考えています。
+組み込みシステムベンダーは、自社の組み込みシステム製品の構成要素として、Linuxがより高性能であり、かつ目前のタスクに対して最適である事を求めています。
+ソフトウェア開発会社やその販売代理店等は、Linuxカーネルの機能、性能、信頼性に明確に興味関心を抱いています。
+エンドユーザーもまた、Linuxを自分のニーズに適したLinuxとする為、Linuxをより良いものとしたいと思うものと考えられます。
+
+Linuxの最も魅力ある特徴の一つは、開発者がアクセス可能である事にあります。
+要求される技術さえあれば、誰でもLinuxの開発に参加してLinuxを改良し、開発の方向性に影響を与える事が出来ます。
+企業製品等では、この様な開放性を提供する事は出来ません。これはフリーソフトウェアならではの特徴です。
+しかし、むしろカーネルは他のほとんどのフリーソフトウェアと比べ、なおさらオープンであると言えるでしょう。
+典型的な三か月間のカーネル開発周期では、千を超える開発者に百を超える企業(会社に属さない場合もある)が、開発に従事する可能性があるのです。
+
+開発コミュニティと協力する事は、特段難しい事ではありません。
+それに関わらず、しかしながらも多くの潜在的なコントリビューターが開発の際に、困難を経験しています。
+開発コミュニティは、毎日数千行のコードが変更される環境下であろうと円滑に機能する(かつ高品質なカーネルを生み出す)、コミュニティならではの開発方法を発展させて来ました。
+したがって、Linuxカーネル開発の手法やプロセスが企業等の開発の手法やプロセスと異なる事は、それほど驚くべき事では無いのです。
+
+カーネル開発のプロセスは奇妙で難解に思えるかも知れないものの、しかしその背景には然るべき正当な理由と確かな経験があります。
+開発コミュニティの方法を理解しない開発者(または悪い事にそれを無視したり回避しようとする開発者)は、必ずや不満の残る経験が残る事となりましょう。
+開発コミュニティは学習を目指す人々には親切に接しますが、開発プロセスに興味を持たず人の話を聞かない様な開発者にはほとんど時間を割きません。
+
+この文書を読み、上記の様な不快な経験を回避される事を願います。
+ここには膨大な資料が存在しますが、しかしそれを読み解く努力は瞬く間にに報われることでしょう。
+我らが開発コミュニティは、常にカーネルの改善に貢献してくれる開発者を求めています。以下の文章は、あなた自身或いはあなたの部下等が開発コミュニティに参入するのに役立つ事でしょう。
+
+クレジット
+----------
+
+この文書は、Jonathan Corbet (corbet@lwm.net)により記述されました。
+そしてJohannes Berg, James Berry, Alex Chiang, Roland Dreier, Randy Dunlap, Jake Edge, Jiri Kosina, Matt Mackall, Arthur Marsh, Amanda McPherson, Andrew Morton, Andrew Price, Tsugikazu Shibata, Jochen Voßからのコメントにより、改善されて来ました。
+日本語への翻訳: Sakamoto Yuto(dayodayo1410@gmail.com)
+
+このプロジェクトはLinux財団により支援されました。この取り組みを理解し実現にご尽力されたAmanda McPherson氏に感謝いたします。
+
+コードをメインラインに取り込む事の重要性
+-------------------------------------
+
+いくつかの会社及び開発者は、時折なぜわざわざ開発コミュニティで作業する仕方を学び、コードをカーネルのメインライン(Linus TorvaldsによってメンテナンスされていてLinuxディストリビュータの基盤として使われる)に組み込むべきなのか、不思議に思う事があるでしょう。
+短期的に見れば、コードをLinuxに組み込む事は面倒なコストの様に思われます。コードをLinuxに組み込まず、ただ使用者を直接サポートする方が簡単であるとも見えるでしょう。
+しかし実の所、コードを分離しておく事は、結局は無駄な出費と成り果てる事となります。
+ツリー外コードの弊害を明らかにする為に、カーネル開発プロセスに関連する側面をいくつか挙げましょう。これらの大半はこの文書内の後半にてより詳しく説明されます。
+以下の事例を考えてみて下さい。
+
+- カーネルのメインラインにマージされたコードは、全てのLinuxユーザーが使用可能です。
+  これは有効化されている全てのディストリビューションでも、それが自動的に提供される事となります。
+  ドライバディスク、ダウンロード、その他複数のディストリビューションの複数のバージョンに対応させる手間から解放され、開発者にとってもユーザーにとっても、全てがスムーズに動作します。
+  メインラインへのマージにより、多くのディストリビューションへの対応の問題が解決されます。
+
+- カーネル開発者達はユーザー空間への安定的なインターフェースの維持に努めていますが、カーネル内部のAPIは常に変化しています。
+  安定した内部インターフェースが存在しないのは、設計上の意図的な決定であり、それによりいつでも改善が可能になる事で結果としてより高性能なコードに繋がります。
+  しかし、この方針の結果、例外無くツリー外コードには新しいカーネルに対応させる為のメンテナンスが必要になります。
+  ツリー外コードのメンテナンスには、コードの動作を確保するのみでも相当な作業量が必要となります。
+
+  一方、メインライン内のコードに関しては、「API変更を行った開発者は、変更により影響を及ぼしたり動作しなくなるコードも修正せねばならない」という単純な規則が存在する為、この様な作業は必要ありません。
+  その為、メインラインにマージされたコードは、大幅にメンテナンスコストが低いです。
+
+- 更に、カーネル内にあるコードは他の開発者によって改善される事がよくあります。
+  ユーザーコミュニティや顧客に製品の改善を任せる事で、驚くべき結果が得られる可能性があります。
+
+- カーネルコードはマージ前後の両方において、評価されます。
+  どれだけ元の開発者の技術や能力が優れていたとて、レビューは必ず元の開発者の思いもしない改善点を見つけ出します。
+  レビューでは、よく深刻なバグやセキュリティ上の問題が発見される事があります。
+  特にクローズドソースソフトにこの事実はよく当てはまる為、その様なコードは外部開発者のレビューからより改善されます。
+  ツリー外コードは低品質なコードです。
+
+- 開発プロセスへの参加は、カーネル開発の方向性に影響を及ぼす方法であります。
+  傍観者として不満を論うユーザーの声もよく開発者達に届きますが、活動的に開発に貢献する開発者がより強い発言力と自分達の需要に合ったLinuxカーネルを実現する変更を実装する力を有する事実は明らかでしょう。
+
+- コードを個別に管理する場合、第三者が類似した機能の異なる実装を提供する可能性と、あなたはいつも隣合わせです。
+  その様な事態が発生した場合、コードのマージは非常に困難になり、時には拒絶されるかも知れません。
+  もしそうなってしまえば、以下の様な好ましくない事態に直面します。
+  (1)ツリー外非標準機能を無期限にメンテナンスする事になる
+  (2)コードを放棄し、ツリー内のバージョンにユーザーを移行させる
+
+- コードの貢献は、プロセス全体を機能させる根本的行動です。
+  あなたのコードを提供する事で、新機能をカーネルに追加する事ができ、かつ外部のカーネル開発者にとって役立つ機能や例を提供できます。
+  もしあなたがLinux向けコードを開発した事があるのなら(またはそうしようと考えたか)、あなたはこのプラットフォームの継続的な成功に関心を持っているものと思われます。
+  コードの貢献は、その成功を確定させる為の最も良い道の一つです。
+
+ここで挙げられる理由の全ては、独自のバイナリのみの形式で配布されるものを含む全てのツリー外カーネルコードに言えます。
+更バイナリのみのカーネルコード配布を考える前に、他にも考慮すべき以下の要素が存在します。
+
+- 独自のカーネルモジュール配布に係る法的問題は、特に複雑です。少なからず多くのカーネルの著作権を保有する者はこれらのモジュールはカーネルから派生した製品であり、それらの配布はGNU一般公衆ライセンス(詳細は後述)に違反すると考えられます。
+  著者は弁護士では無いものですから、この文章の内容は法的助言と捉えられるべきではありません。
+  クローズドソースモジュールの法的地位に関しては、裁判所によってのみ決定されます。
+  しかし、いずれにせよそれらのモジュールについてまわる不確実性は存在します。
+
+- バイナリのみのモジュールはカーネルのデバグ問題をより難解にする為、殆どのカーネル開発者はそれを試みようとさえしないでしょう。
+  したがってバイナリのみのモジュールを配布する事は、ユーザーにコミュニティからのサポートを享受させる事を阻害し得ます。
+
+- バイナリのみのモジュールの配布者にとっても、サポートはより困難となります。
+  誰かが必ずサポートしたいカーネルバージョンや配布毎にバージョンを用意する必要があるからです。
+  十分な網羅性を提供する為には一つのモジュールに対し数十ものビルドが必要であり、そしてユーザーはカーネルをアップグレードする度、個別にあなたのモジュールをアップグレードせねばならないでしょう。
+
+- コードレビューに関する上記の内容は、クローズドソースコードに特に適用できます。
+  このコードは全て公開されていない為、それはコミュニティからのレビューを受けていないでしょうし、間違いなく重大な問題が存在するでしょう。
+
+特に組み込みシステムのメーカーは、固定されたカーネルバージョンでリリース後に更なる開発が不要な製品を出荷したい思いに基いて、この章で述べられた事を無視したくなるかも知れません。
+この主張は広範なコードレビューの価値やユーザーが製品に機能を追加できる事の価値を見落としており、かつこれらの製品も寿命は限られており、その後に新しいバージョンをリリースせねばならないのです。
+その時点では、コードをメインラインに統合し適切なメンテナンスを受けられているベンダーの方が、より早く新しい製品を準備する事が出来るでしょう。
+
+ライセンス
+----------
+
+コードは、多数のライセンス下でLinux Kernelにコントリビュートされている。
+しかし、全てのコードがカーネルディストリビューション等の全体を対象とするversion 2 of the GNU General Public License (GPLv2)に従っていなければならなりません。
+実際には、それは全てのコントリビュートはGPLv2に従うか(補足事項でGPLの最新のバージョン下での配布が許可される)、またはthe three-clause BSD licenseに従う必要がある事を意味しています。
+
+カーネルに貢献するコードに関して、著作権譲渡は必須ではありませんし要求もされません。
+全てのメインラインにマージされるコードは元の所有権を保持しており、その結果としてこのカーネルは今や数千人の所有者を抱えています。
+
+この所有構造の意味する所は、いかなるカーネルのライセンス変更の試みも必ずや失敗するという事です。
+極めて稀な実際のシナリオとして、著作権保持者全員から許可を得る(あるいはカーネルから開発者達のコードが削除される)場合があります。
+だからといってそれは稀なシナリオであって、特にGPLv3への移行の見通しはありません。
+
+全てのカーネルにコントリビュートするコードは、正真正銘の無料である事が不可欠です。
+その為、身元不明あるいは匿名のコントリビューターはこれを受け付けません。
+全てのコントリビューターは、そのコードに署名し、GPLライセンス下でそのコードが配布され得る事を承認する必要があります。
+所有者によってライセンスされていないコード、著作権関係の法的問題等を引き起こす危険性のあるコード(適切な保護措置の欠如したリバースエンジニアリング等に由来する様なコード)はコントリビュート出来ません。
+
+著作権関係問題の悩みに関する質問は、Linuxの開発メーリングリストではよくある事です。
+この様な質問は通常多くの返答が来ますが、回答してくれている人たちは弁護士では無く、法的助言を出来ない事にご留意ください。
+Linuxソースコードに関する法的質問がある場合は、この分野を理解している弁護士に聞くのが一番です。
+Linuxの開発メーリングリストの様な技術的なメーリングリストでの返答に頼り切りになる事は、リスキーです。
\ No newline at end of file
-- 
2.43.0

