Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394536;
	b=3GplvnbjmoKdmHemkZafEeL8x7idplgHcJjc/7OJJ+43YSz2nG11qWJiI59R41UFMzP0
	 nHgxgCLpfOwLrH1A6xCQ/Kgo8RjvOh5U5QcSEw8iN4JUd3L+P983TEhaor4GpTjucqjDN
	 XmDi8dMgxpld7Ec4cTaVxmdKfGUp6cX+Ti81JSlhwQclR7aaRahrY/2wTFEYr8QFJNgvc
	 lU+flYua9paQT/mI+QsHh1pVd/az0iVRc3/CMslLt49W12SaCoQEuui+SltKt+UYUNeyW
	 BvXwFkDX6Hj4XyWoYmA779aoL9Jd4UO3a+PH3wRtANW/SJGowpcKSluUMF/oMHsVomQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=OUolrd1OXwKS6nKNPAcHQ6jGSl8Pb/p1AAcQQX44668=;
	b=WY0zaprBQsrliROT5rc4qXaKrS65JGRJbPXFO7MBktkukB+RsvKRyOJDiF3vYdwblIL3
	 prjaTLcbyNxrPUc3Xcm0amN76K2SHrouNTZzCmSovw7Ubrsds2Aeeb/3CA7sHi7MD8shN
	 gdKtt8hmXfPoy6OmnWK+YyorI39lFG/gSHDndnfaG0X+nF7tUqXumH9AHE2B08iZlT6GH
	 eEkn1Yh0RSvU1WsX+LSyuSBp90aTLKnfUoUK/Beam81tD4vub78UyK0HppZjYl3aFihqd
	 dwJr7wYQ6b4Qs7W//BB7xCK4nzCc+OEORW/PXNW5LY6IAv97IN+RuCT/FXwDeZxWqww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qX6mmiwl;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642E1606A326
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 10:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 642E1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qX6mmiwl
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8b600fae14dso1191760b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 02:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794394536; x=1794999336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OUolrd1OXwKS6nKNPAcHQ6jGSl8Pb/p1AAcQQX44668=;
        b=qX6mmiwlVzVGsWOMKEWWvxEj2iBU/YsFpiaOK9z13xs7rZod1b2GgVozZZuZ6VFQ0s
         KpHTT/gLHkNv+lCYfK/my3GHGPQpHJXBEAeRWH4V7CBOZYJ09pKQ4bxSGB4qjJs1EIV6
         B7IJCQS7nHWkhDg/6WbMD2jRzPYqclpFoFUzrOKeNJkilWfCSYRKw16XK7LAOyaESVY3
         EoBaVuSGvbtUZMAMZpggw6j6wZTZJ3Ry1TlsCt/nDQF4x61BrEQ4D2K7rLXXJoGPf6sH
         6fTgv2tTmxXApLTU8zzTSbc4mNvzsFpn88XIL9a3TzRVG+bAYs6eJkRxaV4ali8McXrf
         w6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794394536; x=1794999336;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OUolrd1OXwKS6nKNPAcHQ6jGSl8Pb/p1AAcQQX44668=;
        b=MSykzqmxuOLTUcXmNfi38i7EItyL2tfOadaWnIyNNy1NVct5p5DoN1wFYDniRUNKRl
         VnnjjtYXGWcb+xZrFIGML2rqPAIfTKpUUW61sD77KHXLJHRj/jqmWZ7Fmc5Cn4Kj7Vfr
         vVBWWs0TuORu6Rh6nELLBSc+JbyWEph7eTAA9RdjV6Q1HiqNO5mJ7T0MmsDekv2Ntt6u
         MU+8KdcqcjUgwdqidG6AuhMOdJ46ow9w8TrVG8uZiOzNla39mWoxnOqgdnw2CtKZh/NM
         gR+Deg3v6deH1lbOCELGdX6NajzjPLdxF6fP2w1Sgl3J/+HOt48hHEfRqOTvxiFJEaJy
         G66g==
X-Forwarded-Encrypted: i=1; AL+hErFxVVQJgWuLAwkD+k7XH0wBOcUrNtCu0xtSoncPwKFEzYS3vYrnwV6HXFiA2yrVubqe5kQjprMPhAY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/k/7yP1e5JcO9Cg2mt3gDFzm1ODjVqVah8nP1vp0cNc2/4TbeC
	FJ8XKms486qZqVKwoqQIH1YtAd5lyU1N7MA6MVhKl9lWeSqeRiHUZ/uR
X-Gm-Gg: AYBFou0z9Dh63EHZuQ1EyJGw0eTbR+EZFPbPJvrcBKyJ13IEobxvMKnm7vwPjiK1P9M
	2/CpXpvYxJyGp1pKw1R5BeJ1ZUcOJoqUH/HU2Zz/80Hs7VLIvnYH8cKrI8kd8H7S3OvIMVhEnoZ
	KFhq634SZdQ/gEK+4V9x7+5X+1MBoFSY2oPCqi+KeQL9Fhnh2QvC1UOfoB6xB3B95tvcTQ8axtg
	1I+zL8UXtiuLOBLo+m0YsA8nrhIaYiZyLPPJSeomEK5TXpKT8ntsq/OeZZo9EB24e6bhhnF2GLk
	rR2GezLfjw9xNqES1VkXV/vhZHfR2CID9A0KCIKAiAV51OuitL126byhoACxz0QMZnGwnTomISh
	yNALOZpLmFGSMQmSs1y5ZxYVKjwZNJg4uvpFAZAo6V8IZvF9Di2WOfMMbUnnqBwxswDoxE1yHA/
	gEMTKXpXlNDQT8Tx8lsboODVNJPa/w46ocjh3JmRzW6K/aHyiz3LHyZHzTP/+L/QbXXuA1RgVp5
	MLaTr06C89vzqXBgb0j4bUMT5m7EKNhJnUI2MwOhbXPskobx0+kLmClL/zlsgQ/BXL/MkQUIqZs
	uIRmAaL1tjcNpJO5ep60qBaUtY8A0fN4cSUIcbJnQfTFaTTBYTV7j6JVnNihidQ7SGYLU51mLG3
	QmtKCFP4DbjpBPoZl+ZM=
X-Received: by 2002:a05:6372:a701:b0:3eb:b1a1:5ca8 with SMTP id adf61e73a8af0-3f2fead849fmr1883650637.27.1794394535375;
        Wed, 11 Nov 2026 02:55:35 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baa7de3619sm2029198b3a.5.2026.11.11.02.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 02:55:34 -0800 (PST)
Message-ID: <18d55a74-869e-4d5c-9687-820502623aae@gmail.com>
Date: Wed, 11 Nov 2026 19:55:32 +0900
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] docs/ja_JP: translate submitting-patches.rst (patch
 format)
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
References: <20261106225619.12869-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20261106225619.12869-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

A couple of comments.  Please see below.

On Sat,  7 Nov 2026 07:56:19 +0900, Akiyoshi Kurita wrote:
> Translate the sections describing permission requirements for
> adding tags, the canonical patch format, and subject line
> conventions into Japanese.
> 
> Update existing cross-references to point to the newly
> translated section.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  .../ja_JP/process/submitting-patches.rst      | 108 ++++++++++++++++--
>  1 file changed, 100 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rst b/Documentation/translations/ja_JP/process/submitting-patches.rst
> index cc0b348086da..bcc0ffd74b17 100644
> --- a/Documentation/translations/ja_JP/process/submitting-patches.rst
> +++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
> @@ -85,11 +85,8 @@ Linux の多くの環境は、上流から特定のパッチだけを取り込
>  
>  パッチ説明を Linux のソースコード管理システム ``git`` の
>  「コミットログ」としてそのまま取り込める形で書けば、メンテナは
> -助かります。詳細は原文の該当節 ("The canonical patch format") を
> -参照してください。
> +助かります。詳細は :ref:`jp_the_canonical_patch_format` を参照してください。
>  
> -.. TODO: Convert to file-local cross-reference when the destination is
> -   translated.
>  
>  1 つのパッチでは 1 つの問題だけを解決してください。記述が長くなり
>  始めたら、パッチを分割すべきサインです。詳細は `変更を分割する`_ を
> @@ -343,11 +340,8 @@ Documentation/process/email-clients.rst を参照してください。
>  ときにはレビューアが機嫌を損ねることもあります。そのような場合でも、
>  丁寧に応答し、指摘された問題に対応してください。次の版を送る際には、
>  カバーレターまたは個々のパッチに ``patch changelog`` を追加し、前回の
> -投稿との差分を説明してください。詳細は原文の該当節
> -("The canonical patch format") を参照してください。
> +投稿との差分を説明してください。詳細は :ref:`jp_the_canonical_patch_format` を参照してください。
>  
> -.. TODO: Convert to file-local cross-reference when the destination is
> -   translated.
>  
>  あなたのパッチにコメントしてくれた人たちは、パッチの Cc リストに追加して
>  新しい版について知らせてください。
> @@ -688,3 +682,101 @@ Documentation/process/stable-kernel-rules.rst を参照してください。
>  最後に、タグを付けることは歓迎され、通常は非常にありがたいものですが、
>  署名者（すなわち、提出者およびメンテナー）は、提示されたタグを
>  適用するかどうかを自身の判断で決めることができます。
> +
> +.. _jp_tagging_people:
> +
> +人をタグ付けするには許可が必要
> +--------------------------------
> +
> +前述のタグをパッチに追加する際は注意してください。``Cc:``、
> +``Reported-by:``、``Suggested-by:`` を除くすべてのタグには、
> +名前を記載される本人の明示的な許可が必要です。これら三つのタグについては、
> +lore のアーカイブやコミット履歴から、その人が同じ名前とメールアドレスで
> +Linux カーネルに貢献していることを確認できれば、黙示的な許可で十分です。
> +ただし、``Reported-by:`` と ``Suggested-by:`` については、
> +その人が報告や提案を公開の場で行っている必要もあります。
> +
> +なお、bugzilla.kernel.org は、この意味では公開の場とみなされますが、
> +そこで使用されるメールアドレスは非公開情報です。その人が過去の貢献で
> +同じメールアドレスを使用していない限り、タグに記載して公開してはいけません。
> +
> +.. _jp_the_canonical_patch_format:
> +
> +標準的なパッチ形式
> +------------------
> +
> +この節では、パッチ自体の形式を説明します。パッチを ``git`` リポジトリで
> +管理している場合は、``git format-patch`` で適切な形式のパッチを
> +生成できます。ただし、必要な説明文までツールで作成できるわけでは
> +ありません。そのため、以下の説明にも目を通してください。
> +
> +件名行
> +^^^^^^
> +
> +標準的なパッチの件名行は次の形式です::
> +
> +    Subject: [PATCH 001/123] subsystem: summary phrase
> +
> +標準的なパッチメールの本文には、次の要素が含まれます。
> +
> +  - パッチの作者を示す ``from`` 行と、その後の空行
> +    （パッチの送信者と作者が異なる場合にのみ必要です）。
> +
> +  - このパッチの説明として恒久的な変更履歴に記録される本文。
> +    1 行を 75 桁以内で折り返します。
> +
> +  - 空行。
> +
> +  - 前述の ``Signed-off-by:`` 行。これも変更履歴に記録されます。
> +
> +  - ``---`` だけを記載した区切り行。
> +
> +  - 変更履歴に含めるのが適切でない追加のコメント。
> +
> +  - 実際のパッチ（``diff`` の出力）。
> +
> +件名行をこの形式にすると、メールを件名のアルファベット順に
> +並べ替えることが非常に簡単になります。ほぼすべてのメールソフトが

My interpretation of original sentence is closer to the following:

  件名行をこの形式にすると、メールの並び替えを件名のアルファベット順で
  容易にできます。というのも、ほぼすべてのメールソフトが

> +この並べ替えに対応しており、連番がゼロ埋めされているため、
> +数値順とアルファベット順の並びが一致します。
> +
> +件名の ``subsystem`` には、パッチの対象となるカーネル内の領域や
> +サブシステムを指定してください。
> +
> +件名の ``summary phrase`` には、メールに含まれるパッチの内容を
> +簡潔に記述してください。ファイル名を使ってはいけません。また、
> +一連のパッチシリーズ（関連する複数のパッチを順序付けたもの）の
> +すべてに同じ ``summary phrase`` を使わないでください。
> +
> +メールの ``summary phrase`` は、そのパッチを識別するための
> +世界的に一意な識別子になることに注意してください。これは ``git`` の

I'd say "大域的" for "global".

> +変更履歴にも記録され、その後の開発者間の議論でパッチを参照する際に
> +使われることがあります。パッチについての議論を調べるために、
> +``summary phrase`` で Web 検索する人もいるでしょう。また、
> +2 ～ 3 か月後に ``gitk`` や ``git log --oneline`` などで
> +数千件ものパッチを確認するとき、すぐに目に入る情報が
> +``summary phrase`` だけという場合もあります。
> +
> +このため、``summary`` は 70 ～ 75 文字以内とし、パッチが
> +**何を変更するのか** と **なぜその変更が必要なのか** の両方を
> +説明する必要があります。簡潔さと説明の十分さを両立させるのは
> +簡単ではありませんが、適切な要約にはその両方が求められます。
> +
> +``summary phrase`` の前には、角括弧で囲んだタグを付けることができます。
> +たとえば ``Subject: [PATCH <tag>...] <summary phrase>`` の形式です。
> +これらのタグは要約の一部とはみなされず、パッチをどのように
> +扱うべきかを示します。一般的なタグには、コメントを受けて
> +複数の版を送信した場合のバージョン番号（``v1``、``v2``、``v3`` など）や、
> +意見を求めることを示す ``RFC`` などがあります。
> +
> +パッチシリーズが四つのパッチで構成される場合は、各パッチに
> +``1/4``、``2/4``、``3/4``、``4/4`` のように番号を付けられます。
> +これにより、開発者はパッチを適用する順序を把握でき、
> +シリーズ内のすべてのパッチをレビューまたは適用したか確認できます。
> +
> +適切な件名の例を以下に示します::
> +
> +    Subject: [PATCH 2/5] ext2: improve scalability of bitmap searching
> +    Subject: [PATCH v2 01/27] x86: fix eflags tracking
> +    Subject: [PATCH v2] sub/sys: Condensed patch summary
> +    Subject: [PATCH v2 M/N] sub/sys: Condensed patch summary

Thanks, Akira
