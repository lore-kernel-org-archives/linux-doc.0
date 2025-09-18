Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EB52D0C9A
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 14:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758206861; cv=none; b=a2C5/MvyRrJXs188bwtDV52RSHry872aM/B3G0KRnB1TpZy67YHPTwBAjcy1SP1iJInt/cTK7MCv3ZrxcrcLkvTt3mzzgTZLLvn/WUSbdwDz3Q+MLXXJgJyg7o33mAF7GNsKl/BFMuI2BtsRqRqG1CEBj5+SzE6f46PmHO4YSTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758206861; c=relaxed/simple;
	bh=bp6ZfJ0qmcI9UpGfhH4hd2SDVX5ketoj669JKK5M7cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RaYKDcaSeHC9k+7af3l7boDwBUT8QDd38yyEan0mqEVAoMidyvIN07//1sqUq/JLjseAod2uVNgCs9LbHFvkD5Q7tN7dV9FUyxOuHxMlbDvRQ2zUc12KT87He0J0rgY5NgRr4nJUidaMdYefpLV9P21nAoqZiZovM4/XW4H9weA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHE1KfcP; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHE1KfcP"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-578985fe017so180448e87.3
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 07:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758206858; x=1758811658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZUVA/eN8y4jUWH55g8+vAZUWm6iD5IWuaZ9B1DTE0Y=;
        b=gHE1KfcPEabveVF7P4S9usDMQEfoiJj4C6YJ1Iwp6aCNGk06Ma3GlTj+YKulEk2oWQ
         TP9pg5jjyYN6OxQpnxpQW+ZuhKfk09uNGPT8425PzjzDrzwWQfO7IVENO78ZRVuUywe4
         QrroVyGNH6mIZ1VlvwsSN9nOzDKU6FN4ff5DQdtW+FnQ1ckMyfH6ZRfJOV1zF3dScYpB
         03dnWRNVOJcSWrYEK8ZlO76QR/rXjrve2NPGapOvc+oL8MgADSaItybnEhlWLoT55+pf
         qYbgIh1s6hUgOQFxoeqoxtf0cXEXPASLouCcZjodFbz4c62Xg1jZ0eFOMJbg8ZV+PfBh
         pYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758206858; x=1758811658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZUVA/eN8y4jUWH55g8+vAZUWm6iD5IWuaZ9B1DTE0Y=;
        b=atwQwwzgXmzgvUJSM73lswlABTKDGxwoWcjtxiyLbiqSgNprp8Qg7wvqOyGmh8JG7U
         eHRfQ2e6koe5npXrfEd7QkraDfxySeHeNFicNXQiVnp+/uNv7Roa7nYceHYSPii+8hVk
         DQLAQjbHfM0/zmYOi4DYgTY8gOK28sjBBBNbKkyk0PbklSRauq8QRooX7WacC1oyeUyx
         YfqsADVbgL9Al2Jf3kPa5nL+IeewyYkLSnweim/p4pp6NnQJsABQ/PYhgS9mw4xNiF9I
         w9MN5zpvt+F/0cb+GJgUfYDIw8ztVl9MXd7e1jfjM9OOL8VnEzBP7vz5JzKTAHaT5xLE
         32Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXfElMWXW6ciFtB8aCjEelCgambcYsloMNd4KyLjkGclW5VCPy7RtaeOtjvgdLZ3Tbm92OYBcFt3ok=@vger.kernel.org
X-Gm-Message-State: AOJu0YztYdo0431yGXtVDPlIwouf9GE0QPErvd3KuhY/kUbd2Oe+jSLb
	YUiQn4CoKKj+FjTwonNJLT3vPOHWlMUOexwZi7x+LItLhsvSB2iFWmCC
X-Gm-Gg: ASbGncuYFfryXbHK6NsHurWFDW84dnOlGiX1Rjon1BPp1iIZxGNLvy3QJNUCEi1wzIj
	umOaLgMKqJjrN9lKCn8iGdktSVgCYCC0tzjgI2yWjpwEN4Rqh3pMZzK1JZMCzcbxtzFSRVGt9vB
	QGXRWvvSe64ik8sZE5+H/9pPz8jjI+bxVXn7jhPTxXWMUriWzQiDC2fhqaPKiOQo5rijDA2/f0j
	PKgKWtTLZl1aH4buLfumYAbyql9WV/LwLus/5u1OnaFZNRvVWFyWBFnVGzOrt2dT0AGzyf0Fiq9
	XQgVfWZTWDtRSxiMxx2NICrg1aJHShSrzsXGW8BgfTVfEfdvJboq1zZN6EhAeTFLztzDp7jh9sW
	zgsLqlhd3KSRF0rLFpYLGuBqYEW4r6jgarg2ddzWoP0Yj08g=
X-Google-Smtp-Source: AGHT+IHtJnmg7xLHWlbfBgfrch0goPM4i92u7CS5SbTFZ6QT2H9sZ6KAdWepbZ79ubW13IVKUYf9fw==
X-Received: by 2002:a2e:b8c5:0:b0:336:7747:72e with SMTP id 38308e7fff4ca-35f66df191emr9476411fa.3.1758206857314;
        Thu, 18 Sep 2025 07:47:37 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a2f7ebcesm6234871fa.29.2025.09.18.07.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 07:47:36 -0700 (PDT)
Message-ID: <dcd0c9be-5a52-480e-8447-ebb0a028edec@gmail.com>
Date: Thu, 18 Sep 2025 16:47:33 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] kasan/hw-tags: introduce kasan.write_only option
To: Yeoreum Yun <yeoreum.yun@arm.com>, glider@google.com,
 andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
 corbet@lwn.net, catalin.marinas@arm.com, will@kernel.org,
 akpm@linux-foundation.org, scott@os.amperecomputing.com,
 jhubbard@nvidia.com, pankaj.gupta@amd.com, leitao@debian.org,
 kaleshsingh@google.com, maz@kernel.org, broonie@kernel.org,
 oliver.upton@linux.dev, james.morse@arm.com, ardb@kernel.org,
 hardevsinh.palaniya@siliconsignals.io, david@redhat.com,
 yang@os.amperecomputing.com
Cc: kasan-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
References: <20250916222755.466009-1-yeoreum.yun@arm.com>
 <20250916222755.466009-2-yeoreum.yun@arm.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250916222755.466009-2-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/17/25 12:27 AM, Yeoreum Yun wrote:
> Since Armv8.9, FEATURE_MTE_STORE_ONLY feature is introduced to restrict
> raise of tag check fault on store operation only.
> Introduce KASAN write only mode based on this feature.
> 
> KASAN write only mode restricts KASAN checks operation for write only and
> omits the checks for fetch/read operations when accessing memory.
> So it might be used not only debugging enviroment but also normal
> enviroment to check memory safty.
> 
> This features can be controlled with "kasan.write_only" arguments.
> When "kasan.write_only=on", KASAN checks write operation only otherwise
> KASAN checks all operations.
> 
> This changes the MTE_STORE_ONLY feature as BOOT_CPU_FEATURE like
> ARM64_MTE_ASYMM so that makes it initialise in kasan_init_hw_tags()
> with other function together.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>
