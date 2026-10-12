Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8192D4AB1A6
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 16:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821927; cv=pass; b=DlJUVd8tX4fStOkWbBYEMW+pK2JDCWlHcOZh0ZkSU2/rpVBW61SsgcP47o7Sb69pRAF/rUS6lYRNCErOFHZlhLJ9WbBbAjvI+CodVoxKodtdOoyiNXN4/fgnGMLIjTn6PHApEBqkM4TMdHKMZhScJc12f+WU118gYX5B6rKgyiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821927; c=relaxed/simple;
	bh=qvVpEPzOzLifjD/7DmAg+LNyF2ciqW2crgsJsv4fMNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r1sYKlQP9IylL9SbDkkVPs+3ipkUFVkUAn/DhgjbX8Ydykw9U5s+xTTsBr3+p9gzs0gmJBMBuy3fGHRR4BclTU46bKRX3HSYbA5stKJ8kL4YDcarzhmpAcrxRuropwgRBh+UfdQNQqZIck1SS+dl+yZPtHG8AjhrqpqklVBdpNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsPS4BD7; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsPS4BD7"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c247f6687dcso317617966b.2
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 09:18:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791821924; cv=none;
        d=google.com; s=arc-20260327;
        b=BIdNjxmShSBIqNXMvLT27elm0K+XjW4gQXBMZJeZuNvCS3CCJFM+O/JmMTn34UYuef
         0JIcGy97mc5mwB+qxk1/FQhR6OWCfzoiC4rqLCeQj3WdDSWMcNXNYxPPHvz+A5Hv2H7N
         EXZbue+wSCutMrIVoDL03AmC0jP0tU3crejZScZ2aKqchyOGPynID6vAfAbA/2PrT1BF
         zOumPVLwiTk0rOxUVm7OQUATIKrfW+VlieC2VfkUMypVWUZNGRBf1/3A1Qy7xbSAJxtA
         fVt6605yJsZ/LdUPQ6ikw/On69mw9NoQgDechlLYQknFpAXPB9P196bYUiDo+bF/sUu7
         d1GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CUeAR5YurRmrLyPWT1WYCY1/iIz0jhnPKKa1Syh0wXc=;
        fh=q078Loxxhx0p+F0+X63Xj+c57PzbGMZkFLrGToo6hfk=;
        b=qCuu1J1qD70Q88gq1MJLTF4yoggQx3qEXDVgq5r9jXyggVEuI/bvPQsGOnXcYhCe9u
         4pkzpRPBI2CjNYSX8mlNZOELS59lgDIHeRbJcJ/TfZlizZznnNQ9+49lwhf6W1o4u9Y+
         LBPlp6m9YqvD4fA1sobReh70rGb5tBF4jnBuqM+TYqONzukh6+buwFJ8Xj7e3i2IyAyf
         Vl+GkCIlpUl5tyyVQ3aVdbFkxDUGneuFfWkC92gcvdVW7pi3cT1j5ZRtxuLsUC6wOrVu
         tmZCW03jlxoBLsFgPFgTnyf7+J9j4n0ZpAiOlJQNJZ+qMH/FcQC3/XwCqtKpP2R5/oWN
         i0iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791821924; x=1792426724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CUeAR5YurRmrLyPWT1WYCY1/iIz0jhnPKKa1Syh0wXc=;
        b=PsPS4BD7m2jkgUCxRdMk0FNY2z5ZY59lAfo1Ryo47UKC1ju9hpMh4jWUN90HEJprgS
         Z+PRQR0N4FHO8/rzWt0K9670/ixmjyEGtvNvyXmSFP75wzZeEH1zaOf+tR32+jDFpJqe
         ZuISWP8RJ2XqbFu/QDyph1iE0p49cMI7cNH2h8l9KfHhfAazx+pHtYvkqaU8J2jyCVaz
         MPWT3vHhzxXm4aYP1+AwRiQnTVbGa2NXDJGCdNej3Mk7bHUkN/cxVzAnTNkZFN9McSQC
         CXN4VzRUuv/vQwGi3HCnNaElw+i0BqDIwIZWS+TlnGoffcIcf4qf/5Yd6Ae5MJNOZL+u
         qX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791821924; x=1792426724;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUeAR5YurRmrLyPWT1WYCY1/iIz0jhnPKKa1Syh0wXc=;
        b=Xk639DjaoOxSwnZXbxMtlQ33BItsEtly8ZrO5fT1paOKB9rJHD0iQY87u/it2Z/k3e
         7YR+yuQ5/MPf9oagcl54tePMFhL/qENbnyTVpd5PqsBBAs6SqtQFQhpsQlx7KHjr9q/N
         LXGLFHCwQL1QeieNFEUej5UOUJa9z3EE0VpqXlbxXpffWmFwWQp3HHgs9LknKTo08djY
         dxkfKoujT4h3H8Ob1D0l7bmQNvsg75GGlfJiY3nJ0dBRAh7tYRcLuDULh3Tz6sRpcpB3
         LwXPbatGunCvhyjJmLYoDkKTfKGZx0JhvoX7A8Bv15D+LnBzbYeugiKgRv/lg9nkyWJl
         ohYw==
X-Forwarded-Encrypted: i=1; AKwUvBwwh0qCIGYu478RkV5H0XJa3B3T0NRpQCTlhH+8G7VoQ1iIPvZLmSAKlxU6wY7p3HvAQ0PERQGhQyc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3v+l3tZioMYPuXVXbuc2blwdy3+xinhbOlQ7JplptWLFJE1mU
	59Klrh8s9L/Dis4ew9vSfHyGNJInlLWGSDjxvdiMOKpR1trot0yQUUTfVP+U8VaoVK4dUbMjrqd
	9xk4joz2Y5I2jANTn04H8sLPuK3zUoWA=
X-Gm-Gg: AYBFou1Qe1d+4XMp0kaeWIR0cxS+u7NSzU2HCXlC1yT64GjUv1lTAuTRMiNuqVCMXDe
	Lnr1R5Q8NGX3DeL/ov5phgmv9Q96FA9rlZB07b1CaKJ8ccE6NkhrPuqffrJc2qjr9RVK4W+pIGf
	uaBQ9w1TUghhd2SVDA+nvun6mU7r/lorVowhtvuom6hDRDUWZvvQkzGTNsdJG7ANjYB/WvV5ozB
	f0v7IC+tM0nzrDNO8U+57gd0Zif6YEWFWRpWUb8UYrr3T1vE/dDTjN+QBF/iAXFONRQe1HJmzUC
	OrUbGR2FX/I6CpKm/DAvue/GbID5Wz025u4mSi0oMzX3Dt2otecBFf9BLZP2IIEEp1mwOY39L5I
	yiIgyRTQn1Do2dhNdX4dfF5OlfoC+EVqqYoHrXpivPw==
X-Received: by 2002:a17:906:dc8e:b0:c2e:4488:b8a3 with SMTP id
 a640c23a62f3a-c31aa0850bamr1000531266b.33.1791821923522; Mon, 12 Oct 2026
 09:18:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com> <20261011-alpha-perf-regs-v3-v1-1-eaa625a39712@gmail.com>
In-Reply-To: <20261011-alpha-perf-regs-v3-v1-1-eaa625a39712@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 12 Oct 2026 18:18:32 +0200
X-Gm-Features: AclHuK-nN_rEqA6xqbO4CkyZX0-XsUGhkKaJX3rrOmarOEgQAl1ktERcvGizgjc
Message-ID: <CA+=Fv5RoxY0Bav9Q-E4FpEofokfB26ePOwPPWUmEDp6_sO5S3Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] alpha: fix stale user_stack_pointer()
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sun, Oct 11, 2026 at 10:16=E2=80=AFPM Matt Turner <mattst88@gmail.com> w=
rote:
>
> PALcode keeps the user stack pointer in the PCB, not the trap frame, so
> pt_regs->usp is only valid where entry code stores it: entSys,
> do_entArith() and do_entIF(). Interrupts, page faults and unaligned
> traps leave it stale, and ptrace and /proc/<pid>/syscall read it
> through user_stack_pointer().
>
> A user-mode pt_regs is at the top of its task's stack, so find the
> thread_info from it and use rdusp() for current or pcb.usp otherwise,
> as KSTK_ESP() and the regset code already do.
>
> Fixes: 8a2857bc2b30 ("alpha: enable regset-based ptrace and core dumps")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/ptrace.h |  7 +------
>  arch/alpha/kernel/ptrace.c      | 12 ++++++++++++
>  2 files changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptr=
ace.h
> index 430e8dc27ff7..45d1229344b6 100644
> --- a/arch/alpha/include/asm/ptrace.h
> +++ b/arch/alpha/include/asm/ptrace.h
> @@ -26,12 +26,7 @@ static inline unsigned long regs_return_value(struct p=
t_regs *regs)
>         return regs->r0;
>  }
>
> -/* Helpers for working with the user stack pointer */
> -static inline unsigned long user_stack_pointer(struct pt_regs *regs)
> -{
> -       /* Valid for user-mode regs */
> -       return regs->usp;
> -}
> +unsigned long user_stack_pointer(struct pt_regs *regs);
>
>  static __always_inline bool regs_irqs_disabled(struct pt_regs *regs)
>  {
> diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
> index e1d8c2f69688..dba7e9905cfa 100644
> --- a/arch/alpha/kernel/ptrace.c
> +++ b/arch/alpha/kernel/ptrace.c
> @@ -440,6 +440,18 @@ ptrace_cancel_bpt(struct task_struct * child)
>         return (nsaved !=3D 0);
>  }
>
> +/*
> + * PALcode keeps the user stack pointer in the PCB, not the trap frame.
> + * A user-mode pt_regs sits at the top of its task's stack, so the
> + * thread_info is at the base.
> + */
> +unsigned long user_stack_pointer(struct pt_regs *regs)
> +{
> +       struct thread_info *ti =3D (void *)((unsigned long)regs & -THREAD=
_SIZE);
> +
> +       return ti =3D=3D current_thread_info() ? rdusp() : ti->pcb.usp;
> +}
> +
>  void user_enable_single_step(struct task_struct *child)
>  {
>         /* Mark single stepping.  */
>
> --
> 2.55.0
>

Nice work!

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
