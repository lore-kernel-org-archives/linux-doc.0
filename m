Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T0/1u7Df"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A3F01AE
	for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 23:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701157363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CEnBNNAbZDViVxp0lQwkboLBGvebtjQoRjp+wXTMCDw=;
	b=T0/1u7DfvtfrKyVMXsGOcywzvoFBqZkE19XLDuCGuI5Iyfgz6KHAzAZK0/5NwmrWKnBOnL
	ufjkO01EF9Jfd29X4jxysBhH8mGCu4G6hLbzZfkYjuKAV6lUHvBdx4RKaDlEl1NKJGWP3U
	Cvagzd/Dn0rEJsa14ig8tnuZsT2M0pk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-LOdCgPArPcWn3lz6D_TlfQ-1; Tue, 28 Nov 2023 02:42:42 -0500
X-MC-Unique: LOdCgPArPcWn3lz6D_TlfQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40b32faeb7eso29435965e9.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 23:42:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701157361; x=1701762161;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CEnBNNAbZDViVxp0lQwkboLBGvebtjQoRjp+wXTMCDw=;
        b=h48edhlWgZcLXMb7mLBQkq41IQGiJ1RAJhntCYMXLt/yf64rlzpQv3V71cwqjW76Df
         YR1rIHvrXhXydvzWwNo63UzpEtgLs2V2q3N7Kmw9liaivk9JsnO1c1Eipqn8Mr+qG4zE
         +GbeKxzVTJSW/kHkUCw7DyKjBwStQzlnNWIanNK+BwLgdFd2bE5W7RQ4W/mb36Og2Vlu
         VM1RQNiHeUHxsHkKU2k0uBlOL2g28vbZJVqRPj+IOturVaYXs7yEpM4F9x3sDy5FayUy
         tMy+Bd0fwGV2CTRGYNs+cAnpDOjAfx+/qnzxAMMeVqQjwXDNTPX0nlnOeEifk1hf2Iv3
         t5hQ==
X-Gm-Message-State: AOJu0YxSgLf6nSB2mqqXk3otSs7Zmg7/THQhNEQiVfE2oClEcr4tyXP1
	7nK9x6hEUeUUdawWlqmtKwxFTPbOgVqR3qn7byZpcxJ+Rz574XTAKg5kt9RGA/m3Hrsj4jhSsB1
	JSItjlFYmLGvJt+97GLKH
X-Received: by 2002:a05:600c:19d1:b0:40b:4268:f375 with SMTP id u17-20020a05600c19d100b0040b4268f375mr5201161wmq.36.1701157360945;
        Mon, 27 Nov 2023 23:42:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE53k66r5nMv2GqUUxSBwpFlLDQ3zS3AaZuf2whu3bEH/EglPV34ja5GP+W5nD3vDIW9KcsQg==
X-Received: by 2002:a05:600c:19d1:b0:40b:4268:f375 with SMTP id u17-20020a05600c19d100b0040b4268f375mr5201138wmq.36.1701157360670;
        Mon, 27 Nov 2023 23:42:40 -0800 (PST)
Received: from starship ([77.137.131.4])
        by smtp.gmail.com with ESMTPSA id p34-20020a05600c1da200b00406408dc788sm17210463wms.44.2023.11.27.23.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 23:42:40 -0800 (PST)
Message-ID: <78f8ff04c20c45525321247336e16d06063e57d0.camel@redhat.com>
Subject: Re: [RFC 19/33] KVM: x86: Decouple
 kvm_range_has_memory_attributes() from struct kvm's mem_attr_array
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Nicolas Saenz Julienne <nsaenz@amazon.com>, kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 pbonzini@redhat.com, seanjc@google.com, vkuznets@redhat.com,
 anelkz@amazon.com,  graf@amazon.com, dwmw@amazon.co.uk, jgowans@amazon.com,
 corbert@lwn.net,  kys@microsoft.com, haiyangz@microsoft.com,
 decui@microsoft.com, x86@kernel.org,  linux-doc@vger.kernel.org
Date: Tue, 28 Nov 2023 09:42:38 +0200
In-Reply-To: <20231108111806.92604-20-nsaenz@amazon.com>
References: <20231108111806.92604-1-nsaenz@amazon.com>
	 <20231108111806.92604-20-nsaenz@amazon.com>
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
> Decouple kvm_range_has_memory_attributes() from struct kvm's
> mem_attr_array to allow other memory attribute sources to use the
> function.
> 
> Signed-off-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
> ---
>  arch/x86/kvm/mmu/mmu.c   | 3 ++-
>  include/linux/kvm_host.h | 4 ++--
>  virt/kvm/kvm_main.c      | 9 +++++----
>  3 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 96421234ca88..4ace2f8660b0 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -7297,7 +7297,8 @@ static bool hugepage_has_attrs(struct kvm *kvm, struct kvm_memory_slot *slot,
>  	const unsigned long end = start + KVM_PAGES_PER_HPAGE(level);
>  
>  	if (level == PG_LEVEL_2M)
> -		return kvm_range_has_memory_attributes(kvm, start, end, attrs);
> +		return kvm_range_has_memory_attributes(&kvm->mem_attr_array,
> +						       start, end, attrs);
>  
>  	for (gfn = start; gfn < end; gfn += KVM_PAGES_PER_HPAGE(level - 1)) {
>  		if (hugepage_test_mixed(slot, gfn, level - 1) ||
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 4242588e3dfb..32cf05637647 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2391,8 +2391,8 @@ kvm_get_memory_attributes(struct xarray *mem_attr_array, gfn_t gfn)
>  	return xa_to_value(xa_load(mem_attr_array, gfn));
>  }
>  
> -bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> -				     unsigned long attrs);
> +bool kvm_range_has_memory_attributes(struct xarray *mem_attr_array, gfn_t start,
> +				     gfn_t end, unsigned long attrs);
>  bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
>  					struct kvm_gfn_range *range);
>  bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index fde004a0ac46..6bb23eaf7aa6 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2440,10 +2440,10 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
>   * Returns true if _all_ gfns in the range [@start, @end) have attributes
>   * matching @attrs.
>   */
> -bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
> -				     unsigned long attrs)
> +bool kvm_range_has_memory_attributes(struct xarray *mem_attr_array, gfn_t start,
> +				     gfn_t end, unsigned long attrs)
>  {
> -	XA_STATE(xas, &kvm->mem_attr_array, start);
> +	XA_STATE(xas, mem_attr_array, start);
>  	unsigned long index;
>  	bool has_attrs;
>  	void *entry;
> @@ -2582,7 +2582,8 @@ static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
>  	mutex_lock(&kvm->slots_lock);
>  
>  	/* Nothing to do if the entire range as the desired attributes. */
> -	if (kvm_range_has_memory_attributes(kvm, start, end, attributes))
> +	if (kvm_range_has_memory_attributes(&kvm->mem_attr_array, start, end,
> +					    attributes))
>  		goto out_unlock;
>  
>  	/*


Same comments as for previous patch + how about 
'kvm_gfn_range_has_memory_attributes'

(I didn't review the memfd patch series and it shows :( )

Best regards,
	Maxim Levitsky



