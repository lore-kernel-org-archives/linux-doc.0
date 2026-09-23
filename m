Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A85857D209
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 15:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177536; cv=none; b=mY9awYHITXa14K/lMLSj6gOYCxzfLlt83XgCAs8U5obKwB+IW9r7WiupbT4iItj9lpaFFZIZpttNjaXQmnDWtIEQKvMj+pMGaELJA8CODF4XSpylWn6uKlSTFN6Ed9LRXRbjOc4Njnxz6AjYz3rUOAVSZqj5TSgQ1kuIwnjjt4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177536; c=relaxed/simple;
	bh=85dX9Lf/sfXcN1Tyse46Ek5ZypzCkU8iMrFONRu4zwA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sNCCXT+MJSjrYdv8r6JtA3Z1JonIqA0deIjVYGUr5Dhp8F2XCxRLr72mxgC9kzwuFQ4OY92DSgnQnusDU6LakE8rC0mYOED93hp0KRX4g8mHd3UKNgnXodMGD/Yz97FUM3eEemNonIZajqOxj3kbHyXaWFZYlfIiYaEvhHf4zWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lCkmUh7x; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lCkmUh7x"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso1836524a91.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 08:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790177529; x=1790782329; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3B1pltCyt8uMcbScgeyNeCyno46cKnz3EXyCIHLNjo8=;
        b=lCkmUh7x1kv9NQcEhQdix2f2i1/BtnuSfWcMAzuxMdtTdEU6S4ukp3+pMjdmwkD58P
         AX1UgQiXyQyQGGt+fl/aNmqWWr0EkvrpXBltZbOxebd5IvEBakNi44HaYe1/0ERSUzoW
         2vykKhbZ7KDbZawJZjWPIU5ea5hXD/yogWzOyM7wehwFNjXnrV8f38Cog3JyQyGRUI/h
         fPXTBHxE3jE8jlH9tfhIGs3MVLrwFeRPxir0ncm9IukFp047lQGchDqOhtm9ao9/SU/g
         z5XF9x6glmTDPEyshwYVvG4We2CeHWdNXyjzhYrFGOtWWpt74BS5M75wuWgKSbA7E4vm
         4hVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177529; x=1790782329;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3B1pltCyt8uMcbScgeyNeCyno46cKnz3EXyCIHLNjo8=;
        b=DCsyyLJM0OengI/+kXeqt8MnGxJ5+ISpoqP3WsbOH8vBtTD+99rpC/65lNXdFDN+2Z
         JWFFSFFPxCZwZf4nCa/LFYcGiYLCl3bcL6c9lZf+E0avBXqTszij6DwMCN+6kaIoq7y+
         uR5tdqOrO1tA8N3Ge99rotY0afHu+wXRKx+JsLl8ZWoq0jSg9oVfVbaCcziaJ0Ux//p8
         qByYFPNq8cVGuNix/pb3XWYgHY+Ibzvodobna7To83m9WU0l94/M0TZrvVOITdrUYbhw
         uSTSuEAejsoE30OVBGaWzacvRxtATsOtH6kd8QuziyAEj8SoX34rSrwstlBRgYXqe9xb
         bgyw==
X-Forwarded-Encrypted: i=1; AKwUvBy/W7rywZZaCzbFJBjY7Rycp+dyI6cki9yNtZvOTr1O5TRFRRNr4caLa7qYhrH9zFX4MJBmKjCezFQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kjbjexGD6M+HqilOj0BQa5Ff8mP+iy7t+yNcLTpHXsBZQi2uVw
	u1AU2hZO/OnFTFFg12CsM09KwbqBqHwxhX+SRZp5q+D+kFbfSk9nDuXz6n8H3HTz/lP2VALNEZi
	7E22AnA==
X-Received: from pgvn10.prod.google.com ([2002:a65:63ca:0:b0:cc4:5907:21e9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:314c:b0:39e:6c68:fd8d
 with SMTP id 98e67ed59e1d1-3a07e5da863mr1820942a91.34.1790177529298; Wed, 23
 Sep 2026 08:32:09 -0700 (PDT)
Date: Wed, 23 Sep 2026 08:32:08 -0700
In-Reply-To: <20260923091555.GX776954@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <179005108298.388919.4535333252892590932.stgit@devnote2>
 <179005110742.388919.1509641807739909065.stgit@devnote2> <20260923091555.GX776954@noisy.programming.kicks-ass.net>
Message-ID: <arPw-N3HF3ehNGTQ@google.com>
Subject: Re: [PATCH v17 02/13] perf/x86, KVM: Prevent host debug register leak
 into guest OS on NMI
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Ingo Molnar <mingo@kernel.org>, Jinchao Wang <wangjinchao600@gmail.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Ian Rogers <irogers@google.com>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, x86@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 23, 2026, Peter Zijlstra wrote:
> On Tue, Sep 22, 2026 at 01:25:07PM +0900, Masami Hiramatsu (Google) wrote:
> > diff --git a/arch/x86/kernel/hw_breakpoint.c b/arch/x86/kernel/hw_breakpoint.c
> > index f846c15f21ca..0473a5c95856 100644
> > --- a/arch/x86/kernel/hw_breakpoint.c
> > +++ b/arch/x86/kernel/hw_breakpoint.c
> > @@ -102,6 +102,9 @@ int arch_install_hw_breakpoint(struct perf_event *bp)
> >  
> >  	lockdep_assert_irqs_disabled();
> >  
> > +	if (perf_guest_in_guest())
> 
> That naming is hilariously bad :-)

Indeed.  It's also misleading and confusing, because it's really checking for
"in KVM's core run loop", whereas the goal of perf_guest_state() returns a
non-zero value if and only if the IRQ/NMI really did occur while the guest was
active (I say "the goal" because it's imperfect due to architectural limitations,
but the goal is purely to detect guest PMIs).

Ugh, and routing this through perf was my suggestion[*]:

  : If we decide this is how to fix arch_install_hw_breakpoint() clobbering DRs from
  : NMI context, I would rather have more generic flag to tell perf that KVM is about
  : to enter the guest, e.g. so that we don't have to separately solve the same problem
  : for other perf events:

After seeing the code, that feels like a pretty stupid suggestion.  Though in my
defense, I was thinking of a per-CPU flag as opposed to a new callback.  Anyways,
I don't think we should key off IN_GUEST_MODE and EXITING_GUEST_MODE because they
are very much an arch-specific, KVM-internal concept.

What I was trying to say by "more generic flag" is that I would prefer not to have
a super specific cpu_dr_in_guest.  I'm not opposed to have a dedicated flag (though
if we can avoid one, that would be lovely).  The biggest problem I see with adding
a generic flag is how to make it precise enough to be useful, without end up with a
confusing name.  E.g. "guest_state_loaded" is terrible because KVM keeps some guest
state loaded even when the task is scheduled out.

And to Peter's point below, is arch_install_hw_breakpoint() even the right place
to handle this?  It seems like KGDB itself should be handling this, at which point
maybe we just do something like this?  Then we can provide nop stubs when KGDB
support is disabled.

diff --git arch/x86/kvm/x86.c arch/x86/kvm/x86.c
index 1705e7be46ec..42fa4dc44cbc 100644
--- arch/x86/kvm/x86.c
+++ arch/x86/kvm/x86.c
@@ -8273,6 +8273,8 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 
        kvm_load_xfeatures(vcpu, true);
 
+       kgdb_arch_enter_guest();
+
        if (unlikely(vcpu->arch.switch_db_regs &&
                     !(vcpu->arch.switch_db_regs & KVM_DEBUGREG_AUTO_SWITCH))) {
                set_debugreg(DR7_FIXED_1, 7);
@@ -8365,6 +8367,8 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
        if (hw_breakpoint_active())
                hw_breakpoint_restore();
 
+       kgdb_arch_exit_guest();
+
        vcpu->arch.last_vmentry_cpu = vcpu->cpu;
        vcpu->arch.last_guest_tsc = kvm_read_l1_tsc(vcpu, rdtsc());
 
[*] https://lore.kernel.org/all/aqgGRKOE138ePqmX@google.com

> > +		return -EBUSY;
> > +
> >  	for (i = 0; i < HBP_NUM; i++) {
> >  		struct perf_event **slot = this_cpu_ptr(&bp_per_reg[i]);
> >  
> 
> Note how the other -EBUSY return is a WARN. Why is silently not doing
> anything not a WARN in this case?

Probably because the WARN would trigger anytime KGDB's NMI craziness happens to
hit a vCPU, i.e. isn't a kernel bug.
