Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gmtdZlii"
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA47FD
	for <linux-doc@vger.kernel.org>; Mon, 11 Dec 2023 11:58:17 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d32c599e83so6519175ad.0
        for <linux-doc@vger.kernel.org>; Mon, 11 Dec 2023 11:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702324697; x=1702929497; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=udnVV+1LLo4lC1xfTDslzGTNJxjoPUuCwayPqZBU8LI=;
        b=gmtdZliiv6tBM5oa15eyJQ9pOGNwSa71YdCzqGhgR7DA7X2gcedECRNwBnTz1CXSwS
         nxh87Vykoj4BIVjkwi2efSY7jpQZE+ujINEmOslP3SUAaVL5sUylAiNiMpKdBrwgQpX+
         YHAVESyHdhPLOe8CFkIIozVeCSxlbTSqxNoVBllNSq0SHHrwhTeCXHsPLxUQw+dk3Ant
         kcNKSZP6d/UkOztEvd+yq6hD6LFM/KsvLOP48ieISXHVUv61tD+pdJjaugVzjuvrdBlT
         /9ahgIPlrRnpyB7beIyVkq+wNyzOtR+FU2euj5xaLNmVHplTV3KjmwdhWVbxMsJ8F+f3
         DTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702324697; x=1702929497;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=udnVV+1LLo4lC1xfTDslzGTNJxjoPUuCwayPqZBU8LI=;
        b=pYWMJncrV7ZxnEcySrjLULlTnJdKHCxk3TDd8gFNcQn04ZwNEdTm5UHujuTCxJOPyB
         42EIkrjrZaG+7+6gqBVAnuDyLLrjIRMOrZ7wScqAiu3KM+YZt+NqPOfohE5u1Im0xPSd
         2ZvWLzbwcAiHGv0AOlCDT4xgR8cRcemPdRi8k7GgQZM3Ta4m9J60OmpQldAy0ciJ/n4l
         uba2tC0/8KCtHjMHGpfwxGNypBJDkA5ljJtThj0lXTgJ+3y2M7tvKW/TLbKbcWHG8t57
         Iszl78YKyn+O/uAF8IsDUzc9337zM5siSD6Tn8+sCDwalq6P4MJt/RIeqyoyCmcVUpW2
         Xzew==
X-Gm-Message-State: AOJu0YzjAMgJVwfHHzYL2ipC1eWx2Mj0QD20r05eUvjzDwJDmFzm78ge
	d+lA89S5XtIc3Oeo8N488Tuo9w==
X-Google-Smtp-Source: AGHT+IF8qEC6cJmCNThPUuX1QiJVGVVFfPZYciPtFoh755w8NOMTAIh9h3+bcKDrrfs1KcEClSYy9Q==
X-Received: by 2002:a17:902:ced1:b0:1d0:b1f0:1006 with SMTP id d17-20020a170902ced100b001d0b1f01006mr4957616plg.101.1702324696738;
        Mon, 11 Dec 2023 11:58:16 -0800 (PST)
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id f8-20020a170902ce8800b001cfc46baa40sm7051945plg.158.2023.12.11.11.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 11:58:16 -0800 (PST)
Date: Mon, 11 Dec 2023 11:58:13 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: Include riscv_set_icache_flush_ctx prctl
Message-ID: <ZXdp1WP+CNutw80I@ghost>
References: <20231130-fencei-v2-0-2cb623ab1b1f@rivosinc.com>
 <20231130-fencei-v2-1-2cb623ab1b1f@rivosinc.com>
 <42e0c9d4-318e-4c84-bdfb-fd364bea02d5@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42e0c9d4-318e-4c84-bdfb-fd364bea02d5@rivosinc.com>

On Mon, Dec 11, 2023 at 10:12:42AM +0100, Clément Léger wrote:
> 
> 
> On 01/12/2023 08:21, Charlie Jenkins wrote:
> > Support new prctl with key PR_RISCV_SET_ICACHE_FLUSH_CTX to enable
> > optimization of cross modifying code. This prctl enables userspace code
> > to use icache flushing instructions such as fence.i with the guarantee
> > that the icache will continue to be clean after thread migration.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/mmu.h       |  2 ++
> >  arch/riscv/include/asm/processor.h |  6 ++++++
> >  arch/riscv/mm/cacheflush.c         | 37 +++++++++++++++++++++++++++++++++++++
> >  arch/riscv/mm/context.c            |  8 +++++---
> >  include/uapi/linux/prctl.h         |  3 +++
> >  kernel/sys.c                       |  6 ++++++
> >  6 files changed, 59 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/mmu.h b/arch/riscv/include/asm/mmu.h
> > index 355504b37f8e..60be458e94da 100644
> > --- a/arch/riscv/include/asm/mmu.h
> > +++ b/arch/riscv/include/asm/mmu.h
> > @@ -19,6 +19,8 @@ typedef struct {
> >  #ifdef CONFIG_SMP
> >  	/* A local icache flush is needed before user execution can resume. */
> >  	cpumask_t icache_stale_mask;
> > +	/* Force local icache flush on all migrations. */
> > +	bool force_icache_flush;
> >  #endif
> >  #ifdef CONFIG_BINFMT_ELF_FDPIC
> >  	unsigned long exec_fdpic_loadmap;
> > diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> > index f19f861cda54..7eda6c75e0f2 100644
> > --- a/arch/riscv/include/asm/processor.h
> > +++ b/arch/riscv/include/asm/processor.h
> > @@ -84,6 +84,9 @@ struct thread_struct {
> >  	unsigned long vstate_ctrl;
> >  	struct __riscv_v_ext_state vstate;
> >  	unsigned long align_ctl;
> > +#ifdef CONFIG_SMP
> > +	bool force_icache_flush;
> > +#endif
> >  };
> >  
> >  /* Whitelist the fstate from the task_struct for hardened usercopy */
> > @@ -145,6 +148,9 @@ extern int set_unalign_ctl(struct task_struct *tsk, unsigned int val);
> >  #define GET_UNALIGN_CTL(tsk, addr)	get_unalign_ctl((tsk), (addr))
> >  #define SET_UNALIGN_CTL(tsk, val)	set_unalign_ctl((tsk), (val))
> >  
> > +#define RISCV_SET_ICACHE_FLUSH_CTX(arg1, arg2)	riscv_set_icache_flush_ctx(arg1, arg2)
> > +extern int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long per_thread);
> > +
> >  #endif /* __ASSEMBLY__ */
> >  
> >  #endif /* _ASM_RISCV_PROCESSOR_H */
> > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > index 55a34f2020a8..3b2bf8256a10 100644
> > --- a/arch/riscv/mm/cacheflush.c
> > +++ b/arch/riscv/mm/cacheflush.c
> > @@ -5,6 +5,7 @@
> >  
> >  #include <linux/acpi.h>
> >  #include <linux/of.h>
> > +#include <linux/prctl.h>
> >  #include <asm/acpi.h>
> >  #include <asm/cacheflush.h>
> >  
> > @@ -152,3 +153,39 @@ void __init riscv_init_cbo_blocksizes(void)
> >  	if (cboz_block_size)
> >  		riscv_cboz_block_size = cboz_block_size;
> >  }
> > +
> > +/**
> > + * riscv_set_icache_flush_ctx() - Enable userspace to emit icache flushing instructions.
> > + * @ctx: Sets the type of context
> > + *  - PR_RISCV_CTX_SW_FENCEI: Allow fence.i in userspace. Another fence.i will
> > + *			      emitted on thread/process migration.
> > + * @per_thread: When set to 0, will use the default behavior of setting the
> > + *  icache flush context per process. When set to 1, will use a per thread
> > + *  context.
> > + *
> > + * When in per-process context, there may be multiple threads using the same mm.
> > + * Therefore, the icache can never be assumed clean when. Multiple threads in
> > + * the process may modify instructions in the mm concurrently.
> > + *
> > + * In per-thread context, it can be assumed that all modifications to
> > + * instructions in memory will be performed by this thread. When the thread is
> > + * migrated the icache will be flushed.
> > + *
> > + */
> > +int riscv_set_icache_flush_ctx(unsigned long ctx, unsigned long per_thread)
> > +{
> > +#ifdef CONFIG_SMP
> > +	switch (ctx) {
> > +	case PR_RISCV_CTX_SW_FENCEI:
> > +		if (per_thread)
> > +			current->thread.force_icache_flush = true;
> > +		else
> > +			current->mm->context.force_icache_flush = true;
> > +		break;
> > +
> > +	default:
> > +		break;
> > +	}
> > +#endif
> > +	return 0;
> > +}
> > diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> > index 217fd4de6134..a394b146e78a 100644
> > --- a/arch/riscv/mm/context.c
> > +++ b/arch/riscv/mm/context.c
> > @@ -297,12 +297,14 @@ static inline void set_mm(struct mm_struct *prev,
> >   *
> >   * The "cpu" argument must be the current local CPU number.
> >   */
> > -static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu)
> > +static inline void flush_icache_deferred(struct mm_struct *mm, unsigned int cpu,
> > +					 struct task_struct *task)
> >  {
> >  #ifdef CONFIG_SMP
> >  	cpumask_t *mask = &mm->context.icache_stale_mask;
> >  
> > -	if (cpumask_test_cpu(cpu, mask)) {
> > +	if (cpumask_test_cpu(cpu, mask) || mm->context.force_icache_flush ||
> > +	    mm->context.force_icache_flush) {
> 
> Hey Charlie,
> 
> Looks like you duplicated "|| mm->context.force_icache_flush" here.
> 
Whoops, will send out a fix for that.

- Charlie

> Clément
> 
> >  		cpumask_clear_cpu(cpu, mask);
> >  		/*
> >  		 * Ensure the remote hart's writes are visible to this hart.
> > @@ -332,5 +334,5 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
> >  
> >  	set_mm(prev, next, cpu);
> >  
> > -	flush_icache_deferred(next, cpu);
> > +	flush_icache_deferred(next, cpu, task);
> >  }
> > diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> > index 370ed14b1ae0..472801ea78cc 100644
> > --- a/include/uapi/linux/prctl.h
> > +++ b/include/uapi/linux/prctl.h
> > @@ -306,4 +306,7 @@ struct prctl_mm_map {
> >  # define PR_RISCV_V_VSTATE_CTRL_NEXT_MASK	0xc
> >  # define PR_RISCV_V_VSTATE_CTRL_MASK		0x1f
> >  
> > +#define PR_RISCV_SET_ICACHE_FLUSH_CTX	71
> > +# define PR_RISCV_CTX_SW_FENCEI		0
> > +
> >  #endif /* _LINUX_PRCTL_H */
> > diff --git a/kernel/sys.c b/kernel/sys.c
> > index 420d9cb9cc8e..e806a8a67c36 100644
> > --- a/kernel/sys.c
> > +++ b/kernel/sys.c
> > @@ -146,6 +146,9 @@
> >  #ifndef RISCV_V_GET_CONTROL
> >  # define RISCV_V_GET_CONTROL()		(-EINVAL)
> >  #endif
> > +#ifndef RISCV_SET_ICACHE_FLUSH_CTX
> > +# define RISCV_SET_ICACHE_FLUSH_CTX(a, b)	(-EINVAL)
> > +#endif
> >  
> >  /*
> >   * this is where the system-wide overflow UID and GID are defined, for
> > @@ -2739,6 +2742,9 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
> >  	case PR_RISCV_V_GET_CONTROL:
> >  		error = RISCV_V_GET_CONTROL();
> >  		break;
> > +	case PR_RISCV_SET_ICACHE_FLUSH_CTX:
> > +		error = RISCV_SET_ICACHE_FLUSH_CTX(arg2, arg3);
> > +		break;
> >  	default:
> >  		error = -EINVAL;
> >  		break;
> > 
