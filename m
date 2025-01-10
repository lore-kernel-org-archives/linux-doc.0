Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0701520A5CD
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 09:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736501002; cv=none; b=ndrVGq4Vn4YrVulTmRe+3weq38Y/00Q6fZzBhEcHgmOkTidMAxAvIlVxePmQw/AlU/FhrzmhVAr7qfbAMmPc+zo10T02xkphxXNzgZy83ye5uYlfDbtHvIt/0VpDx3/K7FE0dA+e+xkOX6BxHPHe8a52MUDLiNJNzFAJqYG4GjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736501002; c=relaxed/simple;
	bh=GAAiDMP/3K4jNuOVlmV9gxFHfSeVsLR0ZBJB5nV0ODY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xpfyw+ZIdHZjccaSoJ2/IXqknYzoquUHTHk+hKq84epn31hSWUkZqmRgucjeZm+m+V3YuT0wrNOO2UivLWzRo8dmH8gkQwLZqbFCE2k5JFaknsx6xhxw3/gndeTOTiS4z6J46PP6zivZZEkevDGJuif/nV8QHkU3avY/bt+nrac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gB9Kg2xC; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gB9Kg2xC"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2eed82ca5b4so2971167a91.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 01:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736501000; x=1737105800; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/8n2ma/ziuKr5ZfTxLhXrZB/sBg/b3H77RWqJjKv6Y0=;
        b=gB9Kg2xC5PBgtMD9f0qHxBXsloikaXrpP1crQa++P/3YKybNU+12FN/gWN+bxBXzgZ
         Ppx3QneoHqpZrq+MHvh5QJVHZnUzkpCWNcabqNTO4N+SaTNRUSd+AVTSRVpmExPZmQ7d
         A/ScG4hgYiV6QgBqjMMXLhkBbNw8PI0wBDBSuxRUJkwDX8xsP+SEdsAPqMqD6UHoZXVg
         6NpkeCfdrxN9jkgCl4S7U3vWGpbvhyApzK9dGwz71q1Wq8qaemKTP3wbw1gD9/QWBy6m
         N/D/zgbKxZjSw9BYEA+dYvI3NXs3K1u6PheIqKqkBJ2ImIm02P09joqgw4qRnj6WBII1
         /ziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736501000; x=1737105800;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8n2ma/ziuKr5ZfTxLhXrZB/sBg/b3H77RWqJjKv6Y0=;
        b=i9DR9q0HMLSWRSUF1HJy8fCS3ZQvN99Yk2+V9n7AoJxoX9lI3uf0no5RVZxXcGXik/
         V+KUf+GGNY4rydfObz6XecdKPVyTLK7fg0aVbEAyLaCcyu1YvcZsogZaNKasxvtCE3jR
         115JOTYDk0k0j+HKy3uTAMY7vqhLzM2m5I+l+pN565OBjq9nKrMMDML6a7EbPmDmp+vF
         rhyTM7pDVbC7vwYPvZZ2psQ9c7h0/ypnK6ZLMocX8hgXiT3OocbcvckQZOTm7AlFKgK2
         TZsWVYEd6GSQ0mSXPW/+uUxfsczJBcqtYgSm6d8se5utOdnMXl1DUwW2K1yQHIAbQlBI
         k7wg==
X-Forwarded-Encrypted: i=1; AJvYcCUhj/6Cy41jofCBN5LSRqQAJpKKb4lzN/3CfpHGQnmDZb47ZzkXlTU720FL7ZgaKBIqM54pIv2V9m4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywem9qWUq0GqdYCcp3dNrs2BQY1IhmuCFpBRGFZXG82G7Z4HT3K
	4WwwJCJdhi7jyaHpY2b2u0JtfkOWiByQAFONsxamewK2nRTKv9IrQS4F5yVl6C5GqQasiPLS4kO
	3vIGYavH3/FCyQEfO5uZwjewkR54BhXey+Ra/
X-Gm-Gg: ASbGncttbg2rak1Q7ra/3Vod3PnUbBxJpc5s3prhCrtjctOZa8I2Yxp8in4WD4Tma4y
	X15lUCmlGRTTCP8HCEXXQgKl/JZ02meDxe5LS8z1OskxeJIo7gxO5wgnjDGgvlVWy3LbAyw==
X-Google-Smtp-Source: AGHT+IEav7llRQkaGRkKqlm4jpxalFoMFJLbH+c+XE/B2dEdXVu/vLKg6ejDqUmr3L00UB4/cFzFuVkFajos5hgHzXU=
X-Received: by 2002:a17:90b:5483:b0:2ea:3d2e:a0d7 with SMTP id
 98e67ed59e1d1-2f548f2a897mr15945376a91.15.1736501000183; Fri, 10 Jan 2025
 01:23:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110073056.2594638-1-quic_jiangenj@quicinc.com>
In-Reply-To: <20250110073056.2594638-1-quic_jiangenj@quicinc.com>
From: Marco Elver <elver@google.com>
Date: Fri, 10 Jan 2025 10:22:44 +0100
X-Gm-Features: AbW1kvbwJdd-Q4HHGj93BJhXupMaNDNojdpH0KA2V7DRnVCIXbRzJRAefX-Qlpc
Message-ID: <CANpmjNOg9=WbFpJQFQBOo1z_KuV7DKQTZB7=GfiYyvoam5Dm=w@mail.gmail.com>
Subject: Re: [PATCH] kcov: add unique cover, edge, and cmp modes
To: Joey Jiao <quic_jiangenj@quicinc.com>
Cc: dvyukov@google.com, andreyknvl@gmail.com, corbet@lwn.net, 
	akpm@linux-foundation.org, gregkh@linuxfoundation.org, nogikh@google.com, 
	pierre.gondois@arm.com, cmllamas@google.com, quic_zijuhu@quicinc.com, 
	richard.weiyang@gmail.com, tglx@linutronix.de, arnd@arndb.de, 
	catalin.marinas@arm.com, will@kernel.org, dennis@kernel.org, tj@kernel.org, 
	cl@linux.com, ruanjinjie@huawei.com, colyli@suse.de, 
	andriy.shevchenko@linux.intel.com, kernel@quicinc.com, 
	quic_likaid@quicinc.com, kasan-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jan 2025 at 08:33, Joey Jiao <quic_jiangenj@quicinc.com> wrote:
>
> From: "Jiao, Joey" <quic_jiangenj@quicinc.com>
>
> The current design of KCOV risks frequent buffer overflows. To mitigate
> this, new modes are introduced: KCOV_TRACE_UNIQ_PC, KCOV_TRACE_UNIQ_EDGE,
> and KCOV_TRACE_UNIQ_CMP. These modes allow for the recording of unique
> PCs, edges, and comparison operands (CMP).

There ought to be a cover letter explaining the motivation for this,
and explaining why the new modes would help. Ultimately, what are you
using KCOV for where you encountered this problem?

> Key changes include:
> - KCOV_TRACE_UNIQ_[PC|EDGE] can be used together to replace KCOV_TRACE_PC.
> - KCOV_TRACE_UNIQ_CMP can be used to replace KCOV_TRACE_CMP mode.
> - Introduction of hashmaps to store unique coverage data.
> - Pre-allocated entries in kcov_map_init during KCOV_INIT_TRACE to avoid
>   performance issues with kmalloc.
> - New structs and functions for managing memory and unique coverage data.
> - Example program demonstrating the usage of the new modes.

This should be a patch series, carefully splitting each change into a
separate patch.
https://docs.kernel.org/process/submitting-patches.html#split-changes

> With the new hashmap and pre-alloced memory pool added, cover size can't
> be set to higher value like 1MB in KCOV_TRACE_PC or KCOV_TRACE_CMP modes
> in 2GB device with 8 procs, otherwise it causes frequent oom.
>
> For KCOV_TRACE_UNIQ_[PC|EDGE|CMP] modes, smaller cover size like 8KB can
> be used.
>
> Signed-off-by: Jiao, Joey <quic_jiangenj@quicinc.com>

As-is it's hard to review, and the motivation is unclear. A lot of
code was moved and changed, and reviewers need to understand why that
was done besides your brief explanation above.

Generally, KCOV has very tricky constraints, due to being callable
from any context, including NMI. This means adding new dependencies
need to be carefully reviewed. For one, we can see this in genalloc's
header:

> * The lockless operation only works if there is enough memory
> * available.  If new memory is added to the pool a lock has to be
> * still taken.  So any user relying on locklessness has to ensure
> * that sufficient memory is preallocated.
> *
> * The basic atomic operation of this allocator is cmpxchg on long.
> * On architectures that don't have NMI-safe cmpxchg implementation,
> * the allocator can NOT be used in NMI handler.  So code uses the
> * allocator in NMI handler should depend on
> * CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG.

And you are calling gen_pool_alloc() from __sanitizer_cov_trace_pc.
Which means this implementation is likely broken on
!CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG architectures (do we have
architectures like that, that support KCOV?).

There are probably other sharp corners due to the contexts KCOV can
run in, but would simply ask you to carefully reason about why each
new dependency is safe.
