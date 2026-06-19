Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6698837999D
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 11:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781866920; cv=pass; b=FYEOC2kSStbDiDUjc8yK9h6QXs5CBHgMgtr+Ob6z3gQk82pm4jeYMPUcCgLcXKf4gLB18Y5muRUncMCUpJYwkeYLSpmUfAh0KjBlkz4aNIuxo8dRVfTVGjrbrDEFpNumV9NAb+hDCfPUcVirAf0Csx8VKdcXg/VzT/7Pyuq73B4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781866920; c=relaxed/simple;
	bh=N74x4oytNIsRYGMlMs20Ai2amlc5LbqjJhAeliuDLJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ey4wtqPGl2+Bu93yS/L6GoaE5hCn0vW1QrznQFnU+jPJeaIHS47px1t1PptGa/0fgRQlmRRVVRJDEyUInO15+nnu+USzY//wpxbdTfEfN9h0XB9zc2tYDodI5zQQThl7uh57EkqE/abGBpT+wPSIlJ1AdFwy0Wd3xAUk7y7e5EQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R9XAowfY; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R9XAowfY"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51765531803so235461cf.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 04:01:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781866914; cv=none;
        d=google.com; s=arc-20260327;
        b=QvLTufpB6Z+F2my4bv9+PSBYL49+SDCOYqTnyPZ+rJZspWJ1k285XUgUF4i3KVn90f
         +QEB3GSHGasOEY62vqhX/0VTRtzg3q+lP5cIJfCuvoA/vkjNscSx6e6IQWz8WgiHJoiO
         Mg2Eo+SJP8AuRky+JH17+odbVsM6rB2SyIzdxrb62YGxLz/TgHxRm+pEWav+6QJBKAIF
         AOKm3gQ4tiw6i0PoTDI9ZIkLw6rSpejP8TPklcueZBM9LcEZWEzPOQ26hQ/MWNATTLXT
         1uLOYlvqmZhTbWTxnGFImcpXlEPwB0f5xF9bns2KzcdQaEm8GtNUdpXiEBs9tRwzuGV+
         WpnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U35NfwEOggAkTfTgF+7yslJDxFAl5ztmZY3G7iS5UTU=;
        fh=/lpMGD0zNaQVYvKf4cdQ+wDfNRkgyRO5rXZir4828PQ=;
        b=R3pP2492SfJZcUvU7vSnpfShtk9gEF5wjsypeflTFSq19t3jhYv9/cOHESSVAHKOYr
         1R3ZT9K13irlGqoeA7yy1/bj0Vad+EYCcA/ZA31x5dQp0DHRLBw7KktQHprY0sZB5KhQ
         PnkLvM9QSnNoPR36RJile5ZyAVuGAHcy0EeKSf2lzsK/ZLMXWq9OB2fOSLG9u8PIK3ra
         x5eB8H835LpfJAfAumQUle/XHZ1Qi19VYQ3T+Toplr8jkn03qcNiQE2GIHWy6BDqX2Np
         w08OsBkgIF0NMdKyueLL/YJUt9d7e91EjpGEgzxBKXGu9hjQAzMFQnEsJuii8ErKKWaj
         Sugw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781866914; x=1782471714; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U35NfwEOggAkTfTgF+7yslJDxFAl5ztmZY3G7iS5UTU=;
        b=R9XAowfYchp9B/3z0IeVThoFWbiICdShhJqRZ88xXZwAJ6uAQEBBnFJS17IQmZV3iw
         eSliyUEPIbeD/ldS64H3WqIVFYtLmhe41eVuAtfUfrWZqz4a/n7UTQnA6WK20LNDoGWF
         B9fJ12GkPELkvY4gOQAFJ4ZlFodvJq4pZvIIdoHNcw8m9VpBNdDXI7hnzan46uTc3XJ4
         gsh7agZIdtFEU5Q3NLtycy3l50l3kIcW0H8bqCRf8bWhelwRpPbvoEhPHqXe4ViBOWKF
         fIrJTv4xNnc+DR04CRoW3g8VDh7fzAwDizj6Ja3LghFpfPZyXw3wYbf6cE2lWL121EXC
         TRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781866914; x=1782471714;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U35NfwEOggAkTfTgF+7yslJDxFAl5ztmZY3G7iS5UTU=;
        b=UC0muBmaiDK4cez/HottIv4RjT0X7h1o6I4snsxrpHzg5lFnoCceuNln9GoSNvD2JA
         Z8Mkcf4gCMEweNUPhp/ypmiH8BcNmEuZZsZwcjVZO0yuSdOQXYi/kLGYagBHIPzmuQqC
         952mGTdkPBsf1K5IEaqxbJKmOzbVTdPuE5Zu6BMG8CYyFds+ghZbMMBkjH4YV9RigTIn
         haaPGJsD2gGT5dIe+zmH8rCZWXjRtB4oBTX9npwlcZgAVHQte4gedEiVR+hZ2V191vav
         1ekVRw0hZgsCzPhLwvyPoisDFnHqtgWnFt+EDsnnNsTWcFm1S8uv/wcFdxcvN9BhJJ7O
         KEhg==
X-Forwarded-Encrypted: i=1; AFNElJ8y38yABJs55wXAmro4cEpeorJMQJ81WkqC28TU0ADQ2Z4+/gmPYKz1bMXVDzNfgnnc/+n3N98EKeY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQVHa00L3nA8LvGKx48Glmg+FDmLtkdWtdOt022yPhTmMvzQu+
	8+ot3t2x1mDcBHihWScjzYVE8Qr7lARyjXT1cQIh9Jr+c5t1es30s9O7Dk1OueumdAwU8XLMQw3
	0rjOB0MaYVOFtoQuHBEdXnacnFhk79P3w580Igjwo
X-Gm-Gg: AfdE7cl/2PlEubW2stJsTO4Xg2dqYVWkmcWAP2n5jutQYKs8eFquQv3wd0y98UzeUzR
	mNQD2LNWOB3/LWr7oZ8RR/48MKj/m+dDsuVl5jjJWbPGUGaIxwYYVmmqGU4lPHGFhWVmprxTqlM
	I3+VWVu/tZWkhaqjcSVyvICqa74Qoy50HIuGXNfqEFXrRWz+qCmWiLLDr8wb3aKwiiIkVOiZdF5
	8IlxDr+MrjygpyJCC5SEAX8UG5NATVermadGAFDFr3Qo/xf+8TqZDdIcVmm3aUAhagY601X8Q==
X-Received: by 2002:a05:622a:2489:b0:519:56a8:2693 with SMTP id
 d75a77b69052e-519e4a7350amr7631861cf.24.1781866913307; Fri, 19 Jun 2026
 04:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-22-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-22-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 12:01:16 +0100
X-Gm-Features: AVVi8CcGOil_aJVBQ43DfPQ1kHXf_SdVHaTxhCHT88DNVFNlliTMrSoTjQT32Xs
Message-ID: <CA+EHjTz3SW50EzxgXm8VysoaM21RReUVG2px_WUYU7zUwjXnpQ@mail.gmail.com>
Subject: Re: [PATCH v8 22/46] KVM: SEV: Make 'uaddr' parameter optional for KVM_SEV_SNP_LAUNCH_UPDATE
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
> From: Michael Roth <michael.roth@amd.com>
>
> Make the source page for populating an SNP guest_memfd instance optional
> if in-place conversion/population is enabled.  If KVM can convert the page
> in-place, then it's possible for guest memory to be initialized directly
> from userspace by mmap()'ing the guest_memfd and writing to it while the
> corresponding GPA ranges are in a 'shared' state, before converting them
> to the 'private' state expected by KVM_SEV_SNP_LAUNCH_UPDATE.
>
> Update the handling/documentation for KVM_SEV_SNP_LAUNCH_UPDATE to allow
> for 'uaddr' to be set to NULL when in-place conversion is enabled, which
> SNP_LAUNCH_UPDATE will then use to determine when it should/shouldn't
> copy in data from a separate memory location. Continue to enforce
> non-NULL when PRIVATE is tracked per-VM, not per-guest_memfd.
>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> [Added src_page check in error handling path when the firmware command fails]
> [Dropped ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES]
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> [sean: drop explicit vm_memory_attributes references]
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  Documentation/virt/kvm/x86/amd-memory-encryption.rst | 13 +++++++++----
>  arch/x86/kvm/svm/sev.c                               | 16 +++++++++++-----
>  virt/kvm/kvm_main.c                                  |  1 +
>  3 files changed, 21 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/virt/kvm/x86/amd-memory-encryption.rst b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
> index bd04a908a8dbd..29409297f1ef0 100644
> --- a/Documentation/virt/kvm/x86/amd-memory-encryption.rst
> +++ b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
> @@ -503,7 +503,8 @@ secrets.
>
>  It is required that the GPA ranges initialized by this command have had the
>  KVM_MEMORY_ATTRIBUTE_PRIVATE attribute set in advance. See the documentation
> -for KVM_SET_MEMORY_ATTRIBUTES for more details on this aspect.
> +for KVM_SET_MEMORY_ATTRIBUTES/KVM_SET_MEMORY_ATTRIBUTES2 for more details on
> +this aspect.
>
>  Upon success, this command is not guaranteed to have processed the entire
>  range requested. Instead, the ``gfn_start``, ``uaddr``, and ``len`` fields of
> @@ -511,9 +512,13 @@ range requested. Instead, the ``gfn_start``, ``uaddr``, and ``len`` fields of
>  remaining range that has yet to be processed. The caller should continue
>  calling this command until those fields indicate the entire range has been
>  processed, e.g. ``len`` is 0, ``gfn_start`` is equal to the last GFN in the
> -range plus 1, and ``uaddr`` is the last byte of the userspace-provided source
> -buffer address plus 1. In the case where ``type`` is KVM_SEV_SNP_PAGE_TYPE_ZERO,
> -``uaddr`` will be ignored completely.
> +range plus 1, and ``uaddr`` (if specified) is the last byte of the
> +userspace-provided source buffer address plus 1.
> +
> +In the case where ``type`` is KVM_SEV_SNP_PAGE_TYPE_ZERO, ``uaddr`` will be
> +ignored completely. For all other page types, ``uaddr`` is optional if in-place
> +conversion is enable, i.e. when the destination can also be the source, and is

Typo: "is enable" -> "is enabled".

"when the destination can also be the source" is hard to parse without
context. Maybe: "i.e. when the data has been written directly to
guest_memfd while the range was in the shared state".

Also, how does userspace discover whether in-place conversion is
enabled? A cross-reference to KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES
would help here.

Cheers,
/fuad

> +required if in-place conversion is disabled.
>
>  Parameters (in): struct  kvm_sev_snp_launch_update
>
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 74fb15551e83f..2b7569b6a8609 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -2330,7 +2330,13 @@ static int sev_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>         int level;
>         int ret;
>
> -       if (WARN_ON_ONCE(sev_populate_args->type != KVM_SEV_SNP_PAGE_TYPE_ZERO && !src_page))
> +       /*
> +        * A source page is required if in-place conversion isn't enabled, as
> +        * the data needs to come from a separate physical page.  Zero pages
> +        * are exempt as they don't consume a source page.
> +        */
> +       if (!gmem_in_place_conversion &&
> +           sev_populate_args->type != KVM_SEV_SNP_PAGE_TYPE_ZERO && !src_page)
>                 return -EINVAL;
>
>         ret = snp_lookup_rmpentry((u64)pfn, &assigned, &level);
> @@ -2377,7 +2383,7 @@ static int sev_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
>          */
>         if (ret && !snp_page_reclaim(kvm, pfn) &&
>             sev_populate_args->type == KVM_SEV_SNP_PAGE_TYPE_CPUID &&
> -           sev_populate_args->fw_error == SEV_RET_INVALID_PARAM) {
> +           sev_populate_args->fw_error == SEV_RET_INVALID_PARAM && src_page) {
>                 void *src_vaddr = kmap_local_page(src_page);
>                 void *dst_vaddr = kmap_local_pfn(pfn);
>
> @@ -2410,8 +2416,8 @@ static int snp_launch_update(struct kvm *kvm, struct kvm_sev_cmd *argp)
>         if (copy_from_user(&params, u64_to_user_ptr(argp->data), sizeof(params)))
>                 return -EFAULT;
>
> -       pr_debug("%s: GFN start 0x%llx length 0x%llx type %d flags %d\n", __func__,
> -                params.gfn_start, params.len, params.type, params.flags);
> +       pr_debug("%s: GFN start 0x%llx length 0x%llx type %d flags %d src %llx\n", __func__,
> +                params.gfn_start, params.len, params.type, params.flags, params.uaddr);
>
>         if (!params.len || !PAGE_ALIGNED(params.len) || params.flags ||
>             (params.type != KVM_SEV_SNP_PAGE_TYPE_NORMAL &&
> @@ -2468,7 +2474,7 @@ static int snp_launch_update(struct kvm *kvm, struct kvm_sev_cmd *argp)
>
>         params.gfn_start += count;
>         params.len -= count * PAGE_SIZE;
> -       if (params.type != KVM_SEV_SNP_PAGE_TYPE_ZERO)
> +       if (src && params.type != KVM_SEV_SNP_PAGE_TYPE_ZERO)
>                 params.uaddr += count * PAGE_SIZE;
>
>         if (copy_to_user(u64_to_user_ptr(argp->data), &params, sizeof(params)))
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 044486f128c37..dd1d18a1d2f68 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -103,6 +103,7 @@ module_param(allow_unsafe_mappings, bool, 0444);
>
>  #ifdef kvm_arch_has_private_mem
>  bool __ro_after_init gmem_in_place_conversion = false;
> +EXPORT_SYMBOL_FOR_KVM_INTERNAL(gmem_in_place_conversion);
>  #endif
>
>  #define MEMORY_ATTRIBUTES_MATCH(one, two)                              \
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
