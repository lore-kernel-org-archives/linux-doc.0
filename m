Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3AC330666
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 08:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781857355; cv=pass; b=tJJr9fcdBtXRGH0ravwjFFEGGngb2QmBGzI5kaqTLPrefzRMZfC4bPkAgSH7QhuIU+EZEpIUkZjWLRNGT34UxhXYsrg1+XGC9FQnTEACRwAVGravWaSDqtjvXzeVbKiTfqQI0wzm+XCz4Zqxx/fns24KTeDerx8/7MG64t7fo9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781857355; c=relaxed/simple;
	bh=8G3Iesv6H4uuh2/K8K/iWGA8fNXhb2ucD0ih1NRqF2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QA49crWIuVJAaHCMT+1hDbCj0CTtBG5Av1iibQYMcY10eBkJn+HzkdB0VVrTREFxshcaX73KdDOg5yUPWQtlct0BaIlCfroyEO/qDV9shSVWIaA+651rCosVJiNksRiar74nYx0vUBqSFnehUHi1gr0EsUapKvz7JE7Ml4Rla8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M/tHg6j+; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M/tHg6j+"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5177d1ff061so115791cf.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 01:22:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857353; cv=none;
        d=google.com; s=arc-20260327;
        b=RkUHVSCxuMlNwC5XVuH+vpBsZKTOPFh2NY0G+/NNZgS/xAtDZebnUM/RwgUcsA0acM
         gTqi+uXdwMda9nwJcPX+Zt4t1P8a/IqxdbMBc9RfrIF2zbelbtXrXtwrAujuZNMd+6F6
         NjQfZyCA/LEYGsK3rhcuJFVfBToO1mU1xL9cOPOXzVO66Z6Fs9yXY1Kjc/pdBh3Ze4uv
         4PKwQ9NAW5QknoB+alKWERr0A+poTFbiygiRfJojYy6tUfR1NjGIR4LiuqCWtiIrW11Q
         TQDxNt7JuEkOcWJOKH25WVjaINrC3Wou9mJ6d4pzwV1yk6c+4sgopqLd7vZriz1bEGeb
         e1JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WecHCv13rG5Qr395P8gqLpoRjr3ajKQ15qH0wjMFBvs=;
        fh=uGmfqPmzfu20Rs51UhykxadPU0FTXPtkdU+DIgYiHdA=;
        b=LXx6H+Skn+8KllARR/E3raaMCccC2KEOQiSQYca0IECnYnUKU+tMOA8OuspQ+iXYoK
         QEryTqCdJ2JAq+fmIfIFbn5GyKBOUGT7jBD3cwEzcO3axuxGxrDSbCIlIGvzMg+Ji2OF
         O4LLj6/guauNm/Pcwah0epI5JkAPSoE1ge/4kpQJErTVq94fDI1W/m0Er644CoMpeCaM
         xID3fvlAqbogGZOKVZpYNehoTVwWFUwZD620usfFZJOrQKwxI2Z9Uh6jwF9awMl53slY
         duLWZlu+lZCIRu8vMp0H7EnyY3xi8BUMhEUs6Th1a4m956AI7P3f8W1dnIrbzTbxXSHL
         c7jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781857353; x=1782462153; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WecHCv13rG5Qr395P8gqLpoRjr3ajKQ15qH0wjMFBvs=;
        b=M/tHg6j+C6Vqmb/h1lmvTrgicl8vxiiubgA1EJ+cghpMBmPAQeFLRb4qCFDjAs5lmJ
         Z7pzAd/CL2EhpDHkaENZPa7iepzhfPWHHVx4xagYiJ+AGu/6ykTbOCZyWzum8UoUhs1t
         YS0MyqEUR4MjiRqyIFBFrGQ76ZDD4MTTCABWChiekxTXWqdfB2bAJRJtIgN34ew0SD+X
         2cF3mifgNEivRi1v5D0n76RSKqlY+iuWu02K0Nvhacpop1TvVZl75YlzAkMugSp2PQyk
         1Gd2nQhKkiHpxkfOnGZUUvyHLz5kXGhLyALD0aQxxPem3zzbBj74S/5vya2VGnip//EZ
         kHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857353; x=1782462153;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WecHCv13rG5Qr395P8gqLpoRjr3ajKQ15qH0wjMFBvs=;
        b=ItNyGNh50O9c1oT3yemrvlqzfXEPW7gbMPMJM+PCc1OtLPzW3LaZzZIqEVbxHBbY2F
         M2qRLQbLTjES9gtmIeyFWH/5mGrnYbVi0VpI1fhQRoE1ZQa5X9q+BzseidkJ5yRbgPpG
         KftQQ3QnQuKNMftldUOgxmXHG6WzdC4SbJ087FUqrjEQGE+j/c6vUHSAnVRL6sxc5sSf
         vv4gw5qMyZjoditaif9PWEiUyQ6PJl/6Fp77wNa1ucVXvQUgUznkiGYYikVyhyZkAGkY
         tko2bl1oMJJ8dw32+2ykuR+d0QSgZ0rzun7p69JVtGpJ9MM6VW99XQEZDZt95T4Tpk37
         ZW0g==
X-Forwarded-Encrypted: i=1; AFNElJ8TG2ecM4M5X2HepdcNOnzWBTtmV2Ai+o45R18m/IdWeSmfdxw0PRPbbzlWD6HLYz4+taOifRd7ybg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh64/hd6ukQDRcKqoxO/A5ci0FYlnl2lbQFlEyCAjcuIv9ms1P
	DzAVU0HuaKsdIOfKECrr6N487JxwXl1/eY550NtK/pEvn8ITqG3m4sIzKf9/dOYMOuUrdqzTm51
	v8Q5V8uH7s+9QbQuxLJUsRLZvOd6/AFNclLUJ7D6K
X-Gm-Gg: AfdE7cmxMsv/0KHNewbwh9SCURLWn6phAsX8fHUt/RR1KpbL7USUfDTDKshfLxH5JJr
	Wa8rNfAylbtjqOobUXlNRyyn9sZUKPCVmXi/wWBISGdDzAYGho7exupJWXVov9Wx9cqOjl7apmC
	l2unL4IlunbbxbtTGeUsJv7IGKIzg0Vft/tPIuTDqWc0CD5EgqYiu1hTiIwoXQDARvA8OWeHwnm
	V0FWipsYePTXIHAu1ALnqmezVW1DImznDkZ4OMhrp75sfqH9jnx/EbDGw1A8r3JH+BaNYVBAzsR
	dIAWo4zq
X-Received: by 2002:a05:622a:1b1d:b0:516:3def:1cf4 with SMTP id
 d75a77b69052e-519e877e8c5mr4724561cf.1.1781857352209; Fri, 19 Jun 2026
 01:22:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-8-9d2959357853@google.com> <CA+EHjTw6x-mxDnJjnhE-6SV73tMrb0paKDTtOC2j6zJ1fXZDLA@mail.gmail.com>
In-Reply-To: <CA+EHjTw6x-mxDnJjnhE-6SV73tMrb0paKDTtOC2j6zJ1fXZDLA@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 09:21:55 +0100
X-Gm-Features: AVVi8CebV0NVi3MbMdc8DhRrav01L0h7Tt3z2YxRqWoRJXqhOu4WExRErk69dGE
Message-ID: <CA+EHjTxu32nQ+vPV7Zmcw76_-V4g2_g=P_UzRnnO2dP1PFO2ww@mail.gmail.com>
Subject: Re: [PATCH v8 08/46] KVM: Provide generic interface for checking
 memory private/shared status
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 09:19, Fuad Tabba <tabba@google.com> wrote:
>
> On Fri, 19 Jun 2026 at 01:31, Ackerley Tng via B4 Relay
> <devnull+ackerleytng.google.com@kernel.org> wrote:
> >
> > From: Sean Christopherson <seanjc@google.com>
> >
> > Introduce a generic kvm_mem_is_private() interface using a static call to
> > determine if a GFN is private. This allows the implementation for checking
> > a GFN's private/shared status to be set at runtime.
> >
> > In preparation for choosing implementations between a guest_memfd lookup
> > and the existing VM attribute lookup, rename the existing
> > VM-attribute-based check to kvm_vm_mem_is_private to emphasize that it
> > looks up VM attributes.
> >
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
>
> (SoB fix plz)
>
> Reviewed-by: Fuad Tabba <tabba@google.com>
>
> Cheers,
> /fuad
> > ---
> >  include/linux/kvm_host.h | 12 +++++++++++-
> >  virt/kvm/kvm_main.c      | 15 +++++++++++++++
> >  2 files changed, 26 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index eb26d4ea8945a..3915da2a61778 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -2546,7 +2546,7 @@ bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
> >  bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
> >                                          struct kvm_gfn_range *range);
> >
> > -static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> > +static inline bool kvm_vm_mem_is_private(struct kvm *kvm, gfn_t gfn)

Should have read the Sashiko review first, but where is this used?
It's not used at all in this series...

/fuad

> >  {
> >         return kvm_get_vm_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
> >  }
> > @@ -2557,6 +2557,16 @@ static inline bool kvm_mem_range_is_private(struct kvm *kvm, gfn_t start,
> >                                                   KVM_MEMORY_ATTRIBUTE_PRIVATE,
> >                                                   KVM_MEMORY_ATTRIBUTE_PRIVATE);
> >  }
> > +#endif  /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
> > +
> > +#ifdef kvm_arch_has_private_mem
> > +typedef bool (kvm_mem_is_private_t)(struct kvm *kvm, gfn_t gfn);
> > +DECLARE_STATIC_CALL(__kvm_mem_is_private, kvm_mem_is_private_t);
> > +
> > +static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> > +{
> > +       return static_call(__kvm_mem_is_private)(kvm, gfn);
> > +}
> >  #else
> >  static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> >  {
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 6669f1477013c..8b238e461b854 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -2627,6 +2627,20 @@ static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
> >  }
> >  #endif /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
> >
> > +#ifdef kvm_arch_has_private_mem
> > +DEFINE_STATIC_CALL_RET0(__kvm_mem_is_private, kvm_mem_is_private_t);
> > +EXPORT_STATIC_CALL_GPL(__kvm_mem_is_private);
> > +
> > +static void kvm_init_memory_attributes(void)
> > +{
> > +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
> > +       static_call_update(__kvm_mem_is_private, kvm_vm_mem_is_private);
> > +#endif
> > +}
> > +#else
> > +static void kvm_init_memory_attributes(void) { }
> > +#endif
> > +
> >  struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn)
> >  {
> >         return __gfn_to_memslot(kvm_memslots(kvm), gfn);
> > @@ -6528,6 +6542,7 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
> >         kvm_preempt_ops.sched_in = kvm_sched_in;
> >         kvm_preempt_ops.sched_out = kvm_sched_out;
> >
> > +       kvm_init_memory_attributes();
> >         kvm_init_debug();
> >
> >         r = kvm_vfio_ops_init();
> >
> > --
> > 2.55.0.rc0.738.g0c8ab3ebcc-goog
> >
> >
