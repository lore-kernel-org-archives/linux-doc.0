Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA17837C
	for <linux-doc@vger.kernel.org>; Sat, 21 Oct 2023 01:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUyNR6kF"
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33616D45;
	Fri, 20 Oct 2023 18:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697850070; x=1729386070;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Iz3NGqbBHff7rhfQuW/ddJUpEWgOz5h6WUqcnEVHelc=;
  b=bUyNR6kF4PG/IlV4hdP2X5BKuE0AbETVCaiVlQLgkbP/PTANXOAFnm5L
   kQVa2+riudiqQmWP5e51+Rhy5j8Kq4UAK7e5H8BWa9EsETlfALlJqPAgm
   bIYnXQwDtloUYasxnkS3p5bblb/1QVVBecYnx6VCO4JiL3lZFxML7pPaX
   RT/IjEVy8kErPkmZEeULJ+nON8j4reTmgS7Jo0Ey4KpiQyehjCZUxJ3a5
   vHq1svwpg3d5tvefnMxKCCmrufYhnh+ABpZHmq430lAsGvV/1ZQd72JrY
   SePE8aI1syqR+8T7uawYjYbinkRBqCoCPPeotcg/XlPH3hOt50g88/xJz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="390488826"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="390488826"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 18:01:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="848250110"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="848250110"
Received: from hkchanda-mobl.amr.corp.intel.com (HELO desk) ([10.209.90.113])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 18:01:07 -0700
Date: Fri, 20 Oct 2023 18:00:59 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Andy Lutomirski <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Paolo Bonzini <pbonzini@redhat.com>, tony.luck@intel.com,
	ak@linux.intel.com, tim.c.chen@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	Alyssa Milburn <alyssa.milburn@linux.intel.com>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	antonio.gomez.iglesias@linux.intel.com,
	Alyssa Milburn <alyssa.milburn@intel.com>
Subject: Re: [PATCH  1/6] x86/bugs: Add asm helpers for executing VERW
Message-ID: <20231021010059.ixziwh552wfjtkfd@desk>
References: <20231020-delay-verw-v1-0-cff54096326d@linux.intel.com>
 <20231020-delay-verw-v1-1-cff54096326d@linux.intel.com>
 <ZTMJiVsEeyu6Vd8E@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTMJiVsEeyu6Vd8E@google.com>

On Fri, Oct 20, 2023 at 04:13:13PM -0700, Sean Christopherson wrote:
> On Fri, Oct 20, 2023, Pawan Gupta wrote:
> > diff --git a/arch/x86/include/asm/nospec-branch.h b/arch/x86/include/asm/nospec-branch.h
> > index c55cc243592e..e1b623a27e1b 100644
> > --- a/arch/x86/include/asm/nospec-branch.h
> > +++ b/arch/x86/include/asm/nospec-branch.h
> > @@ -111,6 +111,24 @@
> >  #define RESET_CALL_DEPTH_FROM_CALL
> >  #endif
> >  
> > +/*
> > + * Macro to execute VERW instruction to mitigate transient data sampling
> > + * attacks such as MDS. On affected systems a microcode update overloaded VERW
> > + * instruction to also clear the CPU buffers.
> > + *
> > + * Note: Only the memory operand variant of VERW clears the CPU buffers. To
> > + * handle the case when VERW is executed after user registers are restored, use
> > + * RIP to point the memory operand to a part NOPL instruction that contains
> > + * __KERNEL_DS.
> > + */
> > +#define __EXEC_VERW(m)	verw _ASM_RIP(m)
> > +
> > +#define EXEC_VERW				\
> > +	__EXEC_VERW(551f);			\
> > +	/* nopl __KERNEL_DS(%rax) */		\
> > +	.byte 0x0f, 0x1f, 0x80, 0x00, 0x00;	\
> > +551:	.word __KERNEL_DS;			\
> 
> Why are there so many macro layers?  Nothing jumps out to justfying two layers,
> let alone three.

I can't remember the exact reason, but I think the reason I added
__EXEC_VERW() was because using EXEC_VERW() in a C function was leading
to build error in the internal draft version. This version is not
calling it from C, so yes I can get rid of the extra layer.

> >  /*
> >   * Fill the CPU return stack buffer.
> >   *
> > @@ -329,6 +347,13 @@
> >  #endif
> >  .endm
> >  
> > +/* Clear CPU buffers before returning to user */
> > +.macro USER_CLEAR_CPU_BUFFERS
> > +	ALTERNATIVE "jmp .Lskip_verw_\@;", "", X86_FEATURE_USER_CLEAR_CPU_BUF
> > +	EXEC_VERW
> 
> Rather than a NOP after VERW, why not something like this?
> 
> /* Clear CPU buffers before returning to user */
> .macro USER_CLEAR_CPU_BUFFERS
>                 ALTERNATIVE "jmp .Lskip_verw_\@;", "jmp .Ldo_verw_\@;", X86_FEATURE_USER_CLEAR_CPU_BUF
> 551:            .word __KERNEL_DS
> .Ldo_verw_\@:   verw _ASM_RIP(551b)
> .Lskip_verw_\@:
> .endm

I wasn't comfortable adding a variable directly in the instruction
stream because the CPU may interpret it wrongly. With NOP it is bound to
ignore the data part.
