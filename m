Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D7cHiGZt"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E851182
	for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 23:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701156522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y5BdmHDgt38rlTrgeOjpNrZmrPx70EBF4G1nvkRBLTc=;
	b=D7cHiGZtbRPMoVo6ImIFpzGTpg+flXP2ETynXTe++VLfSr4m6QsvFJp/Y1jX8CQsQZQVsd
	mP3k7M2ZegzqoLAP/dEO220sko8g/kF8d/gcV20FMc3Ang2joDYeaIwxFRGQR8exYO4X8l
	wu8AKQz5s1a1tdBSRp6xNIX6+Ttf9Mg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-Yck5gJXEO_O4Z0iOt0LMkQ-1; Tue, 28 Nov 2023 02:28:41 -0500
X-MC-Unique: Yck5gJXEO_O4Z0iOt0LMkQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-332f91f43cfso1875300f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 23:28:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701156520; x=1701761320;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y5BdmHDgt38rlTrgeOjpNrZmrPx70EBF4G1nvkRBLTc=;
        b=JOniUSQ2zVIH4l8m49qESJ1+83CadthLOXBvtKeYtDxNPlen/lIDD2UyALRskDmdMv
         tjHARqPvITmx6GgF9lB56bM1HB7VampjpLMpjD9GpJ9I9bMFxo+588mtPo8Cp8FSSbIE
         oADZnGuub/UMWDau81CYIsovyG4USl9U8/sBIdwMLMx8pABR+YkeqYnwUcvEX0LwgZBv
         tj4BjSphcRrWVE61mOKwHjWnUS5xXidZzqkmhkHK5f4naojr9R3gdajodVqYJ4/5iLR3
         tY2khRVfZ9enmBygiNHYgIa4AeSklzwAejM6Uy7KG5KkhN5Ogwzt7nh2556107ErlQSG
         p4MQ==
X-Gm-Message-State: AOJu0YzzyvD3j60MM7XeyD9JS3ysx6+yshSY5e3e6yeK8GViFsvI1GiD
	U9ELuORuaWaHRYGMOjnPjZujb661Jbo/FvCcCHcga9kU7FvgWTAYufhGY5XmFl98hbrP//LjBKu
	gzlZmB24HWWwm+j7cO9pl
X-Received: by 2002:a5d:424a:0:b0:332:c5f8:a082 with SMTP id s10-20020a5d424a000000b00332c5f8a082mr10166417wrr.13.1701156520354;
        Mon, 27 Nov 2023 23:28:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZq3ysto0FjKshj9voU9tQJ6efJmJfszdfClmLvNLefhFl6RycgLDTK4Zz2uTRdBk65VFnUg==
X-Received: by 2002:a5d:424a:0:b0:332:c5f8:a082 with SMTP id s10-20020a5d424a000000b00332c5f8a082mr10166397wrr.13.1701156520034;
        Mon, 27 Nov 2023 23:28:40 -0800 (PST)
Received: from starship ([77.137.131.4])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c475500b0040b2976eb02sm16296878wmo.10.2023.11.27.23.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 23:28:39 -0800 (PST)
Message-ID: <70d51e5f3b202a059009913f165b133265ea4cc2.camel@redhat.com>
Subject: Re: [RFC 12/33] KVM: x86: hyper-v: Handle VSM hcalls in user-space
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Nicolas Saenz Julienne <nsaenz@amazon.com>, kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 pbonzini@redhat.com, seanjc@google.com, vkuznets@redhat.com,
 anelkz@amazon.com,  graf@amazon.com, dwmw@amazon.co.uk, jgowans@amazon.com,
 corbert@lwn.net,  kys@microsoft.com, haiyangz@microsoft.com,
 decui@microsoft.com, x86@kernel.org,  linux-doc@vger.kernel.org
Date: Tue, 28 Nov 2023 09:28:37 +0200
In-Reply-To: <20231108111806.92604-13-nsaenz@amazon.com>
References: <20231108111806.92604-1-nsaenz@amazon.com>
	 <20231108111806.92604-13-nsaenz@amazon.com>
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
> Let user-space handle all hypercalls that fall under the AccessVsm
> partition privilege flag. That is:
>  - HVCALL_MODIFY_VTL_PROTECTION_MASK:
>  - HVCALL_ENABLE_PARTITION_VTL:
>  - HVCALL_ENABLE_VP_VTL:
>  - HVCALL_VTL_CALL:
>  - HVCALL_VTL_RETURN:
> The hypercalls are processed through the KVM_EXIT_HYPERV_HVCALL exit.
> Additionally, expose the cpuid bit.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
> ---
>  arch/x86/kvm/hyperv.c             | 15 +++++++++++++++
>  include/asm-generic/hyperv-tlfs.h |  7 ++++++-
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
> index a3970d52eef1..a266c5d393f5 100644
> --- a/arch/x86/kvm/hyperv.c
> +++ b/arch/x86/kvm/hyperv.c
> @@ -2462,6 +2462,11 @@ static bool kvm_hv_is_xmm_output_hcall(u16 code)
>  	return false;
>  }
>  
> +static inline bool kvm_hv_is_vtl_call_return(u16 code)
> +{
> +	return code == HVCALL_VTL_CALL || code == HVCALL_VTL_RETURN;
> +}
> +
>  static int kvm_hv_hypercall_complete_userspace(struct kvm_vcpu *vcpu)
>  {
>  	bool fast = !!(vcpu->run->hyperv.u.hcall.input & HV_HYPERCALL_FAST_BIT);
> @@ -2471,6 +2476,9 @@ static int kvm_hv_hypercall_complete_userspace(struct kvm_vcpu *vcpu)
>  	if (kvm_hv_is_xmm_output_hcall(code) && hv_result_success(result) && fast)
>  		kvm_hv_write_xmm(vcpu->run->hyperv.u.hcall.xmm);
>  
> +	if (kvm_hv_is_vtl_call_return(code))
> +		return kvm_skip_emulated_instruction(vcpu);

Can you add justification for this?
If this is justified, does it make sense to move this code to kvm_hv_hypercall_complete
(which also calls kvm_skip_emulated_instruction())



> +
>  	return kvm_hv_hypercall_complete(vcpu, result);
>  }
>  
> @@ -2525,6 +2533,7 @@ static bool is_xmm_fast_hypercall(struct kvm_hv_hcall *hc)
>  	case HVCALL_SEND_IPI_EX:
>  	case HVCALL_GET_VP_REGISTERS:
>  	case HVCALL_SET_VP_REGISTERS:
> +	case HVCALL_MODIFY_VTL_PROTECTION_MASK:
>  		return true;
>  	}
>  
> @@ -2745,6 +2754,11 @@ int kvm_hv_hypercall(struct kvm_vcpu *vcpu)
>  		goto hypercall_userspace_exit;
>  	case HVCALL_GET_VP_REGISTERS:
>  	case HVCALL_SET_VP_REGISTERS:
> +	case HVCALL_MODIFY_VTL_PROTECTION_MASK:
> +	case HVCALL_ENABLE_PARTITION_VTL:
> +	case HVCALL_ENABLE_VP_VTL:
> +	case HVCALL_VTL_CALL:
> +	case HVCALL_VTL_RETURN:
>  		goto hypercall_userspace_exit;
>  	default:

Also those new hypercalls also should be added to hv_check_hypercall_access.

>  		ret = HV_STATUS_INVALID_HYPERCALL_CODE;
> @@ -2912,6 +2926,7 @@ int kvm_get_hv_cpuid(struct kvm_vcpu *vcpu, struct kvm_cpuid2 *cpuid,
>  			ent->ebx |= HV_SIGNAL_EVENTS;
>  			ent->ebx |= HV_ENABLE_EXTENDED_HYPERCALLS;
>  			ent->ebx |= HV_ACCESS_VP_REGISTERS;
> +			ent->ebx |= HV_ACCESS_VSM;
>  
>  			ent->edx |= HV_X64_HYPERCALL_XMM_INPUT_AVAILABLE;
>  			ent->edx |= HV_X64_HYPERCALL_XMM_OUTPUT_AVAILABLE;

Best regards,
	Maxim Levitsky

> diff --git a/include/asm-generic/hyperv-tlfs.h b/include/asm-generic/hyperv-tlfs.h
> index 24ea699a3d8e..a8b5c8a84bbc 100644
> --- a/include/asm-generic/hyperv-tlfs.h
> +++ b/include/asm-generic/hyperv-tlfs.h
> @@ -89,6 +89,7 @@
>  #define HV_ACCESS_STATS				BIT(8)
>  #define HV_DEBUGGING				BIT(11)
>  #define HV_CPU_MANAGEMENT			BIT(12)
> +#define HV_ACCESS_VSM				BIT(16)
>  #define HV_ACCESS_VP_REGISTERS			BIT(17)
>  #define HV_ENABLE_EXTENDED_HYPERCALLS		BIT(20)
>  #define HV_ISOLATION				BIT(22)
> @@ -147,9 +148,13 @@ union hv_reference_tsc_msr {
>  /* Declare the various hypercall operations. */
>  #define HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE	0x0002
>  #define HVCALL_FLUSH_VIRTUAL_ADDRESS_LIST	0x0003
> -#define HVCALL_ENABLE_VP_VTL			0x000f
>  #define HVCALL_NOTIFY_LONG_SPIN_WAIT		0x0008
>  #define HVCALL_SEND_IPI				0x000b
> +#define HVCALL_MODIFY_VTL_PROTECTION_MASK	0x000c
> +#define HVCALL_ENABLE_PARTITION_VTL		0x000d
> +#define HVCALL_ENABLE_VP_VTL			0x000f
> +#define HVCALL_VTL_CALL				0x0011
> +#define HVCALL_VTL_RETURN			0x0012
>  #define HVCALL_FLUSH_VIRTUAL_ADDRESS_SPACE_EX	0x0013
>  #define HVCALL_FLUSH_VIRTUAL_ADDRESS_LIST_EX	0x0014
>  #define HVCALL_SEND_IPI_EX			0x0015




