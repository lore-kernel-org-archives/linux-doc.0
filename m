Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9651E5B68
	for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 00:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776904440; cv=none; b=V2qxySpq0Dzt7buXEks2Tw8YxURKEybVS7YZF1a78H9tYBpgAf+yWZBPHCZv+vyndOsmCKPFGFYoNANwnDt15aamA0OymlfKpNr0c2juI6ce+FP8gvcBlJ4xR2AevOqa8PtcDgXxpjrXk2HL4V889Dy+ntQAX5iqoY6lEbCHg54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776904440; c=relaxed/simple;
	bh=71Iax6tAQzAMvfV3tt7igBBJEKZ7hj60454GsDQk71w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DhsYST1aUBq+GJIyOuHjjHe+CyOqiBZ7ebWMtu2HF1oU0TKYP48NBC/Upm+xDPhyeWoa69VJkwtGref0mCGyjbXt1IP/eKyhzFgYc0Osx8kV9lfrsaFbAsSfa1TFwhlPPOckRAjSaNQ10WLh/9fMMe8Mx5BTKGJBuivZojns7sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F8EgQXaq; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F8EgQXaq"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35da9692ec3so5323960a91.1
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 17:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776904438; x=1777509238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P60mcQXYiISPKoUfdmDOOluoif0cLkUH9C1lfxMoAi4=;
        b=F8EgQXaqh/1abtV/bF7RQ5CRShwUmGprblR42RnkBvjbHwy81fh8IDqSvFbRnU5c89
         JX04RpeuJtiaADzyY0vwD1Z9dDHfeCAxKhmuchsQi1DOGnlmyhgjiU8C4j/6dHcFFYuD
         r0+2E4PeZX1cwvUAZ0N61CzCiDa7BVQrcipov043cx2rSYKfvo3Jf+kFGRZSgHitzERW
         ovp0bB3pijd73PXL5mKIbek5E12KUy9o94UKP1gjmfJyX0OTz/TfJ3T5qLumSEdUyFze
         yI+T15N6KO/NteQg6EzUMxakWfYP6k63v1FYBX2oDIahMhhJ54WH3XzZV2yse/pUnOuN
         /NQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776904438; x=1777509238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P60mcQXYiISPKoUfdmDOOluoif0cLkUH9C1lfxMoAi4=;
        b=rz9aW9v6Z9X0nf7ozMHWzTFdmuISxMg9tzWxA7DDcQsVi0hYJUmziK7wxI8r10oRVg
         ofFwqBdsvoyqWsI3SHhzR+UPNWGpU0oSZhC2EsKKBzfMJ8oGX6KMgp4KNicPwC4Z6ei0
         EUxca//0AAswTop+bhTXTNaK8W64HgOXmaZvk2mQAo4A6Jw4xelKdp0mlXy170k6OKTq
         60YMgVAKq9FORazhUULN1rUA9hdSi/UKtI30njJjDJHhTKzL+ovPg3M435rjYcmKgPYK
         tLcS5FYlgB9XPRImYxVLntPY3Fn4QalVu8rC4hmKsK6Q2Yp0d1MvfBozMeYrUzM1UQ/g
         GX6g==
X-Forwarded-Encrypted: i=1; AFNElJ/TXwp2zb0UPNtzHQHIblzJcsWU8Dx7gDA4eaBBA3sf02EyvE9iH9Eznqi7FxCbbg1s6EFeonWcxOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPKJTKOU61t9rLjJTKjIxmCESOeE7nSCgSJPgdP96Wgqfo4SSA
	/2WbTUWwJBQ3eKRME6rHfc9XrSiKv4EDNrfswumK6brDbWDEiUPm+Rf2
X-Gm-Gg: AeBDietpyjH1gZ2P84Cz4AgFYFTapeRxTIJTlRd+E0+PfKsBtiMYaMpR+VSbv/yoSuD
	Mw2xTccjTEMcda+L2xXAPlBkcz1hzfCo+ksZcfPrgs0sMOQOUX8MhsdtgndfpSQRltisqCn/fyx
	NF8vhVU0XXTDUOTpCoXKIFEwK+gsvdBa4uQVtV0w6J+iG1du8LE0Cp0jqc7vgpMulbqi5Ro6Fpq
	cLnEEDmbt8pHvgvknmugQGgnQT7sg8o8LbJYhTXZT1VcTWFnsQoq/6svNuevkHHY0LzMGmXBkOg
	mYyYPbRDpnX/v4B7bItPBoyCQ2v2fr5jtQYxcMvQzYu9btJ+idtkNcFghfJp9uphpfCwWgROtp7
	JvwK2FTARq+qLQO2m/b6kgSSZi9VjiykCnqf7ohmL1XB1Z+V6fblUE4JTvDnpZ456boaV7Sww9D
	Yuh/hf2ZVvAwiSkOdutiWw4gveLwcGcoYbdpdXmj40KPw8C+BpKLrv5QGP9toYCcF7Xjfo1bvy7
	AP2USU=
X-Received: by 2002:a17:90b:3f4d:b0:35d:8f3d:c554 with SMTP id 98e67ed59e1d1-36140468b12mr26997113a91.13.1776904438468;
        Wed, 22 Apr 2026 17:33:58 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410a7a9fsm18200810a91.12.2026.04.22.17.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 17:33:57 -0700 (PDT)
Message-ID: <d299c3f8-f448-46e8-a513-3e17de131af4@gmail.com>
Date: Thu, 23 Apr 2026 09:33:55 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/ja_JP: translate more of submitting-patches.rst
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org
References: <20260419001051.389599-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260419001051.389599-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 19 Apr 2026 09:10:51 +0900, Akiyoshi Kurita wrote:
> Translate the "Separate your changes", "Style-check your changes",
> and "Select the recipients for your patch" sections in
> Documentation/translations/ja_JP/process/submitting-patches.rst.
> 
> Keep the wording close to the English text and wrap lines to match
> the style used in the surrounding Japanese translation.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  .../ja_JP/process/submitting-patches.rst      | 166 ++++++++++++++++++
>  1 file changed, 166 insertions(+)

So, if I am counting lines in the English doc right, corresponding
3 sections are at lines 166--275.  275-166+1 = 110.
Why is your translation taking 50% more lines?

> 
> diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rst b/Documentation/translations/ja_JP/process/submitting-patches.rst
> index 91bd79a0e9dc..e1adab466507 100644
> --- a/Documentation/translations/ja_JP/process/submitting-patches.rst
> +++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
> @@ -180,3 +180,169 @@ lore.kernel.org のメッセージアーカイブサービスを使ってくだ
>  
>      $ git log -1 --pretty=fixes 54a4f0239f2e
>      Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the number of pages it actually freed")
> +
> +.. _split_changes:

No, this will collide with the label in the English doc.
Please remember Sphinx treats these labels as global.

Also, there is no reference to this label in this patch.
Labels should be added only when they are referred to.

> +
> +変更を分割する
> +--------------
> +
> +各 **論理的な変更** は、個別のパッチに
> +分けてください。
> +
> +たとえば、単一のドライバに対する変更の中に
> +バグ修正と性能改善の両方が含まれているなら、
> +それらは 2 つ以上のパッチに分けてください。
> +また、変更に API の更新と、その新しい API を
> +使う新しいドライバが含まれているなら、
> +それらは 2 つのパッチに分けてください。

Ah, this time, you are breaking lines at 25 wide-char.
Why??? This doesn't help my reviewing at all.
Be consistent with yourself, please.

Thanks, Akira

[...]


