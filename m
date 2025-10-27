Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF4C2D5C74
	for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 05:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761542877; cv=none; b=ZFBb8OT6w7CsFIjVKUZ2rlRRSl5datUbt7xQ18w379D3AVsP/VsX2SR3jCoFwCac8piv0L5GjlCMD63blfVW8w86op1KKbfKq8LnYuaMATIGN8nc4nUhz/ad512lmeK36Ivj4OZxwOer3zBWpHSr54Aof4Sq0Fv0CmUBtiCu6wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761542877; c=relaxed/simple;
	bh=inJww/Ob/vbUK/5lqAm9xN5xYDYWYeHnIJvj2WLxyEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DTwYZVgp4OkkEVNuA0I+/JQKWgyxfnUEtRye5FxDPf1unAL554Gc5LM8VtygFDn3ZEIBkWaluSFmVJ6qGAFeoYZWLHo8jntdFLmGHAH21sY4eUd32iYSjJV3nejIgcuY/WfGPlfSS0lDnS7Yl56Cqt9zjYQLiAJHoBLJQ1MQWTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvM0PHbF; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvM0PHbF"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so3061965b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 26 Oct 2025 22:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761542875; x=1762147675; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C/RAYqHmH1h4sjp1gNfQ9pppA/esaFm9GV+1pQeVlcQ=;
        b=DvM0PHbFMTjqnUsL8+H1k6xdPpEpf3qrCeZCus9XI+2Erew75ylAmIQPL+R7WNiwtk
         o19eqXvJ4j0clrSeLSrgxMHq/IRk6XVLRoCh9XCZ22WrGNH/e++6Xaj4xxp3d2SIiju1
         0r/5v47b/RGVJaVk3yT12nDFS3ODFIAEoTxBHY9tn/YHsGdfoYGdxsVVdo1R3JaqrnFH
         QcRgADRi9NogflcD10uKq2mx+zIgpISFaj5EsoSdrBr1swa9gE0Z2JvoguyvDch6q0w0
         7Kyjsx/Rpx6prYhl+oEnKVkCPc+XVnI7gs9y7rMXT2o0PlXFPvfIaDACbjOBTgaw4RYh
         HzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761542875; x=1762147675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C/RAYqHmH1h4sjp1gNfQ9pppA/esaFm9GV+1pQeVlcQ=;
        b=gVpuVbp3qXLbxjs4pFKgpF5z+BjdloMb/7l6QB/sMRAM/VxrbKMYlri5qjwGu2jFgS
         v6v3KMB3ECZXzuw+Si47/V1b4HZ27c5fElGIl8gnRq/E7qE1omV/8S8uxDVnLh50faYC
         TByd0PRBIKMLehuSkaISB0T/sf1FLRv/QLmmgqPpE3v37+7WLFGEQdHuqcApMOdegsKZ
         VZvXioQeblrcYzgNchyBXLgR2JJssqLHXCj8Q9nnLdvy0dZuTDEewKDV3yY+C4qkfyeB
         +xEuLEqIakWcszu8DsdJ2OPfWWicn538v7mN2mN1kuj06zp4fs+DJAFiMqXhsMyXGpuW
         ZK7w==
X-Gm-Message-State: AOJu0Yz4zEelZl19HHs49sf5TY85s2j9/g5SUfAw78/gZ7vGg4Tz5tUM
	esFueCtgxapTsuf6JWzt6fvVoi8xv2V43CzJfn/LZrhcg2WPxhKPD4+Mt1AsuP55
X-Gm-Gg: ASbGncvDDYF4tsKhoH2UDOXq+xBpb4ejDg9aXdDWE7CUXXgzLV3ERk8yr/UuhZrPnFG
	2eGJTdXOj8VHXaxHp3+UrW6hZOtoGZGqQ7fRl6cPk309LWp5WjPdZztkEbviePV5+YAU4g3/MpT
	z6Vpynsid7IqBFY1ism9SlPtycoXmH5QYT44HLaHpT+b70PAlWcLjkeBu0XfCtyXpQypSkFDlGE
	TcDdkkgt2AkkAF00y6Yi87MQqvo9Y7AzUM7wWUmHkKZM53pDK+ZKzLtSa15HcnbZi9fcONeMWmP
	EDHEt0TZLwWvW/k2cmCAvRSRVhUz8YpOjedD1TjQ0Oi3AoEMFYTOs7H6yO+wifJ75WFFGQqoT9V
	ySlsVxxA5p3atcgDsueEw9wCZfuRzns2Xegnf3FblAzbRX1XJGN0aHh5cXXociSP1Acdh8iMFzf
	0aemI/sbcLgAvyTSpvE4jQCVGBCAYrcS4=
X-Google-Smtp-Source: AGHT+IEMUesQIHcuQu4FxPZyWoemXbk+ksDyGhqzHexxaBE/vxFXq0kjagvpHbM0Q/C8rA9lLvDSWQ==
X-Received: by 2002:a05:6a00:27a0:b0:7a2:7f87:7ae7 with SMTP id d2e1a72fcca58-7a27f877cdfmr12402808b3a.19.1761542875391;
        Sun, 26 Oct 2025 22:27:55 -0700 (PDT)
Received: from [10.0.2.15] ([14.98.178.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414072487sm6601511b3a.52.2025.10.26.22.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 22:27:55 -0700 (PDT)
Message-ID: <47844424-302b-4a99-9cce-82924c7b7ebb@gmail.com>
Date: Mon, 27 Oct 2025 10:57:51 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Makefile: Sort Documentation targets
 case-insensitively in make help
To: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com
References: <20251015012922.19467-1-bhanuseshukumar@gmail.com>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <20251015012922.19467-1-bhanuseshukumar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/10/25 06:59, Bhanu Seshu Kumar Valluri wrote:
> Avoid case-sensitive sorting when listing Documentation targets in make help.
> Previously, targets like PCI and RCU appeared ahead of others due to uppercase
> names.
> 
> Normalize casing during _SPHINXDIRS generation to ensure consistent and
> intuitive ordering.
> 
> Fixes: 965fc39f7393 ("Documentation: sort _SPHINXDIRS for 'make help'")
> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> ---
>  Notes
>  - Patch is tested with make help command.
>  - Verified case-insensitive sorting.
> 
>  Documentation/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index 3609cb86137b..00c81e7947a9 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@ -23,7 +23,7 @@ SPHINXOPTS    =
>  SPHINXDIRS    = .
>  DOCS_THEME    =
>  DOCS_CSS      =
> -_SPHINXDIRS   = $(sort $(patsubst $(srctree)/Documentation/%/index.rst,%,$(wildcard $(srctree)/Documentation/*/index.rst)))
> +_SPHINXDIRS   = $(shell printf "%s\n" $(patsubst $(srctree)/Documentation/%/index.rst,%,$(wildcard $(srctree)/Documentation/*/index.rst)) | sort -f)
>  SPHINX_CONF   = conf.py
>  PAPER         =
>  BUILDDIR      = $(obj)/output
Hi,

I just wanted to check if you had a chance to review the patch or if any changes are needed from my side.

Regards,
Bhanu Seshu Kumar Valluri
