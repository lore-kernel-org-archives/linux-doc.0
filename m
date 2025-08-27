Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913221A238F
	for <linux-doc@vger.kernel.org>; Wed, 27 Aug 2025 00:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756255583; cv=none; b=EjN8CLpJjQ/6F47kRADck0HD/6HXnFu25GLy6iuQJhCeSGjh1uKz2iTZRYgVIg5eUoPrYlGblVGfeeKXBVyaIT4nxwIVi8UDENm2Bo80k4cGQ0SYLE/SvG0JMbuELKTHZi9jLAcRABSMBNl7bNtLyWpAGX5J6bc7wc7BdpCzd9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756255583; c=relaxed/simple;
	bh=H+kkfzVW4fOfE6BunEcIw/4uno8zsE2Jauu4d0HhpAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L1t4obXXkNBvXJMMIfUVPxuwHO8/aptLqtaBUGZtHF0zQ1x+nWo4egjkt8RsW60ZytX43x5FupBMP0s7LMA4RCdnU6gushY1GFR1TdkKwXFvcJpW7xjIqkkUkfPeiSsr8pP5vmOYficluRL4VtzXQOWf65+7QOlZ0Df53b2wZe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=c+ONQrpC; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="c+ONQrpC"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3ec4802d43eso14540025ab.1
        for <linux-doc@vger.kernel.org>; Tue, 26 Aug 2025 17:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756255581; x=1756860381; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zclw1iBD4zpqjkUTKL/tBf6jKpfLRB4Ld2/pw8/YSMc=;
        b=c+ONQrpC/gFcMpFrWP6VtrlBKlcf6RfnQxWmrEr8ckXSDyYBJK+GrnN3wCCgIHhGAB
         SzTW4SKnr1jq/6J5fjdlj+48sJYThTL3F1sVT2LGjwyZMlBI36kdtMgciYoz/6iOXXAF
         ucunwLN1tUTq/IwcBu63HPH5v+97JeehyqaME29rMsIk0iZ6hTSA23POTVOyvfpAmXwZ
         B97FaBEzwDfwW2Th7uhD0XJcKlk/Pvd1NHRNEtbpCzJPYLq/nekY+gOFw/Qf6iG2d57A
         qd+vsnj8NZqXhqgu1ZPaQybpuyPHoUmG1kJ+gFb/RgG7XEUytrQ8hREZw2PYf75KFT/v
         tozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756255581; x=1756860381;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zclw1iBD4zpqjkUTKL/tBf6jKpfLRB4Ld2/pw8/YSMc=;
        b=Qy4P8om7Ib/fffYSmj1x5lXeZ+5NxlrOQ8NfFQLVWWKL2SwAgbt4VcE+OqeCXA4nS7
         lbecmoAN5kVXbMJvz+wIi0f0+8Mn8YiQwVgpcPIdyqU+tH1kcsDSubqZb9Pia/qqKaot
         9VEixKrRzsF5iU3m8cAwtg2Z/UoCWYi9uKt84jF+kvCUZ2yWnf43ehL3ehOvyWVnbZG3
         vF+SDcZI1aIpZnmwLeoym1UsHdiJVrU7vii1dJ9fG7lewgpa2MxxwObroeT+OUDNj1iH
         tdx44xIJoZTOjhLO9JKzxBskF6Ix78b5QI0muxfLPDGDxKHI7X5tRbrHw1cLept/22S8
         YYAg==
X-Forwarded-Encrypted: i=1; AJvYcCXwe5yVjtKyonHuwU7LheiCD117/lc2IIipjEnj7+FJHPNibp0Z8IPNid9pf0ls6UHys9ZtFZ4u32c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDqYb/Pzcn0SOUllyRTlCreAAw8T4v9cDMrgJasqxeWElmaERW
	SXqP14qMl3u/Py+5LWM4sy0d7MBRewGTPAWx7tMsZdhYwxkoVPPSxKyq5bqK8sDlBCE=
X-Gm-Gg: ASbGncuDhhTd4NZkjiCGEGcYQHcTeMQ7ytDZCSUtzNBoDEbaIoKoUS/l6iIB/ocwePL
	zaAw+TR8Fd2wbcrNLiwEbBjEAXKJ+M7W2IsXnZZDaE0mY3WwA2EUi1YeeBwwdzv5iq7o5D+rEtf
	AYVkENUndw9BcikYbwmLRumz6YeX9D/PVQw0SWhdUz+bnmap6Me+hY8XNEm15p9HNUunlFrLcGV
	Y+y8iQ3AukxufUPAPUIambHqirzD1vSjT+w1Ai6zFUhoM3SkhgMrBlrgrN4q6kwVF1iwst4egX8
	Va0Yl+hSSQOhON/OM13PGVd/YBTQU0AzO3VPml3blee9XNv4fMPGenEE81PCBCpMpxpa7P3BijK
	M+KGiilDG0+1Qgj/FqGtM4qSqbGX9yRgKMciSIA==
X-Google-Smtp-Source: AGHT+IGfh2W97xdVpFCgiQyq3Pb9/ifBsTlwqyh1OAHr3R34PnfYQnj+aQ8bMShNsAl8EpMrNrhaMQ==
X-Received: by 2002:a05:6e02:1b0c:b0:3ef:1b56:c8ea with SMTP id e9e14a558f8ab-3ef1b56c9f9mr43866025ab.11.1756255580619;
        Tue, 26 Aug 2025 17:46:20 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.11.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ef2ff2dd60sm14606295ab.9.2025.08.26.17.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 17:46:20 -0700 (PDT)
Message-ID: <2e9ee035-9a1d-4a7b-b380-6ea1985eb7be@sifive.com>
Date: Tue, 26 Aug 2025 19:46:19 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/19] x86: LAM compatible non-canonical definition
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 Dave Hansen <dave.hansen@intel.com>
Cc: x86@kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org,
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <c1902b7c161632681dac51bc04ab748853e616d0.1756151769.git.maciej.wieczor-retman@intel.com>
 <c68330de-c076-45be-beac-147286f2b628@intel.com>
 <4rkxgsa5zfrvjqtii7cxocdk6g2qel3hif4hcpeboos2exndoe@hp7bok5o2inx>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <4rkxgsa5zfrvjqtii7cxocdk6g2qel3hif4hcpeboos2exndoe@hp7bok5o2inx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Maciej,

On 2025-08-26 3:08 AM, Maciej Wieczor-Retman wrote:
> On 2025-08-25 at 14:36:35 -0700, Dave Hansen wrote:
>> On 8/25/25 13:24, Maciej Wieczor-Retman wrote:
>>> +/*
>>> + * CONFIG_KASAN_SW_TAGS requires LAM which changes the canonicality checks.
>>> + */
>>> +#ifdef CONFIG_KASAN_SW_TAGS
>>> +static __always_inline u64 __canonical_address(u64 vaddr, u8 vaddr_bits)
>>> +{
>>> +	return (vaddr | BIT_ULL(63) | BIT_ULL(vaddr_bits - 1));
>>> +}
>>> +#else
>>>  static __always_inline u64 __canonical_address(u64 vaddr, u8 vaddr_bits)
>>>  {
>>>  	return ((s64)vaddr << (64 - vaddr_bits)) >> (64 - vaddr_bits);
>>>  }
>>> +#endif
>>
>> This is the kind of thing that's bound to break. Could we distill it
>> down to something simpler, perhaps?
>>
>> In the end, the canonical enforcement mask is the thing that's changing.
>> So perhaps it should be all common code except for the mask definition:
>>
>> #ifdef CONFIG_KASAN_SW_TAGS
>> #define CANONICAL_MASK(vaddr_bits) (BIT_ULL(63) | BIT_ULL(vaddr_bits-1))
>> #else
>> #define CANONICAL_MASK(vaddr_bits) GENMASK_UL(63, vaddr_bits)
>> #endif
>>
>> (modulo off-by-one bugs ;)
>>
>> Then the canonical check itself becomes something like:
>>
>> 	unsigned long cmask = CANONICAL_MASK(vaddr_bits);
>> 	return (vaddr & mask) == mask;
>>
>> That, to me, is the most straightforward way to do it.
> 
> Thanks, I'll try something like this. I will also have to investigate what
> Samuel brought up that KVM possibly wants to pass user addresses to this
> function as well.
> 
>>
>> I don't see it addressed in the cover letter, but what happens when a
>> CONFIG_KASAN_SW_TAGS=y kernel is booted on non-LAM hardware?
> 
> That's a good point, I need to add it to the cover letter. On non-LAM hardware
> the kernel just doesn't boot. Disabling KASAN in runtime on unsupported hardware
> isn't that difficult in outline mode, but I'm not sure it can work in inline
> mode (where checks into shadow memory are just pasted into code by the
> compiler).

On RISC-V at least, I was able to run inline mode with missing hardware support.
The shadow memory is still allocated, so the inline tag checks do not fault. And
with a patch to make kasan_enabled() return false[1], all pointers remain
canonical (they match the MatchAllTag), so the inline tag checks all succeed.

[1]:
https://lore.kernel.org/linux-riscv/20241022015913.3524425-3-samuel.holland@sifive.com/

Regards,
Samuel

> Since for now there is no compiler support for the inline mode anyway, I'll try to
> disable KASAN on non-LAM hardware in runtime.
> 

