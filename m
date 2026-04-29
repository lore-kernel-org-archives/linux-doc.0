Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F872DF153
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 08:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777449689; cv=none; b=SlJA6Yg0e/TNkVrmy1M74E9CTUACA9daozCM1M91gqtXDNcF00UCqz4bo0b32s5Dtuuwl5rE52MLrBxQT3GYCX0OSZA72LHczRKbMvdSadOUxtYM04SUNAe8+WdXc+H8wxXbkweKViXNDsx4rx7Lc+AmNFVfF91SlqJMmjK23aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777449689; c=relaxed/simple;
	bh=cCTmLs5IIowad/djOAK+5VNMZbIbVtoboSLsS4fSv1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kopHDw+d8egKODaETqAm6Aemf6bqsOZcd8L+z8XpWZj1e+TxrrRfxSB6dXrusFrA9aykl68iQHNCqxlMoo3Rdk+NUZ13bSA/sfVQy0bUTM5mHSgiJ4hY9lJt5SKlUKpVJ9wGLcDtRW/VvDR10KDnBkMReNGpMCN8Hddw/HlEMKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NR93f+Ai; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NR93f+Ai"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891f6b6388so4002475e9.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 01:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777449685; x=1778054485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZgTX+gVOkVV7nUMiKXD4ocpW5cTuBnrdpljyNN6o5Eg=;
        b=NR93f+AiUmaejAOC0A5edNkxWHvbAqdFEvdX4zdITz6IzcYlBe0SRnmNRLCfwd/xgV
         14kgd7UtIx6IAJJAlCo1wyQ7zFUM2N/BezMBlamR7bKteI/lMtX+HYU2lEvCSUGrgdEG
         Z6XHrwqqld6FsN5r1bDhr6W85fGlWR+aYdV6msBKZYnKSV3lSMwUYi3XWDwitv64xl4a
         aU8fIqRgxvreeUS5tnh5whq0TtJ+1hTEraVZBn2xWl2q8uw579fFTAbLRFErrDiJtifx
         4injMrFgYzGsese8EW37H+Ou4f4GyMdP7LpXAs7lcwSDoq1JVq3a5wak07g/JhVMg+Zm
         kMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777449685; x=1778054485;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgTX+gVOkVV7nUMiKXD4ocpW5cTuBnrdpljyNN6o5Eg=;
        b=jfZSHT7SmauhTecAxreRyyCRhA0I6ER+8Kc22J35SaUHgXP3iH3ubUkw2i8y8jPhsi
         7MqP45yhws7zt2QMUPoiw45jXYmd348Uau2pSPWfkHCuoO2bpsD9Bd9Mkzy2/UVA1Ydp
         sRh3uUGfJuQrV9Ejff2f3C7Piz3eDDBOrVRihVvWI8Kip90d55LgLEGjS8uyipbIkDB7
         95m8wSLMFYIyLL3aVBC9C/50ejKUI0ZDicxhXbp+R1qOlPDSSLp5qTpmJS7x/ThGBkrb
         YbFAfT3VANSrdPtbyLTZTND4iT8vN/NlT8/Ctm4O+Q2G4lsB2dNbfUBKORN2tK3y+Gnt
         WCKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/bqsHjiNMdB1IlZ8G77/roGeHfoJzZ34wx4l7qzXJ61fsFMoZlu1I00mofZSC+T7wVKVI2dM+sXOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOD2bCsECO50TE1R4ge5PLu+RxUED/S8gRnKKuHMxuBIuM2e1Z
	7TpxQXvep5H1HvgLtY6YmcWy53Txr4j5VzvK/Aigvmo4Z85wUIzYvwew6ESGvl4yXG+OfATwEPV
	r0sfommQ=
X-Gm-Gg: AeBDievgL4fODPB2jrTF9VFOayuMzwIDiPP87c0bC3UYZne9xN76T0SnG2PcAvrl+Oh
	u0byH7Le6gi9qYMVG6bv5mG7hitNTmYcdGoXihKwU3z6pbefW7mEpSsr87t74TVrC5ad9PRbBl+
	Vvs3veqk3rcD8dQ2JkNgVmp2vH1Okn3qZhAI7T+XZgTvwjr//Up49rVZSNnw7O37RWCMFNBqerK
	mzcefRjv1+dCKIT3tGJC/FD5THYbW8Ii+O+Pz/MJKeaEAeYLsZv83O/tsqVB1eJpVyCQtBIg6hS
	wdRS7vJiGwfgKhHPl+haZ7UuGQ07XbKOXcd2lr+YYbucHF58KuX3wpmy7gv4Mrk/DaOM8L27P4B
	c+0D+BRceQ7201bMsO2sXU2NvgmD1yqSZ56AjINzw49URrw2u5Rl1vMkKigGDbEzvqK8uGYbJrq
	5D7/RH+Olx//yOPzlKOa7sv126YvXOAyN/2ut7+/azKHN86+k+H2ygTk1YtcxKMfGVldeA
X-Received: by 2002:a05:600d:8448:b0:488:a797:f099 with SMTP id 5b1f17b1804b1-48a76f7a55dmr48377525e9.3.1777449685427;
        Wed, 29 Apr 2026 01:01:25 -0700 (PDT)
Received: from ?IPV6:2001:1a48:8:903:1ed6:4f73:ce38:f9d4? ([2001:1a48:8:903:1ed6:4f73:ce38:f9d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc12bcbsm63364245e9.1.2026.04.29.01.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 01:01:24 -0700 (PDT)
Message-ID: <e85450b4-def1-41f5-98ff-e88b18d5201b@suse.com>
Date: Wed, 29 Apr 2026 10:01:24 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] Documentation: deprecated.rst: kmalloc-family:
 mark argument as optional
Content-Language: en-US
To: Manuel Ebner <manuelebner@mailbox.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org
Cc: workflows@vger.kernel.org, linux-mm@kvack.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20260429070759.309110-3-manuelebner@mailbox.org>
 <20260429072704.311603-2-manuelebner@mailbox.org>
From: Vlastimil Babka <vbabka@suse.com>
In-Reply-To: <20260429072704.311603-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/29/26 09:27, Manuel Ebner wrote:
> put the optional argument (gfp) in square brackets
> add default value = GFP_KERNEL
> 
> eg. ptr = kmalloc_obj(*ptr, gfp);
>  -> ptr = kmalloc_obj(*ptr [, gfp] );
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

> ---
>  Documentation/process/deprecated.rst | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> index fed56864d036..ac75b7ecac47 100644
> --- a/Documentation/process/deprecated.rst
> +++ b/Documentation/process/deprecated.rst
> @@ -392,13 +392,14 @@ allocations. For example, these open coded assignments::
>  
>  become, respectively::
>  
> -	ptr = kmalloc_obj(*ptr, gfp);
> -	ptr = kzalloc_obj(*ptr, gfp);
> -	ptr = kmalloc_objs(*ptr, count, gfp);
> -	ptr = kzalloc_objs(*ptr, count, gfp);
> -	ptr = kmalloc_flex(*ptr, flex_member, count, gfp);
> -	__auto_type ptr = kmalloc_obj(struct foo, gfp);
> -
> +	ptr = kmalloc_obj(*ptr [, gfp] );
> +	ptr = kzalloc_obj(*ptr [, gfp] );
> +	ptr = kmalloc_objs(*ptr, count [, gfp] );
> +	ptr = kzalloc_objs(*ptr, count [, gfp] );
> +	ptr = kmalloc_flex(*ptr, flex_member, count [, gfp] );
> +	__auto_type ptr = kmalloc_obj(struct foo [, gfp] );
> +
> +The argument gfp is optional, the default value is GFP_KERNEL.
>  If `ptr->flex_member` is annotated with __counted_by(), the allocation
>  will automatically fail if `count` is larger than the maximum
>  representable value that can be stored in the counter member associated

