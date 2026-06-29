Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778483B4EB3;
	Mon, 29 Jun 2026 08:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=222.228.43.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782720310; cv=pass; b=sA5EhaV1uQW+L/q1ZvuIUMPN04/TId/wKA4FzM7z5q1isif4LIBDiXvNmznBXt+73myzhiRPyTvwFJ+TCX9dcWJPx7lIYHyLB49cOeWkVjTvwMHRkqqqMYWmOEh18jlenU+gxJGFAtAeNo8g4TyXr4KBEYy4SNYRpvav/4ksQ/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782720310; c=relaxed/simple;
	bh=rRF+Nv/WKxni+VdKiwhaF2sI09EOOtrtI1qEaD7lAuc=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=rUXoOxM/cep7qbdmg/MkQQCxuIfDzBGvnaenuEABrIGOojU2Ef9XSBc+Bq6bj/Nw208ZN+N3L1GpQ4Kkm9TEyE1lYQndyNYcFQmvpZTwqZLl+pAu+9BZQPwcAdgDVSbtYn2VxydmTommHD4A28dKhpCNRUE6n09L0Kc3a53pccU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=qteBWpSS; arc=pass smtp.client-ip=222.228.43.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="qteBWpSS"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 0A03E109F2940;
	Mon, 29 Jun 2026 16:20:16 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hX5ixFpPhF9c; Mon, 29 Jun 2026 16:20:11 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=192.168.11.50
DMARC-Filter: OpenDMARC Filter v1.4.2 www.redadmin.org A0D2D109F289A
ARC-Seal: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256; cv=none;
	t=1782717611;
	b=hSwJbPnwZXr6x8kq3qXVrTXzsWe3Ig0eiofd0j0gIktBmQpM3lpNdx/yfUWEg+tK3k54
	 1VbHMO5RkRTvFedSJUgyjCgUL/eflR7NFjrtzUF+eqXUC6a9utJDlysFtXHtUuYyrGV8w
	 rUkOSWAPPeXmj8CxYz+M+KJa39K6SDvC9o=
ARC-Message-Signature: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256;
	c=relaxed/relaxed; t=1782717611;
	h=DKIM-Filter:DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=HJ55Q5LqlVvIfrh7wQuwkO1c2iuJf1JU6Vj5ItabHt8=;
	b=OXJff5msUBH1IjnB97m8r2SgjUp8MlDT+FMIvjiM4CKG1Zi3PysyOQMtMuBRMynQhfoz
	 pwuCt24oLIfWgArHVXU8kUYanqG+9Gd032nk7h675SAnh8b0Zg9sKbi4uf5NiwdWcTsuh
	 xba65qH5HgnkOeAW78SHhtcfetz10S9qGc=
ARC-Authentication-Results: i=1; www.redadmin.org; arc=none smtp.remote-ip=192.168.11.50
Received: from webmail.redadmin.org (redadmin.org [192.168.11.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: weibu@redadmin.org)
	by www.redadmin.org (Postfix) with ESMTPSA id A0D2D109F289A;
	Mon, 29 Jun 2026 16:20:11 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org A0D2D109F289A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1782717611;
	bh=HJ55Q5LqlVvIfrh7wQuwkO1c2iuJf1JU6Vj5ItabHt8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qteBWpSSymPB6+oUTxuScawBwkAuqIh5z0TNOf4bCHnHo6vTcqCnpyS+p8nqyT/YE
	 kUhBdnC3Kib3OSldsZWJ8vDlclqWijmZbpHidcHcl4Wz05OntxrQlzv+6kPy/Qwb2q
	 t53NRK0v33IR6cUv3qmhIX0JRiz2UGaNn4b1Vol0=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 29 Jun 2026 16:20:11 +0900
From: weibu@redadmin.org
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net
Subject: Re: [PATCH v1] docs/ja_JP: translate submitting-patches.rst
 (sign-off)
In-Reply-To: <17b906ad-3f95-4a47-9762-b70589d86f6b@gmail.com>
References: <20260613233541.50732-1-weibu@redadmin.org>
 <17b906ad-3f95-4a47-9762-b70589d86f6b@gmail.com>
Message-ID: <d3a29ef047fe1381d18aef66f23304c7@redadmin.org>
X-Sender: weibu@redadmin.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

Hi Akira-san,

Thank you for the review.

I agree that translating the DCO text itself could be confusing,
because the sign-off refers to the English certificate, not to a
translated version.

I'll wait for your fix to the English version and then update the
Japanese translation accordingly.

Thanks,
Akiyoshi


2026-06-29 14:16 に Akira Yokosawa さんは書きました:
> Hi,
> 
> I'm sorry I couldn't respond promptly.
> 
> On Sun, 14 Jun 2026 08:35:41 +0900, Akiyoshi Kurita wrote:
>> Translate the "Include PATCH in the subject" and "Sign your work -
>> the Developer's Certificate of Origin" sections in
>> Documentation/translations/ja_JP/process/submitting-patches.rst.
>> 
>> Keep the wording close to the English text and wrap lines to match
>> the style used in the surrounding Japanese translation.
>> 
>> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
>> ---
>>  .../ja_JP/process/submitting-patches.rst      | 70 
>> +++++++++++++++++++
>>  1 file changed, 70 insertions(+)
>> 
>> diff --git 
>> a/Documentation/translations/ja_JP/process/submitting-patches.rst 
>> b/Documentation/translations/ja_JP/process/submitting-patches.rst
>> index d31d469909e4..56494bac169c 100644
>> --- a/Documentation/translations/ja_JP/process/submitting-patches.rst
>> +++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
>> @@ -402,3 +402,73 @@ ping したりする前に、少なくとも 1 週間は待ってください。
>>  パッチまたはパッチシリーズの修正版を投稿する場合は、"RESEND" を
>>  追加しないでください。"RESEND" は、前回の投稿から一切変更していない
>>  パッチまたはパッチシリーズを再送する場合にのみ使います。
>> +
>> +
>> +件名に PATCH を含める
>> +----------------------
>> +
>> +Linus と linux-kernel には大量のメールが届くため、メールの件名の
>> +先頭に ``[PATCH]`` を付けるのが一般的な慣例です。これにより、
>> +Linus や他のカーネル開発者は、パッチを他のメール議論からより
>> +簡単に区別できるようになります。
>> +
>> +``git send-email`` は、これを自動的に行ってくれます。
>> +
>> +
>> +自分の作業に署名する - Developer's Certificate of Origin
>> +---------------------------------------------------------
>> +
>> +誰が何を行ったのかを追跡しやすくするため、特に、複数階層の
>> +メンテナを経由して、最終的にカーネル内のあるべき場所へたどり着く
>> +可能性があるパッチについて、メールでやり取りされるパッチに
>> +``sign-off`` 手続きを導入しています。
>> +
>> +``sign-off`` は、パッチ説明の末尾に置く単純な 1 行です。これは、
>> +あなたがそのパッチを書いたこと、またはオープンソースのパッチとして
>> +渡す権利を持っていることを証明するものです。ルールは非常に単純です。
>> +以下を証明できるなら:
>> +
>> +Developer's Certificate of Origin 1.1
>> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> You are keeping this title untranslated.
> I agree it is not easy.  I even think it is close to impossible.
> 
> But then, I don't see much point in translating the "certificate"
> itself.
> 
>> +
>> +このプロジェクトへ貢献することにより、私は以下を証明します:
>> +
>> +        (a) この貢献は、全部または一部を私が作成したものであり、
>> +            ファイルに示されているオープンソースライセンスの下で
>> +            提出する権利を私が持っていること。または、
>> +
>> +        (b) この貢献は、私の知る限り、適切なオープンソース
>> +            ライセンスの下にある過去の成果物に基づくものであり、
>> +            そのライセンスの下で、その成果物を、全部または一部を
>> +            私が作成した修正とともに、同じオープンソースライセンスの
>> +            下で提出する権利を私が持っていること。ただし、
>> +            ファイルに示されているように、異なるライセンスでの提出が
>> +            許可されている場合を除きます。または、
>> +
>> +        (c) この貢献は、(a)、(b)、または (c) を証明した別の人物から
>> +            直接私に提供されたものであり、私はそれを変更していないこと。
>> +
>> +        (d) このプロジェクトと貢献が公開されること、ならびに、
>> +            貢献の記録（私が提出したすべての個人情報、私の sign-off を
>> +            含む）が無期限に維持され、このプロジェクトまたは関係する
>> +            オープンソースライセンスに従って再配布される可能性がある
>> +            ことを、私は理解し同意します。
> 
> What you need to agree in signing off is the English certificate.
> Not the translated one.  So this can confuse people.
> 
> I don't have any good idea.
> 
> Please convince me you can translate the certificate
> without any concern of confusion.
> 
>> +
>> +その場合は、次のような行を追加するだけです::
>> +
>> +        Signed-off-by: Random J Developer 
>> <random@developer.example.org>
>> +
>> +確認可能な身元情報を使ってください（残念ながら、匿名での貢献は
>> +受け付けられません）。これは ``git commit -s`` を使えば自動的に
>> +行われます。Revert パッチにも ``Signed-off-by`` を含めるべきです。
>> +``git revert -s`` はこれを自動的に行ってくれます。
>> +
>> +パッチ末尾に追加のタグを付ける人もいます。それらは今のところ単に
>> +無視されますが、社内手続きを示したり、sign-off に関する特別な
>> +詳細を示したりするために使うことはできます。
>> +
>> +作者の SoB に続くそれ以降の SoB (Signed-off-by:) は、パッチを
>> +取り扱い、次へ受け渡した人々によるものですが、その開発に関与した
>> +ことを意味しません。SoB の連鎖は、パッチがメンテナへ伝わり、
>> +最終的に Linus へ届くまでに実際にたどった **本当の** 経路を
>> +反映すべきです。先頭の SoB エントリは、単独の主たる作者を示します。
> 
> I think organization of this section in English version was
> corrupted during reST conversion.  I'll submit a fix.
> 
> Regards,
> Akira
