Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5099C13D530
	for <linux-doc@vger.kernel.org>; Thu, 12 Sep 2024 20:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726171549; cv=none; b=CMNY6ktHUtWSmfQvaYzETOa8LwmDlpVdzde816Vs7NJqVKIeP85hdVzykBRHm1+FnjHkUI1i8Kx2bi2lw5D2iIbb33Xei+xX+EY/ZiXXo8LRv7LQTcvEEJE8O/3QvRhZ04lrDwLNbQJaUg2CTcLqQWqimYQAZdK92xK8f3vc1DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726171549; c=relaxed/simple;
	bh=zgVFGLKcvsfnGJiJdgrGdKWJuix6jbiZzKyiHN3clf0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O+m9Cy6sK3ROD8GXZ4odU7jAfN5jb2cjaFfPNLZknQU/I3waHUuxgQXdsjAY2lTvt0ZF/VHJBWjDh634uDjQDxn0duEObGKT7IHkIP8OQTZO7Qwbh+/ua1vO8vdx4YmubBKpvAbPXBRRuvtf2k6zuFRGgn7ZspYVyjPUz9Z0GTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YmQIWbI9; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YmQIWbI9"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2d88641e9a8so1605326a91.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Sep 2024 13:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726171546; x=1726776346; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fnnjrlSetIbQ77vTIX4XItRIWsi2rxf02mpUNlAPpck=;
        b=YmQIWbI97wgABO+GqgWJ7XMiY9/CGbBe/9xIwKUz27Ea6y3uyU5WGZlx+R+S1FotXo
         Aei2SflW7WkconSAOn+f9KjSR/8l8Pl4Ix8LWEoIp7TeR04rIVB8LY7QjGw9LP5pd6am
         WJFyI5oYK/VBYjMezQOnrrzjVmTiifU3dYXP+3rdRGqHiUd5aD1wXAIg+K3FDawnf4+i
         SACvAFPY40QrscIryoTNhFEVzWLKL/eMJabpv3q4lf90OMCDnYmHrEC8jAVYsrzY52w5
         jFwkf23lV710yKESQQ8syXYNPPqRnv2QObGatwqqxls1xnsztm+Fw7LwEviIXdGd0gJO
         6r/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726171546; x=1726776346;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fnnjrlSetIbQ77vTIX4XItRIWsi2rxf02mpUNlAPpck=;
        b=KzWqH9rh7euxAazuvYesx4+lj4xVQXa7N8djOmonOLkLztd4gA4IhnGN0KThg+Gxve
         c4mp/50RfdoIyGFM8BjiIrC6abc/J4iNGVs8F53ohiLLoaTv3dJdRJZslq3SWBIPughO
         RRGB7GwDPPCn9xGtUf1AImFNSYh92SYtdR4qUMxf1wgre0xzAtG3QQanGTpfDUtpE1eS
         hAk9uoqcWqU4VkPMCSnm2UzsVukvYW3aSf3ChiFSKOnY6siPeGuJInU+shLOUVdPQ3jp
         S4VwMRpFrBDVzJ7swRAYl7sm37jx5kkaCYFoilV5Zvb/7OUchUoiyIY9n0Z0+XMR+xWA
         dRjw==
X-Forwarded-Encrypted: i=1; AJvYcCUv9+1i+tsWJlhrOSuGl7vF2fCmsd/8OkEXF8f6vOzTf0uNGPGvoxtxdvHwqIP5l+i4RetvJorMuLw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl/TDjBzw9UkywRW/HkDQQFrQUH6I4a9wcOgsB5wxklg/j35dX
	bbrNAXZDXpRPb/k0FP8M67NK35kfynOHNYZn7riBDaydfJjVUmRvlFol/FE3nIyLk/QA96Wv4RD
	KAA==
X-Google-Smtp-Source: AGHT+IGMbV565ZUceOdGGm+YNdFHzG/XNLZao6v/FtV6YMEzbuF+laauyv9Oc3FC1PC6/WerO4BWUeVoybg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:d791:b0:2d8:7c76:45d7 with SMTP id
 98e67ed59e1d1-2dba0061767mr25737a91.4.1726171545428; Thu, 12 Sep 2024
 13:05:45 -0700 (PDT)
Date: Thu, 12 Sep 2024 13:05:43 -0700
In-Reply-To: <feefa9d1-f266-414f-bb7b-b770ef0d8ec6@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240207172646.3981-1-xin3.li@intel.com> <20240207172646.3981-8-xin3.li@intel.com>
 <ZiJzFsoHR41Sd8lE@chao-email> <ZmoT0jaX_3Ww3Uzu@google.com> <feefa9d1-f266-414f-bb7b-b770ef0d8ec6@zytor.com>
Message-ID: <ZuNJlzXntREQVb3n@google.com>
Subject: Re: [PATCH v2 07/25] KVM: VMX: Set intercept for FRED MSRs
From: Sean Christopherson <seanjc@google.com>
To: Xin Li <xin@zytor.com>
Cc: Chao Gao <chao.gao@intel.com>, Xin Li <xin3.li@intel.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, shuah@kernel.org, 
	vkuznets@redhat.com, peterz@infradead.org, ravi.v.shankar@intel.com
Content-Type: text/plain; charset="us-ascii"

On Thu, Sep 05, 2024, Xin Li wrote:
> On 6/12/2024 2:32 PM, Sean Christopherson wrote:
> > On Fri, Apr 19, 2024, Chao Gao wrote:
> > > On Wed, Feb 07, 2024 at 09:26:27AM -0800, Xin Li wrote:
> > > > Add FRED MSRs to the valid passthrough MSR list and set FRED MSRs intercept
> > > > based on FRED enumeration.
> > 
> > This needs a *much* more verbose explanation.  It's pretty darn obvious _what_
> > KVM is doing, but it's not at all clear _why_ KVM is passing through FRED MSRs.
> > E.g. why is FRED_SSP0 not included in the set of passthrough MSRs?
> > 
> > > > static void vmx_vcpu_config_fred_after_set_cpuid(struct kvm_vcpu *vcpu)
> > > > {
> > > > 	struct vcpu_vmx *vmx = to_vmx(vcpu);
> > > > +	bool fred_enumerated;
> > > > 
> > > > 	kvm_governed_feature_check_and_set(vcpu, X86_FEATURE_FRED);
> > > > +	fred_enumerated = guest_can_use(vcpu, X86_FEATURE_FRED);
> > > > 
> > > > -	if (guest_can_use(vcpu, X86_FEATURE_FRED)) {
> > > > +	if (fred_enumerated) {
> > > > 		vm_entry_controls_setbit(vmx, VM_ENTRY_LOAD_IA32_FRED);
> > > > 		secondary_vm_exit_controls_setbit(vmx,
> > > > 						  SECONDARY_VM_EXIT_SAVE_IA32_FRED |
> > > > @@ -7788,6 +7793,16 @@ static void vmx_vcpu_config_fred_after_set_cpuid(struct kvm_vcpu *vcpu)
> > > > 						    SECONDARY_VM_EXIT_SAVE_IA32_FRED |
> > > > 						    SECONDARY_VM_EXIT_LOAD_IA32_FRED);
> > > > 	}
> > > > +
> > > > +	vmx_set_intercept_for_msr(vcpu, MSR_IA32_FRED_RSP0, MSR_TYPE_RW, !fred_enumerated);
> > > > +	vmx_set_intercept_for_msr(vcpu, MSR_IA32_FRED_RSP1, MSR_TYPE_RW, !fred_enumerated);
> > > > +	vmx_set_intercept_for_msr(vcpu, MSR_IA32_FRED_RSP2, MSR_TYPE_RW, !fred_enumerated);
> > > > +	vmx_set_intercept_for_msr(vcpu, MSR_IA32_FRED_RSP3, MSR_TYPE_RW, !fred_enumerated);
> > > > +	vmx_set_intercept_for_msr(vcpu, MSR_IA32_FRED_STKLVLS, MSR_TYPE_RW, !fred_enumerated);
> > > > +	vmx_set_intercept_for_msr(vcpu, MSR_IA32_FRED_SSP1, MSR_TYPE_RW, !fred_enumerated);
> > > > +	vmx_set_intercept_for_msr(vcpu, MSR_IA32_FRED_SSP2, MSR_TYPE_RW, !fred_enumerated);
> > > > +	vmx_set_intercept_for_msr(vcpu, MSR_IA32_FRED_SSP3, MSR_TYPE_RW, !fred_enumerated);
> > > > +	vmx_set_intercept_for_msr(vcpu, MSR_IA32_FRED_CONFIG, MSR_TYPE_RW, !fred_enumerated);
> > > 
> > > Use a for-loop here? e.g.,
> > > 	for (i = MSR_IA32_FRED_RSP0; i <= MSR_IA32_FRED_CONFIG; i++)
> > 
> > Hmm, I'd prefer to keep the open coded version.  It's not pretty, but I don't
> > expect this to have much, if any, maintenance cost.  And using a loop makes it
> > harder to both understand _exactly_ what's happening, and to search for relevant
> > code.  E.g. it's quite difficult to see that FRED_SSP0 is still intercepted (see
> > my comment regarding the changelog).
> 
> 
> I owe you an explanation; I have been thinking about figuring out a way
> to include FRED SSP0 in the FRED KVM patch set...
> 
> MSR_IA32_FRED_SSP0 is an alias of the CET MSR_IA32_PL0_SSP and likely to
> be used in the same way as FRED RSP0, i.e., host FRED SSP0 _should_ be
> restored in arch_exit_to_user_mode_prepare().  However as of today Linux
> has no plan to utilize kernel shadow stack thus no one cares host FRED
> SSP0 (no?).  But lets say anyway it is host's responsibility to manage
> host FRED SSP0, then KVM only needs to take care of guest FRED SSP0
> (just like how KVM should handle guest FRED RSP0) even before the
> supervisor shadow stack feature is advertised to guest.

Heh, I'm not sure what your question is, or if there even is a question.  KVM
needs to context switch FRED SSP0 if FRED is exposed to the guest, but presumably
that will be done through XSAVE state?  If that's the long term plan, I would
prefer to focus on merging CET virtualization first, and then land FRED virtualization
on top so that KVM doesn't have to carry intermediate code to deal with the aliased
MSR.

Ugh, but what happens if a CPU (or the host kernel) supports FRED but not CET SS?
Or is that effectively an illegal combination?

> Another question is should KVM handle userspace request to set/get FRED
> SSP0?  IMO, it should be part of CET state management.

Yes, KVM needs to allow userspace to get/set FRED SSP0.  In general, KVM needs to
allow reads/writes to MSRs even if they can be saved/restored through some other
means.  In most cases, including this one, it's a moot point, because KVM needs
to have the necessary code anyways, e.g. if KVM encounters a RDMSR/WRMSR while
emulating.
