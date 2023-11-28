Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PmtHd46t"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2214137
	for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 23:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701156417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aDhxfrZ6A0IBRHudGpkZAOoM1jn0urSkC0LwcNBapbI=;
	b=PmtHd46tbIcu2J+BCUnymbrUzmgleeKR+UMqo0kE59aOBDEIFSasmApiMHJNMqWlAUFScJ
	rTSY707j7hQycK9vB7a3+vAWuuejqFFZmWXAPn2iY34pveJCFWueDkyy8iT1q3A+ylmaLj
	33i5o4CMKgblazQwmr6uVnemv9C+EmE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-ysphY9OsOQWI1UopfTs5mw-1; Tue, 28 Nov 2023 02:26:52 -0500
X-MC-Unique: ysphY9OsOQWI1UopfTs5mw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-407d3e55927so35597995e9.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 23:26:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701156411; x=1701761211;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aDhxfrZ6A0IBRHudGpkZAOoM1jn0urSkC0LwcNBapbI=;
        b=CuTw8Ad9PkmvyykUSNi44AWibVFWMojoz8wMqjBfs1E09oXRuww166dodvZ0HVka1h
         yblm736zenpZJn5eEgwFd+i3SD7mJoajdHHWwRSJL53zKkDZcFb1gUmsTR5HNkpQJHR2
         NQhRkkTE0d2whcA+UJPDorTimj67WWIyYYlgtJUlAWhd9oMaClcrFnOJxMDRsfwpFf3Z
         cb2owrXZasrL1oJVNGu7WdR5HJbpnmdItYd9lPYWA+rxKAJQNYoqMasivwR0bzeQbhpX
         ha0ofLCdO2QlgHtH1k1nQ9m55bdxHpb/SqLF3+Da9AhwhUcybBepmHO0Qa8mUn/aNmJ5
         oMmg==
X-Gm-Message-State: AOJu0YxoetSLB/2PyxgxIKw3xccQw+SVpBcNn42zqcOM2q7PCXt96I+y
	P3Bwg5udL4ESO4UIkvEWFK+AsM8fLHk2w1Db71hkWBMaQk9pBor3K4WqS2hNsCOzka+5zeyAeVQ
	PFZ1Lh7j0yWmlBf+ShkZR
X-Received: by 2002:a05:600c:1f93:b0:401:2ee0:7558 with SMTP id je19-20020a05600c1f9300b004012ee07558mr10641335wmb.32.1701156411728;
        Mon, 27 Nov 2023 23:26:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4M7NxKP9raF3yxSld89xnv352HPd9UfYd6M9jkbwCiMadp3oGAStD9ceWph2CLoGlKw1rNQ==
X-Received: by 2002:a05:600c:1f93:b0:401:2ee0:7558 with SMTP id je19-20020a05600c1f9300b004012ee07558mr10641324wmb.32.1701156411350;
        Mon, 27 Nov 2023 23:26:51 -0800 (PST)
Received: from starship ([77.137.131.4])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c4f0f00b00405959bbf4fsm16310283wmq.19.2023.11.27.23.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 23:26:51 -0800 (PST)
Message-ID: <38e52b16dfb57d0759b0e196fc952f20a62b0d3f.camel@redhat.com>
Subject: Re: [RFC 11/33] KVM: x86: hyper-v: Handle GET/SET_VP_REGISTER hcall
 in user-space
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Alexander Graf <graf@amazon.com>, Nicolas Saenz Julienne
 <nsaenz@amazon.com>,  kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 pbonzini@redhat.com, seanjc@google.com, vkuznets@redhat.com,
 anelkz@amazon.com,  dwmw@amazon.co.uk, jgowans@amazon.com, corbert@lwn.net,
 kys@microsoft.com,  haiyangz@microsoft.com, decui@microsoft.com,
 x86@kernel.org,  linux-doc@vger.kernel.org
Date: Tue, 28 Nov 2023 09:26:48 +0200
In-Reply-To: <b9c6ad26-ce8b-45f3-b856-8e6be2497f6e@amazon.com>
References: <20231108111806.92604-1-nsaenz@amazon.com>
	 <20231108111806.92604-12-nsaenz@amazon.com>
	 <b9c6ad26-ce8b-45f3-b856-8e6be2497f6e@amazon.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2023-11-08 at 13:14 +0100, Alexander Graf wrote:
> On 08.11.23 12:17, Nicolas Saenz Julienne wrote:
> > Let user-space handle HVCALL_GET_VP_REGISTERS and
> > HVCALL_SET_VP_REGISTERS through the KVM_EXIT_HYPERV_HVCALL exit reason.
> > Additionally, expose the cpuid bit.
> > 
> > Signed-off-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
> > ---
> >   arch/x86/kvm/hyperv.c             | 9 +++++++++
> >   include/asm-generic/hyperv-tlfs.h | 1 +
> >   2 files changed, 10 insertions(+)
> > 
> > diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
> > index caaa859932c5..a3970d52eef1 100644
> > --- a/arch/x86/kvm/hyperv.c
> > +++ b/arch/x86/kvm/hyperv.c
> > @@ -2456,6 +2456,9 @@ static void kvm_hv_write_xmm(struct kvm_hyperv_xmm_reg *xmm)
> >   
> >   static bool kvm_hv_is_xmm_output_hcall(u16 code)
> >   {
> > +	if (code == HVCALL_GET_VP_REGISTERS)
> > +		return true;
> > +
> >   	return false;
> >   }
> >   
> > @@ -2520,6 +2523,8 @@ static bool is_xmm_fast_hypercall(struct kvm_hv_hcall *hc)
> >   	case HVCALL_FLUSH_VIRTUAL_ADDRESS_LIST_EX:
> >   	case HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE_EX:
> >   	case HVCALL_SEND_IPI_EX:
> > +	case HVCALL_GET_VP_REGISTERS:
> > +	case HVCALL_SET_VP_REGISTERS:
> >   		return true;
> >   	}
> >   
> > @@ -2738,6 +2743,9 @@ int kvm_hv_hypercall(struct kvm_vcpu *vcpu)
> >   			break;
> >   		}
> >   		goto hypercall_userspace_exit;
> > +	case HVCALL_GET_VP_REGISTERS:
> > +	case HVCALL_SET_VP_REGISTERS:
> > +		goto hypercall_userspace_exit;
> >   	default:
> >   		ret = HV_STATUS_INVALID_HYPERCALL_CODE;
> >   		break;
> > @@ -2903,6 +2911,7 @@ int kvm_get_hv_cpuid(struct kvm_vcpu *vcpu, struct kvm_cpuid2 *cpuid,
> >   			ent->ebx |= HV_POST_MESSAGES;
> >   			ent->ebx |= HV_SIGNAL_EVENTS;
> >   			ent->ebx |= HV_ENABLE_EXTENDED_HYPERCALLS;
> > +			ent->ebx |= HV_ACCESS_VP_REGISTERS;
> 
> Do we need to guard this?

I think so, check should be added to 'hv_check_hypercall_access'.

I do wonder though why KVM can't just pass all unknown hypercalls to userspace
instead of having a whitelist.


Best regards,
	Maxim Levitsky

> 
> 
> Alex
> 
> 
> 
> 
> Amazon Development Center Germany GmbH
> Krausenstr. 38
> 10117 Berlin
> Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
> Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
> Sitz: Berlin
> Ust-ID: DE 289 237 879
> 
> 




