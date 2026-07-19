Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495F913AA2D
	for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 09:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784454399; cv=none; b=P9jE2OARnROHOeyHdJixyg1vIpyuOMSmpYGruYD9aT+iLs6wGlo2FYTU/CjHcq3AfSeq/zTPbUPh73dPAA0hLC8PBoKm60p7+et3XHlBizS1sxeY75ibxUEiNiMaDP97P4R9dcpiy9cjmGAqmNgO+5WQX9q0ErOYgMJQpHdG2PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784454399; c=relaxed/simple;
	bh=1Z1S+Nz5v3Y5s4S8Nbddf3u+wIv4ZvLEnklTAk9rWag=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=MMkcZv63w1k50Oo/63vb0PpzBwmI6fN1Ipafv7NgojRkawGNta7PzF/t5ylcdLoA60nCqS74FHh/4lFL1Bf06yBDv1bJFoWjA/dOL7kcZdnFpO3e8vFWUgpfNreeL2SOW1kLvNgTcH50VcdksORAV/mGY9JgJkE0qQ8DAULLi5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOubgErU; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOubgErU"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-845c92bc464so5272820b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 02:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784454396; x=1785059196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jXYY3/ibDuxq4nPGkcxKT2XFw5nJ8Aoi0c6Y9Xf5j3M=;
        b=pOubgErUC4DAAo/DsPaatWSWYqVyf2g9T6dSwjbZYRdMzZ0qEPfN4i0JZAYBYq0RSd
         awquCFMkeruOvJJmxJgUzKHtWnSILKxNbUnpeIZQVycisczIMQWxCrfXTE6xEeyp7YQf
         QRV3vkOvKPD2t3BzoZYleiyak1hcchjcY4Jrgc6mgqzmLSCZwCFXxkHM7y40yiz/AD0n
         kLaOpPGX2gNVnG+5a+5B+1uOAZAb2E3hkNARq0TZQ/UqeQsCnN2tfIoVuAUmFekwbhWy
         M5lm8ky6KVEgHqzKpzu8w6QAZz6o4scl8dO/8Egwpqo97nK1GdnZ95Vjz64FIXQ4UmKH
         rgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784454396; x=1785059196;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXYY3/ibDuxq4nPGkcxKT2XFw5nJ8Aoi0c6Y9Xf5j3M=;
        b=qanKSPymOOoNpMgS30ibof+zsRlGGyq78+Gk+RgMSycEW4U8lc1i10AdXmSAjQlaF+
         nOY7WCOBwMC3zRv3/zuDLn+SXbC+GKDnAxS4ClI7hUTv5xCkNzOj1TLDupCbJi28fYhb
         eGRbcSSkun2sxprkEu9Z4MdlUw4FbijXxQ4kL1xNB6cTta7aaDI3KbkcKNXKCccowJJQ
         ASGWgafgkg71N2PoQ3V/id62YjJenQy7RjyMsJkuHrQtx9mxKRSM704323ssdw5CZabd
         sOU0MvXCA5j3T4Gw8ExwoSuF0yxKizBvqA3RKygaeK3lxCSe/KFNXnmGEdNiR4Mlk8tZ
         QkPQ==
X-Forwarded-Encrypted: i=1; AHgh+RoOQdQTkfBvGOFa8sJJZ9n6FDjopT47cWz3b077ir2PQGWiINOPfAneRcnHxYN6P7K5g9flBex++Cs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJJZI3Y1N/u6aF0hZqeNS+zL0UZdR2Z1Bx3m5qIeYIPUatZcf9
	+VFYoJWbMjiV3r5kEV16T5mQcU3QsqkXtSU0CTVdGIHxLBq7bQsMYG4E
X-Gm-Gg: AfdE7cn4NgGg1MbVo1Iy4k66NAqLWbOA2n/Pi7O5JI2jtAPsdBkWjJ0sbG/JMbcWbVo
	0hSEQKYEoQkVT3Qaqbmcu1jJaF0FKQMFYcpJIa9kt0s1z65gE/P4B2Cp7BK9pXRnyElzsHZzabY
	slYgZDfEVQwqRoMR+qO+cUhPk+EqR5editV/vNc+jqO3ayqoCtncA6cKSFrL/S8pfVBiFKPyHp9
	vaKaaVL55XtBUrQGwGMyFm3gj5Q/QmraPybpjUGE+RcAiWv5pk08q47sPY7CCeHpnh6BswlCwhu
	rSKwub0YHQMMXAAs3hI2zQq0FsVaLdKm0aVa8Dc3lTtSZM9caJQNw9FPqmi6anzMWdFIBm+9Y0g
	Qp+VikZqcoViWJtHotceeuc9hM3u2A58qGMrPrEEIU1BjPypqgudtDzbQqX13T8YY98giOtVTYS
	e/fIwLD0iwtb+4PGBlfTHUf1TI38ldmelaagcZguLN9OMoQfo=
X-Received: by 2002:a05:6a00:3a21:b0:848:6447:e0a6 with SMTP id d2e1a72fcca58-84c292637e4mr10354358b3a.9.1784454395537;
        Sun, 19 Jul 2026 02:46:35 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6e9a3sm3938132b3a.41.2026.07.19.02.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 02:46:34 -0700 (PDT)
Message-ID: <f20b1394-0360-44f0-b5ba-440df3e7b598@gmail.com>
Date: Sun, 19 Jul 2026 18:46:23 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH v3] docs/ja_JP: translate submitting-patches.rst
 (sign-off)
To: Akiyoshi Kurita <weibu@redadmin.org>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net,
 Akira Yokosawa <akiyks@gmail.com>
References: <20260712210535.161387-1-weibu@redadmin.org>
Content-Language: en-US
In-Reply-To: <20260712210535.161387-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On Mon, 13 Jul 2026 06:05:01 +0900, Akiyoshi Kurita wrote:
> Translate the "Include PATCH in the subject" and "Sign your work -
> the Developer's Certificate of Origin" sections into Japanese.
> 
> Keep the DCO text in English as the original certificate text, and add
> a Japanese note that the sign-off refers to the English DCO text.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
> Changes in v3:
> 
>   - Keep the DCO 1.1 text in English instead of translating it.
>   - Add a Japanese note explaining that Signed-off-by refers to the
>     original English DCO text, not to a translated version.
>   - Address Akira Yokosawa's concern about possible confusion around
>     translating the DCO text.

Looks much better.  Please see inline comment below on a cosmetic
issue.

> 
> Changes in v2:
> 
>   - Added the Japanese translation of the "Include PATCH in the subject"
>     section.
>   - Updated the DCO translation to match the current English text and
>     structure.
>   - Kept the DCO statement in a literal block following commit
>     999161066dc5.
> 
>  .../ja_JP/process/submitting-patches.rst      | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rst b/Documentation/translations/ja_JP/process/submitting-patches.rst
> index d31d469909e4..9bf4d1f99196 100644
> --- a/Documentation/translations/ja_JP/process/submitting-patches.rst
> +++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
> @@ -402,3 +402,78 @@ ping したりする前に、少なくとも 1 週間は待ってください。
>  パッチまたはパッチシリーズの修正版を投稿する場合は、"RESEND" を
>  追加しないでください。"RESEND" は、前回の投稿から一切変更していない
>  パッチまたはパッチシリーズを再送する場合にのみ使います。
> +
> +
> +件名に PATCH を含める
> +---------------------
> +
> +Linus と linux-kernel メーリングリストには大量のメールが届くため、
> +件名の先頭に ``[PATCH]`` を付けることが一般的な慣例となっています。
> +これにより、Linus や他のカーネル開発者は、パッチとその他の議論を
> +容易に区別できます。
> +
> +``git send-email`` は、この指定を自動的に行います。
> +
> +
> +作業への署名 - Developer's Certificate of Origin
> +--------------------------------------------------
> +
> +誰が何を行ったのかを追跡しやすくするため、特にパッチが複数階層の
> +メンテナーを経由して最終的にカーネルへ取り込まれる場合に備えて、
> +メールでやり取りされるパッチには sign-off の手続きが導入されています。
> +
> +sign-off は、パッチの説明の末尾に追加する単純な一行です。これは、
> +そのパッチを自分で作成したか、オープンソースのパッチとして提出する
> +権利を持っていることを証明します。
> +
> +注意: ``Signed-off-by`` によって同意する対象は、翻訳文ではなく、
> +以下に示す英語原文の Developer's Certificate of Origin 1.1 です。
> +DCO は法的な性質を持つ文書であるため、本文は翻訳せず、原文のまま
> +掲載します。内容を確認する場合は、必ず英語原文を参照してください。
> +

It is not obvious that this attention note is local to ja_JP translation.
I think reST's "note" directive is useful here.  For example,

   .. note:: 【訳註】
      ``Signed-off-by`` によって同意する対象は、翻訳文ではなく、...

What do you think?

Thanks, Akira

[...]

