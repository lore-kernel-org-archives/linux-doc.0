Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794567420;
	b=jqle2lXatHQjoGLKofJA/s0XsegjJ2XrpyQeDs7hyph4/hIWMjdZpcKCmjygm2BNaTzT
	 0ulsPKJIPCB0RHfmmvgn4/hoK77KZ7AdmzdqEIsLja5Iil42XGimyGDoyrqTsXsq4pfmB
	 8abTxmryBEzo2LkN/8nrISNM+YV2Dnyz541WtTM7gHKHq/S9YrRbTc2QKXxAcD5nCgYsl
	 DbapHhii6UHoT45FeTZiVvHHolLo2JtrwEcafuuTE3By5UOHMksqweQgKIn97rBbe9JWg
	 JyYeBq1qPWJ6PDNBQw/RCd9H2CD8i5JVNsQOMA2FNHeljBlx3r6FXIyF/lAamyqB7Wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=h148AzK7ulcLWc0NU3jZpboHW5vO/KJ9aeMyUmTns1k=;
	b=FltOZfYlLWJhJvqUbjTu+jqJ+uwgzejLcEUFsgmdffA1HKlMIAlUoXieeEe9GztxVMx1
	 b1/opI1ArKsNW0hCaMgpp9CZeby9l6D+7ZHLqTnQ2cmbgafAs7uFaI0z64TKPeV5jo2uF
	 z4L5UTX1IOPDw6caafOTQ+4xTOVy/BNmrXNZX7j1Y6GHP/jLcMBIEkuBTXWu/wGLyv5VP
	 FoJh4i9gUHCjAB0Lp87cXeac4lGvg8kycgTS7MykvxtQwmZHbR/euSxskDhEGi1rYGok1
	 uy+e2w+k795KSvQ1M8R7TQUHpRv1WCIwSG7SwOVcfghxgNustRCLaCpFoHsnSW6wp2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oSSMMszi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEAC606A32A
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 10:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EEAC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oSSMMszi
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a2af4c8d00so1319074c88.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 02:57:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794567419; cv=none;
        d=google.com; s=arc-20260327;
        b=sv81nMycapa0VMPczTb/HQwGNyCSQzPbabR9v5jkK/7W6dog7QLuuKWUXBuO4sGbAZ
         s2zNdPRaw0WkJD6T2zyOESB1cj1TtCrF0ED2C5Ip3IfPzOLjY2h5dj5cTWYTo9IM+XY5
         OsfFRYRDxF3a53/CkT1cyZHalc3CKXFNLAe6/QWiTkDu1qQv3aotsFZxm/z6BhLn4PA0
         gzDzgAUhQJpJPz2M5MYH7WZuh7J3YgTlt+gm1ccjpcCa1NhQ3VB8olGDv/PqpzhR1zJ8
         mdCoffQc5N+KWcjAl2bIJLzrH6EFH60kzwPjv+nZ7ZqZg6gh9EUwKmKJzIXzuSQnmYTb
         aacA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h148AzK7ulcLWc0NU3jZpboHW5vO/KJ9aeMyUmTns1k=;
        fh=TosBpfZdgjawMPRn+fN6q+kyqDL2RGhBpoDbpcBAKew=;
        b=Qk+XHaPZzCw42BjD1Zkuvl3ib6W5GkQhZXc4+3JM5BQuk3r3XivzmGcIEpIYIAnrJF
         mH8AyXYtbJjo3dJvGD4/8D+LVlEGdeits7y2o2WIJNtLm1KRc0/Cl7ValXrunV/hzgb/
         EuKMKUf3duz55YIOEXI1QgI4kBRq6Bb+WasmW/MsnMItARZ3ibngHrDRS7L1kil9KpCF
         gm4vzBpMiz8tn+Vg3/L17PHTAMtFUGR3/OUgZvYGtPvu2jRuZqni7/s4DbcU1dMzZU+V
         V6GSF4IYtpQZVbPvxPlwMMmZfxscVoRZyyY3pb1p6gwSyFV3lf7OvStpFA0zhx5zkMRZ
         34oA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794567419; x=1795172219; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h148AzK7ulcLWc0NU3jZpboHW5vO/KJ9aeMyUmTns1k=;
        b=oSSMMsziL7w6nW47/r8iQSeinVJ38aAA1LMs3FVdDbSdFpg/klmLvVGMa2XNtc/L++
         qk+1oI4pOmoNAM2Sp+wJp6f1GzvqwIvaSPVHsRXkDEDmi0H/nyYKqQ5+xTUkwN/XJ1aB
         lhIBS8TnoviuNl3qZk6EyysgPOPl1pH4Wefyh1koiZ0i5FTHW1jyvr5iBVxcRqCHFW0N
         uN5FQLfq4Qc+wBBGzRMVFoydK7pIBrWo87Y3Ja9x0PV7XfOgqPtUwsSp/PkVZR1sU1cY
         a0wVy4gycR3P98dRB726mwhv3llAloTH5tKnfwCYXAgxzrNSd6x7O+FrYd1nB4eNJsYs
         Qgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567419; x=1795172219;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h148AzK7ulcLWc0NU3jZpboHW5vO/KJ9aeMyUmTns1k=;
        b=QS8VVFiRVOddUYbThsWc3oZVnq6up+sKotw4XAFoZoYEaybSiHpimOC/RahTXqpRlr
         g0f7g5Kg8joawvfhMRAy+wTuRmbfVdKhrt6auJs1sH/kYeDdYiJA6etFsLW/dQqwaexa
         75nD4K8xwVB+QTJc/JDJ+FAv5XSKseDPqIpAwfJj5G0bYJgP9aaKhF0x8JYFDfu93eYS
         JTBUqNmVCWMO6m9gAU5br0NSIQMHt8L+9azDUugX2OAfytPsW3DE1a1zC+wACedU3XdB
         Mtj3y7YUlnC/Am9ZOxg2wLez3hzEZnY2cycK6VEA3J2rDrV/UJ7w0KIB7tOQK8c/WTI2
         hvFA==
X-Forwarded-Encrypted: i=1; AL+hErEUlgHfBp0SRAQgVJ2P7vpgQOqoxPIAfEJAr/E/aPJQ6TY+hlceeJiUQYao+ysmCIQ86KSz3Sph9Yk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GT2p0WwupWx7D6JLcmFGSmYWUbiZfSqbhLWx3pTS4v4wwhhLU
	FjhKyJcR/cA2WFD1WwgLRCKTMUBlsMFy3EpEbixUs4grasvVkbqcqBOeNIo1qJ9HXob4XUzzVAU
	PodBJq10DuXq23/Anj/Ms5u69U7pHKH4hxbs0aA8d
X-Gm-Gg: AYBFou3uNfv8Y626jOmQjiSH6QBPCBuascEcyd9Pr95U3ir18FxRegqtvvEB+aoCehO
	zgjWiG7jtAZ13fQoxx61mRV+7EB35ca3ln9+78tJV0WYT0QuFgQKRqBLR/OpDeEB1bwNGoXIIVV
	4tUaWwHP4xHTyQjzUhU8tP0VfLMnNVAYhZSNOuLcojIvl4SYbNjMvxFPPY24Nbiy7cU9j/Xfja9
	RwV2wqPu0mDqCkBE+q7WtD+iXu2/XAapV+gQaaOioxjcG5KuBlUAYNxcdD5o86cL21JZVtA2AUH
	1ET2RRUJ9MmQju0l37tkrF6OxHA09MflXjj81tI8BMyELw9Firb0pOai54nezdNiqf05f5ui62z
	SVu5jjjDtcpqmSgDNmdg1DJ8rarCfYNa/z0VBCWoh9qwlLIDVE1UY3VS4X+Jjz3DGnceG
X-Received: by 2002:a05:701b:2810:b0:1af:2ba7:e44b with SMTP id
 a92af1059eb24-1b503068de7mr2114022c88.3.1794567418689; Fri, 13 Nov 2026
 02:56:58 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794506262.git.chris@chrisdown.name>
In-Reply-To: <cover.1794506262.git.chris@chrisdown.name>
From: Marco Elver <elver@google.com>
Date: Fri, 13 Nov 2026 11:56:20 +0100
X-Gm-Features: AclHuK8EymS8R4ke35k_Ts4zDwGVpBzqd0W1daXPPjdA8aiWj2M9LBxfbR3z3Fk
Message-ID: <CANpmjNP0cWB_670hYj7p+Dd=do1qEu4XHeW+c7sTv-MXi0UBTg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] mm/slab: Support selecting slab hardening features
 at boot
To: Chris Down <chris@chrisdown.name>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Kees Cook <kees@kernel.org>, 
	GONG Ruiqi <gongruiqi@huaweicloud.com>, Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Nov 2026 at 09:51, Chris Down <chris@chrisdown.name> wrote:
>
> Slab hardening settings are currently all build time choices. This means
> that, unfortunately, hosts with different requirements end up needing
> separate kernel images. At Meta, for example, some hosts are built with
> these options and the rest of the fleet isn't, and that's one of the
> things that keeps those kernels apart.
>
> This series does two things:
>
> - SLAB_FREELIST_HARDENED and SLAB_FREELIST_RANDOM are cheap enough with
>   sheaves that it makes more sense to just enable them by default than
>   to make them switchable. With both on, system level benchmarks didn't
>   change measurably, only slowpath heavy microbenchmarks did [1].
>
> - SLAB_BUCKETS and KMALLOC_PARTITION_CACHES cost memory (Harry measured
>   about 1 MiB and 18 MiB respectively after boot on a 64 CPU VM [2]), so
>   they get slab_buckets= and kmalloc_partition= boot parameters, which
>   default to on when the option is built in.
>
> Whether those two should be folded into a single slab_hardening= is
> still open [3].

A coarse slab_hardening= option can easily be replaced by
documentation. While less knobs is better, an intransparent coarse
variant of slab_hardening= just makes the admin wonder "what does that
actually to, and do I want it?". They still have to go and look up
what it actually does, and at that point it doesn't add much value
(alternative suggestion below).

> > > light: "I'm willying to sacrifice _some_ memory and CPU for security"
> > > full: "I'm willying to sacrifice more overhead for security

Who will decide what is light and full? I think there just won't be
any consensus reached.

One thing that users may want is an "all off" option, similar to
mitigations=off, should they wish to get max performance back with a
single option. So you could consider slab_hardening=off. But at that
point it may be more consistent to drop slab_buckets= and
kmalloc_partition= in favor of arguments to slab_hardening=, such as
slab_hardening=nobuckets,partition. This would mirror mitigations=,
and should cater to the usecase of slab_hardening=off to get max
performance with a single option.

But I would not add options such as 'light', 'full'.

Thanks,
-- Marco
