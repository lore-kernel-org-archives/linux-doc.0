Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71552E090B
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 22:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768516974; cv=none; b=VqYLoMVNrHyxERjfvMTr6/eCHxp61WOIP1s/VIFfRUjHi5q8He4JCtNHMBA2xgO0HRKiv669iPYi13K2e6fDKaSblKPBB9DVK3Evzb0peS0mtdORdR6voI48zmROX3ko9rLhXwJRLKK65CMSKobX1dBukPvZBaMp07WxLHthKKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768516974; c=relaxed/simple;
	bh=/urejZHkiW/JLzSovkhbPvkfJag0mLFQ0r8u0h3A/30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iP4GD04Yf8W1llH5S4/Ye6E9tEiQVpLUiVIbRKrTWtI/juqEBRWBUW87y5xI7FfVPc2t6zSzb/ZrVZkXoloPbkTehOt6yo59ddHzUwbm93oo20fkkIHpkGjcSw5yvxQDvgyAyr3ztcRuQKNglyxSg1qsxNiIrbrQjOia9olKEwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzNeTLf4; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzNeTLf4"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59b89e1cf34so230939e87.1
        for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 14:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768516971; x=1769121771; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vQuagjPxslA3/GbLy8OgugPdFRJI5tMwgAjobUXXgeg=;
        b=PzNeTLf4LZZZTwtYOKvhrzppxdKHotxQZ2Ml5iDvyX08H2AljkDtW8zh5GlZlQGncH
         hCgUMpI3sOvzfLnMeP3fTsecQffu5L008KvjP3Z2bo7xiFGRP9MXnY1TpLpZdkzNGJhj
         /DxmhjApIhin9ASjISJkLhlfb+EkwgMdLsWwzNqNCsOL9TrEetbRL0zw+acZPTVlEICE
         PpbaDZvHwLWpGzMtSpimgwXdz393WVfzBATJg3XdDtnUyGAy8eU6XkJ6k036WRmk0Sq0
         +a9aofz4oosU2vuZoq02GISXGxP8bVWI0e2oj1gisHuG84Gg5yf+NRcJVpC4ehAD7oXr
         nJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768516971; x=1769121771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQuagjPxslA3/GbLy8OgugPdFRJI5tMwgAjobUXXgeg=;
        b=O7kK9UBu2AV/XqbVrHMm3sQJqjGG4tv1Fnnebt/UsezzPCQ3fgFSlziyiSHYKkAjJI
         ZnUUSZjnvFigtFwz9382HeucvdBITkkC8QVob21uq7NOJavET5TqaATsQk3kkKMriLaP
         gu7y4ovJn4TvhhaxcMzeT82xHsm8PtiNoS9q13Ww50ICbYGh6uVJsqwCXOxV3VXzRA1A
         gr0bTNC5gGBEu9waC29nuHnKyedF2IhpIGidi3w6YXUpHJgnVNdwX6dqdRJNDaPuBJVd
         SJXzalsuUuxknIgmTFsBk1m9dSHbKl6lMuZDuhvfjhgks2P/41/qd4yeEmLxszxz/lwk
         xh0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWn8nD2LcvUnQ70sQUSBaoGsgOfJQu11V3Z6XLKMQTHvxb+p+JDemf7LLfe55NphjEtqV7+m1MnYk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywer3AbjOxbPfBDfNxRqDbuczhvHRaMmemsS5LsIlKQC7nUxBzM
	8pudIcTsyn3yjVRX+t/pP5IM8BiNRckF9uP0toehy6uGh+NsMDYkEidI
X-Gm-Gg: AY/fxX4qrCaZ6/mqvxCYhsYiukwk7W3ye6JLlaUtLcycGjTOU4sOIQWXq4pd7v6U7xp
	smAxVuvI+rPHrrYOcJtItv7Jey2muVXkqpc9/prFbmHYdJursIQC7Qfb7i7CX50PEqIKa0J/odj
	0c71qu4QSJoafUnoiNpiq+n8TSDwI0z+5ZrLTS6//stjcmWwy8YFy7oRGE9zyDv5TFDrY8Gi6vE
	XVNIRzOk7p4xpyu1mXwgxBQhTcCoo1Yx0NVxrUzmP0ikD+VB72+MeBpRDWoRL4jyiV8rg1fvJKc
	guFtWzvIq2RyDT9gzuCkxKE5UYMic1hqDfxNGOaqoB/8GX043RG76nyuN3RZ6SX0ylunHvcblFI
	H3HfuevE7uECRPjyur6k0nA5PlG6hBJa24964sur4UEX6XuqxyoPqXFiqHEwOSci3ErzEgvVOsM
	kjEW5ZAdIHJhtfQ6tqGTk=
X-Received: by 2002:a05:6512:63d1:20b0:59b:7be4:8c40 with SMTP id 2adb3069b0e04-59baef130e4mr131958e87.8.1768516970797;
        Thu, 15 Jan 2026 14:42:50 -0800 (PST)
Received: from [192.168.0.18] ([87.116.178.235])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf35434bsm209044e87.45.2026.01.15.14.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 14:42:50 -0800 (PST)
Message-ID: <2592f303-05f5-4646-b59f-38cb7549834e@gmail.com>
Date: Thu, 15 Jan 2026 23:42:02 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/14] kasan: sw_tags: Use arithmetic shift for shadow
 computation
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-mm@kvack.org, llvm@lists.linux.dev
References: <cover.1768233085.git.m.wieczorretman@pm.me>
 <4f31939d55d886f21c91272398fe43a32ea36b3f.1768233085.git.m.wieczorretman@pm.me>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <4f31939d55d886f21c91272398fe43a32ea36b3f.1768233085.git.m.wieczorretman@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/12/26 6:27 PM, Maciej Wieczor-Retman wrote:
  
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index 62c01b4527eb..b5beb1b10bd2 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -642,11 +642,39 @@ void kasan_non_canonical_hook(unsigned long addr)
>  	const char *bug_type;
>  
>  	/*
> -	 * All addresses that came as a result of the memory-to-shadow mapping
> -	 * (even for bogus pointers) must be >= KASAN_SHADOW_OFFSET.
> +	 * For Generic KASAN, kasan_mem_to_shadow() uses the logical right shift
> +	 * and never overflows with the chosen KASAN_SHADOW_OFFSET values (on
> +	 * both x86 and arm64). Thus, the possible shadow addresses (even for
> +	 * bogus pointers) belong to a single contiguous region that is the
> +	 * result of kasan_mem_to_shadow() applied to the whole address space.
>  	 */
> -	if (addr < KASAN_SHADOW_OFFSET)
> -		return;
> +	if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
> +		if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0ULL)) ||
> +		    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0ULL)))
> +			return;
> +	}
> +
> +	/*
> +	 * For Software Tag-Based KASAN, kasan_mem_to_shadow() uses the
> +	 * arithmetic shift. Normally, this would make checking for a possible
> +	 * shadow address complicated, as the shadow address computation
> +	 * operation would overflow only for some memory addresses. However, due
> +	 * to the chosen KASAN_SHADOW_OFFSET values and the fact the
> +	 * kasan_mem_to_shadow() only operates on pointers with the tag reset,
> +	 * the overflow always happens.
> +	 *
> +	 * For arm64, the top byte of the pointer gets reset to 0xFF. Thus, the
> +	 * possible shadow addresses belong to a region that is the result of
> +	 * kasan_mem_to_shadow() applied to the memory range
> +	 * [0xFF000000000000, 0xFFFFFFFFFFFFFFFF]. Despite the overflow, the
                  ^ Missing couple 00 here

> +	 * resulting possible shadow region is contiguous, as the overflow
> +	 * happens for both 0xFF000000000000 and 0xFFFFFFFFFFFFFFFF.
                                  ^ same as above

> +	 */
> +	if (IS_ENABLED(CONFIG_KASAN_SW_TAGS) && IS_ENABLED(CONFIG_ARM64)) {
> +		if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0xFFULL << 56)) ||

This will not work for inline mode because compiler uses logical shift.
Consider NULL-ptr derefernce. Compiler will calculate shadow address for 0 as:
      (((0x0 | 0xffULL) << 56) >> 4)+0xffff800000000000ULL = 0x0fef8000....0
Which is less than ((0xFF00...00LL) >> 4) +  0xffff800000000000ULL = 0xffff800...0
So we will bail out here.
Perhaps we could do addr |= 0xFFLL to fix this

> +		    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0ULL)))
> +			return;
> +	}
>  
>  	orig_addr = (unsigned long)kasan_shadow_to_mem((void *)addr);
>  
