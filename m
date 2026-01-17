Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FE026A1B9
	for <linux-doc@vger.kernel.org>; Sat, 17 Jan 2026 09:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768641631; cv=none; b=jIlN5X//sfjVGpnU4ZFjSVGBkFSCUOGrVV5v9q08V7/iArhY7ixdVBV7/MeS9y7mhbNbUzaLlnB91S/cXDRs4FPjNDOBzeRASffdXlioII827sDFLAy2oj2RPYlVW/nG64/loBkOIaMmotjbSzNlpcpoK7Oe3OtTrRv4ojuozOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768641631; c=relaxed/simple;
	bh=gz6BV8tw8Oz+NJoE/mdJk6KO7jxFVqwpG8SmJj2tJoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nogP/eu6Nc3pchm4loQrWlw3zn2GMV16TN4PnHlamoKPJK4IjNQOKE96JIcVoWQLryEW6nQirsQFih7PncWVJ5tmMdZlW0KgYgOa6SIuQ/P/JB/Vp1HLDZhjW+Ox/v8hmJVuz2IMHjOldSKIhrfKE8Hkk+mDuQ8ngAc5ao2jwsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4Sd+3lh; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4Sd+3lh"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bcfd82f55ebso1623888a12.1
        for <linux-doc@vger.kernel.org>; Sat, 17 Jan 2026 01:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768641628; x=1769246428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KCh6+wrwiwo+hw9O3OXXzaJvUbFQwMN6FO3NIwgcTk4=;
        b=d4Sd+3lhVGCn23i2KDpwbJnmiVwqKCyLi7BqP05KBr8AAioJw/iJ8AcR1uSoMGVH06
         hxxSP27lPDbl3GkovL4oyA6V0V6AoE04KdlXudb42lQwgvPB+8jMcXeM2ijgO7e4Xirz
         2B9SJRZj32nVzwi56xQkUPVkIYLigflvxGFKD0Gxgk1KceoovzpLP7lKKFD+gNwzdqYr
         2QlJKEKFCgN+SYuaJlZp2JIK6P46Elj9n4wfuSBCFjxQNiqnmYj6KLWEHHuMAHSaqasb
         /Mby/wR95B3VToiOG1GFcWGOZq7x58bx0D3mD/XwPTG11BY7+r+SDNn+ylzfu2g2wEVb
         w9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768641628; x=1769246428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCh6+wrwiwo+hw9O3OXXzaJvUbFQwMN6FO3NIwgcTk4=;
        b=De6+omZNiI96dkOko5/euKg2oH4GhtuOc9EWWbNYxQstHTOoh8IrtqaN1KOXlef4kN
         i/oKcz7cvaG/oAuKCXkseOweJ3zS4dM+raKAAZK6c2azDThykmea8MK1Umbhm7BkgNO6
         kwbiD1VqqnEkw/Ec8Ea/3w07sreW4mGmGTs31/Wh+VGBB5x0haiw+4JIHJoQmlK8e3ky
         tpK06sVAV18MSD8/teOz5pxSv4lPyWt2oAecUCp1ObAaPX5nVtBcbCmqF6S7LzP1NBIj
         b1kN07I6+cSD5iR2CMaMqT14QnTqZyqjlTCjuu6puDn1P9Jhn7mu5P/Mc3qR6/2QQ1y4
         VBSg==
X-Forwarded-Encrypted: i=1; AJvYcCV0AMN+ffwWwrE37jHIWG3ZNVXkYKv5BkDKRclmYSjHTAhor9XRCftIqvSuIm0P9qBDSkSEXxSMO2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHVLSCp74Dzf39ti2l4LkCf1wxv7NIinOc0arNk0c0SJjl4DuR
	uYdayhm423jQueCY1IGKnkxM8OkMnLMGYh3CPISoop5eTNgrBrZbvcpO5+CAUA==
X-Gm-Gg: AY/fxX5WCxA4yAuLg5KOBoOJDnNgga8+e9cpEXcfZiapGoyYAS4RlYcsPkVG1xtsmOq
	8iJfOlMlK7GeZySjnBNyUZiNZT2ATw2H9J3AV0FCqOIykJXQaXNW1u0YlLAb+1IZYtx7ouiHAXF
	bUSWyNpN45/iAz24Vw318/lhznSqZAkrOYnpK3jGDoCv6lplprxq/AnAvoMkhjQRi8VmnQFE272
	ipaaUoN0B3C0iWZmFWUl+UqkxKTu5zdjK3gH69omEZB+4sBrPUNGMROBYtb2vFj6SulG/t4utjC
	roIqdTZ3f2UqMAzenjpwvPhaH9mCZFbsQh4+Q7IDnVfdFiMWqUcUj2tI3DNbGm+T0IUCvc9lJ/S
	b7uyDM3FgBGn9egdS48TXW+4vcDM3EmTy5g+jl2+BT/OjOnRhpPya9g+61d58qNyhX4VKALjIHZ
	UjjIW/fc6BGhJJLbkZtnQPQRkZbXHt8SASijXtxXVR3qdsOb/33waDtGTa
X-Received: by 2002:a17:90b:5405:b0:34c:ab9b:76c4 with SMTP id 98e67ed59e1d1-35272a535b7mr4938347a91.0.1768641628045;
        Sat, 17 Jan 2026 01:20:28 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352677ec7a8sm6351061a91.7.2026.01.17.01.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 01:20:27 -0800 (PST)
Message-ID: <71156e02-e7c5-42a3-87f5-cfad7a8fe907@gmail.com>
Date: Sat, 17 Jan 2026 18:20:25 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: ja_JP: Start translation of submitting-patches
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: shibata@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, corbet@lwn.net
References: <20260115045941.161458-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260115045941.161458-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kurita-san,

On Thu, 15 Jan 2026 13:59:41 +0900, Akiyoshi Kurita wrote:
> Start a new Japanese translation of
> Documentation/process/submitting-patches.rst.
> 
> As suggested by Akira Yokosawa, instead of moving the outdated 2011
> translation (SubmittingPatches), we are starting a fresh translation of
> the current English document.
> 
> This patch adds the initial file structure, the warning about the
> document being under construction, and the translation of the
> introduction section.
> 
> The translation work will be done incrementally.
> 
> Suggested-by: Akira Yokosawa <akiyks@gmail.com>
> Link: https://lore.kernel.org/298d3a9c-41c1-4cbd-b4ab-d3009df9388c@gmail.com/
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  Documentation/translations/ja_JP/index.rst    |  1 +
>  .../ja_JP/process/submitting-patches.rst      | 36 +++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 Documentation/translations/ja_JP/process/submitting-patches.rst
> 
> diff --git a/Documentation/translations/ja_JP/index.rst b/Documentation/translations/ja_JP/index.rst
> index 4159b417bfdd..5d47d588e368 100644
> --- a/Documentation/translations/ja_JP/index.rst
> +++ b/Documentation/translations/ja_JP/index.rst
> @@ -13,6 +13,7 @@
>  
>     disclaimer-ja_JP
>     process/howto
> +   process/submitting-patches
>     process/submit-checklist
>  
>  .. raw:: latex
> diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rst b/Documentation/translations/ja_JP/process/submitting-patches.rst
> new file mode 100644
> index 000000000000..7d3edf1ff87a
> --- /dev/null
> +++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
> @@ -0,0 +1,36 @@
> +.. _jp_process_submitting_patches:
> +
> +パッチの投稿: カーネルにコードを入れるための必須ガイド
> +======================================================
> +
> +.. note::
> +
> +   このドキュメントは :ref:`Documentation/process/submitting-patches.rst <submittingpatches>` の日本語訳です。
> +
> +   免責事項: :ref:`translations_ja_JP_disclaimer`
> +
> +.. warning::
> +
> +   **UNDER CONSTRUCTION!!**
> +
> +   この文書は翻訳更新の作業中です。最新の内容は原文を参照してください。
> +
> +Linux カーネルに変更を加えたいと思っている個人や企業にとって、
> +その「仕組み」に慣れていなければ、投稿のプロセスは時に気後れするものでしょう。
> +この文書は、コードをカーネルに入れるための、主に技術的かつ手続き的な
> +手順の概要を説明することを目的としています。
> +
> +もしこの文書を読んでいるあなたの目的が、単にバグ報告を送信することであれば、
> +Documentation/admin-guide/reporting-issues.rst
> +を参照してください。
> +
> +この文書自体も長大ですが、詳細な手順書というわけではありません。
> +詳細については :ref:`Documentation/process/submit-checklist.rst <submitchecklist>`
> +を参照してください。
> +
> +この文書は多数のセクションから構成されています。これらは比較的独立していますが、
> +順に読むことを推奨します。
> +
> +.. _jp_submittingpatches_common_mistakes:
> +
> +   * :ref:`投稿時によくある間違い <submittingpatches_common_mistakes>`

Hmm...

I'd really like to make more positive response, but ..., this doesn't
address my review comment near the bottom of my reply at [1]:

    "I expected to see a full translation of leader paragraphs up to
     Line 26 of the original.  Can you do it?"

[1]: https://lore.kernel.org/6c156080-04ac-48be-b0ae-5b784883188b@gmail.com/

Honestly speaking, it is hard for me to relate your "translation" to the
original text.

Thanks, Akira

