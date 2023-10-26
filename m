Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7465B3C078
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 20:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xtlo0DJM"
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1515129
	for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 13:17:50 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d815354ea7fso962607276.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Oct 2023 13:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698351470; x=1698956270; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=k/Y1cqVei499MeRuO0JkL2AwtSOgPbZS08N4+Ku0vIU=;
        b=Xtlo0DJMwcg6S4xevIDOsvEqHIAD3oJWPu6TexObC/R5QGBs5RiNbzVIjTUXLr1SUH
         6VWMaRfoV8+aSyNPJJc65D1qNOgYSqCFysaQMsGHEIiE4X4M2YQsB/Li+FuoWBb7TY5y
         o5I7j0/uvlA49lpn6ULMQwBv/g6PEQAPBQu0K5P1ywFHyOoqgIV980c8OSXUSbS7NwNQ
         P/pjGnoEjem1QgcCOFBMtQ1fnPo8GBrn+LYSxaJOsF8jx+dj7sUrl3igNlmQM9Kbz4oc
         OtXg2FqbktOKZBRPzpXMv4l7geQfUTEaUj9hUCt/hfqhW1oSkJVNscPCJaxcAOz6dQGI
         gNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698351470; x=1698956270;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k/Y1cqVei499MeRuO0JkL2AwtSOgPbZS08N4+Ku0vIU=;
        b=M42wRtsgyxKPmrqPQhp/fBDRHhcqvTn+MCp6UaTLCThpsG/3DmOEyghlaAPslGq6jS
         ohacHbzKGJjn9R/fz4ir41MFy+pvWACFnImnXsLCmsjG9o+n+1DKGUSyy9UGLaxM7Mdh
         GP0UFkcEonsilHjJalKXeZ2halojY1Y5gnNzbhC+tZN/HMQ7GedqqRI6SGifmYG9P+L0
         sTNOqFkCbSxwcAQ1ejBp/wsrQIAeOMYmFC96Vb7prr3ltyEzRiffz002XXNWy2BfbHsT
         EOccoQW9vDXwzIMi/6EqznRA7/NDXWuthrsp8bpCXek/j+eJieoVxn0Cw0W0F/5aDZR1
         g/rw==
X-Gm-Message-State: AOJu0YxGWxVAt9u8rBwfZxXX4NInUmkxjm09g2VQ+qVVYS7CHMaI8VFM
	iP5Ss4UnLrIyUWjsT59L+EpXdTZ+uwk=
X-Google-Smtp-Source: AGHT+IFaYfepKEGrRhAf2VkMhklvq9ggBAMQ+KtkKZbuqh6XNf4Y8UxiI5C91vzIg6knFIOo4ZFLVR42pWM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1788:b0:da0:c9a5:b529 with SMTP id
 ca8-20020a056902178800b00da0c9a5b529mr7678ybb.12.1698351469567; Thu, 26 Oct
 2023 13:17:49 -0700 (PDT)
Date: Thu, 26 Oct 2023 13:17:47 -0700
In-Reply-To: <ZTq-b0uVyf6KLNV0@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231025-delay-verw-v3-0-52663677ee35@linux.intel.com>
 <20231025-delay-verw-v3-6-52663677ee35@linux.intel.com> <ZTq-b0uVyf6KLNV0@google.com>
Message-ID: <ZTrJa9NFaAORipVL@google.com>
Subject: Re: [PATCH  v3 6/6] KVM: VMX: Move VERW closer to VMentry for MDS mitigation
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

On Thu, Oct 26, 2023, Sean Christopherson wrote:
> On Wed, Oct 25, 2023, Pawan Gupta wrote:
> >  	vmx_disable_fb_clear(vmx);
> 
> LOL, nice.  IIUC, setting FB_CLEAR_DIS is mutually exclusive with doing a late
> VERW, as KVM will never set FB_CLEAR_DIS if the CPU is susceptible to X86_BUG_MDS.
> But the checks aren't identical, which makes this _look_ sketchy.
> 
> Can you do something like this to ensure we don't accidentally neuter the late VERW?
> 
> static void vmx_update_fb_clear_dis(struct kvm_vcpu *vcpu, struct vcpu_vmx *vmx)
> {
> 	vmx->disable_fb_clear = (host_arch_capabilities & ARCH_CAP_FB_CLEAR_CTRL) &&
> 				!boot_cpu_has_bug(X86_BUG_MDS) &&
> 				!boot_cpu_has_bug(X86_BUG_TAA);
> 
> 	if (vmx->disable_fb_clear &&
> 	    WARN_ON_ONCE(cpu_feature_enabled(X86_FEATURE_CLEAR_CPU_BUF)))
> 	    	vmx->disable_fb_clear = false;
> 
> 	...
> }

Alternatively, and maybe even preferably, this would make it more obvious that
the two are mutually exclusive and would also be a (very, very) small perf win
when the mitigation is enabled.

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 0936516cb93b..592103df1754 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7236,7 +7236,8 @@ static noinstr void vmx_vcpu_enter_exit(struct kvm_vcpu *vcpu,
                 kvm_arch_has_assigned_device(vcpu->kvm))
                mds_clear_cpu_buffers();
 
-       vmx_disable_fb_clear(vmx);
+       if (!cpu_feature_enabled(X86_FEATURE_CLEAR_CPU_BUF))
+               vmx_disable_fb_clear(vmx);
 
        if (vcpu->arch.cr2 != native_read_cr2())
                native_write_cr2(vcpu->arch.cr2);
@@ -7249,7 +7250,8 @@ static noinstr void vmx_vcpu_enter_exit(struct kvm_vcpu *vcpu,
 
        vmx->idt_vectoring_info = 0;
 
-       vmx_enable_fb_clear(vmx);
+       if (!cpu_feature_enabled(X86_FEATURE_CLEAR_CPU_BUF))
+               vmx_enable_fb_clear(vmx);
 
        if (unlikely(vmx->fail)) {
                vmx->exit_reason.full = 0xdead;
