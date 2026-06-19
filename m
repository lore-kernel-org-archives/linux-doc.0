Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9093546FD
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 08:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781857209; cv=pass; b=gBnhmm/7UUNL3bM5laUgUS3eJ9sR3d4S+kLpce8UwWpq/JfkxyIud2cBQwP4GxcQJaR7Y2w1K2RCKVc5PLoC2Ig7nDB9ohgAC3Z0uQmzsu5sA03W5kjKMp8gI4XPjsL+wRXZ8J/N9eIl8tjhKkCTzT56T3otE/SUpRHZTtKw32A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781857209; c=relaxed/simple;
	bh=gFs6fwYYXQhT/SPNLDd9UFrO7xyIHwc9eHwWJt6MDzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DxeKFCL5EXqhxF4i/mKUvDwWaZ0pQnEVCgp+gA+9EVpihl7zVyOsTp4tWgRvTsmxmBxqTTBcmyLkahhiwQp9NqbMTHwcXLv9YfQky2Nvw59GGg99wNeYJaatL91rpCLvnxImPwwirxJvpYdnXlY/E+52VwDb4cxbldSkJkZj7sU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ak4/k/qJ; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ak4/k/qJ"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51765531803so197221cf.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 01:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857207; cv=none;
        d=google.com; s=arc-20260327;
        b=bdibaEzqr809jzwAdCvtIcpWuTp63Hkj2lekko/yBCH2FOPJ+zJ+z8LDkyqlExRvQS
         /oOF/OCzHUyN+h8gmX1hI5yt/ILKr8GtD/WAVawRq3WvwAULSiOp9b8T7ASqy+1jXy3G
         3BScwBobG0aKKXKEYqZd1yxm807s4Qwh3c+RvUphwvtvfvDLCH8LkM0+Ny8iIl3vBmpW
         HFjZAF0KmRrLX9rMMstzje/kWr53ZD36ejcAFNTFECFhLFXsf809juoKZowzr5zjEwYP
         wdRoisE3LaEW0i1IiYU+Dk+6yPp6DOFbk8ToLl1vzU6G7XW2ViM+WFSR18Mx3cDQomPt
         P6Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JBFThqra4oV9uqStWieBti5R0y/ujSHcNSXMNdIU7IE=;
        fh=YllqPZ6gXre2MVBVKb76J6PDoow0QFe57rhLNFATc54=;
        b=DaHlym4jT25lUKwZNhowHA97mMeiit9NMdasb5HcxyHpU15/13zCrrDFBKJRTEnqJX
         gkcIhGjaz3w7mauRxXeYjNtNqQwWy7oxF88ZTOCS1KO5Wuxqbo2Gmp5gOo53d3v1JW0z
         NnkwfFqNCoGucPtFk1aEvKBVIc71xxun2xRxq0LFsyCD8I/r5sj/US6xWaI6lj9mZw4r
         v5s+mdgXCOBH3Yneno87m3izmpMDbZxBmJDV4YK5DPhRWN78tCBfdfAzhpM46Or+1m8J
         fXa/6Gu6mBwta+XrshP9uC1lB5OrxjcdBxCQHXOtNgdGDLcK3IM4pHqGaEC4Pge+s+4e
         6dFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781857207; x=1782462007; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JBFThqra4oV9uqStWieBti5R0y/ujSHcNSXMNdIU7IE=;
        b=ak4/k/qJNGTwJ1pUUN1/9CP3/hQDf2GFXbVsGI0JrAvk/IlcMnNDuS+kopSfkXYXP3
         TbU5UYziI6WkG/MGNDvVhJpUZq+/aPlmeeNZfu6/6zsWSPXcyo37a/hPEHzo2QGqYaLy
         pPdoHXN/gfHfA1RRBJeLWfpybH8UjLWgUFzCeN5jQW+2v87Hezv340SYCK5HgUjlkGpV
         HzlHSsNT1ms18utk/k/ZqoKfUCFs5mxFqR8H6spxYyX0fNBlWzz8vUeHE3IHK0urqYri
         o6NYg4mQN7pxPBzXlgllKGvWh7Q9UajJ+ADP9SU+Rv1Gl0GkE8VlQLoOKsnR7p9h7Be4
         hDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857207; x=1782462007;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JBFThqra4oV9uqStWieBti5R0y/ujSHcNSXMNdIU7IE=;
        b=s+OnVYHBCD56Py9AO6q/PXyx/G5++PSOLIdpXQ89jgF/4OekYbKgvifHvluv9ud02z
         XgspTrA1QdDwwnfMhaHVf2KCJNkPtxhF2LRBNXb+ggyoKraUW3CvC5Cfa9sse+ak8MIh
         veBkL8NKMXE4Mucij6cNVTE95LFEkPWDVaFYOLD+tXC1jgLo2hV2AQB1GhdqBKyKyf9O
         VGIxD1cdx1hjKFjC0+dRNpM1ICGckmUMdpUqhNUCmknBaM/njOWl7Bxlc1bLj40cSU0t
         rBZOt4oHhHaQV6pUNgV8iIS1zllv3QouzRnFopGCU9ncHAMRr+jOdS6bwJLXwnjqYgyO
         rAVQ==
X-Forwarded-Encrypted: i=1; AFNElJ+VpHZlpkjTGeJrDGAB+G9VQj7C2lz963sb/qtOHrDHZkR+fkyDnAuWoeJeurQ7bUaNjfe+BvSoi/4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh99Jz/gLIxaeXmOD6NKrsTnaYg4m2HQv9MWCExPhijj02fpa3
	TSUIwovoSK1CQp7a/a4ps40IiD03yIn4iZIH64PU7PVMhVCbu476Si8rRn14JO2sSkkh+bpRUeI
	EDf0WcqhpMNLX+uKSwsmnfEF7vp22AIuFIhQQktIF
X-Gm-Gg: AfdE7cl5lJ5x2hP/MKhUYBFzbF4bMgKFw8OEkzisrHeliQU07TJSPPEXVYFnM6f4X4I
	Uz10SaKhrwc2VXtB3aisaSeBzSaT/96WX4/c6PFV/O6ogalAJXBkGzhiKbpPjciPiY55veUfONG
	ge9AX8vBICPB9kdLCprq4g6iOuZ/LCdj3Cc9+NwGZeJwF+BGL10MILCU6zEtmMtvWD7wqfFnT50
	Ecj/whshQhoCJvCTiQhsQixi3X7AnrwTm761psGLFAHPY5Xw4E1aT3eUJxkuifmvlSksJNSwVhG
	W2H/UwyC
X-Received: by 2002:a05:622a:1489:b0:517:64f6:3365 with SMTP id
 d75a77b69052e-519e4890222mr6131781cf.4.1781857205879; Fri, 19 Jun 2026
 01:20:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-8-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-8-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 09:19:29 +0100
X-Gm-Features: AVVi8CetDOqUGm8KE1EqJ4bopoK5ozlhUV0GoXpBkC9yvjqeaAph6uDxe3jzIzs
Message-ID: <CA+EHjTw6x-mxDnJjnhE-6SV73tMrb0paKDTtOC2j6zJ1fXZDLA@mail.gmail.com>
Subject: Re: [PATCH v8 08/46] KVM: Provide generic interface for checking
 memory private/shared status
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
> Introduce a generic kvm_mem_is_private() interface using a static call to
> determine if a GFN is private. This allows the implementation for checking
> a GFN's private/shared status to be set at runtime.
>
> In preparation for choosing implementations between a guest_memfd lookup
> and the existing VM attribute lookup, rename the existing
> VM-attribute-based check to kvm_vm_mem_is_private to emphasize that it
> looks up VM attributes.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

(SoB fix plz)

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  include/linux/kvm_host.h | 12 +++++++++++-
>  virt/kvm/kvm_main.c      | 15 +++++++++++++++
>  2 files changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index eb26d4ea8945a..3915da2a61778 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2546,7 +2546,7 @@ bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
>  bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
>                                          struct kvm_gfn_range *range);
>
> -static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> +static inline bool kvm_vm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>  {
>         return kvm_get_vm_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
>  }
> @@ -2557,6 +2557,16 @@ static inline bool kvm_mem_range_is_private(struct kvm *kvm, gfn_t start,
>                                                   KVM_MEMORY_ATTRIBUTE_PRIVATE,
>                                                   KVM_MEMORY_ATTRIBUTE_PRIVATE);
>  }
> +#endif  /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
> +
> +#ifdef kvm_arch_has_private_mem
> +typedef bool (kvm_mem_is_private_t)(struct kvm *kvm, gfn_t gfn);
> +DECLARE_STATIC_CALL(__kvm_mem_is_private, kvm_mem_is_private_t);
> +
> +static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> +{
> +       return static_call(__kvm_mem_is_private)(kvm, gfn);
> +}
>  #else
>  static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>  {
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 6669f1477013c..8b238e461b854 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2627,6 +2627,20 @@ static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
>  }
>  #endif /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
>
> +#ifdef kvm_arch_has_private_mem
> +DEFINE_STATIC_CALL_RET0(__kvm_mem_is_private, kvm_mem_is_private_t);
> +EXPORT_STATIC_CALL_GPL(__kvm_mem_is_private);
> +
> +static void kvm_init_memory_attributes(void)
> +{
> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
> +       static_call_update(__kvm_mem_is_private, kvm_vm_mem_is_private);
> +#endif
> +}
> +#else
> +static void kvm_init_memory_attributes(void) { }
> +#endif
> +
>  struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn)
>  {
>         return __gfn_to_memslot(kvm_memslots(kvm), gfn);
> @@ -6528,6 +6542,7 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
>         kvm_preempt_ops.sched_in = kvm_sched_in;
>         kvm_preempt_ops.sched_out = kvm_sched_out;
>
> +       kvm_init_memory_attributes();
>         kvm_init_debug();
>
>         r = kvm_vfio_ops_init();
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
