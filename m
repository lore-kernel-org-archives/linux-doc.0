Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670F720ADE9
	for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 12:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736511402; cv=none; b=rFT3Vg1VD6QiKSW4lJ8wDkYE0Pqz9ZmicqUm+9dG+gNGfUti66TRxzLhA1+WyOFFZaw/XMZLUoM/ABUI1gkZYybl9BHxaIk7P0bucrp0wqfJnWhKWdMXJliBvBHvJ8DUUYrST0EyRk2DdB/eYh14aMsbfAG+5ZmP7T0srVRjAuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736511402; c=relaxed/simple;
	bh=GGOk9D+nunM4T0ya75OKBiLrbBFOemHDDh2uU6HnyHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QiB/zTI6hUpfkMzR58FhFXhXJJ7Pf5C+1fbTaRYeILdK8gn5YogXRMK8B8/GvalTo3qKD133oA3cO3sGtRML41pkMqIPBcwua6ryc42WIL1XbnsoDc/EybSRsZR1DcmXvSgdyG9OL2WIXwSf6uxAkVx+LGzEh74S0yp8mcgeO0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gqstwN2g; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gqstwN2g"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30167f4c1e3so17266481fa.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 04:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736511398; x=1737116198; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dx6LfbWoOZVo4WZlNr29Yr02kRZ3p+X0xl0ciBlTxio=;
        b=gqstwN2goIWjnQl6JTQ2rLF9l/WYOfYotrlBr+fQe+kOKP0NCkZi7107acw2ij06u0
         cUKWMMhBIzxcugohZArlf8Gg329Qumspc0FQtlp5P14T67Gm29r00F9VoR/HG/ixHRLo
         ePYsGEHnIVS+b6Efe+o4LMOzz3j2TdDrF6fdjuJg5B3nnZEzgS/NOvRaVp8y2VUeVcyj
         QM42Ys0OE882T6rIWfrGffNHuHluCk8uA1+ikMRF4M8hsjrWP7rwetO/njVa+szf1eGR
         jOC3ztv69yEG9sD9iXq2uW/OXDYJZ0EUKMXDRRWzg2A7MHQAdmOzMi2GFvQVy3wql1hV
         EaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736511398; x=1737116198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dx6LfbWoOZVo4WZlNr29Yr02kRZ3p+X0xl0ciBlTxio=;
        b=hBqcaNboyA4SOS7uPQY7+ec/oLyhDh3dPyu3Xin9S/fiu4xs+9J0Ie+Hdb4ViBfUMB
         FrFmHZo/1skCxwPGJPLOU9hU/Bakb0BCgDZ/eDCk4FkdDCpYNXnaJT+mOXC+Qvip9hG9
         k3UwTzM5Jk4bq/5Ej+SKelFTes3EfPKlT6wKf1b7lSEoF1qQrt/gi6V8rOJJHPFk2Mlg
         VhjlPUtmSw9iz3/CZ8hHoXqG4L/tFA10NaRuNVV66w8lOpHrLOjO1MJz1OSh13fQUSzD
         xHTqOU0XGTyE7k+bLKXjxB3j+kkkB/505jXI8Of+YnVCJGcbq/J/uQQmDeij8cBtx6Vv
         cslA==
X-Forwarded-Encrypted: i=1; AJvYcCU0QhJVHj+wXNv1OuU1PNkOcV91aDilW7KCTmDQI9GNfub2KojjteIPturo/r2JrPj1bZs6wxQ7dzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrjBXfOu5aQLxvHmApiLJ5M/a83bn7iHmo7qyv1Wu1NNF4LSSK
	noIHe72qsBZfqNDAjNFWph55qzWmY2IfJghWnJYjcqenw38jw4vEM4sM/gEru6BDJLV5qk6jqB3
	Xm//XcYmoggEv7Vd5OCCAMZCRiYKel0Mfo1d6
X-Gm-Gg: ASbGncu5QEioUB5/C3SQc7fNIi2aoY/tRPrCm+C0/GEySAVsOk0tXC3CFon1aaUFbSX
	vLMoiQDfSAQU6A4Vo7czyDCSa13/G9WXLoTd/bvOaAkbL4BdUkWukb8ej3FbCOm2cmKdawa4=
X-Google-Smtp-Source: AGHT+IGVz7X+fbBVIzBdInnx2bkV3sGGjpZi0hhX8DWvZ9b1BNEo4hsq0wEuqhU72LBjprO2Rqcz30cGAQVOyHHn4rc=
X-Received: by 2002:a05:651c:19a6:b0:300:2464:c0c2 with SMTP id
 38308e7fff4ca-305f453158amr29422851fa.8.1736511398361; Fri, 10 Jan 2025
 04:16:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110073056.2594638-1-quic_jiangenj@quicinc.com> <CANpmjNOg9=WbFpJQFQBOo1z_KuV7DKQTZB7=GfiYyvoam5Dm=w@mail.gmail.com>
In-Reply-To: <CANpmjNOg9=WbFpJQFQBOo1z_KuV7DKQTZB7=GfiYyvoam5Dm=w@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 10 Jan 2025 13:16:27 +0100
X-Gm-Features: AbW1kvYg6Yj75R_YQTMDFKYPIK4IFfqRlUkZXLVrw7rnxTU_BdbrBR450FQtMuY
Message-ID: <CACT4Y+Zm5Vz1LL7m_BubwV=bMPgVjOVNpp12nDZRi5oesH47WA@mail.gmail.com>
Subject: Re: [PATCH] kcov: add unique cover, edge, and cmp modes
To: Marco Elver <elver@google.com>
Cc: Joey Jiao <quic_jiangenj@quicinc.com>, andreyknvl@gmail.com, corbet@lwn.net, 
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

On Fri, 10 Jan 2025 at 10:23, Marco Elver <elver@google.com> wrote:
> > From: "Jiao, Joey" <quic_jiangenj@quicinc.com>
> >
> > The current design of KCOV risks frequent buffer overflows. To mitigate
> > this, new modes are introduced: KCOV_TRACE_UNIQ_PC, KCOV_TRACE_UNIQ_EDGE,
> > and KCOV_TRACE_UNIQ_CMP. These modes allow for the recording of unique
> > PCs, edges, and comparison operands (CMP).
>
> There ought to be a cover letter explaining the motivation for this,
> and explaining why the new modes would help. Ultimately, what are you
> using KCOV for where you encountered this problem?
>
> > Key changes include:
> > - KCOV_TRACE_UNIQ_[PC|EDGE] can be used together to replace KCOV_TRACE_PC.
> > - KCOV_TRACE_UNIQ_CMP can be used to replace KCOV_TRACE_CMP mode.
> > - Introduction of hashmaps to store unique coverage data.
> > - Pre-allocated entries in kcov_map_init during KCOV_INIT_TRACE to avoid
> >   performance issues with kmalloc.
> > - New structs and functions for managing memory and unique coverage data.
> > - Example program demonstrating the usage of the new modes.
>
> This should be a patch series, carefully splitting each change into a
> separate patch.
> https://docs.kernel.org/process/submitting-patches.html#split-changes
>
> > With the new hashmap and pre-alloced memory pool added, cover size can't
> > be set to higher value like 1MB in KCOV_TRACE_PC or KCOV_TRACE_CMP modes
> > in 2GB device with 8 procs, otherwise it causes frequent oom.
> >
> > For KCOV_TRACE_UNIQ_[PC|EDGE|CMP] modes, smaller cover size like 8KB can
> > be used.
> >
> > Signed-off-by: Jiao, Joey <quic_jiangenj@quicinc.com>
>
> As-is it's hard to review, and the motivation is unclear. A lot of
> code was moved and changed, and reviewers need to understand why that
> was done besides your brief explanation above.
>
> Generally, KCOV has very tricky constraints, due to being callable
> from any context, including NMI. This means adding new dependencies
> need to be carefully reviewed. For one, we can see this in genalloc's
> header:
>
> > * The lockless operation only works if there is enough memory
> > * available.  If new memory is added to the pool a lock has to be
> > * still taken.  So any user relying on locklessness has to ensure
> > * that sufficient memory is preallocated.
> > *
> > * The basic atomic operation of this allocator is cmpxchg on long.
> > * On architectures that don't have NMI-safe cmpxchg implementation,
> > * the allocator can NOT be used in NMI handler.  So code uses the
> > * allocator in NMI handler should depend on
> > * CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG.
>
> And you are calling gen_pool_alloc() from __sanitizer_cov_trace_pc.
> Which means this implementation is likely broken on
> !CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG architectures (do we have
> architectures like that, that support KCOV?).
>
> There are probably other sharp corners due to the contexts KCOV can
> run in, but would simply ask you to carefully reason about why each
> new dependency is safe.

I am also concerned about the performance effect. Does it add a stack
frame to __sanitizer_cov_trace_pc()? Please show disassm of the
function before/after.

Also, I have concerns about interrupts and reentrancy. We are still
getting some reentrant calls from interrupts (not all of them are
filtered by in_task() check). I am afraid these complex hashmaps will
corrupt.
