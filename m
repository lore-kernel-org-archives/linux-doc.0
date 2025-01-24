Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216861B424B
	for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 03:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737689210; cv=none; b=UXLz7apw6uvScjvAlo4t3FQkXhYmfckWN/06L217ZWme7GEXwk9ml0z1vr0TMz2eoFHFGYQ9UPAKJrj5nyO8Wk45DEi+7X7uaxjnzaPwlGK3E4crbLdxkrQDfzQRPgnvSluFeaFP4Lw9agB2wCYi1+ZB6D5NGRDlz5mwUR/IRCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737689210; c=relaxed/simple;
	bh=tU2QzktmPdlYAOQVknfO8sr/6ZNOUzyHr3Z6kwiTXOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QqLICMDL67pvvTa5ee6oHjlEbv25K6rr/dihhPcME0eUoyIqrqmtJ4z/OVh2o7olT9kyPUhuHWOgpKX60S8DJ1yJNjWBl8ha045au8w/R0r7qG9FUurnRay0BM8tG+bboJ0YaDlOoXSiPAWLItl+uB8kTHHYcmSJNhct4RU5b24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Th/U/Mc7; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Th/U/Mc7"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5f4d935084aso659746eaf.2
        for <linux-doc@vger.kernel.org>; Thu, 23 Jan 2025 19:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737689207; x=1738294007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wYF9SYVPXBWNDoppVRqkp4GObHclaiBorKPLUibZhw=;
        b=Th/U/Mc71LQSRM0LOKGShmVw79HpErnHpIEXwwhSu+sC50mL16dTPHLAt4xUl5u47A
         V1EtX4GlyVJGlVRlcQNlfgsYtsAaIhUJiL1/tFgYG6uGkS3+UoHgj+i/JJDLH4khErIJ
         hl6vLLAEwwOI6HMUOj3WU5jNySuiBKEVcFkouDAt47Pw0uZ2lHO2SA3LK94S12XftsEU
         HdfqxySVzPOK+DqWL+smg0kgXOjgOq0X7bJmiF3bhUR8R5VOuO8mCnSw/KkwBxkcrjwc
         cqxsMCORI5x/AAylS3/3mf87N4koksvUNaxnPTc+7QkaOzFtPUIgUcd/UPAO6s6v97w/
         nBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737689207; x=1738294007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wYF9SYVPXBWNDoppVRqkp4GObHclaiBorKPLUibZhw=;
        b=wqMSVwP6jZRJ20xsbfc58f2TVNtHAbojzYWPtGlltd7Zr2FVFQtwxlhkgekJm6bj1F
         GILE/kw7J+pjxEEjGhcyMEnhd+zt/QjONNKNsW7vWXWoyFr/s9kYXp8j/AXhiHP+BhIh
         SAIJM0yTSl/hCyUqd4GmxIk/wrrBdHlzeYBB23pXSGZsTHo8noKFywsp1V254pZlrmwh
         JMqSjZv8irJxeqw+p6BwEvrA+5z5YUuAYMUFf+lpFT9aILl+pf3YjZ+WpEkcmf7dgUfi
         KL5slNUMXFWktCFGwvZRxG6xPZCoIxOoQS1P3TG6ia/LfWG7sD2THBBawnpsEoJk8u0J
         vkEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWufcj6W7YOACoD+jJDnYKtC5ENDuDIzlVLm4+MeYAuOZO60aLFMHmkGutR4cI3zvNbF3ssqS/+kIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YybrTYHEY58k9244UbqEQTGuYLr0mt8yT2FmIhNfoHeq9Lst/iw
	boO611qPlh0wt4n7ajbL+87DK1WuYqYAif3SeYqBhE03wtkT0H21/y5DkpoucFBmuQFLbvbltSb
	CPVhVFR2mk5guFCpllK1i+8lbMDGrXg4Yj9NaWw==
X-Gm-Gg: ASbGncuZ9uxYFpQnOmwJer0J91LQhWO7RNix0hquE1ZYdu9dW0vYuixjYFFEMEf6Xct
	DKM7ou1+Fxkyyl1x/j4rSUbczMNrGYkTO9FfZdLQPi3Jj9p0Zzz4kHsZazU5tuGgd
X-Google-Smtp-Source: AGHT+IFGnKLva7FD+LaCZWDZWwF1THCBFHRVpsQutJS5kXSNOriJYKOl1H7ykN+A+qzX7nta9YxDL/rzI0cKEjaNzAA=
X-Received: by 2002:a05:6870:2f0d:b0:29e:5522:8eea with SMTP id
 586e51a60fabf-2b1c0b6cdc0mr17604012fac.38.1737689207038; Thu, 23 Jan 2025
 19:26:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115024024.84365-1-cuiyunhui@bytedance.com>
 <20250115024024.84365-3-cuiyunhui@bytedance.com> <20250121-4990d96a861a4ddd304abc33@orel>
In-Reply-To: <20250121-4990d96a861a4ddd304abc33@orel>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 24 Jan 2025 11:26:36 +0800
X-Gm-Features: AWEUYZmWZdjm8pzj4zzIf6rTTBzAFecQ8H3gVQ0i5poz74_c15zJ4cOjObQZY58
Message-ID: <CAEEQ3wnZK2xkQ0+pnNCEvXJ6TUVnCHrkL_VNfhK=9Duy0yKNoA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5 2/3] RISC-V: hwprobe: Expose Zicbom
 extension and its block size
To: Andrew Jones <ajones@ventanamicro.com>
Cc: alexghiti@rivosinc.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, samuel.holland@sifive.com, 
	shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi drew,

On Tue, Jan 21, 2025 at 11:29=E2=80=AFPM Andrew Jones <ajones@ventanamicro.=
com> wrote:
>
> On Wed, Jan 15, 2025 at 10:40:23AM +0800, Yunhui Cui wrote:
> > Expose Zicbom through hwprobe and also provide a key to extract its
> > respective block size.
> >
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > ---
> >  Documentation/arch/riscv/hwprobe.rst  | 6 ++++++
> >  arch/riscv/include/asm/hwprobe.h      | 2 +-
> >  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
> >  arch/riscv/kernel/sys_hwprobe.c       | 6 ++++++
> >  4 files changed, 15 insertions(+), 1 deletion(-)
> >
>
> As the bot points out, we need to add the following to this patch.
OK, I'll update a version and change hwprobe_ext0_has's second param to u64=
.

>
> Thanks,
> drew
>
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index cb93adfffc48..6b5b24b399c3 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -160,7 +160,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pa=
ir,
>         pair->value &=3D ~missing;
>  }
>
> -static bool hwprobe_ext0_has(const struct cpumask *cpus, unsigned long e=
xt)
> +static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
>  {
>         struct riscv_hwprobe pair;
>

Thanks,
Yunhui
