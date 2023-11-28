Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B20RADcp"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 706781AE
	for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 23:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701155779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+wPQpfAGbhR2fcRE9CwV+QhwuDv286D2znD8D3G529g=;
	b=B20RADcpmy/+II5C76Ld4M3+ErJ+GcIaQ/C3K+U/1xhsArGU+/eEjBvyUxTscaqLiMYJj3
	1yWz+45f81vWhKQCL2mnS+xproQu80rHy3SuMQvB5b7O2lyxHa5/zcSYvOJ3dESsZbHcvg
	kZwZSQGKjD/BPiAUVfzVSv83lFQR8L8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-BfURrQLkPc-N1su5piiz3w-1; Tue, 28 Nov 2023 02:16:17 -0500
X-MC-Unique: BfURrQLkPc-N1su5piiz3w-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40b4e24adc7so1311085e9.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 23:16:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701155776; x=1701760576;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+wPQpfAGbhR2fcRE9CwV+QhwuDv286D2znD8D3G529g=;
        b=iTXY5fxF9UGhuVI/GeF8uc5kskw2sIhSfDl0NaeBES77HPQPFPi7HmpJYY+iViqh5a
         rKc7THEemaAKCcJNZM75TEvLwTat+HtQvssKaPPAfHmQWyM/1P8UE6XtZMhrjDO+Ntc+
         UoGQ3bNbUr8ty5W/eq0CY1ZgN+KDWA0JNOMdeFWY0HGWv1KKsytFbqfDHSPnRUbogIfC
         Vjfob9AhvNo3pTbhytl0UQnVZhfmnGju+nv+2xlFDD7WzrZNjrXJ1XpRpdpsNCrM+QKW
         vb7mhN4/I5MA+D/sC3lNKmg0rWp4hM9biMrVq3AhAVYkUxRevmV008mkPntoc45b9/1j
         c7uw==
X-Gm-Message-State: AOJu0YyZFn3c1FPcBoCb1882OdLP/K9rqKmkWrlDsQaPBUQXwXO+RqqI
	GUE2bUKSe4Kg7N5jaRChvACq5TYzbBeAJXy3z3Vg4K97DzcWJsG5FU8IvUaoubLgu9YjkJwqveG
	8Rxmnx+v7Sqbxw1IHFMcj
X-Received: by 2002:a05:600c:4ecb:b0:40b:4b29:aa1c with SMTP id g11-20020a05600c4ecb00b0040b4b29aa1cmr1045332wmq.30.1701155776323;
        Mon, 27 Nov 2023 23:16:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWP9ONc9tOktke0kByXQi1XOIYmIVsWXsJAFkQI6HA50Moog1GCqH/U1U/uYGzT3LG1oIEyA==
X-Received: by 2002:a05:600c:4ecb:b0:40b:4b29:aa1c with SMTP id g11-20020a05600c4ecb00b0040b4b29aa1cmr1045311wmq.30.1701155775947;
        Mon, 27 Nov 2023 23:16:15 -0800 (PST)
Received: from starship ([77.137.131.4])
        by smtp.gmail.com with ESMTPSA id m8-20020a05600c4f4800b0040b347d90d0sm16983794wmq.12.2023.11.27.23.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 23:16:15 -0800 (PST)
Message-ID: <fcd7567a1b45c6779882f696fe2fdac8c6702b3b.camel@redhat.com>
Subject: Re: [RFC 07/33] KVM: x86: hyper-v: Introduce KVM_CAP_HYPERV_VSM
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Nicolas Saenz Julienne <nsaenz@amazon.com>, kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 pbonzini@redhat.com, seanjc@google.com, vkuznets@redhat.com,
 anelkz@amazon.com,  graf@amazon.com, dwmw@amazon.co.uk, jgowans@amazon.com,
 corbert@lwn.net,  kys@microsoft.com, haiyangz@microsoft.com,
 decui@microsoft.com, x86@kernel.org,  linux-doc@vger.kernel.org
Date: Tue, 28 Nov 2023 09:16:13 +0200
In-Reply-To: <20231108111806.92604-8-nsaenz@amazon.com>
References: <20231108111806.92604-1-nsaenz@amazon.com>
	 <20231108111806.92604-8-nsaenz@amazon.com>
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
> Introduce a new capability to enable Hyper-V Virtual Secure Mode (VSM)
> emulation support.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
> ---
>  arch/x86/include/asm/kvm_host.h | 2 ++
>  arch/x86/kvm/hyperv.h           | 5 +++++
>  arch/x86/kvm/x86.c              | 5 +++++
>  include/uapi/linux/kvm.h        | 1 +
>  4 files changed, 13 insertions(+)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 00cd21b09f8c..7712e31b7537 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1118,6 +1118,8 @@ struct kvm_hv {
>  
>  	struct hv_partition_assist_pg *hv_pa_pg;
>  	struct kvm_hv_syndbg hv_syndbg;
> +
> +	bool hv_enable_vsm;
>  };
>  
>  struct msr_bitmap_range {
> diff --git a/arch/x86/kvm/hyperv.h b/arch/x86/kvm/hyperv.h
> index f83b8db72b11..2bfed69ba0db 100644
> --- a/arch/x86/kvm/hyperv.h
> +++ b/arch/x86/kvm/hyperv.h
> @@ -238,4 +238,9 @@ static inline int kvm_hv_verify_vp_assist(struct kvm_vcpu *vcpu)
>  
>  int kvm_hv_vcpu_flush_tlb(struct kvm_vcpu *vcpu);
>  
> +static inline bool kvm_hv_vsm_enabled(struct kvm *kvm)
> +{
> +       return kvm->arch.hyperv.hv_enable_vsm;
> +}
> +
>  #endif
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 4cd3f00475c1..b0512e433032 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -4485,6 +4485,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  	case KVM_CAP_HYPERV_CPUID:
>  	case KVM_CAP_HYPERV_ENFORCE_CPUID:
>  	case KVM_CAP_SYS_HYPERV_CPUID:
> +	case KVM_CAP_HYPERV_VSM:
>  	case KVM_CAP_PCI_SEGMENT:
>  	case KVM_CAP_DEBUGREGS:
>  	case KVM_CAP_X86_ROBUST_SINGLESTEP:
> @@ -6519,6 +6520,10 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>  		}
>  		mutex_unlock(&kvm->lock);
>  		break;
> +	case KVM_CAP_HYPERV_VSM:
> +		kvm->arch.hyperv.hv_enable_vsm = true;
> +		r = 0;
> +		break;
>  	default:
>  		r = -EINVAL;
>  		break;
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 5ce06a1eee2b..168b6ac6ebe5 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -1226,6 +1226,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_GUEST_MEMFD 233
>  #define KVM_CAP_VM_TYPES 234
>  #define KVM_CAP_APIC_ID_GROUPS 235
> +#define KVM_CAP_HYPERV_VSM 237
>  
>  #ifdef KVM_CAP_IRQ_ROUTING
>  

Do we actually need this? Can we detect if the userspace wants VSM using
guest CPUID?

Of course if we need to add a new ioctl or something it will have to be
done together with a new capability, and since we will need at least to
know a vCPU's VTL, we will probably need this capability.

Best regards,
	Maxim Levitsky



