Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209AB3AA1B2
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 16:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780675577; cv=pass; b=Dw81xQUl0wEQUaRwZz0m3dab1T9QqAEjr9l3/VKfj1F3xLDQcAHBk3SmXYb7rJ6bsb02yIkYAhjAhw1EK0l3nSzhsgwYHTrjudKeUxHd0pCE3jBMEf1f1VWyjzbkNm1TGqoyNIM8h54v75XqODKDLPmUpN7bUQz7tedl9HJnoSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780675577; c=relaxed/simple;
	bh=CYocm5u0+pg9o3aIVAE3m5a3oTIe6F5o9fKMKsoF8EI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rWfi3kmWCclVrNPsInt7Sl5GLb1vgH4IQd45qbLvpSuWaMhbZgJsFCvv6W/R1WFM4eLLaTlATGw35VlAjGeei0osf+wLjJxwLfebCkSOpgGkh90wvpt8RZrA3n4MUpg6iCLKH7jumTMmqqflY1wQokFkr6EdCjT3bkv58i1mGBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WYw2iXHO; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WYw2iXHO"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6611669cd16so120256d50.0
        for <linux-doc@vger.kernel.org>; Fri, 05 Jun 2026 09:06:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780675574; cv=none;
        d=google.com; s=arc-20240605;
        b=BzGj9u5sonHc1ryi/W5hOOfXum+T91l11keiy+9dPi2JwYOcWDhOUFeJ8BBO9M3GHF
         SsTXu/QthQW6oo5UIYxPI6/EpllYX4t+tkh/DJJG+ypLsFV8rW7/mVlMxaKNyh553AW8
         eheswGD7H1iRaAEKh1B+GuJBBiMW+3Alz/vNjKCBwZUc/+t85gnq/VLl4qGvNVuDO+lH
         Hq7AxoPKuhqyqul6Vmvs+LydkR2q8WNue0qIS/O5fh9TQxAvmiNdRX0E5g5HhUVGCV2R
         ditTSufbfdWqH83u5VvpQIHFqlMlh87o8PhuLXWSIJfmuMqY/8iPmNdRZydu8PHCKd/8
         ZVbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qpweCGcPTYVu/t4xYY3lqhavrFen0DWkq0lhTltrHoo=;
        fh=gee7PEzVbjyziB32gM9Bw1rHWNvMQ/aoumOSsAlssy0=;
        b=aE/fGJ3ozrG+6slpj6W22+fAbOUYbd8dTiX+QCrd/Ff5kf78pY8E4MWg/p51rTAfgO
         wyZ10NPUJcR61CPkW3Es/JDJXGFvlML0v12/+AmZHtxERhruNvCZwAtChn1x22s2/zJk
         CtM0rAElFbaaF9+m27zgDKIKgxkM2fVp4PuN9jeVVosJyaaclAu6fg8DV9+gj2zQbFFs
         IyLFvrkpSC+QAnRQPT/e9KJu6wbh0b6z4z0nMRxh6GCZEnki8wXKLIM6GxsnaN8Wzlxb
         dzaHtTXkJzwKYfm3TXAPziV2rotQGloDFMHMK5VW/nMCBAnDn1KzJx5TL9hS3hbbqRSX
         ELGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780675574; x=1781280374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpweCGcPTYVu/t4xYY3lqhavrFen0DWkq0lhTltrHoo=;
        b=WYw2iXHOew+BVshvJs3UfrU4HFPekt6Fb8/tqKm4amfDigUZ6hWHjh7r8YmjoU9Ce9
         fBHImGVFkweW4lLujv8L1j3m0/zSU9xH6jtigm2fcG96IxbZIqOpUMWi7lliz0/Hrtnk
         vevzrHl0YIIsR/g7BcnK3ryi1PLU+zA4Q/NgwHHv+XEsErNfiJK2fpTL8tpYeGAdhZjd
         jZp/Rp4d68R4LkJB4UHFMslX+FEClMg1Zdt4YADT+WQ6HPD4x0ptwJ4yTKrEaw1M/YLy
         08DZyxvggsVzvq4Eqjvw8U7OiQWeMk7jdRsrmh2m/UpyZI5Pf6uu6ZZtKerOAGuVB1fM
         md5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780675574; x=1781280374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qpweCGcPTYVu/t4xYY3lqhavrFen0DWkq0lhTltrHoo=;
        b=RdUsY+u/7/kpjicSp0Ii4fGPinArzDzzGXOQXT58rBopw4tcVFEZJaCHXe+kohoX5m
         OFmJ1vbKO4ou4FUE40eKhQUAqco+4sLIgUPZ/ZVvaEUfzUj93HN4kh1iG6a2gPngJCYn
         Uc65jLSFCaCNCATrTunw3P1dRePzm+NIl28hQBYeyaywV9CdbGNk/xaFm8EHsNSRItxq
         ZEfdzL2xsbjZ3WX61TIYI3VaOW3H+MZVfvuXmhbvJzIx/S0Um32bXKXXWleU4T3cdLqx
         VawhWItW4sSrbWLSGj+aDJqfnoziPr1FvloIXM1PEnxJ2LpCEnyBbQgPhinOTVF4LCUk
         JyZA==
X-Forwarded-Encrypted: i=1; AFNElJ8cWMLJ5yw1FQrRAYhMPr2NnQvpX/tggBK14dyznK7sokV8R7R5D9aq6kMr6OoAGkyhbRYbryWLjn8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6TwPx84w8QczG/dStQB7wp6lITyifXl7CsrUm2VC6/s/o3BCg
	GhWJIEYZfU09m1tYVLvMm+n8QJ+mT5xkPtMKd5LFkKS8DVf7pXKIYZ3H/aW8eFcvgaWk7fKtoT5
	H8mJw1DXGqc/GBSC2oq1hyqKpCgetVOHdqRsBEVL5
X-Gm-Gg: Acq92OHUlgGGLDWi/Ybt0PAcAV/NQE/8p5OTjt9EmokdU3bcPmWG49aufylwmZt6C8E
	GOz29gYSg7ZRQ1ENGWwMnJGtc+51ddj+DpXUFe/iREaXIbP40eHm9JMEm7aLXrU4UTFG0HpYpQW
	aR+fyD7CgWdoOR2K7OXY52GqVSaJSahZ7NsCzSNuNhItpibOfudTz0TXtJ3UUC4jDVa+pUXgDPl
	Xy2Su9fX5TMc/PEa1IfsWsz7Dof9bJhq+Bok1Q8ZDon14h3L5oKhTMAF4Q6naU8nCJmwfveOHLZ
	/swS0LEmi68V51cocJZCYY3JKoOG3aAaOMPXv+lQS/xJNNUO9wg=
X-Received: by 2002:a53:e306:0:b0:660:3426:3ff1 with SMTP id
 956f58d0204a3-66106f583b0mr2916376d50.34.1780675573532; Fri, 05 Jun 2026
 09:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech> <20260603-kcov-dataflow-next-20260603-v2-1-fee0939de2c4@est.tech>
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-1-fee0939de2c4@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 5 Jun 2026 18:05:34 +0200
X-Gm-Features: AVVi8CdtIWJrRUEJnQQQB7BanVCY0Gd9ha8SThOa2A947QiJHGGMsBgLigo__P8
Message-ID: <CAG_fn=UMJJz+3zipowaC4uTvcbC0gvXbBRaF0UUJ_1AW+oWNGA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/6] kcov: add per-task dataflow tracking for
 function arguments/return values
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yunseong Kim <ysk@kzalloc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> - Per-task buffer: task->kcov_df_area with atomic xadd reservation

I don't understand this line...

> - Recursion-safe: notrace __no_sanitize_coverage noinline
> - ERR_PTR aware: skips struct expansion for error pointers

... and this.

>
> The callbacks (__sanitizer_cov_trace_args/ret) are inserted by the
> compiler when -fsanitize-coverage=3Ddataflow-args,dataflow-ret is used.
> The Kconfig options depend on cc-option to verify compiler support.
>
> Buffer format (TLV records, all u64):
>   area[0]: atomic word count
>   [pos+0]: type_and_seq (0xE=3Dentry, 0xF=3Dreturn in upper 4 bits)
>   [pos+1]: PC
>   [pos+2]: meta (arg_idx | arg_size | ptr)
>   [pos+3..N]: field values read via copy_from_kernel_nofault()
>
> This is completely independent from legacy /sys/kernel/debug/kcov.
> Existing users (syzkaller, oss-fuzz) are unaffected.

Does oss-fuzz even use kcov?

>
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  include/linux/sched.h |   8 ++
>  kernel/kcov.c         | 291 ++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  lib/Kconfig.debug     |  22 ++++
>  3 files changed, 321 insertions(+)
>
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index c4433c185ad8..03be4b495f70 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1533,6 +1533,14 @@ struct task_struct {
>         /* KCOV sequence number: */
>         int                             kcov_sequence;
>
> +       /* KCOV dataflow per-task sequence counter for TLV records: */
> +       u32                             kcov_dataflow_seq;
> +
> +       /* KCOV dataflow: separate buffer for trace-args/trace-ret */
> +       unsigned int                    kcov_df_size;
> +       void                            *kcov_df_area;
> +       bool                            kcov_df_enabled;
> +
>         /* Collect coverage from softirq context: */
>         unsigned int                    kcov_softirq;
>  #endif
> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index 1df373fb562b..d3c9c0efe961 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -353,6 +353,288 @@ void notrace __sanitizer_cov_trace_switch(kcov_u64 =
val, void *arg)
>  EXPORT_SYMBOL(__sanitizer_cov_trace_switch);
>  #endif /* ifdef CONFIG_KCOV_ENABLE_COMPARISONS */
>
> +#if defined(CONFIG_KCOV_DATAFLOW_ARGS) || defined(CONFIG_KCOV_DATAFLOW_R=
ET)
> +/*
> + * KCOV Dataflow: /sys/kernel/debug/kcov_dataflow
> + *
> + * Completely separate from legacy /sys/kernel/debug/kcov.

Since this code is completely separate, could it be put into a separate fil=
e?
I think kcov.c is too big already.

> + * Own buffer, own ioctl, own mmap. No printk =E2=80=94 buffer only.

Can you please not use these long dashes in C code?

> +/*
> + * Core write function =E2=80=94 no printk, no locks, just atomic buffer=
 write.

I think it's okay to omit what this function is not doing.


> +
> +       /* Atomic reservation */
> +       pos =3D 1 + xadd((unsigned long *)&area[0], record_len);
> +       if (unlikely(pos + record_len > max_pos)) {
> +               xadd((unsigned long *)&area[0], -(long)record_len);
> +               return;
> +       }

Have you tried compiling this code on ARM64?
I am pretty sure they don't have xadd(), so it won't work.
But why do we need an atomic increment here at all? write_comp_data()
performs the same job, and does not need it.
Or am I missing something?
