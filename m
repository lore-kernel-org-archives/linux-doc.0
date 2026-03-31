Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8333630C345;
	Tue, 31 Mar 2026 16:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=222.228.43.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774974310; cv=pass; b=QffF+0Ku7pTz3J/Y2dzPBX6ShyB171pj8rqqvAl/u0v49iGDJyOW1gbcmQVDMavkIzYYQ5cnwb/hJiGX4dAQUoa/9GtiUppHwfK6NChw+XrkBbs4YGFDJoHPytKFXRcEv0v5hbUoJN7eEeN6/o5jIFqfGLk4exiiqXoYKf1aXfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774974310; c=relaxed/simple;
	bh=8VCjzYz6+6bWhMVEPWX+cJit5pyB2T6UCu0SPlH3gFU=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=nhU9hmwRrNVgGKennK2zyVczpmm9YJ6EnXk8Zbwx/WSbDufMSN2+VU39SETL9cwaO4+rnBRNGiLXbgdXbZk3lDgD3/fsZYK0Na8f7jZCQ+4jdaV/khaRHmcWQrv4MdKCfTp4d3gHgW9YYR0diPFo3nDVmYOAv6UHysZ8CAECt6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=X66os2ip; arc=pass smtp.client-ip=222.228.43.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="X66os2ip"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 0CB4C109F1D40;
	Wed,  1 Apr 2026 00:45:53 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tt84pW6fcwZL; Wed,  1 Apr 2026 00:45:48 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=192.168.11.50
DMARC-Filter: OpenDMARC Filter v1.4.2 www.redadmin.org 0A111109F254B
ARC-Seal: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256; cv=none;
	t=1774971948;
	b=XbJBHj1U2jN72hDg4xSwWwAf96y4wXL/iQwuWKopOpSxk3tI418gYuE5ig22yZ7N023O
	 6MT1vmf4TypEb6lN0oCgqycYrEeKi3ZojKGnOC/f5eFGxVwwkDw/w8XyBAx2nwxQ5ys95
	 gP4VSXZj8uzh5YPJJdW6ZYl5ACZAfsecZI=
ARC-Message-Signature: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256;
	c=relaxed/relaxed; t=1774971948;
	h=DKIM-Filter:DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=phTKlPqiK+zsuDa80NVbtH0Hw7k6FZfZWL3kx7puyWk=;
	b=m1dKt1P7SVbhkloPq7jojz2JFqrz4Mcj2oQnfqaO+1XO7wpmx+UiyneRgGB/KATLxGL3
	 hR4rB2Gl5bUvFd12x2MMuGheZarvL40nhZn0ggf4gbo8d7EcQ2uhV1Ge+qBw5MqSGhBAT
	 IhcuaWg08otdze6AE2CQH9eo+6bGTR61v0=
ARC-Authentication-Results: i=1; www.redadmin.org; arc=none smtp.remote-ip=192.168.11.50
Received: from webmail.redadmin.org (redadmin.org [192.168.11.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: weibu@redadmin.org)
	by www.redadmin.org (Postfix) with ESMTPSA id 0A111109F254B;
	Wed,  1 Apr 2026 00:45:48 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 0A111109F254B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1774971948;
	bh=phTKlPqiK+zsuDa80NVbtH0Hw7k6FZfZWL3kx7puyWk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X66os2ip4zuFpHUeYQoLzE1oAtNCsHdP5EpFkfydBaJU3JnmRrkkewGpQ5by7K/sN
	 /He2q/dnFK3fZZq7hXoH31tl79qQUANM4rZBhgyZJT0e6E27M8AXaXWZD8C648ECWG
	 gPkvoijNZ0jlkoNpTdxBY2Mm4d0fmB5uXCrEG/ko=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 01 Apr 2026 00:45:47 +0900
From: weibu@redadmin.org
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/ja_JP: submitting-patches: Amend "Describe your
 changes"
In-Reply-To: <20260326114637.144601-1-akiyks@gmail.com>
References: <20260326114637.144601-1-akiyks@gmail.com>
Message-ID: <0ca7d524b258df1c78d269fd7faceb04@redadmin.org>
X-Sender: weibu@redadmin.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Looks good to me.

Acked-by: Akiyoshi Kurita <weibu@redadmin.org>

2026-03-26 20:46 に Akira Yokosawa さんは書きました:
> To make the translation of "Describe your changes" (into
> "変更内容を記述する") easier to follow, do some rewording and
> rephrasing, as well as fixing a couple of mistranslations.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
> .../ja_JP/process/submitting-patches.rst      | 107 +++++++++---------
>  1 file changed, 53 insertions(+), 54 deletions(-)
> 
> diff --git 
> a/Documentation/translations/ja_JP/process/submitting-patches.rst 
> b/Documentation/translations/ja_JP/process/submitting-patches.rst
> index 3bb2383871e1..9d63220abd15 100644
> --- a/Documentation/translations/ja_JP/process/submitting-patches.rst
> +++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
> @@ -55,67 +55,66 @@ Documentation/process/maintainer-handbooks.rst.
>  変更内容を記述する
>  ------------------
> 
> -問題を記述してください。あなたのパッチが 1 行のバグ修正であっても、
> +まず問題点を記べてください。あなたのパッチが 1 行のバグ修正であっても、
>  5000 行の新機能であっても、それを行う動機となった根本的な問題が
> -必ずあるはずです。修正すべき価値のある問題が存在し、レビューアが
> -最初の段落以降を読む意味があることを納得させてください。
> +必ずあるはずです。レビューアが、修正すべき問題がたしかに存在し、冒頭の
> +段落の続きを読むべきだと納得できるように書いてください。
> 
> -ユーザーから見える影響を記述してください。クラッシュやロックアップは
> +次にユーザーから見える影響を記述してください。クラッシュやロックアップは
>  分かりやすいですが、すべてのバグがそこまで露骨とは限りません。
>  たとえコードレビュー中に見つかった問題であっても、ユーザーに
>  どのような影響があり得るかを記述してください。
>  Linux の多くの環境は、上流から特定のパッチだけを取り込む二次的な
>  安定版ツリーや、ベンダー／製品固有のツリーのカーネルで動いています。
> -したがって、変更を下流へ適切に流す助けになる情報（発生条件、dmesg
> +したがって、変更を適切に下流へ流す助けになる情報（発生条件、dmesg
>  の抜粋、クラッシュ内容、性能劣化、レイテンシのスパイク、
>  ロックアップ等）があれば記載してください。
> 
> -最適化とトレードオフを定量的に示してください。パフォーマンス、
> +次に最適化とトレードオフを定量的に示してください。パフォーマンス、
>  メモリ消費量、スタックフットプリント、バイナリサイズの改善を主張する
>  場合は、それを裏付ける数値を記載してください。
> -また、目に見えないコストについても記述してください。最適化は通常
> -無料ではなく、CPU・メモリ・可読性の間でのトレードオフになります。
> -ヒューリスティクスの場合は、異なるワークロード間でのトレードオフに
> +また、目に見えないコストについても記述してください。多くの場合、
> +最適化は CPU・メモリ・可読性の間でのトレードオフとなります。
> +ヒューリスティクスの場合は、異なるワークロード間でのトレードオフと
>  なります。レビューアがコストとメリットを比較検討できるよう、
> -最適化によって予想されるデメリットも記述してください。
> +最適化に伴って想定されるデメリットも記述してください。
> 
> -問題を明確にできたら、実際にどのような対策を講じているかを技術的に
> -詳しく記述してください。レビューアがコードが意図したとおりに動作して
> -いるかを確認できるよう、変更内容を平易な言葉で書き下すことが重要です。
> +問題点の明確化が済んだら、実際にどのような対策を講じているかを技術的に
> +詳しく説明してください。コードが意図したとおりに動作していることを
> +レビューアが確認できるよう、変更内容を平易な言葉で書き下すことが重要です。
> 
> -パッチ説明を Linux のソースコード管理システム ``git`` の
> -「コミットログ」としてそのまま取り込める形で書けば、メンテナは
> -助かります。詳細は原文の該当節を参照してください。
> +パッチの説明が Linux のソースコード管理システム ``git`` の「コミットログ」
> +としてそのまま取り込める形で書かれていれば、メンテナは助かります。
> +詳細は原文の該当節 ("The canonical patch format") を参照してください。
> 
>  .. TODO: Convert to file-local cross-reference when the destination is
>     translated.
> 
>  1 つのパッチでは 1 つの問題だけを解決してください。記述が長くなり
> -始めたら、パッチを分割すべきサインです。詳細は原文の該当節を参照
> -してください。
> +始めたら、それはパッチを分割すべきサインです。
> +詳細は原文の該当節 ("Separate your changes") を参照してください。
> 
>  .. TODO: Convert to file-local cross-reference when the destination is
>     translated.
> 
>  パッチまたはパッチシリーズを投稿／再投稿する際は、その完全な
> -説明と、それを正当化する理由を含めてください。単に、これが
> -パッチ（シリーズ）のバージョン N であるとだけ書かないでください。
> -サブシステムメンテナが以前のパッチ版や参照先 URL をさかのぼって
> -パッチ説明を探し、それをパッチに補うことを期待してはいけません。
> +説明と、それを正当化する理由を含めてください。単に「これはパッチ
> +（シリーズ）のバージョン N です」とだけ書くのは避けてください。
> +サブシステムメンテナが以前のパッチバージョンや参照先 URL をさかのぼって
> +パッチ記述を探し、それをパッチに補うことを期待してはいけません。
>  つまり、パッチ（シリーズ）とその説明は、それだけで完結しているべき
>  です。これはメンテナとレビューアの双方に有益です。レビューアの
> -中には、以前のパッチ版を受け取っていない人もいるでしょう。
> +中には、以前のパッチバージョンを受け取っていない人もいるでしょう。
> 
> -変更内容は命令形で記述してください。たとえば、
> -「make xyzzy do frotz」とし、
> -「[This patch] makes xyzzy do frotz」や
> -「[I] changed xyzzy to do frotz」
> -のようには書かないでください。あたかもコードベースに対して、
> -その振る舞いを変えるよう命令しているかのように書いてください。
> +変更内容は、あたかもコードベースに対してその振る舞いを変えるように
> +命令するかの如く、（訳補: 英語の）命令形で記述してください。たとえば、
> +"[This patch] makes xyzzy do frotz" や
> +"[I] changed xyzzy to do frotz" のような言い回しを避け、
> +"make xyzzy do frotz" のように書いてください。
> 
> -特定のコミットに言及したい場合は、コミットの SHA-1 ID だけを
> -書かないでください。レビューアがそれが何についてのものかを
> -把握しやすくなるよう、コミットの 1 行要約も含めてください。例::
> +特定のコミットに言及したい場合に、コミットの SHA-1 ID だけを
> +書くのは避けてください。レビューアがそれが何についてのものかを
> +把握しやすいよう、コミットの 1 行要約も含めてください。例::
> 
>  	Commit e21d2170f36602ae2708 ("video: remove unnecessary
>  	platform_set_drvdata()") removed the unnecessary
> @@ -123,28 +122,29 @@ Linux の多くの環境は、上流から特定のパッチだけを取り込
>  	delete it.
> 
>  また、SHA-1 ID は少なくとも先頭 12 文字を使うようにしてください。
> -カーネルのリポジトリには非常に多くのオブジェクトがあるため、
> -それより短い ID では衝突が現実に起こり得ます。いま 6 文字の ID に
> -衝突がなくても、5 年後もそうだとは限らないことに注意してください。
> +カーネルのリポジトリには\ **非常に多くの**\ オブジェクトがあるため、
> +それより短い ID では衝突が現実問題となります。6 文字の ID が今現在
> +衝突しないからといって、5 年後もそうであるとは限らないことを念頭に
> +置いてください。
> 
>  変更に関連する議論や、その背景情報が Web 上で参照できる場合は、
> -それを指す ``Link:`` タグを追加してください。パッチが過去の
> -メーリングリストでの議論や、Web に記録された何かの結果であるなら、
> +それを指す 'Link:' タグを追加してください。過去のメーリングリスト
> +での議論や、Web に記録された何かに由来するパッチならば、
>  それを示してください。
> 
> -メーリングリストのアーカイブへリンクする場合は、できれば
> -lore.kernel.org のメッセージアーカイブサービスを使ってください。
> -リンク URL を作るには、そのメッセージの ``Message-ID`` ヘッダの内容
> -から、前後の山括弧を取り除いたものを使います。例::
> +メーリングリストのアーカイブへリンクする場合は、できれば lore.kernel.org
> +のメッセージアーカイブサービスを使ってください。リンク URL を作るには、
> +そのメッセージの ``Message-ID`` ヘッダの内容から、前後の山括弧を取り除いた
> +ものを使います。例::
> 
>      Link: 
> https://lore.kernel.org/30th.anniversary.repost@klaava.Helsinki.FI
> 
>  実際にリンクが機能し、該当するメッセージを指していることを
> -確認してください。ただし、外部リソースを見なくても説明が理解できる
> -ようにするよう努めてください。
> +確認してください。
> 
> +ただし、外部リソースを見なくても説明が理解できるようにするよう努めてください。
>  メーリングリストのアーカイブやバグへの URL を示すだけでなく、
> -投稿されたパッチに至った議論の要点も要約してください。
> +投稿されたパッチに至った議論のポイントも要約してください。
> 
>  パッチがバグを修正するものであれば、メーリングリストのアーカイブや
>  公開バグトラッカー上の報告を指す URL を付けて、``Closes:`` タグを
> @@ -153,23 +153,22 @@ lore.kernel.org のメッセージアーカイブサービスを使ってくだ
>      Closes: https://example.com/issues/1234
> 
>  このようなタグ付きのコミットが適用されたとき、自動的に issue を
> -閉じられるバグトラッカーもあります。メーリングリストを監視している
> +閉じるバグトラッカーもあります。メーリングリストを監視している
>  ボットの中には、そのようなタグを追跡して一定の動作を行うものも
> -あります。非公開のバグトラッカーや無効な URL は禁止です。
> +あります。ただし、非公開バグトラッカーの（訳補: 部外者が）閲覧できない
> +URL は禁止です。
> 
> -パッチが特定のコミットに含まれるバグを修正するものであれば、
> -たとえば ``git bisect`` で問題を見つけた場合には、SHA-1 ID の
> -先頭少なくとも 12 文字と 1 行要約を含めて、``Fixes:`` タグを
> +パッチが特定のコミットに含まれるバグを修正するもの、たとえば
> +``git bisect`` で問題を見つけたものの場合には、SHA-1 ID の
> +先頭少なくとも 12 文字と 1 行要約を含めて 'Fixes:' タグを
>  使ってください。タグを複数行に分割してはいけません。タグは
>  解析スクリプトを単純にするため、「75 桁で折り返す」規則の
> -例外です。
> -
> -例::
> +例外です。例::
> 
>      Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the 
> number of pages it actually freed")
> 
> -上の形式を ``git log`` や ``git show`` で出力しやすくするために、
> -次の ``git config`` 設定を使えます::
> +``git log`` や ``git show`` の出力を上の形式で整形させるには、
> +次の ``git config`` 設定が使えます::
> 
>      [core]
>          abbrev = 12
> 
> base-commit: 0a4f3ef9880e505d41817419b0255d6552776143
