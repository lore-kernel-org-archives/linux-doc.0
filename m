Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BB63A48E8
	for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353045; cv=pass; b=em1x6fEgrR4QgeFOqeAOt2tUpNpU7cPLvptc9Obm8aqLrF4QNylJ2KxSj3DXloOP7NAxx/rafBC52TMDjBC03e3sFFzIu/5c8GD9qwq4ezPYQ8yJQKUJ7L+xJOQK+sozuvigwKRiQaYo0qAdcU85kAcVm02Z7OGQ0C7Ulw9EXvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353045; c=relaxed/simple;
	bh=CmmmdhhayV/b7ulbjd3OCXcgROAzS38gRgBEkt+q41o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aeEFG3SnRRixjwfJzGPhWZoPu+VAAVjk0PVKb2wMIsl5C55ywEZN3EVTftmx+EFVv2v98xkfmGEdyi9xAiX2PxWQHqDQdBdiWZlkHYreQSNd5IbXszzEZ+tlAluPjEKeSPanGVT/gQi/9V8n2cyaQqB1mimcNIIP76VZoDwYxAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ohnBiIn4; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ohnBiIn4"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50d6b393d60so1611cf.0
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 01:44:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779353043; cv=none;
        d=google.com; s=arc-20240605;
        b=ZywZEaLjdT1w79JfGHxM1G2Rx/EtFc3pXSYriS/Mw8v4tVfjqJBQZYNvIvfRq8tuTX
         3ojlKemp4/6tK4I9PLSZu6yqHiU9I9dVo3iOV4k/kIkGIKxmeBX5Zu31RNgWetxdpHeD
         8I7bF7p9s0RHISbropUfMSWO4anSQM3dPPd9IcBhOqdAHBw2gsG8MFbhQR7HWSTX8mTr
         HvMM87oU6tcR8DrNzR/TcA9BXKsuRf1lLu+gAaTP2RuNeKSju2NX/xq3K0oiUmBNzjCh
         W9/P5720ni1kw7OuCR4BCPb7vMRPpEn1aSCEMrjGRbMpTRQ8IKn4awSDh8dDLcMwY+H9
         0Vqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1kiAAPdqT4PYHNduYcz+D7nl/8os61F/7CmhrRm2X2M=;
        fh=V/ehvFTToTM1c2lmrPjfqrD80mmS6LlAlWAwCrwRBLk=;
        b=R7xq48tagfTZeUNFfuDmsSRUmLvF5e9phGhWGx/sJyc3ZLfAxWpwDzbzGR2E1PVtXt
         O8rFijGXPhuhN659HQfoNxk0UMsdlIKS5dA5Fz01KKgk6yW86QilrOujzGj0JwxQnliz
         hPQq9vujyDPCOXsQAnJT3tfqfvGkCWgHAEq5QYm0lX8arwANXXp/NnPd9CdkaZsF2tBE
         B6H2kupsDGo4+qoWdHjA59NgYg2mQgMsHXd8SsChTuvkGa7bFfYsYKTMfdyoQFprP2Es
         XyThU9lMUGcAGKz7CJDcgHsi1jVqlo61kx0cyRZ5A2ubolIqO+POgRC2YKHKqgf1U/3w
         ifPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779353043; x=1779957843; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1kiAAPdqT4PYHNduYcz+D7nl/8os61F/7CmhrRm2X2M=;
        b=ohnBiIn41UK8NvV3YpcqJtN6m/ZsymFNicDzFm/WJwdjXsSqhWm9XZ5lGwqZSY6tPM
         lraZCaO/iJxOnz7YpDbNvwHM6Ez9+xTdCNn37ivHC8RbwO1L0lUxfvc0sOIvyjXXCoQm
         6EATiYq5/59uzZutmhJylnc41m4CB8SdmxSq4HpAlGw7YxMkI5NLqrEAH1818PmYByKn
         MKHnyc6uHa/ultgIFa6opXVavuwpJn9vPdI6QXc6TWAJHY2SLuMDAOJ3tWWM1yE4TD1u
         EJik2T+fbCY+jSITKRFuguF0NW5r+injPzjFYcWpg/Fxg+yKNKTo9CZjFBR9O9L5AoWS
         QAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353043; x=1779957843;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kiAAPdqT4PYHNduYcz+D7nl/8os61F/7CmhrRm2X2M=;
        b=INyyliwt0RxAPzbgssFb+fEQ4O31x7t4u+ix9iFevH/UpueDMkw7RO21Y1exPU0JjU
         E20onvsmW73NwBHQBK9eMhEqw3ZhYXrmxSaBiOzly+ZWb8pvUkjTO7mMPUzeJvNFXphD
         EhZsgvOWn8eDo+XJa3Us8D+5t0EW82rrV9BYunGyGwtymkQbYF0WRU8Wlzn9aRJ8c30x
         pcjn9GGEGYvY70JDx+PwL+IDToQ2Qe0jHqZHe2yfOiqML4KaijPZNKOPI970STt8U2AO
         98fXSfPMWyc6wFz89SDnqDDxtUDkM4Nu2IboHtHYMWTLgamHlkAJdUSNHRD8bUnv668K
         qKfg==
X-Forwarded-Encrypted: i=1; AFNElJ+NAbPYN2/AuE2LwhwWQq/kabJCNUjb3eEfe91yJvfBdAoc/tTdevZjp6s4a4lmI99i5zeGksr/dp0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/wQZCW/usQ+s9pROjWxGv6XTvbEPPl2Rrmb444GfybLFJZBNS
	Z9+Nmk6hLUsCleMvAQTf0SfBIHRJjQniAfHBbcH6N4WPrKdKkppiJguDOSAGP9EmpmTYYWDtf3h
	OVwBS4V72Gxo38Ju2mOwy9qVVzfcFhpmxQQC/E2eq
X-Gm-Gg: Acq92OFX6lOVFh4MPUgj0SMsxSsBsKoo9WN7YyqzxGEFMhYN+KYpnQjwn+DPut3Ix2B
	0rW2smFDC1plg6Bqgo7Uc3GTKE1OBZ5HrXnCNn9y2cccRe6waJO/K1QaZA6CgAIysVafkj9PBrz
	NR06Xw0vlYlzNJYj/nA5ibR+tmSHpTm7yWhFAHpl8c7tXzzscr2MkhrF2d9asiObF+9op8YJDEK
	sjRg1FnLGu7hOFEnDYPON5ohNe9juoLYkXiABaLvfSnwBUxRUDxkCqYV2aV1oUFksR/fAc04/A9
	VHhGTe7t0Tl6FPUESPc=
X-Received: by 2002:a05:622a:4cc5:b0:516:4f62:85e8 with SMTP id
 d75a77b69052e-516c552713emr7157791cf.19.1779353041810; Thu, 21 May 2026
 01:44:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-19-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-19-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 09:44:00 +0100
X-Gm-Features: AVHnY4IQ5gCtMUjytcQydV2ClyWPBKSROIDG9-iOU8lHVPfTjxaIUJeWGPDUkE8
Message-ID: <CA+EHjTzu=28Sr3=9A9LmJEGz0tBEDbU9taznVV5kdL7s8Nw=Jg@mail.gmail.com>
Subject: Re: [PATCH v6 19/43] KVM: Let userspace disable per-VM mem
 attributes, enable per-gmem attributes
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

Hi Ackerley,

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Sean Christopherson <seanjc@google.com>
>
> Make vm_memory_attributes a module parameter so that userspace can disable
> the use of memory attributes on the VM level.
>
> To avoid inconsistencies in the way memory attributes are tracked in KVM
> and guest_memfd, the vm_memory_attributes module_param is made
> read-only (0444).
>
> Make CONFIG_KVM_VM_MEMORY_ATTRIBUTES selectable, only for (CoCo) VM types
> that might use vm_memory_attributes.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Config files always confuse me, but Sashiko might be onto something:

https://sashiko.dev/#/patchset/20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4%40google.com?part=19

I think this partially goes back to commit 6, the one I flagged
yesterday. But also adding "default y" to KVM_VM_MEMORY_ATTRIBUTES?
The default value should at least fix this issue, but I'm not sure if
it would cause other problems...

Cheers,
/fuad


> ---
>  arch/x86/kvm/Kconfig | 13 +++++++++----
>  virt/kvm/kvm_main.c  |  1 +
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index b6d65ee664d0f..8b97d341bd33f 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -82,13 +82,20 @@ config KVM_WERROR
>
>  config KVM_VM_MEMORY_ATTRIBUTES
>         select KVM_MEMORY_ATTRIBUTES
> -       bool
> +       depends on KVM_SW_PROTECTED_VM || KVM_INTEL_TDX || KVM_AMD_SEV
> +       bool "Enable per-VM memory attributes (for CoCo VMs)"
> +       help
> +         Enable support for per-VM memory attributes, which are deprecated in
> +         favor of tracking memory attributes in guest_memfd.  Select this if
> +         you need to run CoCo VMs using a VMM that doesn't support guest_memfd
> +         memory attributes.
> +
> +         If unsure, say N.
>
>  config KVM_SW_PROTECTED_VM
>         bool "Enable support for KVM software-protected VMs"
>         depends on EXPERT
>         depends on KVM_X86 && X86_64
> -       select KVM_VM_MEMORY_ATTRIBUTES
>         help
>           Enable support for KVM software-protected VMs.  Currently, software-
>           protected VMs are purely a development and testing vehicle for
> @@ -139,7 +146,6 @@ config KVM_INTEL_TDX
>         bool "Intel Trust Domain Extensions (TDX) support"
>         default y
>         depends on INTEL_TDX_HOST
> -       select KVM_VM_MEMORY_ATTRIBUTES
>         select HAVE_KVM_ARCH_GMEM_POPULATE
>         help
>           Provides support for launching Intel Trust Domain Extensions (TDX)
> @@ -163,7 +169,6 @@ config KVM_AMD_SEV
>         depends on KVM_AMD && X86_64
>         depends on CRYPTO_DEV_SP_PSP && !(KVM_AMD=y && CRYPTO_DEV_CCP_DD=m)
>         select ARCH_HAS_CC_PLATFORM
> -       select KVM_VM_MEMORY_ATTRIBUTES
>         select HAVE_KVM_ARCH_GMEM_PREPARE
>         select HAVE_KVM_ARCH_GMEM_INVALIDATE
>         select HAVE_KVM_ARCH_GMEM_POPULATE
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index cec02d68d7039..ba195bb239aaa 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -104,6 +104,7 @@ module_param(allow_unsafe_mappings, bool, 0444);
>  #ifdef CONFIG_KVM_MEMORY_ATTRIBUTES
>  #ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>  bool vm_memory_attributes = true;
> +module_param(vm_memory_attributes, bool, 0444);
>  #endif
>  DEFINE_STATIC_CALL_RET0(__kvm_get_memory_attributes, kvm_get_memory_attributes_t);
>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(STATIC_CALL_KEY(__kvm_get_memory_attributes));
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
