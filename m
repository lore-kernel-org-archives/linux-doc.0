Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B111362
	for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 00:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721350397; cv=none; b=MQ0C0myGBzkZcc0KSZF8QPdXLswZT5zCHiI3rIg1H6KwLVUq4Q1qiffM/WpyTCokKOsVG6H+4vFe1lSYNTIKtDrnNwaf27OC/2+/+1iijfTVaY7As19i+l+QciqtzH/xN0Yd5MO6/eJjFC1H1rUMhVIgMjvDPPblXtlW1pIkD5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721350397; c=relaxed/simple;
	bh=RnoOrTDqYMwqmgyBL997j2WfnbhFEDox1ALgKaUqHuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=S7BUmZAEo0CGoJ/dsjmZ8gLPhcHpC7EOGGl13s6LK/U8J9ecWnYi5m4r87AQvW1zc38+wZVuOuplN/kaKP8ZjtWmbnq+hPNBHI3fxqVPI88stz1ix46nEBBfM3HjN84iG3j3rn0P+JIfJlpb5nBieghV2p/mNzO8l8Ijep/ZAFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Sn2I95Uu; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Sn2I95Uu"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3856b7be480so5455015ab.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Jul 2024 17:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721350394; x=1721955194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CNAPVnBxs50FSqQ39oQ/X0NdsaUWEkhbtljgwA0dK+M=;
        b=Sn2I95UuUc1Z1VLFwESxfN4bG9UYWvNIkgHVpubVF5jr8Ky/BGxrk07t2KU0KYRexx
         dIpoWbrb3NAAkQE/Znd9/p9td5WtnBHMEhZGURIzSuvmwsCJCWcDYVGKoH4gnaj6l0Qr
         e8CEo8qM52EHLIZpdg3YNiAJAWQ2kl9g3l+IPTyJMenKelo6vl6HachLbX7hAgiy7lne
         oIKVV/HRruWdu6GHlUfYTuLNEccpVnw1Eyi8mEwTBG5Lnv3Wnzu1xuyKX4Cj+WLarnnK
         s3ZcA+ANdDSbV9aWfJQkLq6jD5cNE/Uxo0St8qfBgOJsW6sEd33p7CiAnfb3z68NUbRK
         CzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721350394; x=1721955194;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CNAPVnBxs50FSqQ39oQ/X0NdsaUWEkhbtljgwA0dK+M=;
        b=hgWeHP7vKdDkYLe4kwXxOlCet4DPGfFx3t8gKhUZxx30dpNU1ix4sVT1A8F3OA4zxF
         +iMy4t2V2dCWHPYjSheNvPVBFXnVxHfPLwvN+QyKdJoA5qDPXhSY0+qgIgYliSH4SmDn
         jLi5YFhc6buhRTZZvQl2wqzHJ3y/pQmxRpg1xh8l6nk+a1KXA8uYdaO6rNcZiYffl9wU
         76FO+kiFlE/KMmBzkJCbjtL1HpSkzWOz8rtMZDJjwD3Adajgb4pk+AJy+kOj6L1fqf2s
         LBo+8H1NP0/YuZKEvL+CkmVAAB9HJ6du4LpACNpCw6Si6WpRa00Qfe1q+oWRSteboSBw
         kNqg==
X-Forwarded-Encrypted: i=1; AJvYcCV2Pnqzxyjoyoj6gxnkxVa+AFN8umDQ5viLpOfjgEaOcx9Uv+ItwU40xlFA7FlCHoQunc/Gfol1WXrttToLzEZAqTd6sVxVSiQe
X-Gm-Message-State: AOJu0Yz9QG5IhBXQKjWmUfEbu/fOp8ntDz9Un2MFMRQFrignTwvqVKaD
	KVsFx49OfyTW+9KTLH+cbFtS0kjbcL2IOK1cuzWsOSZr0ZiPyWe2W9RofqfmM0o=
X-Google-Smtp-Source: AGHT+IF5soNWoBfxIJAzPM7ulE2ztXx3R64HiLhLbDOWs9lCmTj3XqnA7S+bNE2jbslzIWMskkLVPA==
X-Received: by 2002:a05:6e02:b2d:b0:396:4314:2bcf with SMTP id e9e14a558f8ab-39643142de5mr67747935ab.19.1721350394158;
        Thu, 18 Jul 2024 17:53:14 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-397f60fc088sm897415ab.50.2024.07.18.17.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 17:53:13 -0700 (PDT)
Message-ID: <da5ba38a-8848-439e-b80a-3d6584111a78@sifive.com>
Date: Thu, 18 Jul 2024 19:53:11 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/11] riscv: Add ISA extension parsing for Ziccrse
To: Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
 <20240717061957.140712-10-alexghiti@rivosinc.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andrea Parri <parri.andrea@gmail.com>, Nathan Chancellor
 <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
 Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org
In-Reply-To: <20240717061957.140712-10-alexghiti@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Alex,

On 2024-07-17 1:19 AM, Alexandre Ghiti wrote:
> Add support to parse the Ziccrse string in the riscv,isa string.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/hwcap.h | 1 +
>  arch/riscv/kernel/cpufeature.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index f71ddd2ca163..863b9b7d4a4f 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -82,6 +82,7 @@
>  #define RISCV_ISA_EXT_ZACAS		73
>  #define RISCV_ISA_EXT_XANDESPMU		74
>  #define RISCV_ISA_EXT_ZABHA		75
> +#define RISCV_ISA_EXT_ZICCRSE		76
>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index c125d82c894b..93d8cc7e232c 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -306,6 +306,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>  	__RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_EXT_XANDESPMU),
> +	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),

Please sort this entry per the comment at the beginning of the array.

Regards,
Samuel

>  };
>  
>  const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);

