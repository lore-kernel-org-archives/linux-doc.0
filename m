Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2713D6CB0
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 15:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069859; cv=none; b=NtzLV5wWDeDOy4BiSLnbcV32IwwQ7waFhgElxGATTn8IDqA6t/yywPQeesH7i0/HRkaLPCct6F0W2PDT7JQistMDXytgrv7doAgvk+MwT/hzsZFZ4LLZy+/dYTqNUWXLdsxMoO3C3c3L4gYRgOTe5+IUgstwdugdVTZYFMkTynM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069859; c=relaxed/simple;
	bh=iqr08CzJpJ9MB+Clz+/PkQJLo47o9lxWmUwKvTHmolY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FtsqA6HfPo4KNfMz0+e+/PBnR7ixvkcB8Bvqa6IZVY1+MsrB0Xt/dLCBirry0RUGDHEtPAm17sKkn7wnoRTGEu6AXH0kMpckuPn0cks5/XeSg6x+gm3rtuomMowJ1iS+lzs0P+RDGO9xDoQOON3IVz5UGK+GCaxKV/SvW7Fk8Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sYaaUs2a; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sYaaUs2a"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3598007eb74so43857783a91.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 08:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773069857; x=1773674657; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2Nxr3/dxihY6x8oi77PmypbhOW14c4yfKqAOy8dFzc=;
        b=sYaaUs2aCiUYHMUiyhimCXLOhVVntk9GmdxbNgy4pRBRMxnpbS0CUt59WhEzQOGQLh
         VBql968nPViE46hlFEVD7Ib/qIDj/B+nLIqV/SkUX/q+YYtaUuZzWr4rlTe6U+pUozQP
         YocF9PRWdoI8tI6U38A4Nfex4FiscHC4clFqQd78vSKefF+aaN/U62ZHXQ4G6ygau2IR
         lQM3Tr7I5OKLCUGEaiVo0AYKLDwXnbNbKfdImtzLS5Jjcfc6qVwcXpvu1qIL/vgSHqVO
         YRI/QMyCQrRzUgscwml+9aEr/r2qTap1w4aYxay64z6mRrg/JfK79vY1ygVegUGK9HNh
         QopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069857; x=1773674657;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m2Nxr3/dxihY6x8oi77PmypbhOW14c4yfKqAOy8dFzc=;
        b=p/U0QH4RsZ6NV3lRl6Z6Oq9sMg10O2xaXVyJsA4Zsz5rmfeafJkapUiNObtlxqNPwj
         NUrPVSXCLYXE8Tfgfo7fKtjeI/0GLdlodeWLSunVJoJeF80Ab2PSa8N034krU+zWR/I5
         6wVAYl76y2aBJ8jEZv2rc0PVJsFGYMYjUdcWy+egvaE/8py5fSVotkPzIrrIwgFkR0pT
         RLexCFHtnoW/leehgsP51wCij6T4m1q7Jolys5xQlPceZgbeK+jK/yLBdg/jCbUFmm4a
         Lofl+/4/kJdNe+dWpKD4ROqhDcN9gYYNXWMbmqVQk01C86j6/mdlgEGeaEzA1SMevsAH
         dVhg==
X-Forwarded-Encrypted: i=1; AJvYcCXZeE3fCAt+dFMsV3fqITDQCK90LCPQDKg5uQC6n14VwLCOI/06fb+Fifaj4KlsgpIOrOKtCnDSlu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxixhWW/stajvBBaH+vIEW/Rp3gF3pKjmQCv8HsnFen6E4T+qs0
	X/sFi5VgrTvo+TJ4868c+YEpnYGc/PrZRWerMoMK94c8Y2gnqtZAPgbjrUsAbX/gc7T3wdW0QNp
	dOe5yMw==
X-Received: from plsl9.prod.google.com ([2002:a17:903:2449:b0:2ae:3d76:eb1b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1968:b0:2ae:8062:8362
 with SMTP id d9443c01a7336-2ae82266d9fmr111476405ad.0.1773069857431; Mon, 09
 Mar 2026 08:24:17 -0700 (PDT)
Date: Mon, 9 Mar 2026 08:24:16 -0700
In-Reply-To: <9C6FC4E7-DF8A-4583-93A8-3B82806D11CD@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251026201911.505204-1-xin@zytor.com> <20251026201911.505204-7-xin@zytor.com>
 <20260130134644.GUaXy2RNbwEaRSgLUN@fat_crate.local> <9C6FC4E7-DF8A-4583-93A8-3B82806D11CD@zytor.com>
Message-ID: <aa7mILKnhX9N4228@google.com>
Subject: Re: [PATCH v9 06/22] x86/cea: Export __this_cpu_ist_top_va() to KVM
From: Sean Christopherson <seanjc@google.com>
To: Xin Li <xin@zytor.com>
Cc: Borislav Petkov <bp@alien8.de>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com, 
	x86@kernel.org, hpa@zytor.com, luto@kernel.org, peterz@infradead.org, 
	andrew.cooper3@citrix.com, chao.gao@intel.com, hch@infradead.org, 
	sohil.mehta@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 06, 2026, Xin Li wrote:
> > On Jan 30, 2026, at 5:46=E2=80=AFAM, Borislav Petkov <bp@alien8.de> wro=
te:
> diff --git a/arch/x86/include/asm/fred.h b/arch/x86/include/asm/fred.h
> index 2bb65677c079..7eea65bfc838 100644
> --- a/arch/x86/include/asm/fred.h
> +++ b/arch/x86/include/asm/fred.h
> @@ -35,6 +35,13 @@
> =20
>  #ifndef __ASSEMBLER__
> =20
> +enum fred_stack_level {
> +	FRED_STACK_LEVEL_0,
> +	FRED_STACK_LEVEL_1,
> +	FRED_STACK_LEVEL_2,
> +	FRED_STACK_LEVEL_3

Why bother with a layer of indirection and more enums?  Just pivot on the M=
SR
index.

>  #ifdef CONFIG_X86_FRED
>  #include <linux/kernel.h>
>  #include <linux/sched/task_stack.h>
> @@ -105,6 +112,8 @@ static __always_inline void fred_update_rsp0(void)
>  		__this_cpu_write(fred_rsp0, rsp0);
>  	}
>  }
> +
> +unsigned long this_cpu_fred_rsp(enum fred_stack_level lvl);
>  #else /* CONFIG_X86_FRED */
>  static __always_inline unsigned long fred_event_data(struct pt_regs *reg=
s) { return 0; }
>  static inline void cpu_init_fred_exceptions(void) { }
> @@ -113,6 +122,7 @@ static inline void fred_complete_exception_setup(void=
) { }
>  static inline void fred_entry_from_kvm(unsigned int type, unsigned int v=
ector) { }
>  static inline void fred_sync_rsp0(unsigned long rsp0) { }
>  static inline void fred_update_rsp0(void) { }
> +static unsigned long this_cpu_fred_rsp(enum fred_stack_level lvl) { retu=
rn 0; }
>  #endif /* CONFIG_X86_FRED */
>  #endif /* !__ASSEMBLER__ */
> =20
> diff --git a/arch/x86/kernel/fred.c b/arch/x86/kernel/fred.c
> index 433c4a6f1773..363c53701012 100644
> --- a/arch/x86/kernel/fred.c
> +++ b/arch/x86/kernel/fred.c
> @@ -72,6 +72,23 @@ void cpu_init_fred_exceptions(void)
>  	setup_clear_cpu_cap(X86_FEATURE_SYSCALL32);
>  }
> =20
> +unsigned long this_cpu_fred_rsp(enum fred_stack_level lvl)
> +{
> +	switch (lvl) {
> +	case FRED_STACK_LEVEL_0:
> +		return __this_cpu_read(fred_rsp0);
> +	case FRED_STACK_LEVEL_1:
> +		return __this_cpu_ist_top_va(ESTACK_DB);
> +	case FRED_STACK_LEVEL_2:
> +		return __this_cpu_ist_top_va(ESTACK_NMI);
> +	case FRED_STACK_LEVEL_3:
> +		return __this_cpu_ist_top_va(ESTACK_DF);
> +	default:
> +		BUG();
> +	}
> +}
> +EXPORT_SYMBOL_FOR_MODULES(this_cpu_fred_rsp, "kvm-intel");

Meh, just do EXPORT_SYMBOL_FOR_KVM so that there's no export when KVM_X86=
=3Dy|n.
And it's possible AMD may need to grab the MSRs too.

> +
>  /* Must be called after setup_cpu_entry_areas() */
>  void cpu_init_fred_rsps(void)
>  {
> @@ -87,7 +104,7 @@ void cpu_init_fred_rsps(void)
>  	       FRED_STKLVL(X86_TRAP_DF,  FRED_DF_STACK_LEVEL));
> =20
>  	/* The FRED equivalents to IST stacks... */
> -	wrmsrq(MSR_IA32_FRED_RSP1, __this_cpu_ist_top_va(ESTACK_DB));
> -	wrmsrq(MSR_IA32_FRED_RSP2, __this_cpu_ist_top_va(ESTACK_NMI));
> -	wrmsrq(MSR_IA32_FRED_RSP3, __this_cpu_ist_top_va(ESTACK_DF));
> +	wrmsrq(MSR_IA32_FRED_RSP1, this_cpu_fred_rsp(FRED_STACK_LEVEL_1));
> +	wrmsrq(MSR_IA32_FRED_RSP2, this_cpu_fred_rsp(FRED_STACK_LEVEL_2));
> +	wrmsrq(MSR_IA32_FRED_RSP3, this_cpu_fred_rsp(FRED_STACK_LEVEL_3));
>  }
