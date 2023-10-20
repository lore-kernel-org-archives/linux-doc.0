Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4186C1A71B
	for <linux-doc@vger.kernel.org>; Fri, 20 Oct 2023 22:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xk/nimL+"
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97105D6F
	for <linux-doc@vger.kernel.org>; Fri, 20 Oct 2023 15:55:09 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d86dac81f8fso1802741276.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Oct 2023 15:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697842509; x=1698447309; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+g38I1Y8PaKbaByFCxxvsTO4uB3YltKuRgG8s7U1tVw=;
        b=xk/nimL+eI0gDd5i/VB2O1JHRcQWK6obE8r3F546i3IHLFa47qMggw0YxFa+2Gmp/v
         GowzfJC9QQck1e+vtS/g1LdAAkuQU6a82T0P1oJaBJVgLUfPoV65Xk7Dps4keA27gFke
         a7A6IR8asHo63y/IIXR/R2PyN3S1cPAHNR1jEdFVc06FfnyXscUqMlykzLDYTkOF3n0U
         iS5Yi4lkvnsgF/ZU0UNR3u/a4sEb6IkQtOPSO/x0DVkmXjlNhN5OX2bzy6ols3i+ft68
         MbMzQDkC3Qn3dERfAsDAeqge7477AtsNr/30Z3LaKcHDa4XLk8Z/RD/XXfpwSkfCb/NU
         y8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697842509; x=1698447309;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+g38I1Y8PaKbaByFCxxvsTO4uB3YltKuRgG8s7U1tVw=;
        b=SfXiHlCIiBNOWf60eD1OATKtVVIAqZMQ52+7U+oqtQKCNYxnKvtVqugeFTTVYyHQ1e
         RglC9so4HkBS7omksE8IPqjJXq8u0OYI5t82odq2WP90zb9k5M+KDqjoyY0yJAgKaX+s
         JWbll22sdVF0fdnV+JTQKWSsNZKwFW/5H35mI9WQ2gzltTVmNEgwMnqBX8GIuujTLaIR
         vrdq7QSdNangUi3GeIFn7UFcTUuaeN05BPGyo4AnMcIvyKOmCLN3H5CxqhXIQsPjiMNt
         e8OBZF+ZTxr702Zeb15pyTwJpDGNSSFXSAtLn+Kb8Sh4ReS8s3gy4dfRCFPBGYABzLoS
         kBuw==
X-Gm-Message-State: AOJu0YyQwKJzdzbgQZS73F2uZZi2NEHmQW0IVyMn4+WPI5Gn35uuifHv
	BasoR6Mn85qTVwqUw4ffUVUQ4cgIYYQ=
X-Google-Smtp-Source: AGHT+IENHoQiZ42m6eFADsLCJq2/clyckBRLfOaBWIr29kVDjxo24ynfoZVNeCXHANN6kij0abAlz7oMAhY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:297:0:b0:d9a:4c45:cfd0 with SMTP id
 145-20020a250297000000b00d9a4c45cfd0mr63479ybc.2.1697842508740; Fri, 20 Oct
 2023 15:55:08 -0700 (PDT)
Date: Fri, 20 Oct 2023 15:55:07 -0700
In-Reply-To: <20231020-delay-verw-v1-6-cff54096326d@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com> <20231020-delay-verw-v1-6-cff54096326d@linux.intel.com>
Message-ID: <ZTMFS8I2s8EroSNe@google.com>
Subject: Re: [PATCH  6/6] KVM: VMX: Move VERW closer to VMentry for MDS mitigation
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
	Daniel Sneddon <daniel.sneddon@linux.intel.com>, antonio.gomez.iglesias@linux.intel.com
Content-Type: text/plain; charset="us-ascii"

On Fri, Oct 20, 2023, Pawan Gupta wrote:
> During VMentry VERW is executed to mitigate MDS. After VERW, any memory
> access like register push onto stack may put host data in MDS affected
> CPU buffers. A guest can then use MDS to sample host data.
> 
> Although likelihood of secrets surviving in registers at current VERW
> callsite is less, but it can't be ruled out. Harden the MDS mitigation
> by moving the VERW mitigation late in VMentry path.
> 
> Note that VERW for MMIO Stale Data mitigation is unchanged because of
> the complexity of per-guest conditional VERW which is not easy to handle
> that late in asm with no GPRs available. If the CPU is also affected by
> MDS, VERW is unconditionally executed late in asm regardless of guest
> having MMIO access.
> 
> Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> ---
>  arch/x86/kvm/vmx/vmenter.S |  9 +++++++++
>  arch/x86/kvm/vmx/vmx.c     | 10 +++++++---
>  2 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/vmenter.S b/arch/x86/kvm/vmx/vmenter.S
> index be275a0410a8..efa716cf4727 100644
> --- a/arch/x86/kvm/vmx/vmenter.S
> +++ b/arch/x86/kvm/vmx/vmenter.S
> @@ -1,6 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  #include <linux/linkage.h>
>  #include <asm/asm.h>
> +#include <asm/segment.h>
>  #include <asm/bitsperlong.h>
>  #include <asm/kvm_vcpu_regs.h>
>  #include <asm/nospec-branch.h>
> @@ -31,6 +32,8 @@
>  #define VCPU_R15	__VCPU_REGS_R15 * WORD_SIZE
>  #endif
>  
> +#define GUEST_CLEAR_CPU_BUFFERS		USER_CLEAR_CPU_BUFFERS
> +
>  .macro VMX_DO_EVENT_IRQOFF call_insn call_target
>  	/*
>  	 * Unconditionally create a stack frame, getting the correct RSP on the
> @@ -177,10 +180,16 @@ SYM_FUNC_START(__vmx_vcpu_run)
>   * the 'vmx_vmexit' label below.
>   */
>  .Lvmresume:
> +	/* Mitigate CPU data sampling attacks .e.g. MDS */
> +	GUEST_CLEAR_CPU_BUFFERS

I have a very hard time believing that it's worth duplicating the mitigation
for VMRESUME vs. VMLAUNCH just to land it after a Jcc.

 3b1:   48 8b 00                mov    (%rax),%rax
 3b4:   74 18                   je     3ce <__vmx_vcpu_run+0x9e>
 3b6:   eb 0e                   jmp    3c6 <__vmx_vcpu_run+0x96>
 3b8:   0f 00 2d 05 00 00 00    verw   0x5(%rip)        # 3c4 <__vmx_vcpu_run+0x94>
 3bf:   0f 1f 80 00 00 18 00    nopl   0x180000(%rax)
 3c6:   0f 01 c3                vmresume
 3c9:   e9 c9 00 00 00          jmp    497 <vmx_vmexit+0xa7>
 3ce:   eb 0e                   jmp    3de <__vmx_vcpu_run+0xae>
 3d0:   0f 00 2d 05 00 00 00    verw   0x5(%rip)        # 3dc <__vmx_vcpu_run+0xac>
 3d7:   0f 1f 80 00 00 18 00    nopl   0x180000(%rax)
 3de:   0f 01 c2                vmlaunch

Also, would it'd be better to put the NOP first?  Or even better, out of line?
It'd be quite hilarious if the CPU pulled a stupid and speculated on the operand
of the NOP, i.e. if the user/guest controlled RAX allowed for pulling in data
after the VERW.
