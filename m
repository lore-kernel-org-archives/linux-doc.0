Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71380348C54
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 09:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772987; cv=none; b=r626mzsJrXSB1pnSgV9VpNs72GLk0XI5a4thr20fVyWL5LNqwwK+4IcmKQthCHiPZOoizgu3HQwpW4NCUhY4/jZIBCdT9gZJcSfsEhiUzVxNsXHqQyzLWqW8GSrkyZj3u6Py1rwauvqrLO/eqMeOXZm+jbRIPzwZ+lbTFfR5okc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772987; c=relaxed/simple;
	bh=O9E5UU7KDMg1prlzm9x6rf/L2j9ojB1u4O+i5dh5pe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B91bb1wlc9d4s4dkfLqtFIuGVt6nP3XXY7q5ic5o7hPC6m4r6SvlT16mdc6c82v9JxqggTFqqLI/xuwoVk99exCcL6gQoX8yx3OvL6w3/TzWXXF/eKib/e2LOaxbEFNAZQolOtGn+/LmrfrBt+kVm4Scsvwy7CIrrPnzNvwAq0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SGks5zDb; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SGks5zDb"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8487214ad2bso3543513b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2026 02:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788772984; x=1789377784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=779V8up9UUbTfdCTWD8dD075WrCFiRj+sKr7et++Wgw=;
        b=SGks5zDbOINN+NZ1/N1WH3ZRHpheVJvMxIlFdnPhEcKZXszAs4Sd6bzKXBtb6ndQAl
         MQVfdGXjfO/0OQR4AKIGPQ/RMOHuN5qcbWbIO2vO+/SOm1Xxd0r57xcA9KvvCn1vj04h
         lqWhb3RaOq9Ix0q94V685WCJcH/bor9Q/he+w2WyhVCqIUcqA2dSsqTM1RNyXGHeLGgd
         eaPYXg6krhWLeMoXM8ubQAi4/tzaQUMGqslvzZErAh+v40//dEd4XAV/qO0uTkO39mrP
         tPGQZ2MtO1qLkbds21LeAI0boKlN69Jvz4w0Ia7GYIcMQC0z62+WIDLzd0qoj0hxl/TM
         Q3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788772984; x=1789377784;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=779V8up9UUbTfdCTWD8dD075WrCFiRj+sKr7et++Wgw=;
        b=PPIfc2xopY1nPLz4Ve9MQ27Olcpc+EmA79mEFyHcJxgHpN02zkGMhqQPyVwIpUDjM1
         Bnf8kxX9tW29fBinYQq5Okw4/oj0hzE+TlADsynAWGLaC7/C/VtbilbaoUvkZhtfV3UK
         FG+HJU7p57e1sON5aa/s2FxDTUjbP6CRRLj34G8f4jXbyfSGbccNWNFMdAe/tOd/Ej1T
         Fwx86T7Gq/Xm5O1wZUhRKKCSDHHRMnSRK1dN1so7OUwn1kaZ5GdNnZ1rXK866Pkvwf8U
         Ksj1m6tjPVw5aVOGf9ZSGjnhFmHm8JoB+aefRCfFVAcK5KCDxv/cuT9STCKcEdP0zzFn
         GNDg==
X-Forwarded-Encrypted: i=1; AKwUvBxBrzK83jKH+vZUDZql/MMuEl8QwbAC5Eo7tFvhZqCA5DUbSffOgUAlPyDLVl0purBuXuroQvN5KCQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mMQrj0GIiQVZ+cN9jYfm9dpTmx/xog+2FRclz2Qkq41yFtijyy
	zJvzXZsLO1U9gYI36NE7LBqJBWMYpYApIQhD2Nnu5eiVD5+9tO+WY7aM33g4hw==
X-Gm-Gg: AYBFou0+hYqiR/ICVKJLYaUUAIhw+Oq4U+pe+bJKJZEqLBlC9/qqahV8HlRTFWdeWar
	yVkSaHbEFO9Rj9/SnlEpUchtkg9Y1ecW/z6yvXkw4W6QzovqVj3+4gl4VVLvUAeMXLDlDzzLBAx
	voSEGlokgptX1HhcwM93mbQjIoQfs3IlE1p5r0CMha7ZiF2V+SETOfv8OCWrwoHFCirPKvKiMaz
	iyHrV2jFGVi36CINC4BMFCni0ayTLTamhWARKY+OINGwwIODVJYvA8owD7zj6uGGKHqm9I95HR4
	24KdlA2WEH4BPDvhsEfTT6icxVjdac/LM+vVAt85CzqxfOucChSovA/VXu9Q3mgLSyJDRtSk/5O
	99AAwq7+NB0uZk82N03+kk05yVOpC+2jKv/YuQgMnH0dyEsIpy/Pni25fHtlnMY3pUkaycctYPr
	ocmwr+WZomsPrfivbNpHCWEaP0Z4Fh4llLRooApWZ790dP6JhU6Y10d09MI6MZgckVyiOtH+1zw
	D5TJ3uttjNNzd1jFiWwO98uLL+HAWU3sA==
X-Received: by 2002:a05:6a00:f0d:b0:848:4faa:480b with SMTP id d2e1a72fcca58-8616ba5f20fmr31101318b3a.12.1788772983589;
        Mon, 07 Sep 2026 02:23:03 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-864782f0be1sm1477885b3a.41.2026.09.07.02.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 02:23:03 -0700 (PDT)
Message-ID: <4608104c-7075-43cd-adaf-c15ef09cec54@gmail.com>
Date: Mon, 7 Sep 2026 18:23:00 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/ja_JP: translate submitting-patches.rst (review and
 report tags)
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, corbet@lwn.net,
 Akira Yokosawa <akiyks@gmail.com>
References: <20260903020356.1055420-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260903020356.1055420-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kurita-san,

First of all, this email has a lot of bogus @www.redadmin.org addresses
in To: and Cc:.  Please don't do that.

On 9/3/26 11:03, Akiyoshi Kurita wrote:
> Translate the section describing Reported-by, Tested-by, Reviewed-by,
> Suggested-by, and Fixes tags into Japanese.
> 
> This includes the Reviewer's Statement and the guidance on adding or
> removing review and testing tags in subsequent patch versions.
> 
> Keep the Japanese submitting-patches documentation aligned with the
> corresponding English section.

Inline comments below.

> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  .../ja_JP/process/submitting-patches.rst      | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rst b/Documentation/translations/ja_JP/process/submitting-patches.rst
> index 797b70b97fa7..0b4e22b015d7 100644
> --- a/Documentation/translations/ja_JP/process/submitting-patches.rst
> +++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
> @@ -573,3 +573,94 @@ Acked-by:、Cc:、Co-developed-by: を使用する場合
>      Signed-off-by: From Author <from@author.example.org>
>      Co-developed-by: Submitting Co-Author <sub@coauthor.example.org>
>      Signed-off-by: Submitting Co-Author <sub@coauthor.example.org>
> +
> +
> +Reported-by:、Tested-by:、Reviewed-by:、Suggested-by:、Fixes: の使用
> +---------------------------------------------------------------------
> +
> +``Reported-by:`` タグは、バグを発見して報告した人の功績を示すものであり、
> +今後も再び協力してもらうきっかけになることが期待されます。このタグは
> +バグを対象としています。機能追加の要望に対する功績を示すためには
> +使用しないでください。報告が Web 上で参照できない場合を除き、
> +``Reported-by:`` タグの後には、その報告を指す ``Closes:`` タグを
> +付ける必要があります。パッチが報告された問題の一部だけを修正する場合は、

   付けてください。報告された問題の一部だけを修正するパッチの場合は、

> +``Closes:`` の代わりに ``Link:`` タグを使用できます。なお、
> +``Reported-by:`` は、名前を記載される本人の明示的な許可なしに
> +使用できる可能性がある三つのタグのうちの一つです。詳細については、
> +後述の「人をタグ付けするには許可が必要」を参照してください。
> +
> +``Tested-by:`` タグは、記載された人が（何らかの環境で）パッチを
> +正常にテストしたことを示します。このタグは、何らかのテストが
> +実施されたことをメンテナーに知らせ、将来のパッチでテスターを
> +探す手段を提供するとともに、テスターの功績を記録します。
> +
> +一方、``Reviewed-by:`` は、パッチがレビューされ、以下の
> +レビュー担当者の声明に従って受け入れ可能と判断されたことを示します::
> +
> +        レビュー担当者による確認声明

You used "レビューア" for "reviewer" in your earlier submissions.
Is there any reason for the different word/term ?

Also, "Reviewer's statement of oversight" is similar to the DCO.
I think it should be translated in a way so that it looks like
a legal statement.
Especially, I'd use "だ体", or formal style.

I would rather put the original English text here, and append the
translation as a 試訳 (or 訳例).

> +
> +        ``Reviewed-by:`` タグを付けることにより、私は以下を表明します:
> +
> +         (a) このパッチがメインラインカーネルへの取り込みに適切であり、
> +             その準備が整っているかを評価するため、技術的なレビューを
> +             行いました。
> +
> +         (b) パッチに関する問題、懸念、または質問はすべて提出者に
> +             伝えられています。私は、自分のコメントに対する提出者の
> +             回答に満足しています。
> +
> +         (c) この提出物には改善できる点が残っている可能性がありますが、
> +             現時点では、(1) カーネルに対する価値のある変更であり、
> +             (2) 取り込みに反対する理由となる既知の問題がないと
> +             考えています。
> +
> +         (d) 私はこのパッチをレビューし、妥当であると考えていますが、
> +             別途明示されていない限り、そのパッチが記載された目的を
> +             達成すること、またはいかなる状況でも正しく動作することを
> +             保証するものではありません。
> +
> +``Reviewed-by:`` タグは、そのパッチが重大な技術的問題を残していない、
> +カーネルに対する適切な変更であるという意見を表明するものです。
> +必要なレビューを行った既知の身元を持つ人であれば、関心のある
> +レビュー担当者は誰でもパッチに ``Reviewed-by:`` タグを付けられます。
> +このタグは、レビュー担当者の功績を示すとともに、どの程度のレビューが
> +行われたかをメンテナーに知らせる役割を果たします。対象分野を理解し、
> +十分なレビューを行うことで知られているレビュー担当者が付けた
> +``Reviewed-by:`` タグは、通常、パッチがカーネルに取り込まれる
> +可能性を高めます。
> +
> +``Tested-by:`` と ``Reviewed-by:`` の両方のタグは、メーリングリスト上で
> +テスターまたはレビュー担当者から受け取った後、次のバージョンを
> +送信するときに、作者が該当するパッチへ追加する必要があります。
> +ただし、次のバージョンでパッチが大幅に変更された場合は、これらのタグが
> +適用できなくなる可能性があるため、削除する必要があります。
> +通常、誰かの ``Acked-by:``、``Tested-by:``、または ``Reviewed-by:`` タグを
> +削除した場合は、その理由をパッチの変更履歴で説明する必要があります
> +（``---`` 区切りの後）。
> +
> +``Suggested-by:`` タグは、パッチのアイデアが記載された人によって
> +提案されたことを示し、そのアイデアに対する功績を記録します。
> +アイデアを提案した人の功績をきちんと記録すれば、今後も再び協力して
> +もらうきっかけになることが期待されます。なお、これは、名前を
> +記載される本人の明示的な許可なしに使用できる可能性がある三つの
> +タグのうちの一つです。詳細については、後述の
> +「人をタグ付けするには許可が必要」を参照してください。
> +
> +``Fixes:`` タグは、そのパッチが以前のコミットにあるバグを修正する
> +ことを示します。これは、問題がどこで発生したのかを容易に特定できる
> +ようにし、バグ修正のレビューに役立ちます。また、このタグは stable
> +kernel チームが、どの stable kernel バージョンに修正を適用すべきかを
> +判断する際にも役立ちます。パッチが修正するバグを示す方法としては、
> +これが推奨されています。詳細については :ref:`describe_changes` を

This will point the original (English) section.  File-local reference
can be made by:

                        詳細については `変更内容を記述する`_ を

> +参照してください。
> +
> +注意: ``Fixes:`` タグを付けても、stable kernel rules の手順や、
> +stable 向けパッチ候補すべてで ``Cc: stable@vger.kernel.org`` を
> +指定する要件がなくなるわけではありません。詳細については、
> +Documentation/process/stable-kernel-rules.rst を参照してください。
> +
> +最後に、タグを付けることは歓迎され、通常は非常にありがたいものですが、
> +署名者（すなわち、提出者およびメンテナー）は、提示されたタグを
> +適用するかどうかを自身の判断で決めることができます。

This label is not needed in this patch/file ...

> +
> +.. _tagging_people:

Thanks, Akira

