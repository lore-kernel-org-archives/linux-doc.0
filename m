Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0DB2D6E72
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 13:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284074; cv=pass; b=J66rYvCKECPYF5YfBYXrkLaSt/IDYKWI/Gm+mDoSixtA1DLNgE9qTuY69t5aBw3ungIL8c5qt8mD6X9bA9glR2MejgHT9z/YcMcelCjX4fG2rtyK8aBcV8WkyvjJ+TVapDWBHmiKU4rDbOGskAf6RCRpVOV6kHtVcdHMfB/ehGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284074; c=relaxed/simple;
	bh=qQiJNamxvq/HKg+2DcbBfJZDz4xq8G4yBXbE6YWO298=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XAhsN/D84zWK47yDslu7DEnqyEmujMEEIRRLc6/BGYY3E2LkkDrmph+HapMkdzhqoGeAtvTwI5byCx5X21lQMPPPmgYpvvv9uPDKvd8zQ71w5yqnBKqUJMCDXiyIPS90aqpMuJ2CmA5ZShp90t0Ha6BAw1lkzJIBKzuRgWji4/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZBRT6gnh; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZBRT6gnh"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50d6b393d60so4091cf.0
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 06:34:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779284072; cv=none;
        d=google.com; s=arc-20240605;
        b=bK1zJ0aFJZ6l56yB3lMk7O4Gi+6Z4k8v/aIVGvf03J8XRhSiRWZrBTavbdK7/76KYs
         BmggWhdoXHX8I6UcddUDE4Vj1v9LHHpp8eARBMEg1VhcIZk6k8QN3XhCswe6Baga0MCu
         8H4eQcX9bgFApaEEMgUfI2Z9KHm+dDFsEyXz6X858Hf5rBGKna6iPbaVsqxJ91Dw2FcS
         U298GXzaMvbQfcH0JQU3jcohiPL6dZW7LdpBffhyDdpQLN34LViXrELGQtFC94Y70/nD
         39JrgjlUnzyqrN+AONT6Y7z7VV5GkpSPRFcK66f8I8S6RArXVvuRs5G3kx3Ys4OKLkwi
         Zj/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gg6EIejukVN1UskEcFFGr4CnqhwTYz/FF3EfBDzQQN0=;
        fh=z4zSV+jZ7DiGzaP8mWzx9NF5CyA5nO2FJL92d87Q77k=;
        b=cRUSBBfWaVDI+1nspUyA/F9jMXSRWehgWX3JfkO62VQJ3EfVMHCHQNDp4LeF7mvcAU
         lpkQJ6W4niEpceoZyLLTZGlvvQR1vTyd7UVixMf1NKqI+bDXuQk5FYFG7OMTRlBNttwW
         z7dPlRn6gRHfhdysZyfVNIr79Qtk3/OPUu5alZI2m+keXzoGMcU9ZE9MMVmEcXWHRTZt
         7EWiniWLWUcWZnTOcJ+I0XKhkbMqwIF3Bq9oM1lPplQfnTGeY8wM/68kUzdLuOLK0f7o
         26N5OJhXP3lWpoN4c8Wnygx3f8YwatCVvUnc9TqCzIrHbIrmcC916BSa5t1mGKLU7iG0
         tSuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779284072; x=1779888872; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gg6EIejukVN1UskEcFFGr4CnqhwTYz/FF3EfBDzQQN0=;
        b=ZBRT6gnhCXkmGh5E5RtdmLG01m9cbItQ+fVl69SplNV7tKGs61gKG5ulpXLXI3m0CV
         VqWRol0J7UEu6kw0wTYeDnN+bhK5PkKcjH4IZBDJu2QnESW3xcrRHKQ2NmeBb+e1z20y
         40TGM7LDeKzAVQk0C2z1InDN9opgFG0aYQ5pizLD3zEjBmXu75tCjgpzS9Dy8ZtoRAnd
         mseFVCUD2+xzRKgDKks5GSd74VjJhvBSzB+FU0Ij3tsu9TVKxjNcRfZ9s+XTod4gwuja
         f443+uL+BI0rx4m5EKNYjDSE3d/gPxIpxLnXDYygGkZmTghLORiiVzj/Vuc5sYqrnefo
         LX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284072; x=1779888872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gg6EIejukVN1UskEcFFGr4CnqhwTYz/FF3EfBDzQQN0=;
        b=DAGFhVfUz4NwmVa9W9rQHDkvcJX8eGESxJD5tk+ZvMIt8Oi3Uq/Qvkph9B8jhRiWzQ
         wt7T+4x6hkpVjjmZa7KZAt5nmxMAa7af65Wu149Jr1P6i9Wz19UNedLwzL1+WxDHRJjr
         FSzM4KH3+BQDqUuNVQOr6qUUQiDw1XW49DU6HoSY5uXUiqXP5x+TexlCxerh8KbbbY9Y
         PclvfF5PIJ1AjiUw/uDjNPU1lYKPnjsLItFYa93sxg0uTD6jlLVhrbrG9/zL3ST0sNc+
         aORJGMr5VxyLSWdziEMXPY7PXQPc0cdxWL3vA/BxE4+KodBssrvH2ofWN0vjpTlGEu7e
         5NBA==
X-Forwarded-Encrypted: i=1; AFNElJ/ttdInFMUqnbX2lWSdS5bPjW9UDh5zUmCrx/iKUAvNNTLB5DNjLUsuOaRsheBCIYpTnH3psn+8WJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys/vdQ8mDYLqXqpXU0k8YQq1kIrWgXsO+zwm8c9gMNJv0d1Z+k
	ChuSoOUoAra14/SorPABMIOZ80eaI8dtThBV+hmz2X0lMpPudVGd39SwIUA93X8Ptw5cH4JbMpg
	6AJ7TFGcV0goIagi2y1N9oQ3xqGRHsGXrUEsSyrgf
X-Gm-Gg: Acq92OHPexdzXlUDhRkIACEpZ9W6z7OZQwWagxJK19xzjJf3PkyEpNwo9uVruga0F3w
	YEktfTGLqdI9zTg8pgowf6RVfbbb/V+nIl3TNLxHY0DK/6I48tVaekJwcHOxMAvDlSsyNTrd5ZP
	aZDIYz4uwP8xhsqlfd/C3/VECAKx6+nyG0odITr81hTz84kFZqnOwVC9td6/f30pSxSwqc7rpv7
	eM789/DLKX9j2XFUQ+VZzB7hRxYaM8MVzHmCw9xrRBDbJEJSL1dL6VmDF7pkt6+uQ8VVafgCOez
	daJlv9ZNZS/rb2U7kug=
X-Received: by 2002:a05:622a:1f18:b0:516:5709:45e5 with SMTP id
 d75a77b69052e-516794404famr42713051cf.14.1779284071144; Wed, 20 May 2026
 06:34:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-6-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-6-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 20 May 2026 14:33:54 +0100
X-Gm-Features: AVHnY4LNSFj0RfEZst7XJ-H9igWv5oxnJFnr1A0Uux_hrTg7SmxNRLrzDdjcxpU
Message-ID: <CA+EHjTxvLU4XDPXDXYXXWJES1OFQgN8VTRLMgCCNMwBE6Hk8tQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/43] KVM: x86/mmu: Bug the VM if gmem attributes are
 queried to determine max mapping level
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> When the maximum mapping level is queried, KVM's MMU lock is held, and
> while the MMU lock is held, guest_memfd cannot take the
> filemap_invalidate_lock() to look up the current shared/private state of
> the gfn, for these reasons:
>
> + The MMU lock is a spinlock or rwlock and cannot be held while taking a
>   lock that can sleep.
> + In guest_memfd's code paths (such as truncate), the
>   filemap_invalidate_lock() is held while taking the MMU lock, and taking
>   the locks in reverse order would introduce a AB-BA deadlock.
>
> Currently, the maximum mapping level is only queried from guest_memfd in
> the process of recovering huge pages, if dirty logging is disabled on a
> memslot. Dirty logging is not currently supported for guest_memfd, and
> guest_memfd memslots also cannot be updated.
>
> For now, bug the VM if guest_memfd needs to be queried to determine the
> maximum mapping level. This guard can be removed if/when support is added.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  arch/x86/kvm/mmu/mmu.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index a80a876ab4ad6..153bcc5369985 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -3357,6 +3357,15 @@ int kvm_mmu_max_mapping_level(struct kvm *kvm, struct kvm_page_fault *fault,
>                 max_level = fault->max_level;
>                 is_private = fault->is_private;
>         } else {
> +               /*
> +                * Memory attributes cannot be obtained from guest_memfd while
> +                * the MMU lock is held.
> +                */
> +               if (KVM_BUG_ON(static_call_query(__kvm_get_memory_attributes) ==
> +                              kvm_gmem_get_memory_attributes, kvm)) {
> +                       return 0;
> +               }
> +

This directly takes the address of kvm_gmem_get_memory_attributes,
which is only compiled if CONFIG_KVM_GUEST_MEMFD=y. This breaks
ARCH=i386.

Cheers,
/fuad

>                 max_level = PG_LEVEL_NUM;
>                 is_private = kvm_mem_is_private(kvm, gfn);
>         }
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
