Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TaYW9onr"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C18113
	for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 23:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701154908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TFm09BdRgr9hMTLD1yLTzer1bL4YuNmrnI5hvmqZVZ4=;
	b=TaYW9onre+X4u+pU5istavdZSFc0Lx+VQQgLB8ddfTuiXzJltFNIDsQw5Xc1DHvL/7Ph8T
	UFshCl2dWN/WUvSUCVCVz3R2CtiE8vlgm8Y9ZMBLX9tDdUd9izEgZfQ9wTfvEF5xA9B668
	Q9/smGaj3IDYACVqcXTtisgQlBc4+q8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-43T5ovvZPFWtrbv2K-a2vw-1; Tue, 28 Nov 2023 02:01:46 -0500
X-MC-Unique: 43T5ovvZPFWtrbv2K-a2vw-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-332e18f4fdbso3062255f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 23:01:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701154905; x=1701759705;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TFm09BdRgr9hMTLD1yLTzer1bL4YuNmrnI5hvmqZVZ4=;
        b=bRQPePjp/s1qEr6eAp939LwYvJAP+I3ZF6i6r1CEmixElM4fWrzOHBPfUKtRvJmpGa
         K7N7XNlUC+nPf2xcFyaU6prJc7IKjWsIQ09nBz1J0nn+Lt413vq4YcGbzWDH8FhhUFZX
         JN8/Ha6ESVtwae+mooLpS/A6eo/yghTbwv3OU6TEa+OVjkONYVDhxuxIpF6bmX096jRy
         Fs6tgku5PpXh6nGcjUGuk+xW5/nVSb9X2qxeqAx9cs4pq7GftnsOJ0FY7aQOk6PYjQ5+
         kUYuHWsxQb8aeIAni4oYVQCuAmDzyh9zn0+cX4CEMiUWwp0Sl2MsA8UTn3/PVqEGkVZF
         Op7A==
X-Gm-Message-State: AOJu0YyQZ8bHrNgbGIT9LPgS9lQm67xLQBS79QeA8Xnh5DoeB+8r8xma
	ARnmKrRCzvEIJC3h0H19t+g3P7w96m2nvTpPD/W0dXBlEzAgseBiyWzB5zs7ZhqJ61vrmtXCLLo
	a78/GPfg47AFOHebHVL6P
X-Received: by 2002:a5d:5551:0:b0:332:eaa7:56b1 with SMTP id g17-20020a5d5551000000b00332eaa756b1mr10473135wrw.37.1701154905460;
        Mon, 27 Nov 2023 23:01:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJh6KHVnFuAmI4DNL88OhLS0ibEFFHYEoJGgdx0+cxUbi599XVe0FHmIVi7s/oyOMg/Kx2rQ==
X-Received: by 2002:a5d:5551:0:b0:332:eaa7:56b1 with SMTP id g17-20020a5d5551000000b00332eaa756b1mr10473106wrw.37.1701154905161;
        Mon, 27 Nov 2023 23:01:45 -0800 (PST)
Received: from starship ([77.137.131.4])
        by smtp.gmail.com with ESMTPSA id l12-20020a5d4bcc000000b00332fbc183ebsm6535150wrt.76.2023.11.27.23.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 23:01:44 -0800 (PST)
Message-ID: <04a6495330967c74cb6e6e122a634992bb3efa0e.camel@redhat.com>
Subject: Re: [RFC 04/33] KVM: x86: hyper-v: Move hypercall page handling
 into separate function
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Nicolas Saenz Julienne <nsaenz@amazon.com>, kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 pbonzini@redhat.com, seanjc@google.com, vkuznets@redhat.com,
 anelkz@amazon.com,  graf@amazon.com, dwmw@amazon.co.uk, jgowans@amazon.com,
 corbert@lwn.net,  kys@microsoft.com, haiyangz@microsoft.com,
 decui@microsoft.com, x86@kernel.org,  linux-doc@vger.kernel.org
Date: Tue, 28 Nov 2023 09:01:42 +0200
In-Reply-To: <20231108111806.92604-5-nsaenz@amazon.com>
References: <20231108111806.92604-1-nsaenz@amazon.com>
	 <20231108111806.92604-5-nsaenz@amazon.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2023-11-08 at 11:17 +0000, Nicolas Saenz Julienne wrote:
> The hypercall page patching is about to grow considerably, move it into
> its own function.
> 
> No functional change intended.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
> ---
>  arch/x86/kvm/hyperv.c | 69 ++++++++++++++++++++++++-------------------
>  1 file changed, 39 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
> index e1bc861ab3b0..78d053042667 100644
> --- a/arch/x86/kvm/hyperv.c
> +++ b/arch/x86/kvm/hyperv.c
> @@ -256,6 +256,42 @@ static void synic_exit(struct kvm_vcpu_hv_synic *synic, u32 msr)
>  	kvm_make_request(KVM_REQ_HV_EXIT, vcpu);
>  }
>  
> +static int patch_hypercall_page(struct kvm_vcpu *vcpu, u64 data)
> +{
> +	struct kvm *kvm = vcpu->kvm;
> +	u8 instructions[9];
> +	int i = 0;
> +	u64 addr;
> +
> +	/*
> +	 * If Xen and Hyper-V hypercalls are both enabled, disambiguate
> +	 * the same way Xen itself does, by setting the bit 31 of EAX
> +	 * which is RsvdZ in the 32-bit Hyper-V hypercall ABI and just
> +	 * going to be clobbered on 64-bit.
> +	 */
> +	if (kvm_xen_hypercall_enabled(kvm)) {
> +		/* orl $0x80000000, %eax */
> +		instructions[i++] = 0x0d;
> +		instructions[i++] = 0x00;
> +		instructions[i++] = 0x00;
> +		instructions[i++] = 0x00;
> +		instructions[i++] = 0x80;
> +	}
> +
> +	/* vmcall/vmmcall */
> +	static_call(kvm_x86_patch_hypercall)(vcpu, instructions + i);
> +	i += 3;
> +
> +	/* ret */
> +	((unsigned char *)instructions)[i++] = 0xc3;
> +
> +	addr = data & HV_X64_MSR_HYPERCALL_PAGE_ADDRESS_MASK;
> +	if (kvm_vcpu_write_guest(vcpu, addr, instructions, i))
> +		return 1;
> +
> +	return 0;
> +}
> +
>  static int synic_set_msr(struct kvm_vcpu_hv_synic *synic,
>  			 u32 msr, u64 data, bool host)
>  {
> @@ -1338,11 +1374,7 @@ static int kvm_hv_set_msr_pw(struct kvm_vcpu *vcpu, u32 msr, u64 data,
>  		if (!hv->hv_guest_os_id)
>  			hv->hv_hypercall &= ~HV_X64_MSR_HYPERCALL_ENABLE;
>  		break;
> -	case HV_X64_MSR_HYPERCALL: {
> -		u8 instructions[9];
> -		int i = 0;
> -		u64 addr;
> -
> +	case HV_X64_MSR_HYPERCALL:
>  		/* if guest os id is not set hypercall should remain disabled */
>  		if (!hv->hv_guest_os_id)
>  			break;
> @@ -1351,34 +1383,11 @@ static int kvm_hv_set_msr_pw(struct kvm_vcpu *vcpu, u32 msr, u64 data,
>  			break;
>  		}
>  
> -		/*
> -		 * If Xen and Hyper-V hypercalls are both enabled, disambiguate
> -		 * the same way Xen itself does, by setting the bit 31 of EAX
> -		 * which is RsvdZ in the 32-bit Hyper-V hypercall ABI and just
> -		 * going to be clobbered on 64-bit.
> -		 */
> -		if (kvm_xen_hypercall_enabled(kvm)) {
> -			/* orl $0x80000000, %eax */
> -			instructions[i++] = 0x0d;
> -			instructions[i++] = 0x00;
> -			instructions[i++] = 0x00;
> -			instructions[i++] = 0x00;
> -			instructions[i++] = 0x80;
> -		}
> -
> -		/* vmcall/vmmcall */
> -		static_call(kvm_x86_patch_hypercall)(vcpu, instructions + i);
> -		i += 3;
> -
> -		/* ret */
> -		((unsigned char *)instructions)[i++] = 0xc3;
> -
> -		addr = data & HV_X64_MSR_HYPERCALL_PAGE_ADDRESS_MASK;
> -		if (kvm_vcpu_write_guest(vcpu, addr, instructions, i))
> +		if (patch_hypercall_page(vcpu, data))
>  			return 1;
> +
>  		hv->hv_hypercall = data;
>  		break;
> -	}
>  	case HV_X64_MSR_REFERENCE_TSC:
>  		hv->hv_tsc_page = data;
>  		if (hv->hv_tsc_page & HV_X64_MSR_TSC_REFERENCE_ENABLE) {


This looks like another nice cleanup that can be accepted to the kvm,
before the main VTL patch series.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky




