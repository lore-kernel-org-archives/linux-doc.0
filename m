Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0183730C35C
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 12:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278941; cv=pass; b=Jmk0+R3MfI9jALbv2lS0vVWYemcNg4b2a6ENqGfUDIrXQWbTl4GccDt9tOPMx2IpBnto83cty7Szbi+zOfl69W4+UExu3Xyiour51zZ2sJoTJinm2GXbZOcfUrnQWSp64soO7X2jc2zr9VY0/gacZCP/iSAyLum2LQyP8KwcI8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278941; c=relaxed/simple;
	bh=UL5TH54YsejC0jorgc7QDDO4B8HZpwF6Hf/qda5tNFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tiUuF9VrPSbByAB9HOkeLwHbSP/4scy/3A7IpSfENWUygnAh7o4/ivduL0wDiOPwtVPCWCChu4U9fxxbSy8nUcTpqzy7qO/hqbOk9JXxI2HOVWYaM2IjcP3PMtK6vCDnbs8NI0tKCJs1UZFVYPvA4qwKow3ltxUBvXW8MAsvnt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vA79okPr; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vA79okPr"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50d6b393d60so7951cf.0
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 05:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779278939; cv=none;
        d=google.com; s=arc-20240605;
        b=BtTr+p+mrzAxuNtrHPEQOCtPMEVAO0atzCVHbGaJitjP+wOlgyDjVYWUi1w3XWJLF2
         Vxcbf2rdTSMfCe6SD0Gu2JYTsjnHJ0MgtQSYpxghDDATZNmSngosDy2ZbdsbIrMEEiNT
         QyqOPp6r/Iy4QUx+3B8xe9H0IfwgjU6jNmsW+kWZAOqEsUomDTlt8lC1Z9umEbziig5h
         +0Vr1IzIkh4SXKBT25AloS6SwucbtE75XLI4P8AhrFZ/Lb0AwBio4fLHfR5ow5W7Gq6R
         4tWGK2Hc1fY27m4+r8uH0nC3ZQpyPSoepw9cGssZ6mnEPqIO6WAaCozW5YNOeMyf9xyu
         g9Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+Px9FMSWQfRWBgPBzexC/j5D1iZQd5J23JXma/NqqOY=;
        fh=NZhJr4phXiaeJ0EQaO9D4GpsuQbEH1QrIFZghjEwmHs=;
        b=NE8GaijL/Ji95UpQqTsGXCZ/qte98lwVOhpBgoUDyg+R8tafhN3AMOWby9FuK8nqTs
         gIxVyGKgzu+hI2gMenaaP1isW+PNgq4Fw0GTHZRc6t2ltG1B+Tnrm++EdX163WEa1nWz
         SoTPvTSDnoyorJF64G+mkDIad4/yi/Jc2BmxwjpC+XyU/EpKElJCYAzLlW9v1r0DYYdP
         hJ4ktNmOXhHEYgNLKiuxDgaxe/hJvpP0kuefLFcPLaM1wlIoHBSLcU0SGmO7BrhmhkH7
         KLwS0VtxsukKYh2B3KJXl4cG9OSN2K02yquRAhLUylq61tWlEQgmKCRJl3ZRyjw62cye
         Fvaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779278939; x=1779883739; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+Px9FMSWQfRWBgPBzexC/j5D1iZQd5J23JXma/NqqOY=;
        b=vA79okPrNl8/E58Oe6hC/PSwspCkodR6V4uLDnXuTL3mnZoq3pmr18UxTKlKQ0eF0l
         IOfCrnoq40V02E5ZNp+YB/CzGeDrIB4Uz6unz5fiOM5s2U0qHlU5TgPWy5MowFFrbNL2
         +iM0MFIOBnUyu2ci+T068ws8WkUGQf12du21hRH/KNK62CDlYF4J5Y3knhbN7bHiNtCA
         RFyq3AB+CKHw51QBseuCJj4rrLckY9nkZXOvQhh/CLjs2UJxlWKzAVPz0x/33Cqdk6AX
         bx+oRfwCxHpmDSXbC2LMr8W1T4id0XNp0Vjp6JrAjHMwWBervvGZhWxdQwjH6EynjVTY
         uqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779278939; x=1779883739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Px9FMSWQfRWBgPBzexC/j5D1iZQd5J23JXma/NqqOY=;
        b=KvE3cGv4He70By2iRg9K/SPo3uK78aWglDQPphwYvhZv1WxyJ9ZuiMCIiO5fAhU6Aq
         E2ts1uU1aJDGF+cFqHgFw2V59DmIR8ADQ7nBh7MRJirQGmhnqBh/vJk/FlVgne99kdXY
         ElUStw3r/zNKVHlnKoXhkjGOCkdH7mnGZfN87Gl3ncgt/MhurOUJjVzzjaul6s+5w6uv
         W1PB1qSvStMEcrIBQPVG/beKmCfdlxb7z+R0LzIC/Sc8KZCMEqqBkNcjBcI0YloQJ9Q3
         xY+iKMGwcMMDyPpvPpjXoYLWxzXfS1tOatkNuzfipNinQVktVlD5Hhznkq01KHaDSQqW
         6eZg==
X-Forwarded-Encrypted: i=1; AFNElJ/5gnBVhzUDYLAW32+Z10PTTBO9N7z/JQ8RYnodvxyaFodoLs17xpvl0N6vq/kgf/IBnW7MhOy/IQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgvXrC2a7lcKDkLW1c1XLokJlZIJkGCEUrWUh5TYPKbJd9fZYC
	O9X1BIsYEamFAd5hIGfr4lt7R+1/SqXZIQEz+RZYxvEinlYSA084uMXfYowLR2FGtyjQdULeawr
	uzAGHptlg6xmvl+68Vys0FHydrerzLITItfTXLn7S
X-Gm-Gg: Acq92OF5LhNkl2DBwwVhXhQEAdLTp+rsO6855bcQ54v1fjvLFnWIgyt5U+4mpi7+bEq
	bW3ttj2fHJ3tzCS65lCVuo8sgzjhLh4kPbofsigykzZSzCHzwI3/4tcYt9cSba11CYXapt2N0DO
	j6L2YtMRB+jg+DGIpo22ylfvwb63zN9fDHfLse08dF8RyournO8yWzVnVNrXeZ54kklWIyi+nOA
	2xMa0dBHAVAt6lONxtu3WihjZbGiMCVrVrlrKXXqA813YMkIiaZEnJp4vmK+O7j8vacmUG5S8xP
	okYKXD2wIQsp92PRFGs=
X-Received: by 2002:ac8:7d11:0:b0:4ff:cb75:2a22 with SMTP id
 d75a77b69052e-5167b58811dmr18170691cf.3.1779278937787; Wed, 20 May 2026
 05:08:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-3-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-3-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 20 May 2026 13:08:19 +0100
X-Gm-Features: AVHnY4LfQbiWdiGwXSEhGQDtGx7oiVEOShaBU1_EGdecpQaasdwwwCwSujlZjbQ
Message-ID: <CA+EHjTzvkF93kznZ6e5SBu-w9Gc_Z4ryDwg7qnjzWSPt4KfNCQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/43] KVM: Enumerate support for PRIVATE memory iff
 kvm_arch_has_private_mem is defined
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
> From: Sean Christopherson <seanjc@google.com>
>
> Explicitly guard reporting support for KVM_MEMORY_ATTRIBUTE_PRIVATE based
> on kvm_arch_has_private_mem being #defined in anticipation of decoupling
> kvm_supported_mem_attributes() from CONFIG_KVM_VM_MEMORY_ATTRIBUTES.
> guest_memfd support for memory attributes will be unconditional to avoid
> yet more macros (all architectures that support guest_memfd are expected to
> use per-gmem attributes at some point), at which point enumerating support
> KVM_MEMORY_ATTRIBUTE_PRIVATE based solely on memory attributes being
> supported _somewhere_ would result in KVM over-reporting support on arm64.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  include/linux/kvm_host.h | 2 +-
>  virt/kvm/kvm_main.c      | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 7b9faa3545300..7d079f9701346 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -722,7 +722,7 @@ static inline int kvm_arch_vcpu_memslots_id(struct kvm_vcpu *vcpu)
>  }
>  #endif
>
> -#ifndef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
> +#ifndef kvm_arch_has_private_mem
>  static inline bool kvm_arch_has_private_mem(struct kvm *kvm)
>  {
>         return false;
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 306153abbafa5..abb9cfa3eb04d 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2421,8 +2421,10 @@ static int kvm_vm_ioctl_clear_dirty_log(struct kvm *kvm,
>  #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>  static u64 kvm_supported_mem_attributes(struct kvm *kvm)
>  {
> +#ifdef kvm_arch_has_private_mem
>         if (!kvm || kvm_arch_has_private_mem(kvm))
>                 return KVM_MEMORY_ATTRIBUTE_PRIVATE;
> +#endif
>
>         return 0;
>  }
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
