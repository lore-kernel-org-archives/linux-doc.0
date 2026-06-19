Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CBF3469FC
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 11:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781867010; cv=pass; b=LV+AgkaQ2zMTDY+tCC3pZFT4eTmhNaOqN4oeaCfz0Nw15Z6I2bFrUk+CM5ojOzlOTHvFu+hqjWsPzfOr8E8ZG1jK3LJQ08TbLcgdbFMwjD1U4nY+GD1vheXvuTuha8/u0sAuXWjxiASpLgdaUC0ZIB9kW4z6SgAiYzVbYVs2bmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781867010; c=relaxed/simple;
	bh=GsiXIcEdAu1JNPx0o0Rkb8mPpCDUCHPoupmGVgfFazA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mst4fNQ3sNnDrNy4gpAI543d8VBhqDWoPCkYpr4tPojsb3Xk8/I/0dyL8qUEO9W8NkAnSS6OILftr+BxIihblzT4BcI+wBplmIyRP5j1UraUCuZAE8ujyQh/C6qo0u3qZVJ0/ckF1h47hjXnortrFPuLQMbNFKPw5hTpOsReat4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bbcADlBT; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bbcADlBT"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-519ed52bcc6so136551cf.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 04:03:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781867006; cv=none;
        d=google.com; s=arc-20260327;
        b=QBsfm0O1TVMqqKBzj3wSfsYHRxErUrb1uAcA7ZFW8Boi49E+N2Zd4w7jA9AcgXVD8c
         YIIfa1hm29C+azZ2EjliiocUueWCwIxhy4JRVOYYlvAFtKtB2uVRFI8IDLYlAq9kKEP8
         5zfU6vYReb+s+hrfhZmsfMr8Q0uQKRrXsExexqJLNFvJCNtpB+/jQ+0k0X7Ev6kJl+R2
         qxdRZIr6a5ja/CyLXsUJMXr2/4PCXrTmOcE/XTI2Z+o0G5ljZmvYrsH6TQdi6Jt26tx3
         tLblK3dWWCCR8OYrwkHtft2l6zWPCSd6jFgCqUzM5dIQX6F3Y3eHnm6PP6lK/CAUiaJI
         JiEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tjw3cW/Oozrva+KBRQ9a1eMgdLYrVdyOI99ohvpEcUU=;
        fh=/hIQr7SzG2LLo8+l4gqO2yK27mnJtgAf5eDcT6OziGE=;
        b=r3H8ZSTVE0HYV0ZxoVrC+DW+rax42rvokDdYl22AzkKGTW8MRsZvJFvi9S8a2T6hr/
         juWWIAlt+wpaJKw4kZRNSiTquc1cpRksqwmXOGdkRPseynZAr4/eqHw+2dbOWpt84DcH
         ec+2Xf4FOMq9lKQ4Q+DHD9qIfXXyc/S8YVzdvdoHhfghVBTHwRwaiqykCPp6tVvKdS7k
         9hl0SvQww1MkDuhywM2d/E0HaJvpmNGgppHU4WBEZGazoexsrGovvEfE51Cid2RF9Lci
         9HJPIGYuwVpB5buG1FQn+ZmcaPxHurjmb0P+Pm7MRUjmoiDlPVLjk6ZpW/r0LofwAtQv
         ORvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781867006; x=1782471806; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tjw3cW/Oozrva+KBRQ9a1eMgdLYrVdyOI99ohvpEcUU=;
        b=bbcADlBT8HbCLpMyMG3EPLwa3qTHe3eGPyIP2OI/A91UMFYoORXh/tpHAi7X8NSPDG
         1kUSIlZt6BWlvj52JyUoPE5hWasC7NKFkEsSQ0zAQxyvdOSpVW/T9hp2/bKg/I/m036v
         8k/FTTc24b5mC/Wy/SGzNiZUA1pm+0qncVvvI3GyBB9Or5pUGPslfJCOrCxbkLpuDX1z
         iudVNAW/M9tbgf1Roi70sGQW6/1bKZ1SEuHX9zl8rOg1gnAB9kPVgYUpQRXULbgRJaCD
         354fbnoesOQTMqVG0pBEdnTJgKCYMdZmpTEl/iwyaixm8tLgehHqCuWfY07hoPgS32CV
         +r7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781867006; x=1782471806;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tjw3cW/Oozrva+KBRQ9a1eMgdLYrVdyOI99ohvpEcUU=;
        b=IhQX7IfAF10v2Hqu45PbSlYRsEomCuxc6Qmy7NUsyVAnq5k2Lpg84/1QF00cEgpyI4
         MwfINHycqwPTEJ9kMgREJx66vAShrufugtFETYXB7X0ODZA73BeHGcchJ1G2/F5s59EH
         Bh7Q+rhyuqVetyG1w8kUX/FbMzBrEXrUmgo09+sM2Ag1hHBV9yGXFnNHuuNDPuUNJXB7
         0YDIzs7+k+NJD1kKTMeAvvcuY1xBltAp2J1iZXBFoj+g19fqg5pCHqYQGVJt4A4INysO
         TWXHkQBsfa4LFiZ5Bcek42nQA0l/LpC1b32fbU7CLDPscp/NF3TdYN50OykKNiM4lJyg
         82zg==
X-Forwarded-Encrypted: i=1; AFNElJ98yO4/Mh3xf7rkM8wBAGh0coCTQkJvC1BPxSF6FIdlYQnuhXceFtJAZDNsKFc/FxUf/mV5REkHE6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlYO3yZm25npskmQZkf9N43SGMoreQenk7l+XyuYk2UohdDwL7
	/arjhuhfipwI1bX7fMGbLFgOmNqXl/lNIMwuHqFseSO7yb6XRSAogso1x1yVjy7FjPSoRWyJctU
	WDAeh1mOHq84/2mPtlSkl0bo5PnKHXuI/zqOheavF
X-Gm-Gg: AfdE7cmNY7mIDukXLY0t5ZKCZm/yYJFA3shnPXp/AeGB94grvmdogBFpUVlSgJQLcTh
	8a9rfV9m1txG5bYLBLnKF2b7o5hcKWQXuMGdphWHm6SOko8EF7szzTuLGCgPWPOHMIrcRSOqGyL
	ZSCMDo2aGQxRQqDsNRbgpL5DqFm28GIQOH+L8D7O6dkI8Xdklp/vgT1H3pfbHLBAzq1qtX69EGL
	LSDZELJafXzLT/QeSOAV4f4ilpnnBmiX3owGMSzO0VhVK6z0aMXylUb6aO/wk8jxxiyJCAN6A==
X-Received: by 2002:a05:622a:5a12:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-519e878bcd3mr6572861cf.1.1781867005698; Fri, 19 Jun 2026
 04:03:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-11-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-11-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 12:02:47 +0100
X-Gm-Features: AVVi8CdeH8_e_cqUhrAt8PYHFeMtnUwZS7qxotCUws3_NP2cjS-AO0E0Squx-po
Message-ID: <CA+EHjTxd4_x-J8DurWuhPostfZqsxMUV87tWN5GzLCknH5wfQw@mail.gmail.com>
Subject: Re: [PATCH v8 11/46] KVM: Consolidate private memory and guest_memfd
 ifdeffery in kvm_host.h
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
> Move the kvm_arch_has_private_mem() stub and a few guest_memfd function
> definitions/declarations "down" in kvm_host.h to utilize existing #ifdefs,
> and so that related code is clustered together.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

SoB fix please. With that...

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  include/linux/kvm_host.h | 37 ++++++++++++++++---------------------
>  1 file changed, 16 insertions(+), 21 deletions(-)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index acb552745b428..9c1cf1a6559e3 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -722,27 +722,6 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
>  }
>  #endif
>
> -#ifndef kvm_arch_has_private_mem
> -static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
> -{
> -       return false;
> -}
> -#endif
> -
> -#ifdef CONFIG_KVM_GUEST_MEMFD
> -bool kvm_arch_supports_gmem_init_shared(struct kvm *kvm);
> -
> -static inline u64 kvm_gmem_get_supported_flags(struct kvm *kvm)
> -{
> -       u64 flags = GUEST_MEMFD_FLAG_MMAP;
> -
> -       if (!kvm || kvm_arch_supports_gmem_init_shared(kvm))
> -               flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
> -
> -       return flags;
> -}
> -#endif
> -
>  #ifndef kvm_arch_has_readonly_mem
>  static inline bool kvm_arch_has_readonly_mem(struct kvm *kvm)
>  {
> @@ -2572,6 +2551,11 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>  #else
>  #define gmem_in_place_conversion false
>
> +static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
> +{
> +       return false;
> +}
> +
>  static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>  {
>         return false;
> @@ -2580,6 +2564,17 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>
>  #ifdef CONFIG_KVM_GUEST_MEMFD
>  bool kvm_gmem_is_private(struct kvm *kvm, gfn_t gfn);
> +bool kvm_arch_supports_gmem_init_shared(struct kvm *kvm);
> +
> +static inline u64 kvm_gmem_get_supported_flags(struct kvm *kvm)
> +{
> +       u64 flags = GUEST_MEMFD_FLAG_MMAP;
> +
> +       if (!kvm || kvm_arch_supports_gmem_init_shared(kvm))
> +               flags |= GUEST_MEMFD_FLAG_INIT_SHARED;
> +
> +       return flags;
> +}
>
>  int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>                      gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
