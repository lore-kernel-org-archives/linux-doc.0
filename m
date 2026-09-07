Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CFD37DEBA
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 02:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788747637; cv=none; b=UQwUOuyaZE9WLFkfZkY9OUknixul/7+SXhwucY5M7A9mUnzCrDo0N4Qd0heMJFXG1VxYnkyjObr02jiXBO+0PASX7nhfHfo/CdtWAaphshkWKC7wmP3wRFZQ2HU3DqEn5EsFfc3JQfqyIimpife+kURZRYhqO4M+MNG3RIVLAjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788747637; c=relaxed/simple;
	bh=bgN0piWLoCmGGP6Vi0GPl7wrpZyOkEoBokqSqjUPb8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aqaDFJJvF2hj2lNATsNfpyalqmxt6kRDUrtx7OHV+46K7VHqSWn56b5wcCZhR00BhZi1oG7zBz8Y9e/femO6ATCXuEaX7HXHXtvlUq4HLQ2pyjPcs9vD+3d3M2LdhSvBl28fkG0aeYDN34PyOaJ9Zf3nWpsg1GQj2+OlYJ1+CAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSHEV3xR; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSHEV3xR"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-39647184c73so3672738a91.1
        for <linux-doc@vger.kernel.org>; Sun, 06 Sep 2026 19:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788747635; x=1789352435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2xQbczVfHV6CF15MNixvVfDaRPmdmf2gjFgOoATcDvo=;
        b=iSHEV3xR727BaCbS1Ix1IzLZ/NpCHbUKnT+4YdcQjdbeccxodgI1cfgyoKOe6poD15
         JYh/PC4NTmsmzLXDM2Cg6u5HAdkpxfr696rtS/67vzwbPePlvohYIrgEXJcgpPFwii4Y
         fniARn7XkCOqwMa55RMAoKATkCxb7opXfUf9XGAL4EFTvMTU2uan7GDHzmKPWWxB4GJy
         FaNZ8JbgdvPTnSunSjopKa8BxMb2S0wGwH7NzMBi9h54lsTfI+D+dVwylINafmRK1QOv
         bnUaND+lhR3flSz+mCTwbwARmpCcl7M3PAK3xrw2Pyg8jugwP4ccFmeLXFBuZREpDng0
         dEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788747635; x=1789352435;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xQbczVfHV6CF15MNixvVfDaRPmdmf2gjFgOoATcDvo=;
        b=e67DfOX8e4zrHJlMtZgTrwqms7Gmmw7cHwdZM53oa+cS3HAuwRe6jFAZGhgNdvNFBv
         FUcGetpzBcWI+DN4Mc0JBoFldTPjny77xvGVHbPeqCHKkl5rL4liIbN5r6KckrPeKF8C
         W2TbGbIdXA0r+iYblhE+XX+7BY6oocrO3rXVWPsnES0hnpwrORdxPcZzOwFZV2er5Mu9
         Tce85g2oBlWXmZFxd6qkeILQCihuDFjJD7S7kY1px5FX7P1pRb+c/R74Yxy7RG0AutR7
         Zq8vza6tBXb590sXB9XtbQg/bUAnVhATr2JsOeqI3+5lzQ48kBiU4qtBirgrAZjPoRHV
         omdg==
X-Forwarded-Encrypted: i=1; AKwUvBy+I3qSZ0h/R4iFyQ6cnbWYNh9g37QKakJB4RMjglpdBEvKD6DnTzoIQm/4W52U+bk3Ath0677UAbk=@vger.kernel.org
X-Gm-Message-State: AFuF++ld2wba4g31XbtCj36dS2WP3QgZvJum5C+iFgivApoAqaldGbyD
	vSCLz2F8JSVWNVusnFtVa1pIaTNN2rKPu9p1UDEUN7y+fDP3nx7/xjeh
X-Gm-Gg: AYBFou3m3LH4xWJ+rsbAIvYX9Mx7LvjBHLITrrUrLGvwu/XC62qwuSCwuh4cyI2CZkd
	WHVMGOGu8Aa6GgBDxuR4Bw1OQR1nJbY34c027rQAHP9Gmdc7/2VcSS9gaB85Mjt6bgeSgxk5D/C
	ex39L3hD5tFvVxwO7ggeIzSas1JKiar1OT7Q/5X0UzaQsgkeImucvwecL7Yxef/xDCBfJyeIC8U
	XXja6T5NEz187MVgbkUA8mgAj4SYSBcYqYN4EoEaPFGliH0ZaphGUMMEIVHDufqQmChKnqlIx9q
	R9qPH+dlM2hg9lvYrjxMdl2jR1PK3y8Z5U86BI51HFra0HXwbRY4M1hxASTgiX/dT/p6sp4EsrW
	bH3+jehjb6EqbRvv7SEyT7xZR9Op+AbUqOgmog2WVqlAGYacYzPRI/VX5IbqFW/zhVFb4wyzyqe
	qgIAyC5AuZpceX9V1xXYxRhfhZFBsBUu+CT9JGPhG9D8/a4CZhhD8bM95yXSf/TFiBLIplmEfL6
	dAAXoL8964KIBhsOGFYKhqfPA==
X-Received: by 2002:a17:90a:e7c9:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-39b07f2f51amr28808592a91.1.1788747635211;
        Sun, 06 Sep 2026 19:20:35 -0700 (PDT)
Received: from [192.168.2.166] (104.194.78.75.16clouds.com. [104.194.78.75])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm15214284c88.8.2026.09.06.19.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 19:20:34 -0700 (PDT)
Message-ID: <2f56d8ab-9542-4d53-9e6e-158435d29b67@gmail.com>
Date: Mon, 7 Sep 2026 10:20:27 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2] docs/zh_CN: sync page_table_check.rst
 translation
To: Ye Liu <ye.liu@linux.dev>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>
Cc: Ye Liu <liuye@kylinos.cn>, Dongliang Mu <dzm91@hust.edu.cn>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260819025535.2967566-1-ye.liu@linux.dev>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <20260819025535.2967566-1-ye.liu@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/8/19 10:55, Ye Liu wrote:
> From: Ye Liu<liuye@kylinos.cn>
> 
> Update the translation of page_table_check.rst to reflect changes in
> the English original, including the clarification on corruption
> detection and the new paragraph about userfaultfd wr-protect
> verification.
> 
> Update the translation through commit 8430557fc584
> ("mm/page_table_check: support userfault wr-protect entries")
> 
> Signed-off-by: Ye Liu<liuye@kylinos.cn>
> ---
> v2:
>   - Update the commit message.
> 
>   .../translations/zh_CN/mm/page_table_check.rst         | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/mm/page_table_check.rst b/Documentation/translations/zh_CN/mm/page_table_check.rst
> index dc34570dceff..7ba5a39db487 100644
> --- a/Documentation/translations/zh_CN/mm/page_table_check.rst
> +++ b/Documentation/translations/zh_CN/mm/page_table_check.rst
> @@ -21,9 +21,13 @@
>   当新的页面可以从用户空间访问时，页表检查通过将它们的页表项（PTEs PMD等）添加到页表中来执行额外
>   的验证。
>   
> -在检测到损坏的情况下，内核会被崩溃。页表检查有一个小的性能和内存开销。因此，它在默认情况下是禁用
> -的，但是在额外的加固超过性能成本的系统上，可以选择启用。另外，由于页表检查是同步的，它可以帮助调
> -试双映射内存损坏问题，在错误的映射发生时崩溃内核，而不是在内存损坏错误发生后内核崩溃。
> +在检测到大多数类型的损坏时，内核会崩溃。页表检查有一个小的性能和内存开销。因此，它在默认情况下是
> +禁用的，但是在额外的加固超过性能成本的系统上，可以选择启用。另外，由于页表检查是同步的，它可以帮
> +助调试双映射内存损坏问题，在错误的映射发生时崩溃内核，而不是在内存损坏错误发生后内核崩溃。

This translation sounds too AI-generated and doesn't flow naturally in 
Chinese. Please revise it carefully

> +
> +页表检查还可用于对各种标志进行页表项检查，在检测到非法的标志组合时输出警告。目前，userfaultfd 是
> +唯一的使用者，用于对 wr-protect 位与任何可写标志进行一致性检查。在这种情况下，非法的标志组合不会
> +立即直接导致数据损坏，但会使只读数据变为可写，从而在后续修改页面内容时导致损坏。
>   
>   双重映射检测逻辑
>   ================
> -- 2.25.1
> 

