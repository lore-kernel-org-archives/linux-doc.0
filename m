Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D0F43932C;
	Wed,  8 Jul 2026 16:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=222.228.43.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527892; cv=pass; b=D1fp+w0yB+NkUzUMqwVHWqLVAXBJouVQ4IBmRMxtAALqb3B4kaWqJhyV3GBdyh8xTCTZCRh6o/6lYVfM2QIHcMYyWKb5mLlZiSJht/CHEWVCN4VAo6Dug0YREPlRSdvijc1nIl9kaJqmBJwS8+XRgz6CCSG93S9Y8vxeLeQOjwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527892; c=relaxed/simple;
	bh=flbUQjllSMTdj0IAmLdKr2k7a9WysdbZGy2xkJ/ztnY=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=FmN942EsiY/68bz3S3T165y37dVXvylan8vf+lXetkErowrk4Szuc7yg+dDKiZ9G4yXqV666DT8dvhJja/Inqz9YO/v8n05Z7MOjoej58Tt7WF3PZ+PNpyPC1yVacSGCc94AEia8pO6l2/tnl45krqxUVdYw+4S1Jy8UhOqKyFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=JZqYZvZe; arc=pass smtp.client-ip=222.228.43.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="JZqYZvZe"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id A7083109BED15;
	Thu,  9 Jul 2026 01:17:01 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZSL8nmZ042FQ; Thu,  9 Jul 2026 01:16:55 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=192.168.11.50
DMARC-Filter: OpenDMARC Filter v1.4.2 www.redadmin.org EFF96109EFD81
ARC-Seal: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256; cv=none;
	t=1783527415;
	b=ZV6r/8IwMr5YN3//218YKY1r5bfXkEGPQ475Y8fU2iLDSW/Q2LMh81ZcugYtf1EK95uD
	 npe7+QoxB/3x1SAK67r3xCkvYouTrK8jpDRSweoFoWbKWEzUTBL5hNghNwMdOHnl+6lbH
	 tAEiHUwXMnPIKCRkeplwXB8ueb6t63ixYI=
ARC-Message-Signature: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256;
	c=relaxed/relaxed; t=1783527415;
	h=DKIM-Filter:DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=xBUo8j5GvY/rIrP2lsQbrrx02jeQlRXGN1JHBLMTZQI=;
	b=rEvCS6WTSEaf/fI7pXRALCx1FMr6JDCuoVgpJpVTrXvct1Jy0dxz4M8j+D9xDvn+7npn
	 8+IfjPp5xt7sKveL2Q+ooANKjce7YtFtxPF6vtQaqcGoydxTEeJsL2LNCmLpHOkUl5I6N
	 pT8iiarwdMWHFqhS9+3loBRQriOhWiudWY=
ARC-Authentication-Results: i=1; www.redadmin.org; arc=none smtp.remote-ip=192.168.11.50
Received: from webmail.redadmin.org (redadmin.org [192.168.11.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: weibu@redadmin.org)
	by www.redadmin.org (Postfix) with ESMTPSA id EFF96109EFD81;
	Thu,  9 Jul 2026 01:16:54 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org EFF96109EFD81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1783527415;
	bh=xBUo8j5GvY/rIrP2lsQbrrx02jeQlRXGN1JHBLMTZQI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JZqYZvZeMZq8ABAsEdZLt3oaunYz8qu0vPRmM+IuykhGu8Nek19/1R+eYo6Duq0tY
	 FIlJ0CP62ARvU9eRx80IGmV7ILcgoPH5VOn2Tm4YCfcla1b1+p+U+jnId1yJeHxyq2
	 3K9nvGyIuZcBjY2H3Rard6lWaeeZfecWQGmlTPsU=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 09 Jul 2026 01:16:54 +0900
From: weibu@redadmin.org
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/ja_JP: submitting-patches: Refine wording etc for
 "splitting changes" and later
In-Reply-To: <20260708105906.40954-1-akiyks@gmail.com>
References: <20260708105906.40954-1-akiyks@gmail.com>
Message-ID: <7313ca559ef8a984e0cd1bd8f9fb8c17@redadmin.org>
X-Sender: weibu@redadmin.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Hi Akira-san,

Thank you for the cleanup.

I will review the wording, and if I find anything that should be 
adjusted,
I will submit a follow-up patch on top of this change.

Thanks,
Akiyoshi

2026-07-08 19:59 に Akira Yokosawa さんは書きました:
> Resolve rough edges in translation text added since commit 61e4155c81d1
> ("docs/ja_JP: translate more of submitting-patches.rst").
> 
> As with commit 999084ee0b11 ("docs/ja_JP: submitting-patches: Amend
> "Describe your changes""), do the following tweaks:
> 
> - Rewording and rephrasing.
> - Suppress extra white spaces rendered before and after strong emphasis
>   in HTML and PDF by using espcaped spaces.
> - Provide translation words for "embargo", "word-wrap", "top-posting",
>   etc.
> - Rather than keep "interleaved replies", use only 「インライン返信」
>   ("inline reply"), which is a popular term in Japanese.
> 
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Akiyoshi Kurita <weibu@redadmin.org>
> ---
> Kurita-san,
> 
> If you find some of my word choices strange, please submit a patch
> on top of this change.
> 
> Thanks,
> Akira
> 
> .../ja_JP/process/submitting-patches.rst      | 150 +++++++++---------
>  1 file changed, 75 insertions(+), 75 deletions(-)
> 
> diff --git 
> a/Documentation/translations/ja_JP/process/submitting-patches.rst 
> b/Documentation/translations/ja_JP/process/submitting-patches.rst
> index d31d469909e4..fa794a44d8c4 100644
> --- a/Documentation/translations/ja_JP/process/submitting-patches.rst
> +++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
> @@ -182,7 +182,7 @@ URL は禁止です。
>  変更を分割する
>  --------------
> 
> -各 **論理的な変更** は、個別のパッチに分けてください。
> +それぞれの\ **論理的な変更**\ は、個別のパッチに分けてください。
> 
>  たとえば、単一のドライバに対する変更にバグ修正と性能改善の
>  両方が含まれるなら、それらは 2 つ以上のパッチに分けてください。
> @@ -208,7 +208,7 @@ URL は禁止です。
>  ことがあります。途中でバグを持ち込めば、彼らに感謝されることは
>  ないでしょう。
> 
> -パッチセットをこれ以上小さくできないなら、一度に投稿するのは
> +パッチセットをそれ以上小さくできないなら、一度に投稿するのは
>  15 個程度までにして、レビューと統合を待ってください。
> 
> 
> @@ -220,18 +220,17 @@ Documentation/process/coding-style.rst を参照してください。
>  これを怠ると、単にレビューアの時間を無駄にするだけでなく、
>  パッチはおそらく読まれもせずに却下されます。
> 
> -大きな例外が 1 つあります。コードをあるファイルから別の
> -ファイルへ移動する場合です。このときは、コードを移動する
> -その同じパッチの中で、移動したコードを一切変更してはいけません。
> -そうすることで、コードの移動という行為と、あなたの変更とを
> -明確に区別できます。これは実際の差分のレビューを大いに助け、
> -ツールがコード自体の履歴をより適切に追跡できるようにします。
> +一つの重要な例外は、コードをあるファイルから別のファイルへ移動する場合です。
> +その際は、コードを移動するその同じパッチの中で、一切コードを変更しては
> +いけません。これにより、コードの移動という行為と、コードの変更とが
> +明確に区別されます。これは実際の差分のレビューを大いに助け、また、ツールを
> +使ったコード変更の履歴の追跡を容易にします。
> 
>  提出前に、パッチスタイルチェッカー
>  (``scripts/checkpatch.pl``) でパッチを確認してください。
> -ただし、スタイルチェッカーは指針として見るべきであり、
> +ただし、スタイルチェッカーは指針にすぎず、
>  人間の判断に取って代わるものではないことに注意してください。
> -違反があっても、その方がコードの見栄えがよいなら、
> +違反が指摘されるままのコードの方が見栄えがよいなら、おそらく
>  そのままにしておくのが最善でしょう。
> 
>  チェッカーは 3 つのレベルで報告します:
> @@ -240,8 +239,7 @@ Documentation/process/coding-style.rst を参照してください。
>   - WARNING: 慎重なレビューを要するもの
>   - CHECK: 検討を要するもの
> 
> -パッチに残した違反については、すべて理由を説明できなければ
> -なりません。
> +パッチに違反を残す場合は、そのすべてを正当化できなければなりません。
> 
> 
>  パッチの宛先を選択する
> @@ -256,8 +254,8 @@ Documentation/process/coding-style.rst を参照してください。
>  サブシステムのメンテナが見つからない場合は、Andrew Morton
>  (akpm@linux-foundation.org) が最後の手段となるメンテナです。
> 
> -すべてのパッチでは、デフォルトで linux-kernel@vger.kernel.org を
> -使うべきですが、このリストの流量が多いため、目を通さなくなった
> +すべてのパッチは、デフォルトで linux-kernel@vger.kernel.org にも
> +送られるべきですが、このリストは流量が多く、目を通さなくなった
>  開発者も少なくありません。とはいえ、無関係なメーリングリストや
>  無関係な人々にスパムを送らないでください。
> 
> @@ -268,103 +266,104 @@ Documentation/process/coding-style.rst 
> を参照してください。
>  Linux カーネルに採用されるすべての変更の最終的な裁定者は
>  Linus Torvalds です。彼のメールアドレスは
>  <torvalds@linux-foundation.org> です。Linus は大量のメールを
> -受け取っており、現時点では彼に直接届くパッチはごくわずかなので、
> -通常は彼にメールを送ることを極力避けてください。
> +受け取っており、現時点では直接彼を経由するパッチはごくわずかなので、
> +通常は彼にメールを送ることを極力\ **避けて**\ ください。
> 
> -悪用可能なセキュリティバグを修正するパッチがあるなら、
> -そのパッチを security@kernel.org に送ってください。深刻なバグに
> +悪用可能なセキュリティバグを修正するパッチの場合は、
> +それを security@kernel.org に送ってください。深刻なバグに
>  ついては、ディストリビュータがユーザーにパッチを配布できるよう、
> -短期間の embargo が検討される場合があります。そのような場合、
> -そのパッチを公開メーリングリストに送るべきではありません。
> +短期間の秘匿措置 (訳註: embargo) が検討される可能性があります。
> +ですので、その種のパッチを公開メーリングリストに送らないでください。
>  Documentation/process/security-bugs.rst も参照してください。
> 
>  リリース済みカーネルの深刻なバグを修正するパッチは、次のような行を
> -パッチの sign-off 欄に入れることで、stable メンテナへ向けてください::
> +パッチの sign-off 欄に入れることで、stable メンテナに知らせてください。
> +(メールの宛先ではないことに注意。) ::
> 
>    Cc: stable@vger.kernel.org
> 
> -これはメールの受信者ではないことに注意してください。また、
> -この文書に加えて Documentation/process/stable-kernel-rules.rst も
> -読んでください。
> +また、この文書に加えて Documentation/process/stable-kernel-rules.rst
> +も読んでください。
> 
>  変更がユーザーランドとカーネルのインターフェースに影響する場合は、
>  MAINTAINERS ファイルに記載されている MAN-PAGES メンテナに
> -man-pages パッチ、少なくとも変更の通知を送って、情報が
> -マニュアルページに反映されるようにしてください。ユーザー空間 API の
> +マニュアルページのパッチ、もしくは少なくとも変更の通知を送って、情報が
> +そちらにも反映されるようにしてください。ユーザー空間 API の
>  変更は、linux-api@vger.kernel.org にも Cc してください。
> 
>  MIME・リンク・圧縮・添付なし、プレーンテキストのみ
>  ----------------------------------------------------
> 
>  Linus や他のカーネル開発者は、あなたが投稿する変更を読み、
> -コメントできる必要があります。カーネル開発者が標準的な
> -メールツールを使ってあなたの変更を「引用」し、コードの特定の
> -箇所についてコメントできることが重要です。
> +コメントできる必要があります。カーネル開発者にとって、コードの特定の
> +箇所について、標準的なメールツールを使ってあなたの変更を「引用」し、
> +コメントできることが重要です。
> 
> -このため、すべてのパッチはメール本文中に ``inline`` で投稿すべきです。
> +このため、すべてのパッチはメール本文中に「インライン」で投稿すべきです。
>  これを行う最も簡単な方法は ``git send-email`` を使うことであり、
>  強く推奨されます。``git send-email`` の対話型チュートリアルは
> -https://git-send-email.io で利用できます。
> +https://git-send-email.io にあります。
> 
> -``git send-email`` を使わないことを選ぶ場合:
> +``git send-email`` を使わない場合:
> 
>  .. warning::
> 
> -  パッチをコピー＆ペーストする場合は、エディタの word-wrap によって
> -  パッチが壊れないよう注意してください。
> +  パッチをコピー＆ペーストする際に、エディタによる自動改行で
> +  パッチが壊されないよう注意してください。
> 
>  圧縮の有無にかかわらず、パッチを MIME 添付ファイルとして添付しては
> -いけません。多くの一般的なメールアプリケーションは、MIME 添付
> -ファイルを常にプレーンテキストとして送信するとは限らず、あなたの
> -コードにコメントできなくなります。MIME 添付ファイルは Linus が
> -処理するのにも少し余分な時間がかかるため、MIME 添付された変更が
> -受け入れられる可能性を下げます。
> +いけません。よく使われるメールアプリケーションの多くは、MIME 添付
> +ファイルをプレーンテキストとして送信するとは限らず、あなたのコードに
> +対するコメントを妨げます。MIME 添付ファイルは Linus (訳補: をはじめ
> +とする開発者）が処理するのに余分な手間がかかるため、MIME 添付すると
> +その変更が受け入れられる可能性を下げることになります。
> 
> -例外:  メーラがパッチを壊してしまう場合は、誰かから MIME を使って
> -再送するよう求められることがあります。
> +例外:  パッチがメーラーによって壊されている場合に、MIME による再送
> +を求められることがあります。
> 
> -パッチを変更せずに送信するようメールクライアントを設定するための
> -ヒントについては、Documentation/process/email-clients.rst を参照してください。
> +改変なしにパッチを送信するためのメールクライアント設定のヒントは、
> +Documentation/process/email-clients.rst を参照してください。
> 
> 
> -レビューコメントに返答する
> +レビューコメントに応答する
>  --------------------------
> 
> -あなたのパッチには、ほぼ確実に、パッチを改善する方法について
> -レビューアからコメントが付きます。それは、あなたのメールへの返信という
> -形で届きます。それらのコメントには必ず返答してください。レビューアを
> -無視することは、こちらも無視されるためのよい方法です。コメントに
> -答えるには、単にそのメールへ返信すれば構いません。コード変更に
> +あなたのパッチには、ほぼ確実に、その改善に向けてレビューアから
> +コメントが付きます。それは、あなたのメールへの返信という
> +形で届きます。それらのコメントには必ず応答してください。レビューアを
> +無視することは、あなたが無視されることにつながります。コメントに
> +答えるには、単にそのメールへ返信すればよいです。コード変更に
>  つながらないレビューコメントや質問であっても、次のレビューアが状況を
> -よりよく理解できるように、ほぼ確実にコメントまたは changelog エントリに
> -反映すべきです。
> -
> -どのような変更を行うのかをレビューアに必ず伝え、時間を割いてくれた
> -ことに感謝してください。コードレビューは疲れる、時間のかかる作業であり、
> -レビューアが不機嫌になることもあります。そのような場合であっても、
> -丁寧に返答し、指摘された問題に対応してください。次の版を送るときは、
> -cover letter または個々のパッチに ``patch changelog`` を追加し、前回の
> +よりよく理解できるよう、多くの場合、コメントまたは changelog エントリ
> +として残すべきです。
> +
> +どのような変更を行うのかを忘れずにレビューアに伝えてください。そして
> +時間を割いてくれることへの感謝を忘れないでください。
> +コードレビューは疲れる、時間のかかる作業であり、
> +ときにはレビューアが機嫌を損ねることもあります。そのような場合でも、
> +丁寧に応答し、指摘された問題に対応してください。次の版を送る際には、
> +カバーレターまたは個々のパッチに ``patch changelog`` を追加し、前回の
>  投稿との差分を説明してください。詳細は原文の該当節
>  ("The canonical patch format") を参照してください。
> 
>  .. TODO: Convert to file-local cross-reference when the destination is
>     translated.
> 
> -あなたのパッチにコメントした人には、パッチの Cc リストに追加して、
> -新しい版を知らせてください。
> +あなたのパッチにコメントしてくれた人たちは、パッチの Cc リストに追加して
> +新しい版について知らせてください。
> 
>  メールクライアントとメーリングリストでの作法についての推奨事項は、
>  Documentation/process/email-clients.rst を参照してください。
> 
> -メール議論では不要な引用を削った interleaved replies を使う
> -------------------------------------------------------------
> +要点に絞ったインライン返信での議論
> +---------------------------------------
> 
> -Linux カーネル開発の議論では、top-posting は強く非推奨とされています。
> -Interleaved replies、または ``inline`` replies を使うと、会話の流れを
> -ずっと追いやすくなります。詳細は次を参照してください:
> +Linux カーネル開発の議論では、全文引用 (訳註: top-posting) は強く非推奨です。
> +インライン返信 (訳註: interleaved reples or "inline" replies) を使うと、
> +会話の流れをずっと追いやすくなります。詳細は次を参照してください:
>  https://en.wikipedia.org/wiki/Posting_style#Interleaved_style
> 
> -メーリングリストでは、よく次のように引用されます::
> +これについて、メーリングリストでは、次の引用をしばしば目にします::
> 
>    A: http://en.wikipedia.org/wiki/Top_post
>    Q: Where do I find info about this thing called top-posting?
> @@ -381,24 +380,25 @@ 
> https://en.wikipedia.org/wiki/Posting_style#Interleaved_style
>    Q: Should I include quotations after my reply?
> 
> 
> -落胆しない、そして急がない
> ---------------------------
> +落胆しない - いらいらしない
> +---------------------------
> 
>  変更を投稿した後は、辛抱強く待ってください。レビューアは忙しい人たちであり、
> -あなたのパッチをすぐに見られるとは限りません。
> +あなたのパッチにすぐに取りかかれるとは限りません。
> 
>  かつては、パッチが何のコメントもなく虚空へ消えていくこともありましたが、
>  現在の開発プロセスはそれよりも円滑に機能しています。数週間以内、
>  通常は 2〜3 週間以内にコメントを受け取るはずです。そうならない場合は、
>  パッチを正しい場所へ送ったか確認してください。再投稿したりレビューアに
> -ping したりする前に、少なくとも 1 週間は待ってください。merge window の
> -ような忙しい時期には、さらに長く待つ方がよい場合もあります。
> +ping したりする前に、少なくとも 1 週間は待ってください。マージ期間
> +(訳註: merge window) のような忙しい時期には、さらに長く待ちましょう。
> 
> -数週間後に、subject line に "RESEND" を追加して、パッチまたは
> -パッチシリーズを再送しても構いません::
> +数週間後に、サブジェクト (訳註: subject line) に "RESEND" を追加して、
> +パッチまたはパッチシリーズを再送しても構いません::
> 
>     [PATCH Vx RESEND] sub/sys: Condensed patch summary
> 
> -パッチまたはパッチシリーズの修正版を投稿する場合は、"RESEND" を
> -追加しないでください。"RESEND" は、前回の投稿から一切変更していない
> -パッチまたはパッチシリーズを再送する場合にのみ使います。
> +ただし、パッチまたはパッチシリーズの修正版を投稿する際には "RESEND"
> +を追加しないでください。
> +"RESEND" は、前回の投稿から一切変更のないパッチまたはパッチシリーズの
> +再送だけに当てはまります。
> 
> base-commit: 2933b82083e758fe6cfff570143541d4dba672c3
