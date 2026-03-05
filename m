Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033A62F659F
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 19:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772737551; cv=pass; b=ilqEM0x8i7FM+acPPMCh7QJbZW1BDm+t/76cY88qBWXI3LmNGSzxOw+4sU0t1iXeJsUrRrb5aQ2g6+rRfSyCxF1emazXQdJK5iBt2s2eSA9Q8iERZoQ509KI8SUBlpPLd5ikgLJurLoCc01Ky/GM5QbRvnLf5s4SX12tjPzFNBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772737551; c=relaxed/simple;
	bh=OiEKC9dj80TLcUp3yk+ZVSKiJN0ebZG15+u03MmyUhM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K54oxUZe0gHxsSMeXmFEHFteJdET5uqyNEe2hv74ALZu6imvQrBK8FgdeZu721dw+QanbhdZeRnKo5a/iJ6XNSmgZLE4l3Nu4WEa8JD95PQqfs1Lspfn6mGsdLUaAlGXiw9jMqZwsA89reG9+VjFFM7GcUOrwz1Q6OkmS5j7jms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGDHBfDc; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGDHBfDc"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-797d6bde07fso5082087b3.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 11:05:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772737549; cv=none;
        d=google.com; s=arc-20240605;
        b=VJ7Usu8a2CjDcFOLpM+mqAOoSRbUNRVGidS+NvsSBkafSaJSRec4Fnp6CzfFSG96DW
         VViGB9LlM3raW21zIW0eKBwBm0HvgJWwxqve0VaZC/Ap955MHTSpPRa7Y1MNp/GvgVGt
         eLjWQB6rwQW+/MniKxFo3jkpEvi0uUvfzg+CL3P4rzgdFaxbKcsbKb0L3RzkkFkVe67a
         N9mFBH3Kbcl2d6xV0rSeP51XtLwLzu0c9APLnCBSuGQHxllBsRiDV0fNc0Y0ZGNDPwJl
         NtDFufRIyhBXsg4B82+FxE1U7ULgDxaLX3kZ4TN8fK/Pfp/ZSU5VwLeKqZ60hzwqtxCd
         8DCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=DUfdbW7OxfhKiR73pKbZr0uWEl4+qEzhZGOpiUb5qj8=;
        fh=hJtsMcm63KAxZOkNKTVPqJlyQHIBOVr0T5dLDawG2zk=;
        b=TuivbDnJTh2NJUkJE49TrL2cYGHRfn5LvfhezA2etvtzCRaSv8S07hFWv+FrA9uGEy
         DOUxdnqCGGE/wVGfsmlaSowCwii//TTZgZaCNRLcTShkkN0qk0Ijxej7mLjvizAFVi4S
         3+7vCQHdyk7GqsShVSVawksUKHkjYq7cagT+2VC5Pzr6ggdreXA2xOhV6gk+d94HyDT2
         eNEmHbuPrZXGPE8Ow0aRQ5RJDUPnnHnvfdcKvaleygLGMfK/3VnNOdn751/q8g7/foh8
         8P9LwLt/Jz0nZ+n+BjxA0I1ZKpxHdsOowrsfH3FghUE0Yjv6AXj/G4qdz85zLxuk7IGE
         TWMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772737549; x=1773342349; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DUfdbW7OxfhKiR73pKbZr0uWEl4+qEzhZGOpiUb5qj8=;
        b=PGDHBfDcvLabTp72Em/A1p3xWwIMXxb5OPdsMMut5RG+EV/wbrTkt4lpWKP763RNQR
         5YMRwWuignb6eIxMtaGOJraHLWeNhw2QhnkQ2N5s89Jyshrj8WKlwxosnz1SLfiW6HxK
         h+2nG3pnZpVPyc6fYCauXUvcj72fqd/ky5bhE1R5sLBuMURwTNwPE/7CZ57qOuS5vlP2
         q7S0ttvPPq6obsGqA0YmnYTci3ZKoshdkJ2aYQ57V7yiMjesiQDcILZjeWsP5VRCPIM+
         GCoLkJfASXEtn+F+eTetRw+cU6f5l0uSjqFy5ck/uP9T81Dv6YUy8z1t4rMBzRNvHfb2
         scMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772737549; x=1773342349;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUfdbW7OxfhKiR73pKbZr0uWEl4+qEzhZGOpiUb5qj8=;
        b=bloizY2u5t8KO6k4Mzfb0ECh+cGqs5pHx3Gf+MXosQ4khaJiozSjeTQOI3Mt6dR3ZT
         v5SGUMMjCAgxZM9a/J3VdSfYwgBrUSCmnMj1uGUW/K0mtbbNvirOuvqJJmDg2e1qbIpj
         RGgZx2xwDXSdqht9UCpRH3ln6XYGk2pHacVjuaVW81rDShj/vTWDENoPI+jh1efbfSkx
         djeMfe2Z3tt0z+EKm6Nf6S2v/K5gAHN6ZtkJm9n2xX1gCEuKgodA+SLwUBisNLKvY0HQ
         uXK661gg6D22OIRP9EXZsFQorSw9jt1piOthTSOJdkI4gE/fHaHGsgWHgxi6Fcc79EN0
         dLcA==
X-Forwarded-Encrypted: i=1; AJvYcCVqg1jikS3SuqbuhTJChZfK1bT3A7TuamoOpCay/wl8XoCcKMWTMudASm5WmnY1I2RmDeS+Boz36tE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtMcGzWCC8NoXsLDvkg2Cg5aN5kiW/zi5z2IZ59iQFemVmGoD+
	t0cpalit16AYL8+/zNlVkaUULcgLE9+uT5UhmqaYeJrJvDNU/tbwbn+0uxgRtXMMBAG7ZUjA4Bs
	WwYfJvWpOATJm1CkH2vnR4DwJJgFDykg=
X-Gm-Gg: ATEYQzyaA8j87NEll/mkXriFcEyfRTXm5WArtQACsxHq/RJFhdjvnm105R8WEPv6Lyg
	0/XRj0jdJT3F0Ech1+X3/SJTq7rnC8NURNwu0Jb2kFE12Zo//UGAqlPdh7KiUEMUB4BOGHk1tTa
	d+3sdQqA6H97Ngt3qQmvQuMyHTVl/Z3tsQFLqrzGeJpb6pJXA2KgoPF0UfIfHWvNusRNxurksf6
	6nAEE2lMOHpsf2GsKz3LiA2uWWzv79eoKVXFNgnD3P0jbfUKNoPHn1//zAqmSD298EhoSVKfSV4
	wij3uw==
X-Received: by 2002:a05:690c:e3ca:b0:798:1de:f894 with SMTP id
 00721157ae682-798c6c843e6mr49794737b3.4.1772737548885; Thu, 05 Mar 2026
 11:05:48 -0800 (PST)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Mar 2026 13:05:48 -0600
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Mar 2026 13:05:48 -0600
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <bd935d83b2fe3ddfedff052323a2b84e85061042.1770232424.git.m.wieczorretman@pm.me>
References: <cover.1770232424.git.m.wieczorretman@pm.me> <bd935d83b2fe3ddfedff052323a2b84e85061042.1770232424.git.m.wieczorretman@pm.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 5 Mar 2026 13:05:48 -0600
X-Gm-Features: AaiRm51wLGHSZ9SaMaT4E-JYzg2vW23YHvcBblsyf-Lc9uQK9qhJFdTRUjtyx2g
Message-ID: <CAPAsAGxpHBqzppoKCrqvH0mfhEn6p0aEHR30ZifB3uv81v68EA@mail.gmail.com>
Subject: Re: [PATCH v10 01/13] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, workflows@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Maciej Wieczor-Retman <m.wieczorretman@pm.me> writes:

> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -558,6 +558,13 @@ static inline bool kasan_arch_is_ready(void)	{ return true; }
>  #error kasan_arch_is_ready only works in KASAN generic outline mode!
>  #endif
>
> +#ifndef arch_kasan_non_canonical_hook
> +static inline bool arch_kasan_non_canonical_hook(unsigned long addr)
> +{
> +	return false;
> +}
> +#endif
> +
>  #if IS_ENABLED(CONFIG_KASAN_KUNIT_TEST)
>
>  void kasan_kunit_test_suite_start(void);
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index 62c01b4527eb..53152d148deb 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -642,10 +642,19 @@ void kasan_non_canonical_hook(unsigned long addr)
>  	const char *bug_type;
>
>  	/*
> -	 * All addresses that came as a result of the memory-to-shadow mapping
> -	 * (even for bogus pointers) must be >= KASAN_SHADOW_OFFSET.
> +	 * For Generic KASAN, kasan_mem_to_shadow() uses the logical right shift
> +	 * and never overflows with the chosen KASAN_SHADOW_OFFSET values. Thus,
> +	 * the possible shadow addresses (even for bogus pointers) belong to a
> +	 * single contiguous region that is the result of kasan_mem_to_shadow()
> +	 * applied to the whole address space.
>  	 */
> -	if (addr < KASAN_SHADOW_OFFSET)
> +	if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
> +		if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0ULL)) ||
> +		    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0ULL)))
> +			return;
> +	}
> +
> +	if (arch_kasan_non_canonical_hook(addr))
>  		return;
>

I've noticed that we currently classify bugs incorrectly in SW_TAGS
mode. I've sent the fix for it [1] :
 [1] https://lkml.kernel.org/r/20260305185659.20807-1-ryabinin.a.a@gmail.com

While at it, I was thinking whether we can make the logic above more
arch/mode agnotstic and without per-arch hooks, so I've ended up with
the following patch (it is on top of [1] fix).
I think it should work with any arch or mode and both with signed or
unsigned shifting.

diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index e804b1e1f886..1e4521b5ef14 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -640,12 +640,20 @@ void kasan_non_canonical_hook(unsigned long addr)
 {
 	unsigned long orig_addr, user_orig_addr;
 	const char *bug_type;
+	void *tagged_null = set_tag(NULL, KASAN_TAG_KERNEL);
+	void *tagged_addr = set_tag((void *)addr, KASAN_TAG_KERNEL);

 	/*
-	 * All addresses that came as a result of the memory-to-shadow mapping
-	 * (even for bogus pointers) must be >= KASAN_SHADOW_OFFSET.
+	 * Filter out addresses that cannot be shadow memory accesses generated
+	 * by the compiler.
+	 *
+	 * In SW_TAGS mode, when computing a shadow address, the compiler always
+	 * sets the kernel tag (some top bits) on the pointer *before* computing
+	 * the memory-to-shadow mapping. As a result, valid shadow addresses
+	 * are derived from tagged kernel pointers.
 	 */
-	if (addr < KASAN_SHADOW_OFFSET)
+	if (tagged_addr < kasan_mem_to_shadow(tagged_null) ||
+	    tagged_addr > kasan_mem_to_shadow((void *)(~0ULL)))
 		return;

 	orig_addr = (unsigned long)kasan_shadow_to_mem((void *)addr);
@@ -670,7 +678,7 @@ void kasan_non_canonical_hook(unsigned long addr)
 	} else if (user_orig_addr < TASK_SIZE) {
 		bug_type = "probably user-memory-access";
 		orig_addr = user_orig_addr;
-	} else if (addr_in_shadow((void *)addr))
+	} else if (addr_in_shadow(tagged_addr))
 		bug_type = "probably wild-memory-access";
 	else
 		bug_type = "maybe wild-memory-access";
-- 
2.52.0
