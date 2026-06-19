Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF2531354F
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 08:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781858137; cv=pass; b=koq6nsBzl+g0Vx50IPK/X49OGrhhE10rM9Vfdov0nuBPQ4+B9kW1Hskz5MI0d6Ja5u9O64ftyZ8wVx7zeIb/ToOUifRkv/DE+QnOHxfmTYHGg29gy78nFSgXKNWK/HqlVZTR5rMvuwl1N4N12S5YG+a5/xqdoqHmiFsAVQ5HVeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781858137; c=relaxed/simple;
	bh=/2P664m7jGEtDAIgqO27YOlQWepzpwSiTCXRoum/oLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wj+7wO7QNEjonU5b4yXVCFBaW0z7BSVPicBruDCXJS02SyQQsVLcnI7QeILAPncxOfiMHdadP+hqUifjkq1d+9nWaS3kgAenx7Kbp/vEPugDv66EmVsru5xHJH8wCh0uq6w/73EuNnGmfrHPUi+IdIE2jzEaWo8MbsdBnNSqLSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=udsHHS+i; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="udsHHS+i"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51765331535so124821cf.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 01:35:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781858135; cv=none;
        d=google.com; s=arc-20260327;
        b=Y2qfUAN2X9dwpuF/reTVzvSg+VDMCadhX3lWdZYXbtD1a1WyirTCI9q2PM6HTTvtr1
         jdPKwZICgwl1z6tU8fG9cKm6XLobfA71iRE7fGVTZ8cN6KwYjPDrJO2/79FwVRCtxYLJ
         lY+0vEF6/tM1LIvn00zbGsUrZgojclllaht1uaKf8OruG3Dlnkrj8j1KQVzcOyUjJxOQ
         OS45SxavtC/QZ09EJovotsf7VrpZPZctyv4HIIuer2l50c4gx2RMPtdVXrR7752t4HWJ
         c0JGA2PMfmbG+8g0GUX9gnPtVaIQarTgRwnM4J3GThMMY++EK2mSmwYd7UAFfXGXVVc7
         SaYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vJCNxtqxuBlYp3k8AwtzAL+0dBQBaE1Rgq6EFlCIf04=;
        fh=grZo++IvM+59IQFLqJ/9+frNyzXZA1+NIOzrs8hEpMM=;
        b=HdiRb6mNkfPNFc0im8zQt6hhAfhms6gTnw0mFDHpzVTjer3dynRtOPiKvpTjwEzwzP
         2J86RMANjqo1Q6+/39HVoKkyAUPMaeien54FWk/bX+NZZJSPUo6hiTBw5VWak004S+eR
         r80BhYzQ+BanYLbc3zWz6yF4ib0G28coECQg5yfuLeFdW34T2ZAi3yfI8cIc3o9xJOD/
         5q6A7qvBnF5QAuY8zWBQrliK2ctlC/6B1FxHsIuNRfLVGZ8uRzEl2P7fsoVITXhIS4R9
         KQfjzsLP6OD3uBnEl4ov47Vqn9gD8NrFfiec5r/fu06rf8y1oxckyRYxAQX2hEnTE+Fv
         ELVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781858135; x=1782462935; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJCNxtqxuBlYp3k8AwtzAL+0dBQBaE1Rgq6EFlCIf04=;
        b=udsHHS+i25aggofArHhr2DS9m2ry8BQzgg3eT2kMYyLe77BdjoruBV9gi3qxkPzyA2
         PkXqN5uCS0x92UWIv/YoFDZdkGs2Me24stmBd4Gs7t8/WcOoTlenIh/DsAcRhBUzQiVF
         AiqwjI6X1AdurJ7DJ+MPiJVXQk6UQZzveYywVdOxc9JmVtEpVvOTMkmmRqu5ZA2tmpvr
         0dtawsZDq5vMfEk7UdMyxTWkko3CgFUaLoZSUwC3wWL3flZVOM1fU3o3pwNFwX3KQYNF
         k+AeXJ8NmaI1LUw1v1yF3qYIYX9kjZ8YQUErPGaNm7Ip6+fZIdcPG9RYAsWKHBzS/44e
         ZuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781858135; x=1782462935;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vJCNxtqxuBlYp3k8AwtzAL+0dBQBaE1Rgq6EFlCIf04=;
        b=m/u6dl75uTkA4zcjzfb/ZDC8FdRuU417N1huK0wfsLTUXAy+K0zS+5qPiK/Tew70Oj
         r78MPuFpSEmUPtJhyWmriB/g8f4JyaF+hFvbNzPxZ/+s9sdhJfRZQ2T+rsQINrLFwaVE
         p/18Fo2AOYeHYu8MaefV7hBed6d4+ddRVl85wEq7ub4iKFhw+lTBQMPg+dVOe9px4ZWk
         EJIEYEpiUWl3gZugSpUdlw0KvuOlysDjtMYlyIDmI42TOhcfCXZs7YHszCCx1qwCx3Ju
         q7YGTDmUGw7l9rulGRwmSgdIantyOIxWemwrom2ZogWMIo4yD1ozX1OsPJHiENV9KR41
         MVrA==
X-Forwarded-Encrypted: i=1; AFNElJ+h0r4fRY5K7aGDtAV8eeVSb71KQG/fakw5DD3DPTTEv2qW8bZCFSMpQz0M6E/UBageJjpYg6PFhh8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYZFkklhijaAv82+/ZHX8PVXVHDOXFHdhPb/lZMWqoP6mBEa1N
	nd74pGU2PoSUhQrLK4IwBb1ot4RWEXnVtOoC6NAUjHW8M+Tb/KCgjJlzJhzm6xICkSdxhLhDBt3
	XPghMQaK80zhlsd83jntBIah0UKKMe15dEq85dU9j
X-Gm-Gg: AfdE7cneg1uiUqOh1w/zqqBMwPO/Ex6msyIPWm4LXX7XtBpMPAKhEx3ywjyhiWG28gm
	FV4xzlHoYaydies4FNfaX7GfvUr65XoM5+kZUrY1/FhdBU2fOwdmg+GPe3nWXHMU5knwl2MzFh/
	xF7FIlsNS9PWhVkxuf50d/uRo2RTyLzSu+L4O0/uGWe5ZYmRV00WqKLPJlbU/9hMveG5EWY+2ns
	Ro1tZnW513SpksM9kGCSXkoQlmAHrSyZTVCOvAMiz9u2ZVgiQc96k0HxBT/t/UjJTSN8+T2eA==
X-Received: by 2002:a05:622a:8893:b0:517:99ea:ab7e with SMTP id
 d75a77b69052e-519e4a70452mr6973311cf.24.1781858134705; Fri, 19 Jun 2026
 01:35:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-10-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-10-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 09:34:57 +0100
X-Gm-Features: AVVi8Ce8UOYY3ibWf7EXz5J6tTWRIQf_RIk-gcXz8kRs-aLeFMDUqknE2c7ssDk
Message-ID: <CA+EHjTyGPo0JMsN8WFMer-2NWv6kNNUnyads+YHEXC20CwPjXQ@mail.gmail.com>
Subject: Re: [PATCH v8 10/46] KVM: guest_memfd: Wire up core private/shared
 attribute interfaces
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

On Fri, 19 Jun 2026 at 01:31, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> With in-place conversion, guest_memfd is able to track the private/shared
> status of memory. Use a global flag to toggle between tracking
> private/shared status per-vm or within guest_memfd.
>
> When queried for supported vm memory attributes, return 0 if attributes are
> tracked in guest_memfd.
>
> When querying for memory attributes over a range, look up memory attributes
> based on the flag's state at query time.
>
> For per-GFN memory attribute queries, choosing an implementation (VM or
> guest_memfd lookup) at KVM load time.
>
> The flag is always false for now and will be made toggle-able after all
> in-place conversion features are added in subsequent patches.
>
> If/since the flag is false, if CONFIG_KVM_VM_MEMORY_ATTRIBUTES is also not
> selected, the per-GFN memory attribute query defaults to returning
> 0 (false/not private).
>
> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  include/linux/kvm_host.h |  4 ++++
>  virt/kvm/guest_memfd.c   | 22 +++++++++++++++++++---
>  virt/kvm/kvm_main.c      | 12 +++++++++++-
>  3 files changed, 34 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 27687fb9d5201..acb552745b428 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2560,6 +2560,8 @@ static inline bool kvm_mem_range_is_private(struct kvm *kvm, gfn_t start,
>  #endif  /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
>
>  #ifdef kvm_arch_has_private_mem
> +extern bool gmem_in_place_conversion;
> +
>  typedef bool (kvm_mem_is_private_t)(struct kvm *kvm, gfn_t gfn);
>  DECLARE_STATIC_CALL(__kvm_mem_is_private, kvm_mem_is_private_t);
>
> @@ -2568,6 +2570,8 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>         return static_call(__kvm_mem_is_private)(kvm, gfn);
>  }
>  #else
> +#define gmem_in_place_conversion false
> +
>  static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>  {
>         return false;
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index bca912db5be6e..e0e544ef47d69 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -926,6 +926,24 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_get_pfn);
>
>  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_POPULATE
> +static bool kvm_gmem_range_is_private(struct file *file, pgoff_t index,
> +                                     size_t nr_pages, struct kvm *kvm, gfn_t gfn)
> +{
> +       struct maple_tree *mt = &GMEM_I(file_inode(file))->attributes;
> +       pgoff_t end = index + nr_pages - 1;
> +       void *entry;
> +
> +       if (!gmem_in_place_conversion)
> +               return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
> +                                                         KVM_MEMORY_ATTRIBUTE_PRIVATE,
> +                                                         KVM_MEMORY_ATTRIBUTE_PRIVATE);
> +
> +       mt_for_each(mt, entry, index, end) {
> +               if (xa_to_value(entry) != KVM_MEMORY_ATTRIBUTE_PRIVATE)
> +                       return false;
> +       }
> +       return true;
> +}
>
>  static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
>                                 struct file *file, gfn_t gfn, struct page *src_page,
> @@ -946,9 +964,7 @@ static long __kvm_gmem_populate(struct kvm *kvm, struct kvm_memory_slot *slot,
>
>         folio_unlock(folio);
>
> -       if (!kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + 1,
> -                                               KVM_MEMORY_ATTRIBUTE_PRIVATE,
> -                                               KVM_MEMORY_ATTRIBUTE_PRIVATE)) {
> +       if (!kvm_gmem_range_is_private(file, index, 1, kvm, gfn)) {
>                 ret = -EINVAL;
>                 goto out_put_folio;
>         }
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 8b238e461b854..01761f6e25d25 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -101,6 +101,10 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(halt_poll_ns_shrink);
>  static bool __ro_after_init allow_unsafe_mappings;
>  module_param(allow_unsafe_mappings, bool, 0444);
>
> +#ifdef kvm_arch_has_private_mem
> +bool __ro_after_init gmem_in_place_conversion = false;
> +#endif
> +
>  /*
>   * Ordering of locks:
>   *
> @@ -2422,6 +2426,9 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
>  static u64 kvm_supported_vm_mem_attributes(struct kvm *kvm)
>  {
>  #ifdef kvm_arch_has_private_mem
> +       if (gmem_in_place_conversion)
> +               return 0;
> +
>         if (!kvm || kvm_arch_has_private_mem(kvm))
>                 return KVM_MEMORY_ATTRIBUTE_PRIVATE;
>  #endif
> @@ -2633,8 +2640,11 @@ EXPORT_STATIC_CALL_GPL(__kvm_mem_is_private);
>
>  static void kvm_init_memory_attributes(void)
>  {
> +       if (gmem_in_place_conversion)
> +               static_call_update(__kvm_mem_is_private, kvm_gmem_is_private);
>  #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
> -       static_call_update(__kvm_mem_is_private, kvm_vm_mem_is_private);
> +       else
> +               static_call_update(__kvm_mem_is_private, kvm_vm_mem_is_private);
>  #endif
>  }
>  #else
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
