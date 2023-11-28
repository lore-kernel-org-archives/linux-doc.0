Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RqK/fJnc"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 344F5183
	for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 23:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701157317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hj+ePaztyH38XwsDFKaGQMIHjoROMLLdxOGdK4dpGbY=;
	b=RqK/fJncvV/YqSmiQRrvFTCEhjIf3tYiT4j7tIV+J/DejOWlx9kZuQC0eC4W/mXl8qfUxl
	IE0f2jXlv1segst86694EFHRi/q2ex5qSZoCK8C9mfXrN1WehMNxyVTwhtsZe7WF9j5i5q
	JJSpey4kdMvIyx1XhJO20yBZm0tM12U=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-MTWyVOurOzqFyjDTx53JRA-1; Tue, 28 Nov 2023 02:41:50 -0500
X-MC-Unique: MTWyVOurOzqFyjDTx53JRA-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2c8749e1c2dso43485441fa.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 23:41:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701157309; x=1701762109;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hj+ePaztyH38XwsDFKaGQMIHjoROMLLdxOGdK4dpGbY=;
        b=laXdvPPkts3ko8wDwPs/n0k9Jns6CALpe6qV0ghI9piTablEXHxjmdY+GimQxO0dCm
         aKBQ/WXDE/4CPl/3YxDUZHzyo8cRR/XQu1ngvzUhh9UOK3rfEmhe/ZzZd5X5SQREs1ap
         lJGXXDhAk0ifu4dKhiWQ9372K8kShB6UVQ4shuQD5sn53DwmXfZYKjPxDtudJ62qjR4n
         yy8uca+EXXuFoBGRnZ277/K7SkgWe3r2GO1z+V9Cg7H5vGErw22l7rU3E4f0spNkT1sP
         YdxjgC/KrOqN+tJQBHVk+LM+PWiNOAh/d4JDkwV4hB062j9EnteRE6APqK17tzVeAu/m
         o0Bg==
X-Gm-Message-State: AOJu0YxcAbSxzRIWvVbd8LbYFqQED1epEBxZQ4DiBZspd2rBHHP7GJMl
	h/6S2HZtkAaDwNr3OVSuad2rXt1nsKGUZh/c1QsVcWesy+RYqUabuobi6o7OfKCbslAxGKmehXi
	4BSpHFEojmRcTyMgo0Lqo
X-Received: by 2002:a2e:9e8a:0:b0:2b9:412a:111d with SMTP id f10-20020a2e9e8a000000b002b9412a111dmr9369587ljk.42.1701157309359;
        Mon, 27 Nov 2023 23:41:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3FE3J5y8X/hBV92oAOBL8IN3pj8MBH48Z78QOogI1DEahZHBZbEG4Kbce22YYj3CMRPt4sQ==
X-Received: by 2002:a2e:9e8a:0:b0:2b9:412a:111d with SMTP id f10-20020a2e9e8a000000b002b9412a111dmr9369570ljk.42.1701157309050;
        Mon, 27 Nov 2023 23:41:49 -0800 (PST)
Received: from starship ([77.137.131.4])
        by smtp.gmail.com with ESMTPSA id q19-20020a05600c46d300b0040b35195e54sm16408634wmo.5.2023.11.27.23.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 23:41:48 -0800 (PST)
Message-ID: <24f037ee4547a1726e358900a63755f5db0e6f39.camel@redhat.com>
Subject: Re: [RFC 18/33] KVM: x86: Decouple kvm_get_memory_attributes() from
 struct kvm's mem_attr_array
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Nicolas Saenz Julienne <nsaenz@amazon.com>, kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 pbonzini@redhat.com, seanjc@google.com, vkuznets@redhat.com,
 anelkz@amazon.com,  graf@amazon.com, dwmw@amazon.co.uk, jgowans@amazon.com,
 corbert@lwn.net,  kys@microsoft.com, haiyangz@microsoft.com,
 decui@microsoft.com, x86@kernel.org,  linux-doc@vger.kernel.org
Date: Tue, 28 Nov 2023 09:41:46 +0200
In-Reply-To: <20231108111806.92604-19-nsaenz@amazon.com>
References: <20231108111806.92604-1-nsaenz@amazon.com>
	 <20231108111806.92604-19-nsaenz@amazon.com>
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
> Decouple kvm_get_memory_attributes() from struct kvm's mem_attr_array to
> allow other memory attribute sources to use the function.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
> ---
>  arch/x86/kvm/mmu/mmu.c   | 5 +++--
>  include/linux/kvm_host.h | 8 +++++---
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index a1fbb905258b..96421234ca88 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -7301,7 +7301,7 @@ static bool hugepage_has_attrs(struct kvm *kvm, struct kvm_memory_slot *slot,
>  
>  	for (gfn = start; gfn < end; gfn += KVM_PAGES_PER_HPAGE(level - 1)) {
>  		if (hugepage_test_mixed(slot, gfn, level - 1) ||
> -		    attrs != kvm_get_memory_attributes(kvm, gfn))
> +		    attrs != kvm_get_memory_attributes(&kvm->mem_attr_array, gfn))
>  			return false;
>  	}
>  	return true;
> @@ -7401,7 +7401,8 @@ void kvm_mmu_init_memslot_memory_attributes(struct kvm *kvm,
>  		 * be manually checked as the attributes may already be mixed.
>  		 */
>  		for (gfn = start; gfn < end; gfn += nr_pages) {
> -			unsigned long attrs = kvm_get_memory_attributes(kvm, gfn);
> +			unsigned long attrs =
> +				kvm_get_memory_attributes(&kvm->mem_attr_array, gfn);
>  
>  			if (hugepage_has_attrs(kvm, slot, gfn, level, attrs))
>  				hugepage_clear_mixed(slot, gfn, level);
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 631fd532c97a..4242588e3dfb 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2385,9 +2385,10 @@ static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
>  }
>  
>  #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> -static inline unsigned long kvm_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
> +static inline unsigned long
> +kvm_get_memory_attributes(struct xarray *mem_attr_array, gfn_t gfn)
>  {
> -	return xa_to_value(xa_load(&kvm->mem_attr_array, gfn));
> +	return xa_to_value(xa_load(mem_attr_array, gfn));
>  }

Can we wrap the 'struct xarray *' with a struct even if it will have a single member
to make it clearer what type the 'kvm_get_memory_attributes' receives.
Also maybe rename this to something like 'kvm_get_memory_attributes_for_gfn'?

>  
>  bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> @@ -2400,7 +2401,8 @@ bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
>  static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>  {
>  	return IS_ENABLED(CONFIG_KVM_PRIVATE_MEM) &&
> -	       kvm_get_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
> +	       kvm_get_memory_attributes(&kvm->mem_attr_array, gfn) &
> +		       KVM_MEMORY_ATTRIBUTE_PRIVATE;
>  }
>  #else
>  static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)


Also if we go with VM per VTL approach, we won't need this, each VM can already have its own memory attributes.

Best regards,
	Maxim Levitsky



