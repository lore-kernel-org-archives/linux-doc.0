Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AE81AED50
	for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2024 15:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724945277; cv=none; b=aCsfemAAxcVyHXrWfAYdo3OKrMxatTqcsSHQv1AgjcjpkmEfJJIuZ4fkTSB8aWSI1kI8xm7gxWvgt5vgND91b+vAR37MntAMchE+yWd2ECzUXvqR6z8jjMscH0B6M5+X6XTrEZ4wM2B3U5vSwD5ALLKoYh4ylNsByRYRQKhz+X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724945277; c=relaxed/simple;
	bh=tRokqt+GOmx9sDn8JqOLZjGmYY7taAR7cm+0h+E3h+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A17YoT9DE2hNXr/zXc1SHlCLDiKyAtoVWDQRLbHQdHpPrb3KfJXLFCP/9GOW/I4ICxBPsnSWM3nBo7fDajC/Pe2qa/SmdRItvzDqzmHfv0CsoXbjn2TdRiN3SSxn68LlGmxh2E9ddfaL/P8eXD5CcAWXwCpST3Q5pbg9Aa8SoUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=ItGVR7pC; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="ItGVR7pC"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8695cc91c8so80160266b.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2024 08:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1724945273; x=1725550073; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/2jct9mt2CfCfjn41Js5/oCqYM+gziBIReSZS4ygZQg=;
        b=ItGVR7pCBfCPrIdhzDjYAe6unXRhn5balCFeFVqhfXAIsBh6sdVYykSOwK3QsYmFyx
         3pZoOrvELjniMWD7PECil29EfM1fA8hc/eEU0NoKV1mZHURNpErvm3I5em/yW5JZ1tjb
         soE3Vq8TnAuOvwj7KJsXteeXkxeD8UdnAjozp/Gjf0+KortgFDYSk4agXu0u5wATVzUJ
         aPu2btp00wVJz+oj9eZ4ujrQRJgTrLIW6Vzn7miRBoWuHZSHvtKRS2K90wAdpHLjkE7D
         RzFdmQ+OmSSyDYkFlnN1qSjDw7iY+53PzMCa0cSMpgRWs7jD4knWac6nrOzUz2nM1U66
         ZT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724945273; x=1725550073;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/2jct9mt2CfCfjn41Js5/oCqYM+gziBIReSZS4ygZQg=;
        b=ZwDuxDq8VA61BOX0+FDfJfPTOTP+D5IxwUEs9YiU2zaAlvgID/LdFjB3GqNe7KAD48
         q9AIEPr5qDhiTWCxO7JsEP2uzOEryNjH5czedM7TDjmbuQN/l3lXwEKAjphCzGG/+gKy
         1Ix1ZXlgtJDFIS0x/i29FQTnbT5WGXvVa13YbbXTQX/M2lYYWA0nKk33vySKmINPSNoR
         ZXtJLsUwhS1nV0fT8JXez6ymqAd+2LGneVVT+DegVJt3Ijyt3dMFWAVCzIeUVVXeSiF1
         uZKsgJQzXgdKVpaYRa9aWhEZBN3qEreUoqccM1d9JxKPrYN+7hHBSv8p9gxchkKW++2k
         ndgw==
X-Forwarded-Encrypted: i=1; AJvYcCUYrqMwFWk8s7dClq5Au1htu3Q6V4NkL9DHBLeTu9CO1Oi7X8C8Nm5YKFfsNUFrNH2G2EsRy//Usxs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbgdj6K+b1n6Da9aAfjRfdg9wlnAmCf7U8pOjwSEwV59110h/3
	eQYN5ViWwwp+dJcGfwpEDoN5+m8zk8e7NS6l99ddvhOzMV+GA5UU5356YgdhtNo=
X-Google-Smtp-Source: AGHT+IG6CE4bRBHCFzW4p/RUhNwgsV0732Dtt34yk/Rn99V9FPbCrXpW+wHJ7f/oZsADu/vxvtc5Mg==
X-Received: by 2002:a17:907:9485:b0:a86:a41c:29b with SMTP id a640c23a62f3a-a897f78cc4emr285884366b.8.1724945272288;
        Thu, 29 Aug 2024 08:27:52 -0700 (PDT)
Received: from [192.168.0.245] ([62.73.69.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891963c1sm90381166b.103.2024.08.29.08.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 08:27:51 -0700 (PDT)
Message-ID: <5347c7b2-cbd3-4fc2-9794-6dcad4b9aae7@blackwall.org>
Date: Thu, 29 Aug 2024 18:27:50 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] docs: netdev: document guidance on cleanup.h
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew@lunn.ch, corbet@lwn.net, linux-doc@vger.kernel.org
References: <20240829152025.3203577-1-kuba@kernel.org>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20240829152025.3203577-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/08/2024 18:20, Jakub Kicinski wrote:
> Document what was discussed multiple times on list and various
> virtual / in-person conversations. guard() being okay in functions
> <= 20 LoC is my own invention. If the function is trivial it should
> be fine, but feel free to disagree :)
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: andrew@lunn.ch
> CC: corbet@lwn.net
> CC: linux-doc@vger.kernel.org
> ---
>  Documentation/process/maintainer-netdev.rst | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/process/maintainer-netdev.rst b/Documentation/process/maintainer-netdev.rst
> index fe8616397d63..ccd6c96a169b 100644
> --- a/Documentation/process/maintainer-netdev.rst
> +++ b/Documentation/process/maintainer-netdev.rst
> @@ -392,6 +392,22 @@ When working in existing code which uses nonstandard formatting make
>  your code follow the most recent guidelines, so that eventually all code
>  in the domain of netdev is in the preferred format.
>  
> +Using device-managed and cleanup.h constructs
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Netdev remains skeptical about promises of all "auto-cleanup" APIs,
> +including even ``devm_`` helpers, historically. They are not the preferred
> +style of implementation, merely an acceptable one.
> +
> +Use of ``guard()`` is discouraged within any function longer than 20 lines,
> +``scoped_guard()`` is considered more readable. Using normal lock/unlock is
> +still (weakly) preferred.
> +
> +Low level cleanup constructs (such as ``__free()``) can be used when building
> +APIs and helpers, especially scoped interators. However, direct use of
> +``__free()`` within networking core and drivers is discouraged.
> +Similar guidance applies to declaring variables mid-function.
> +
>  Resending after review
>  ~~~~~~~~~~~~~~~~~~~~~~
>  

Definitely and strongly agree.
Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

