Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974D730C179
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 00:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782260017; cv=pass; b=EzU2Xv3B1yNwo6ZSltrTSwqvVz+IHDRpnL/F1S6QikZqkAZ9U5bcshiHiIdfqKPZqnu6RTZ/P21VlKZ+ehfnQpKWCFDUsula3sqa4GeUurdqsjEskT9tK5NC//d+8JU7ohBmCs9IsrpNY/LbN9S19+/NPQn0MhAq/hrxaFx/WrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782260017; c=relaxed/simple;
	bh=RYAvvdGH//Kw5GkREKpzN/KALBoM5gNnUxyEPrhaWUg=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eb5s/p+KY1H0fJjW99RA31Dl899e1pseL7emdqZ49wOtcROxIHQN0yfTybagdf85gYYkkQtZ3uu9+g/y+4JbC563TloptQQQDON1BVMI3HRqU+WewWByNDSeLa3GjLFqcqE5z0tnd9fVOgNQLVj3k1zumzlJf0CeEdrjtvjs9qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GfRD9DKj; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GfRD9DKj"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-137dd4cc208so678562c88.1
        for <linux-doc@vger.kernel.org>; Tue, 23 Jun 2026 17:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782260016; cv=none;
        d=google.com; s=arc-20260327;
        b=JQksEil+JB5DajahdCFXMFsjByPcn8F9JV4bjn/lwatKbvvIMty++Dinhcj3k2lfZL
         RKKKeaV3Au7TMqtaQlAP95PJ0qK5KRGXaje7K8xanJQajEqU1Oabad7KK7YlobuXXbrq
         Qd23s3T1Oa08XrV9aUieWl99gUoGGfFDnpM/Uw2RUOCib2PH+ReZCLACjv2nYVUvOfLS
         Q+v3gzZ+Dt07xTKV2WN8M6x/uR9WcJ5ZGx1ancnm/mf+B610KquB7fDbubp74CcoMaTT
         mH8JQLK71Pbf9wygE3HQKTj7zUheh5QWN7ieaQv0l2LzmVZ5D+aofeUpzVWeDpfNPGP0
         CzFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=AXfKSlAh1VQG+yH3bfeaIisPmAkRsyj1F3ZP6iafDhc=;
        fh=Y287JflRLJxMki4kLK2/mfzTE5PBn8NdUhnyvCgBc84=;
        b=dPBvFqgXNrqJFO3HOSrKT0OMI3le+oztbqf5ctq454zs5FyV/YliG0qvuCoroWCzLA
         w29QQ6QddkV3oEIzA0pqzWRk4tGDclDB3INtgp651k3IEEhy21jUMfiEPthQyQ1qq+mJ
         mTVlzdjAj+JD6fxkM/s4B14oPz8SDA3bQEhtStSAA1iSnMzNmSgbs3l4rvfe/HLovzYJ
         k0fJl+fDi16Ub+njHsnnzWDNwkrNdmt82wP8kBWLZM2KwWSwIG+3GC8RDwGg8x6FlbSd
         yzt/L0M+R1yGBCOWA18ITPEH90Yuf1YGpoQytRyLMjShMmrhU4op8fe6rSsDmlcRFGk0
         4m3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782260016; x=1782864816; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AXfKSlAh1VQG+yH3bfeaIisPmAkRsyj1F3ZP6iafDhc=;
        b=GfRD9DKjO6m4etzUk23FUdNdZ3CSHx3IZQLR8z1RuC4yFdMZFOSvO7wGWuFO9Pz6of
         jT+8BdagviOTg+P0UeM8nDK4Epu4DE5TP0SF38dSlppFLVd3SPW3VhaB7YlkhLZXYCNl
         fSxXWnKMDhQeQprUfMAE+XDAx6oF1ysjXhc/2tKw6aq3111tun4ezu9+5ax+D00pec5B
         Q+qppo1NWHKgnbyqMG6M7HRL7gcjBZbl0kIHA2zEmBK62djTrJVYWBpSaQvCutelBG+r
         7jOGVfjeVx8YuUk5wztCZOQZD9S7Xs3SZzTjThhoG0uLs8q7D/7CLT+pRt7lAIPJu0F1
         DGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782260016; x=1782864816;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AXfKSlAh1VQG+yH3bfeaIisPmAkRsyj1F3ZP6iafDhc=;
        b=ZmbpbxMrGIWffT3YOt8g4T2jl0CO8g08hrBGTs8ileoOOjgCu9N2xbpXbcKBlYS2ND
         P2azNMNIgmf7xSU2RpC4O2fOeMUVKfZoUM/9gryma44d+n8ySzx6ehIzXF1DFyKBfngx
         i2gK6FR9ynGlPrVgriFCjCuIZt1ErSa0A86n8wqyJo+g8FUAbtXi02zfqSG7z1GY8QVW
         uMLnhMsjaNVyUtCBsaPgPacZ+/VKUO7NJBcgqwdD5LfHm8JJ6Wk/jf3z/hh3FkQLbx0z
         eZkGY2YTYOjUIudp/bEKLqRKpgjpSbk8jv4VPZ6GM7jt0pLIk2gzrzrEYh0aSwDgrazR
         Z4Hg==
X-Forwarded-Encrypted: i=1; AFNElJ+jIwXZsihKd6m0CASqPxIOs99NT8pizXeaZ+99VLGU4xUvB1IRF0eFUEwNZqqkIU9r3fsBJ8px+aE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs278Nwv+252Il1YCiLwNs8mxRGJo8o20oJ+oeKv4GPvTUTzp+
	n4Q1/8ich8p5OLYZS2V5eWvLEGfXxKxaFCnAxHPkbEJa/ZFwCObNUdfxdsMIFee4nPBYxefvqvY
	j8YuRqnYKJ1xCjOIKrpN88JN7oNrKINMvsKO77s4N
X-Gm-Gg: AfdE7ckGruSgqixEFQs32x+nZEwk2G3lzzbJQhmXNO6gJ9clWffM/bZsD5z6YpHGpQe
	OLw8FGokISYjY1pTkuS2pn4a6W/Yv+7NjS2omvNOSqKPAogMia0qq3iRZE5P+gNoTd52Tw+LBvZ
	ocXZYWXs54vfmhN0voN1DR2u/9cfDD1y6lhbJRxaXSEAQOmWbF+iIuGoNYi0m3cW0sySEAPJzYl
	BqzXpZJ4k0xi5aMInWRi9yb8q122YgLzsp7NFzT28bF6XXUd4GKt0geKNrFXsD80qSQ3WVfNJXc
	5z/y0TBoOJVTDvNKBJ17xImQ+QYvsMzXrzYjYlOKZx+3uk0SK74aCplX8yc=
X-Received: by 2002:a05:7022:fe05:b0:12d:c3d8:1f95 with SMTP id
 a92af1059eb24-139c3c12ca8mr4394599c88.4.1782260014848; Tue, 23 Jun 2026
 17:13:34 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 17:13:34 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 17:13:33 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <a21bfc05-787e-4cd8-89af-8579357e6a12@linux.intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-4-9d2959357853@google.com> <a21bfc05-787e-4cd8-89af-8579357e6a12@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 23 Jun 2026 17:13:33 -0700
X-Gm-Features: AVVi8Cdxrjo0g3tR27IbX_VUitZ5rT0F_mHH6JHHegralypGAFX77zV4x7wFDNs
Message-ID: <CAEvNRgGF+O7r-YHqcLp-ZgoXTCbqjuUhpOdD5eE5w2wu3YYYpw@mail.gmail.com>
Subject: Re: [PATCH v8 04/46] KVM: Decouple kvm_has_arch_private_mem from CONFIG_KVM_VM_MEMORY_ATTRIBUTES
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
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

Binbin Wu <binbin.wu@linux.intel.com> writes:

> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
>> From: Sean Christopherson <seanjc@google.com>
>>
>> When memory attributes become trackable in guest_memfd, the concept of
>> having private memory is no longer dependent on
>> CONFIG_KVM_VM_MEMORY_ATTRIBUTES.
>>
>> With this, on x86, kvm_arch_has_private_mem() is defined if some CoCo
>> platform support (or the testing CONFIG_KVM_SW_PROTECTED_VM) is compiled
>> in.
>>
>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> Co-developed-by: Ackerley Tng <ackerleytng@google.com>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
>
> One nit below.
>
>> ---
>>  arch/x86/include/asm/kvm_host.h | 4 +++-
>>  include/linux/kvm_host.h        | 2 +-
>>  2 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
>> index 8e8eb8a5e8a6b..1bde67cf6eb0e 100644
>> --- a/arch/x86/include/asm/kvm_host.h
>> +++ b/arch/x86/include/asm/kvm_host.h
>> @@ -2394,7 +2394,9 @@ void kvm_configure_mmu(bool enable_tdp, int tdp_forced_root_level,
>>  		       int tdp_max_root_level, int tdp_huge_page_level);
>>
>>
>> -#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>> +#if defined(CONFIG_KVM_SW_PROTECTED_VM) ||	\
>> +	defined(CONFIG_KVM_INTEL_TDX) ||	\
>> +	defined(CONFIG_KVM_AMD_SEV)
>
> Nit:
> Vertically align the defined(XXX) statements for better readability?
>

Sean had this aligned with spaces, and checkpatch complained about
having no spaces before tabs, so I switched it to tabs instead since I
don't think alignment like that is officially documented either way.

Either way is fine :)

>>  #define kvm_arch_has_private_mem(kvm) ((kvm)->arch.has_private_mem)
>>  #endif
>>
>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
>> index 201d0f2143976..d370e834d619e 100644
>> --- a/include/linux/kvm_host.h
>> +++ b/include/linux/kvm_host.h
>> @@ -722,7 +722,7 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
>>  }
>>  #endif
>>
>> -#ifndef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>> +#ifndef kvm_arch_has_private_mem
>>  static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
>>  {
>>  	return false;
>>
