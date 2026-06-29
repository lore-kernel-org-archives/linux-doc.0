Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BD68834
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 05:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782710194; cv=none; b=c90wwwLf6BgVHcGech+WFIyaqyfkr60z2CYntVx/9ds5kPJRmHhXKf8BxyE/fyCmgMskw6bF/B6JAmn7QVLkZrUz/l+il3t3E0+PmTAz8FzbtbFg2efMqx2b844wHj82QhJBCqo0GTABo+rjWClvZkhocssDqKaUJvMI2BncUeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782710194; c=relaxed/simple;
	bh=/ylXVaBwLzid2elTBdH+r8JbF9H6ufR7LoYsxFXUOpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vAeGKPfyRkx3KZ12EXy6pT9LUlAJFi62jJtnYwGG+/tifpbdKX18XenC/PUR1qJhoybmhVvBA5wWvcGHilkA/7jdHw7WgIb5ffRsHODZ7ttOEaWKd8Vrxj5j7NZiNkHWAw+z+1Yed6c8kF7c1c7qQmZLc/gXXhSzrlGg2ML+CMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VszQJUFM; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VszQJUFM"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8478a25f268so161744b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 22:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782710192; x=1783314992; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N+KyHNjUf/PpwCVd1UFriIsmpGmljdtm//+glOfppmQ=;
        b=VszQJUFMot6emWJTjJJneIwJvUSM27xQJmzLq2BUqHtDsz+vfXNIrby49/bbPEJVzJ
         de3b7kF8kA7uw7mGRtjxSc600ZXTr1Nx4nqqPEzeXQ6uOc+X8oGAj2+CWb13+7B1RM3F
         DOJn0puBciZbednz5Xb9q8rlDaio0Xc4ljI9dDgutXupuJFQHIPcsnVAnNEpZ29ppED6
         B2C9P7a8KJFU/Q8U8nudxSjMJ6KoxLMXlR8l1IqSaWAGezldUGxk6cHZbj5BzzWh/Dwf
         iV69pGaXqBcg2aYjHqAzVykaPjZHeh3JYvmKY8WnD9DFPHxD7TAEONUJfOvE4rLGcSTX
         yc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782710192; x=1783314992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N+KyHNjUf/PpwCVd1UFriIsmpGmljdtm//+glOfppmQ=;
        b=VzGvKpULL1l1pv9pigIqgvGFzsApM6okscnFnqoGGHHajiQMfveHYbh2DLqf7tX5tM
         zaJJam/EfXXPWTXfxHGmwxCjcm1wgcUanJWrrVJdGyyaRfFGZmPEbZz0xViSEnld5avt
         hRvuc5s3GQ/s+kiPRKoRuCqrZeaTzI2L65BuaG5XFtiw/gAwOFES27gkiFnlPFni4UmA
         LmB8xwzGrpDkNykDNuu9Ac6TH4aIQ+/tZRDZkYThb1ZvvmTmllZajUFR3nX+/uX1v5x5
         wynxcm/WQipbMjErFubIIORPEyj0oPi9oQAHYCdD82b9TMvDIOm6YMcg+Uvz4/f06qaR
         GVvA==
X-Forwarded-Encrypted: i=1; AHgh+RpQDfb5WguoPRqCPt+gwfmNQVPeR8HW2tqCBTq3nJanEezYcjzsoCa2yyPDH0QYIiPrENGzVnemc64=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxj3dY5YaUBTin2utuuTkPe/+4OY+/m8t2MYnzCK9dRMbNw85v
	RA3saHcet0zRrmWOmSzjno67ZNAcKH2ei5PAMIclO1V0SLzVVUh5aFZl
X-Gm-Gg: AfdE7ck7EtY+zZBE/y0FFLIKGjn4u1SyMtCdpMo5wU6TJgQW+LUivKtKybguNafgWyV
	h5eCLaWXATqB9xVZrLT9EEU2num+hoviFyLKtkKHvd3NbWEU1A1FCW7+tstyirRuHNCZsdFVsfm
	D2SN5/aTVD2E+MWqGfRGDhIvc/mJyaYFIo9kmIlFZ3LptDZngZNWY1GD3ybQFwt0OweNuvIyjZc
	Es46ORHKwBz/74BDlyE8/UrA+7bBRWEl/C1cL34J5n3rLClV5LTrYOCtgVhxUE9NU0znSdlgpTt
	ew/31K4E9vDMQuOioTrk6T8iUV1fOPlnnoSdNwYKQ+ucFUn5xkhfcFsjArr/oGXRzsDY73aV7Iw
	alCMsXhH2DjKFZVFwERqITns0Wigu0VcTOliAi2dbbJH7Fo+WEsyryISSlEz2UmA/sUDZ5qym7B
	ijt2Kz5jMujJoxXCsFruYHQg/7IeSqb9yoaTTgNfDTKyzolHGVUHS3bCBg7Q==
X-Received: by 2002:a05:6a00:14cd:b0:847:86d8:5937 with SMTP id d2e1a72fcca58-84786d85f19mr1451037b3a.50.1782710191836;
        Sun, 28 Jun 2026 22:16:31 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d23d7sm10963307b3a.30.2026.06.28.22.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:16:31 -0700 (PDT)
Message-ID: <17b906ad-3f95-4a47-9762-b70589d86f6b@gmail.com>
Date: Mon, 29 Jun 2026 14:16:29 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] docs/ja_JP: translate submitting-patches.rst
 (sign-off)
To: Akiyoshi Kurita <weibu@redadmin.org>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net,
 Akira Yokosawa <akiyks@gmail.com>
References: <20260613233541.50732-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260613233541.50732-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I'm sorry I couldn't respond promptly.

On Sun, 14 Jun 2026 08:35:41 +0900, Akiyoshi Kurita wrote:
> Translate the "Include PATCH in the subject" and "Sign your work -
> the Developer's Certificate of Origin" sections in
> Documentation/translations/ja_JP/process/submitting-patches.rst.
> 
> Keep the wording close to the English text and wrap lines to match
> the style used in the surrounding Japanese translation.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  .../ja_JP/process/submitting-patches.rst      | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rst b/Documentation/translations/ja_JP/process/submitting-patches.rst
> index d31d469909e4..56494bac169c 100644
> --- a/Documentation/translations/ja_JP/process/submitting-patches.rst
> +++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
> @@ -402,3 +402,73 @@ ping したりする前に、少なくとも 1 週間は待ってください。
>  パッチまたはパッチシリーズの修正版を投稿する場合は、"RESEND" を
>  追加しないでください。"RESEND" は、前回の投稿から一切変更していない
>  パッチまたはパッチシリーズを再送する場合にのみ使います。
> +
> +
> +件名に PATCH を含める
> +----------------------
> +
> +Linus と linux-kernel には大量のメールが届くため、メールの件名の
> +先頭に ``[PATCH]`` を付けるのが一般的な慣例です。これにより、
> +Linus や他のカーネル開発者は、パッチを他のメール議論からより
> +簡単に区別できるようになります。
> +
> +``git send-email`` は、これを自動的に行ってくれます。
> +
> +
> +自分の作業に署名する - Developer's Certificate of Origin
> +---------------------------------------------------------
> +
> +誰が何を行ったのかを追跡しやすくするため、特に、複数階層の
> +メンテナを経由して、最終的にカーネル内のあるべき場所へたどり着く
> +可能性があるパッチについて、メールでやり取りされるパッチに
> +``sign-off`` 手続きを導入しています。
> +
> +``sign-off`` は、パッチ説明の末尾に置く単純な 1 行です。これは、
> +あなたがそのパッチを書いたこと、またはオープンソースのパッチとして
> +渡す権利を持っていることを証明するものです。ルールは非常に単純です。
> +以下を証明できるなら:
> +
> +Developer's Certificate of Origin 1.1
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

You are keeping this title untranslated.
I agree it is not easy.  I even think it is close to impossible.

But then, I don't see much point in translating the "certificate"
itself.

> +
> +このプロジェクトへ貢献することにより、私は以下を証明します:
> +
> +        (a) この貢献は、全部または一部を私が作成したものであり、
> +            ファイルに示されているオープンソースライセンスの下で
> +            提出する権利を私が持っていること。または、
> +
> +        (b) この貢献は、私の知る限り、適切なオープンソース
> +            ライセンスの下にある過去の成果物に基づくものであり、
> +            そのライセンスの下で、その成果物を、全部または一部を
> +            私が作成した修正とともに、同じオープンソースライセンスの
> +            下で提出する権利を私が持っていること。ただし、
> +            ファイルに示されているように、異なるライセンスでの提出が
> +            許可されている場合を除きます。または、
> +
> +        (c) この貢献は、(a)、(b)、または (c) を証明した別の人物から
> +            直接私に提供されたものであり、私はそれを変更していないこと。
> +
> +        (d) このプロジェクトと貢献が公開されること、ならびに、
> +            貢献の記録（私が提出したすべての個人情報、私の sign-off を
> +            含む）が無期限に維持され、このプロジェクトまたは関係する
> +            オープンソースライセンスに従って再配布される可能性がある
> +            ことを、私は理解し同意します。

What you need to agree in signing off is the English certificate.
Not the translated one.  So this can confuse people.

I don't have any good idea.

Please convince me you can translate the certificate
without any concern of confusion.

> +
> +その場合は、次のような行を追加するだけです::
> +
> +        Signed-off-by: Random J Developer <random@developer.example.org>
> +
> +確認可能な身元情報を使ってください（残念ながら、匿名での貢献は
> +受け付けられません）。これは ``git commit -s`` を使えば自動的に
> +行われます。Revert パッチにも ``Signed-off-by`` を含めるべきです。
> +``git revert -s`` はこれを自動的に行ってくれます。
> +
> +パッチ末尾に追加のタグを付ける人もいます。それらは今のところ単に
> +無視されますが、社内手続きを示したり、sign-off に関する特別な
> +詳細を示したりするために使うことはできます。
> +
> +作者の SoB に続くそれ以降の SoB (Signed-off-by:) は、パッチを
> +取り扱い、次へ受け渡した人々によるものですが、その開発に関与した
> +ことを意味しません。SoB の連鎖は、パッチがメンテナへ伝わり、
> +最終的に Linus へ届くまでに実際にたどった **本当の** 経路を
> +反映すべきです。先頭の SoB エントリは、単独の主たる作者を示します。

I think organization of this section in English version was
corrupted during reST conversion.  I'll submit a fix.

Regards,
Akira

