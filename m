Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A641B26B
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 14:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t0gaFMfr"
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F4C0172E
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 07:59:00 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5abfa4c10c4so12852297b3.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 07:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698073139; x=1698677939; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Flyl5CTmQl8KaVZkUK6sdZJgLtZ9cPBOArwvlq8mdTY=;
        b=t0gaFMfr57X0eZU/lKCOhS/MG0/yy4xukxJRgkMFu1dU3h1QAl3Hjok2/wiupLIXLx
         EDKpOn7TWuBxUs4Wzhp+iGTEi9jgvf/z73zho1P6eH65gSgaX0a7CgfCl3FzrwJrsfOK
         NrMMR6nnrN5K1r+hDVCGTaakmQ/7m/EGmzcZR8IQpc1xMPHORO8aXyuaVfVI53k5OvR5
         ywIKdAEi5VE4fTvhiI71jXgtwU4DfaSypmUp5T6uRl2QgdiYMFyfv+Tdx4vtEowfi/Jc
         1ov32QAlIcBPbEvLpyQSRwuh9POidgx4MiBMs4xAj5eE0LfRjemvY6P/oZK1JJ7aocDP
         15hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698073139; x=1698677939;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Flyl5CTmQl8KaVZkUK6sdZJgLtZ9cPBOArwvlq8mdTY=;
        b=ie8w08Ebdp+k+Ri5POzrCtoLGTn1viC/M1UALDqu+zdP1nB9WEITxqFrmttJnlz/Mv
         vo3BGAEtV3F6SiLwQt5Kk1nBzli/05uLiaZLhYYHzwTWQoTcYEXPYpNMOFZRkevjfT/r
         1m7j7W7lYEVo0frL0WhLtD4+NVYQTaQKAGooAskoXqnZQef6cNde3PyMkC5d1qng5l5I
         YHffE0qWPb8j+5OXKYLH50uU8VkUzmI/zQT/7XZgcNe0o5EBbTKWIwZu920AHJadXM3f
         xcVldhMr6CFL8cK1KYqxmztAo7KbJRk0t4j8ZFnZWfDEoqsyySfqdqOl5mnFpP53JSaQ
         MDzw==
X-Gm-Message-State: AOJu0YwxC5MC926wYjqHebyizWe72xaK8SJZCYlQiP3zPeeLiL/HoCpc
	28sEzNuK0QJvEK8dP49W1/fw6Au+7hs=
X-Google-Smtp-Source: AGHT+IGJVEjwFciVLjGMcTbk9Ucqyn6zEG4pnXQMiBfSEdqlgcK+Ls1MZjlK6mcaopsYanQyUqMIMpoNPdE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:b97:0:b0:d7b:94f5:1301 with SMTP id
 145-20020a250b97000000b00d7b94f51301mr168980ybl.9.1698073139445; Mon, 23 Oct
 2023 07:58:59 -0700 (PDT)
Date: Mon, 23 Oct 2023 07:58:57 -0700
In-Reply-To: <20231021004633.ymughma7zijosku5@desk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com>
 <20231020-delay-verw-v1-6-cff54096326d@linux.intel.com> <ZTMFS8I2s8EroSNe@google.com>
 <20231021004633.ymughma7zijosku5@desk>
Message-ID: <ZTaKMdZqq2R1xXFh@google.com>
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
> On Fri, Oct 20, 2023 at 03:55:07PM -0700, Sean Christopherson wrote:
> > On Fri, Oct 20, 2023, Pawan Gupta wrote:
> > > During VMentry VERW is executed to mitigate MDS. After VERW, any memory
> > > access like register push onto stack may put host data in MDS affected
> > > CPU buffers. A guest can then use MDS to sample host data.
> > > 
> > > Although likelihood of secrets surviving in registers at current VERW
> > > callsite is less, but it can't be ruled out. Harden the MDS mitigation
> > > by moving the VERW mitigation late in VMentry path.
> > > 
> > > Note that VERW for MMIO Stale Data mitigation is unchanged because of
> > > the complexity of per-guest conditional VERW which is not easy to handle
> > > that late in asm with no GPRs available. If the CPU is also affected by
> > > MDS, VERW is unconditionally executed late in asm regardless of guest
> > > having MMIO access.
> > > 
> > > Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> > > ---
> > >  arch/x86/kvm/vmx/vmenter.S |  9 +++++++++
> > >  arch/x86/kvm/vmx/vmx.c     | 10 +++++++---
> > >  2 files changed, 16 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/arch/x86/kvm/vmx/vmenter.S b/arch/x86/kvm/vmx/vmenter.S
> > > index be275a0410a8..efa716cf4727 100644
> > > --- a/arch/x86/kvm/vmx/vmenter.S
> > > +++ b/arch/x86/kvm/vmx/vmenter.S
> > > @@ -1,6 +1,7 @@
> > >  /* SPDX-License-Identifier: GPL-2.0 */
> > >  #include <linux/linkage.h>
> > >  #include <asm/asm.h>
> > > +#include <asm/segment.h>
> > >  #include <asm/bitsperlong.h>
> > >  #include <asm/kvm_vcpu_regs.h>
> > >  #include <asm/nospec-branch.h>
> > > @@ -31,6 +32,8 @@
> > >  #define VCPU_R15	__VCPU_REGS_R15 * WORD_SIZE
> > >  #endif
> > >  
> > > +#define GUEST_CLEAR_CPU_BUFFERS		USER_CLEAR_CPU_BUFFERS
> > > +
> > >  .macro VMX_DO_EVENT_IRQOFF call_insn call_target
> > >  	/*
> > >  	 * Unconditionally create a stack frame, getting the correct RSP on the
> > > @@ -177,10 +180,16 @@ SYM_FUNC_START(__vmx_vcpu_run)
> > >   * the 'vmx_vmexit' label below.
> > >   */
> > >  .Lvmresume:
> > > +	/* Mitigate CPU data sampling attacks .e.g. MDS */
> > > +	GUEST_CLEAR_CPU_BUFFERS
> > 
> > I have a very hard time believing that it's worth duplicating the mitigation
> > for VMRESUME vs. VMLAUNCH just to land it after a Jcc.
> 
> VERW modifies the flags, so it either needs to be after Jcc or we
> push/pop flags that adds 2 extra memory operations. Please let me know
> if there is a better option.

Ugh, I assumed that piggybacking VERW overrode the original behavior entirely, I
didn't realize it sacrifices EFLAGS.ZF on the altar of mitigations.

Luckily, this is easy to solve now that VMRESUME vs. VMLAUNCH uses a flag instead
of a dedicated bool.

From: Sean Christopherson <seanjc@google.com>
Date: Mon, 23 Oct 2023 07:44:35 -0700
Subject: [PATCH] KVM: VMX: Use BT+JNC, i.e. EFLAGS.CF to select VMRESUME vs.
 VMLAUNCH

Use EFLAGS.CF instead of EFLAGS.ZF to track whether to use VMRESUME versus
VMLAUNCH.  Freeing up EFLAGS.ZF will allow doing VERW, which clobbers ZF,
for MDS mitigations as late as possible without needing to duplicate VERW
for both paths.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/run_flags.h | 7 +++++--
 arch/x86/kvm/vmx/vmenter.S   | 6 +++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/vmx/run_flags.h b/arch/x86/kvm/vmx/run_flags.h
index edc3f16cc189..6a9bfdfbb6e5 100644
--- a/arch/x86/kvm/vmx/run_flags.h
+++ b/arch/x86/kvm/vmx/run_flags.h
@@ -2,7 +2,10 @@
 #ifndef __KVM_X86_VMX_RUN_FLAGS_H
 #define __KVM_X86_VMX_RUN_FLAGS_H
 
-#define VMX_RUN_VMRESUME	(1 << 0)
-#define VMX_RUN_SAVE_SPEC_CTRL	(1 << 1)
+#define VMX_RUN_VMRESUME_SHIFT		0
+#define VMX_RUN_SAVE_SPEC_CTRL_SHIFT	1
+
+#define VMX_RUN_VMRESUME		BIT(VMX_RUN_VMRESUME_SHIFT)
+#define VMX_RUN_SAVE_SPEC_CTRL		BIT(VMX_RUN_SAVE_SPEC_CTRL_SHIFT)
 
 #endif /* __KVM_X86_VMX_RUN_FLAGS_H */
diff --git a/arch/x86/kvm/vmx/vmenter.S b/arch/x86/kvm/vmx/vmenter.S
index be275a0410a8..b3b13ec04bac 100644
--- a/arch/x86/kvm/vmx/vmenter.S
+++ b/arch/x86/kvm/vmx/vmenter.S
@@ -139,7 +139,7 @@ SYM_FUNC_START(__vmx_vcpu_run)
 	mov (%_ASM_SP), %_ASM_AX
 
 	/* Check if vmlaunch or vmresume is needed */
-	test $VMX_RUN_VMRESUME, %ebx
+	bt   $VMX_RUN_VMRESUME_SHIFT, %ebx
 
 	/* Load guest registers.  Don't clobber flags. */
 	mov VCPU_RCX(%_ASM_AX), %_ASM_CX
@@ -161,8 +161,8 @@ SYM_FUNC_START(__vmx_vcpu_run)
 	/* Load guest RAX.  This kills the @regs pointer! */
 	mov VCPU_RAX(%_ASM_AX), %_ASM_AX
 
-	/* Check EFLAGS.ZF from 'test VMX_RUN_VMRESUME' above */
-	jz .Lvmlaunch
+	/* Check EFLAGS.CF from the VMX_RUN_VMRESUME bit test above. */
+	jnc .Lvmlaunch
 
 	/*
 	 * After a successful VMRESUME/VMLAUNCH, control flow "magically"

base-commit: ec2f1daad460c6201338dae606466220ccaa96d5
-- 

