Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8939232C81
	for <linux-doc@vger.kernel.org>; Fri, 20 Oct 2023 23:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3dzEKRkQ"
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5555FD51
	for <linux-doc@vger.kernel.org>; Fri, 20 Oct 2023 16:13:15 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6936a25f49bso1236764b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Oct 2023 16:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697843595; x=1698448395; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CgAVXy/axx8rbE3S2sz/Fpl+Q5PtMzZyyI0NieynS1Q=;
        b=3dzEKRkQ3gyICAewppe2ffS6ZcMlYJNYdSp0UhbUUy9GAMvGPZSTOBDQBYOvfNPb8q
         /aO3YepGbcj1wHzD60P6vX61zRnFjr8Sn32IIAlzvbWDrrHH5sqsTav6I8eyTxe+YRnR
         Pa3A3j1/YJRXX87xGouWpsID1BeypQFBeq0Sa10b042o6IOLXZ2hmOExcuOqsE6KH5YF
         gVtVGvMPwGLfrhEUJdrPmA9NKcRn+pbf1UhmzQbNri+SO6tmFlR4TYSILZjmic3cp79T
         mR62nI6y3qkkL7kZ77ISvQdCFQ4g/wKBnhYkUaiNyhRfcsOASyAuEV66smJ82chJpOe7
         SQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697843595; x=1698448395;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CgAVXy/axx8rbE3S2sz/Fpl+Q5PtMzZyyI0NieynS1Q=;
        b=OuPM2WVCNztJ4BLLYGuzZbKpfQnLyuA8cmnLRYV8rP8D5YstfilcNxVIvudwoLBSdm
         K8qwuGUXNb3QxzEgM7FAn5RuPzHg17Iwt6Qd5/bTKh2ftr5qalzBQ5Fi/CcJzICdcOX9
         dgOPS1JluDKWtxhx40rzqpmOmF8kNqXxCrQcObwnBdKvCwnxMKszo+Dp8Kgx1L14dNdQ
         jcsQbWVpASAbuBlsdg65KYjJibuQBfAlmqIqOt6jYVfcnRAz2/MH9DDh03K1nJGGhAxl
         sag9SkwgLH48WPAyiN+SO36ufInySzxRraL2YZt2TeumiKIPna8R46CCQgRUDlK0jvoe
         eR2Q==
X-Gm-Message-State: AOJu0YwufApiy5DteykvV/YW+3mY2AEXS1fl6BCye+G/Z17PeH/ftegi
	NfFS3dO9a9vC8hnRPVChx++E0oUVrqw=
X-Google-Smtp-Source: AGHT+IEb+B01P1bRaoNxc8joEn7AXOfNyBKk3u3HcHvMNx5bY4rK4asGL8wTgvrzbJpYbbyCzWgKi6MQfSk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:26e4:b0:6bc:ff89:a30e with SMTP id
 p36-20020a056a0026e400b006bcff89a30emr86478pfw.3.1697843594765; Fri, 20 Oct
 2023 16:13:14 -0700 (PDT)
Date: Fri, 20 Oct 2023 16:13:13 -0700
In-Reply-To: <20231020-delay-verw-v1-1-cff54096326d@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com> <20231020-delay-verw-v1-1-cff54096326d@linux.intel.com>
Message-ID: <ZTMJiVsEeyu6Vd8E@google.com>
Subject: Re: [PATCH  1/6] x86/bugs: Add asm helpers for executing VERW
From: Sean Christopherson <seanjc@google.com>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Andy Lutomirski <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Paolo Bonzini <pbonzini@redhat.com>, tony.luck@intel.com, ak@linux.intel.com, 
	tim.c.chen@linux.intel.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	Alyssa Milburn <alyssa.milburn@linux.intel.com>, 
	Daniel Sneddon <daniel.sneddon@linux.intel.com>, antonio.gomez.iglesias@linux.intel.com, 
	Alyssa Milburn <alyssa.milburn@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Oct 20, 2023, Pawan Gupta wrote:
> diff --git a/arch/x86/include/asm/nospec-branch.h b/arch/x86/include/asm/nospec-branch.h
> index c55cc243592e..e1b623a27e1b 100644
> --- a/arch/x86/include/asm/nospec-branch.h
> +++ b/arch/x86/include/asm/nospec-branch.h
> @@ -111,6 +111,24 @@
>  #define RESET_CALL_DEPTH_FROM_CALL
>  #endif
>  
> +/*
> + * Macro to execute VERW instruction to mitigate transient data sampling
> + * attacks such as MDS. On affected systems a microcode update overloaded VERW
> + * instruction to also clear the CPU buffers.
> + *
> + * Note: Only the memory operand variant of VERW clears the CPU buffers. To
> + * handle the case when VERW is executed after user registers are restored, use
> + * RIP to point the memory operand to a part NOPL instruction that contains
> + * __KERNEL_DS.
> + */
> +#define __EXEC_VERW(m)	verw _ASM_RIP(m)
> +
> +#define EXEC_VERW				\
> +	__EXEC_VERW(551f);			\
> +	/* nopl __KERNEL_DS(%rax) */		\
> +	.byte 0x0f, 0x1f, 0x80, 0x00, 0x00;	\
> +551:	.word __KERNEL_DS;			\

Why are there so many macro layers?  Nothing jumps out to justfying two layers,
let alone three.

> +
>  /*
>   * Fill the CPU return stack buffer.
>   *
> @@ -329,6 +347,13 @@
>  #endif
>  .endm
>  
> +/* Clear CPU buffers before returning to user */
> +.macro USER_CLEAR_CPU_BUFFERS
> +	ALTERNATIVE "jmp .Lskip_verw_\@;", "", X86_FEATURE_USER_CLEAR_CPU_BUF
> +	EXEC_VERW

Rather than a NOP after VERW, why not something like this?

/* Clear CPU buffers before returning to user */
.macro USER_CLEAR_CPU_BUFFERS
                ALTERNATIVE "jmp .Lskip_verw_\@;", "jmp .Ldo_verw_\@;", X86_FEATURE_USER_CLEAR_CPU_BUF
551:            .word __KERNEL_DS
.Ldo_verw_\@:   verw _ASM_RIP(551b)
.Lskip_verw_\@:
.endm

> +.Lskip_verw_\@:
> +.endm
