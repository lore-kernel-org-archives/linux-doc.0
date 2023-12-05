Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AHThslmY"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED495A9
	for <linux-doc@vger.kernel.org>; Tue,  5 Dec 2023 07:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701788601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RVfnz9yEraI13QEVMWCv15KSWf2rbynT5uHuzX4Khhk=;
	b=AHThslmYQ0ft76mCXsWTQZDafqBDw3R1qzRezHKzuHWoi2PsvXPWHm/l0+s3yYlAwYzZY6
	EnivNxIM9zAl8yZ99bFFifMHo6Be3hb6MD37uwZPa5Ry/jaUOOJcy8CmW0ixBJfgnNrl0K
	E9a7MXv8LNWe66P09zWD4i2RZCFgWas=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-HstHri1ZOtqHT7M9MO7Pqw-1; Tue, 05 Dec 2023 10:03:01 -0500
X-MC-Unique: HstHri1ZOtqHT7M9MO7Pqw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-40b4e24adc7so40816835e9.0
        for <linux-doc@vger.kernel.org>; Tue, 05 Dec 2023 07:02:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701788563; x=1702393363;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RVfnz9yEraI13QEVMWCv15KSWf2rbynT5uHuzX4Khhk=;
        b=vtts0w2qt7f+YkRTh+EBxX7WeeDJNckMcbcN3JE3PlqD33HYao5krMnYP3Gg9C6Q/e
         6xxS2crxJ0C3c+xnJmL5+LH2uS9EbS94FTHu+PfqFwZ42M4g8NXpRUBi4u1IEwIxHuCd
         S7IqmB6x+ji47yqM/Jmel4F+rFuznVePLLo3t7sfrsJMUrs1gvygsMRLCXCquA1chni/
         qf/Tq6v5hw+2B/SiObUvWbxKnc16mGZU1SnIGz02d/QWmKfvLgPhk67AxIflzTDtaWQU
         xLJUdtmeRMV5SKoFDcF5yVHJ35Vc8w+nbYBwKWn1+Co4PJRuc1zJspO8UJUFr3tvm3A1
         rPXA==
X-Gm-Message-State: AOJu0Yyw9QUqbTqF1N4yrFVxtJ/vr3U/6MCDWKSzoOFb6HmzjlPmKcB1
	LWkIuORACbz5T4Lex9dAP9FqRCoWT7WqCM1pjrEXeUqaycKxlrpVICc+QKvKVqmVdsBA87Xhp8s
	/cS0y/grUPy9NXmKBdecH
X-Received: by 2002:a05:600c:4506:b0:40b:37ef:3671 with SMTP id t6-20020a05600c450600b0040b37ef3671mr4708323wmo.38.1701788563082;
        Tue, 05 Dec 2023 07:02:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFw+ZIqFfTxBo1MNegF8bmaDRUQK0S0GcC3WZpfcXrIP2tAUAD/esumx04OeKShDkq6yYuUlA==
X-Received: by 2002:a05:600c:4506:b0:40b:37ef:3671 with SMTP id t6-20020a05600c450600b0040b37ef3671mr4708304wmo.38.1701788562696;
        Tue, 05 Dec 2023 07:02:42 -0800 (PST)
Received: from starship ([89.237.98.20])
        by smtp.gmail.com with ESMTPSA id g16-20020a05600c4ed000b0040b47c53610sm18964395wmq.14.2023.12.05.07.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 07:02:42 -0800 (PST)
Message-ID: <72ab3fa2932dc661a4e0e124ac630e6bb269ebd4.camel@redhat.com>
Subject: Re: [RFC 06/33] KVM: x86: hyper-v: Introduce VTL awareness to
 Hyper-V's PV-IPIs
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Nicolas Saenz Julienne <nsaenz@amazon.com>, kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 pbonzini@redhat.com, seanjc@google.com, vkuznets@redhat.com,
 anelkz@amazon.com,  graf@amazon.com, dwmw@amazon.co.uk, jgowans@amazon.com,
 corbert@lwn.net,  kys@microsoft.com, haiyangz@microsoft.com,
 decui@microsoft.com, x86@kernel.org,  linux-doc@vger.kernel.org
Date: Tue, 05 Dec 2023 17:02:40 +0200
In-Reply-To: <CXD538WSGHGC.BMUQF0OJSSW4@amazon.com>
References: <20231108111806.92604-1-nsaenz@amazon.com>
	 <20231108111806.92604-7-nsaenz@amazon.com>
	 <9249b4b84f7b84da2ea21fbbbabf35f22e5d9f2f.camel@redhat.com>
	 <CXD538WSGHGC.BMUQF0OJSSW4@amazon.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Fri, 2023-12-01 at 16:31 +0000, Nicolas Saenz Julienne wrote:
> On Tue Nov 28, 2023 at 7:14 AM UTC, Maxim Levitsky wrote:
> > On Wed, 2023-11-08 at 11:17 +0000, Nicolas Saenz Julienne wrote:
> > > HVCALL_SEND_IPI and HVCALL_SEND_IPI_EX allow targeting specific a
> > > specific VTL. Honour the requests.
> > > 
> > > Signed-off-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
> > > ---
> > >  arch/x86/kvm/hyperv.c             | 24 +++++++++++++++++-------
> > >  arch/x86/kvm/trace.h              | 20 ++++++++++++--------
> > >  include/asm-generic/hyperv-tlfs.h |  6 ++++--
> > >  3 files changed, 33 insertions(+), 17 deletions(-)
> > > 
> > > diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
> > > index d4b1b53ea63d..2cf430f6ddd8 100644
> > > --- a/arch/x86/kvm/hyperv.c
> > > +++ b/arch/x86/kvm/hyperv.c
> > > @@ -2230,7 +2230,7 @@ static u64 kvm_hv_flush_tlb(struct kvm_vcpu *vcpu, struct kvm_hv_hcall *hc)
> > >  }
> > > 
> > >  static void kvm_hv_send_ipi_to_many(struct kvm *kvm, u32 vector,
> > > -                                 u64 *sparse_banks, u64 valid_bank_mask)
> > > +                                 u64 *sparse_banks, u64 valid_bank_mask, int vtl)
> > >  {
> > >       struct kvm_lapic_irq irq = {
> > >               .delivery_mode = APIC_DM_FIXED,
> > > @@ -2245,6 +2245,9 @@ static void kvm_hv_send_ipi_to_many(struct kvm *kvm, u32 vector,
> > >                                           valid_bank_mask, sparse_banks))
> > >                       continue;
> > > 
> > > +             if (kvm_hv_get_active_vtl(vcpu) != vtl)
> > > +                     continue;
> > 
> > Do I understand correctly that this is a temporary limitation?
> > In other words, can a vCPU running in VTL1 send an IPI to a vCPU running VTL0,
> > forcing the target vCPU to do async switch to VTL1?
> > I think that this is possible.
> 
> The diff is missing some context. See this simplified implementation
> (when all_cpus is set in the parent function):
> 
> static void kvm_hv_send_ipi_to_many(struct kvm *kvm, u32 vector, int vtl)
> {
> 	[...]
> 	kvm_for_each_vcpu(i, vcpu, kvm) {
> 		if (kvm_hv_get_active_vtl(vcpu) != vtl)
> 			continue;
> 
> 		kvm_apic_set_irq(vcpu, &irq, NULL);
> 	}
> }
> 
> With the one vCPU per VTL approach, kvm_for_each_vcpu() will iterate
> over *all* vCPUs regardless of their VTL. The IPI is targetted at a
> specific VTL, hence the need to filter.
> 
> VTL1 -> VTL0 IPIs are supported and happen (although they are extremely
> rare).

Makes sense now, thanks!

Best regards,
	Maxim Levitsky

> 
> Nicolas
> 


