Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C193A05C4
	for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 08:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350901; cv=pass; b=rQ293JdRz8SNjFVRXjsVWiEITgHyJuHqzl9mmuAss8CapS5RoeHEbIJEOOAf+Bg4FZFS29v9IbTAAZIt7HQWjSRR2E7wrINNsy+8xRvkY9IEGVyAfOXGakwUy83cYK4B5W+NdVDavkhBji9gqTftyrRzhu4FnbhrAWuO84wCUxM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350901; c=relaxed/simple;
	bh=1GakT4SLC90WzEHUaDnF34eVqI2fpwRSLI5kegyTcEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eRoSIkf2wswNibTe9VqsSJ7VzfzJNFvxrcUdy4UmcmN8DTcwCpU5yIMbiEeFz31cNkNBbYrM+5+c4dC32BwpNZIXPQsTkI0uZ/CCSbD1I+2Jgwr6UDWrafgElIQnVI2fRYhgamhfSyvwBdCQv+1Ze2fDKJgY1u9sRLMmQ+EqoNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vNa4ncl4; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vNa4ncl4"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-515548f390fso3431cf.0
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 01:08:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779350898; cv=none;
        d=google.com; s=arc-20240605;
        b=jlyzxsruizvs8mU9stkkF/6mBHGUDM62LxFhu1Z+IjTcUVaTqnWD3Gu2/H2emoOyVx
         lq0xyWZapSdHbV/op0zbBrPm4xyZGRn2oTaMWOhHC6QCMHmECCrlHUHGzeoFT+XcKPtP
         5UqwiWyiDRKFIyXlaQDfOT9rNDdpgCD65+xI2hZzu7yJOLklCQrcxoDNPtZN+F1UNl4I
         UeiA11+0sS8otHfJRd0QrzrRljylX8QutgGCDpZImO1D2CMkeqCCClPb9KL4jdy5hLr5
         EUj3AVuxHlq/Zr0RYOmzBBO8AybR/fcarItFmcLJe/1vVwdmfMi5SLO6AyWzmY4mIoKS
         2Rww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7RmlTBsfZu7jfSANKVaOagnr+/jgA52gkBUY+7wdM10=;
        fh=Wkujt8JfJUti6OSgTfV/WWAqosCnSQjytd44vWjVUr4=;
        b=AfQ4IIWMW5VQFctA9MGRK7LEnMPSoMYIUJ1JqCpP9XM3vrmqVVfA10XrlLnm+xMlNi
         ontRyLC3hFq30/uaHZxf7ONOP8W3U7dadtZhw/vgu5SgzIY5Bk90vxhCWhL32bYE0sjJ
         YBdAOc+AoBj3bsPXkehH3je6WdIbDScC+mpqoiXzJWE1iK85vbBccnEPv9ZR0XWeOdF6
         I5+b7Al9oxD6KQMNr23fppCxZoXEug0HpALtY+/chgbbwxg/OMBQWQx33kAIbT/E6FCq
         /lwJvpHScB1oPKbmigJrcfi0CrMMOBqtiNwI1QKv1JB0DsCmKy4q3OFXHVkai6ME7v1B
         cEuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779350898; x=1779955698; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7RmlTBsfZu7jfSANKVaOagnr+/jgA52gkBUY+7wdM10=;
        b=vNa4ncl4w88J0jNq6h9uTpV/yc3viKafNMSoFRv6ne3V9rhUNFugVCeiSMRdIx/87D
         TVFSXh25D2vRuEtzLjkCsEviLgn1jWIyr112ltrat3Ol0r9CgYXKsOz6sjZ8E+LlQxI8
         0sbsHWLfeiKOjg5/NxkMrywhvNdMzSesGb2xdpJAc8EM4JpMQlZYtFrCu/sDiIO5i1Tb
         sumwZJ+82jOgNXR0ZZBjdMBODKRWkxYb1xTde73+1INALPFNgnvtbTISnB566JM4Ef+x
         RyR6IGvNcp8HCvqOy7t8rll5A3cZmb/D44ZjFB0Deqh5Pl6HH/xnGZVfChInXyOa6gWY
         herg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350898; x=1779955698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RmlTBsfZu7jfSANKVaOagnr+/jgA52gkBUY+7wdM10=;
        b=lYzlqYdHzGflvKEuw85apWFphqx09mt2QuNq5QyZrFcXysZYJJwosTCzcnl+sdbIRd
         Jtzot3DDmwdFg+dr8g6L+pyCeSwy3PDN/A+qu+G2q+kbJ7lXPKKp4bsa0Ym4gZQvlxJ5
         84qDyvsjs3xkUz13xBX3R8pHMDncAFfoON7o3BTrf1L+8mu/LywxM1WWcmU9lLi3kaPv
         bqoB6d/zrfKDTNjwz8ss5dH3pXery4UURekpU22ScaBzJd6UvNZL0xq/xjVnFyOV1KHR
         kO7yZJtMd7d7XPhHoU27/KGgOW4Ai684eCpO8EWfaE8cD6jXLtyMDC8aMBojWor25rzk
         ygNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9pwn/KUEJu3qtXKpu/V0xE/VILisoVBnrkspci+ZGhgUrPzkfEdnmGEpuSitnSkc2dh+JThpoOGqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSNSwD6yntVMzJ9/qcpjA9lZEcCuSf0Z2O8WPmPPvrPWWKvrg9
	RNMNnO0jtVvGBRCdbOmPQzO1yfWBXwObQnN936s6o/zz2jPvZs5m0ThAlzcxM14L0VPZkyGvGtG
	A70OrLJnv7ooKzrVBRF9dW9v3QYsk05AmLKdm8zVj
X-Gm-Gg: Acq92OEZjte7xe+d0p45VcyOlEc3XoxY/7s1aUy4p9RYaDve2IRjiaDqAlJWjfDdeTA
	/9ObFZgOCXOJy1caGCddgtj8CG6eFEHcQ2f72WrEYagNJDGGDhh1dD5w/BEX+50Ix58wvH4KiZc
	b8u1sKO3p8075x9JwSxG+t5Je4rrFoXh/B/5/s7k5eZ/1RyevNCWEXio3nwvqV2Loh3/XWoIJWg
	FkDib5DmSnvRZ3rm8B01va3WEJXBhiQvPoVIJfwH3qdfvLsD+G89BVk41X3g4V4KfnGcuwmYpSQ
	3826p1TMqaeQMjSuLsA=
X-Received: by 2002:a05:622a:588c:b0:50f:ce97:3b84 with SMTP id
 d75a77b69052e-516c534d1f0mr6941501cf.6.1779350897637; Thu, 21 May 2026
 01:08:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-18-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-18-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 21 May 2026 09:07:00 +0100
X-Gm-Features: AVHnY4K_Cpc3lp6TF05Y1I39E-kRC-mXXncMC4rrkZH8FAVJjZ2CPai0rhLiTAg
Message-ID: <CA+EHjTyiAgmBQgmrAHAHx3G1yKsP7tSgd9r-y4oPKQM4Nn_Kjg@mail.gmail.com>
Subject: Re: [PATCH v6 18/43] KVM: Move KVM_VM_MEMORY_ATTRIBUTES config
 definition to x86
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
> Bury KVM_VM_MEMORY_ATTRIBUTES in x86 to discourage other architectures
> from adding support for per-VM memory attributes, because tracking private
> vs. shared memory on a per-VM basis is now deprecated in favor of tracking
> on a per-guest_memfd basis, and no other memory attributes are on the
> horizon.
>
> This will also allow modifying KVM_VM_MEMORY_ATTRIBUTES to be
> user-selectable (in x86) without creating weirdness in KVM's Kconfigs.
> Now that guest_memfd support memory attributes, it's entirely possible to
> run x86 CoCo VMs without support for KVM_VM_MEMORY_ATTRIBUTES.
>
> Leave the code itself in common KVM so that it's trivial to undo this
> change if new per-VM attributes do come along.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  arch/x86/kvm/Kconfig | 4 ++++
>  virt/kvm/Kconfig     | 4 ----
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index 26f6afd51bbdc..b6d65ee664d0f 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -80,6 +80,10 @@ config KVM_WERROR
>
>           If in doubt, say "N".
>
> +config KVM_VM_MEMORY_ATTRIBUTES
> +       select KVM_MEMORY_ATTRIBUTES
> +       bool
> +
>  config KVM_SW_PROTECTED_VM
>         bool "Enable support for KVM software-protected VMs"
>         depends on EXPERT
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index e371e079e2c50..663de6421eda2 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -103,10 +103,6 @@ config KVM_MMU_LOCKLESS_AGING
>  config KVM_MEMORY_ATTRIBUTES
>         bool
>
> -config KVM_VM_MEMORY_ATTRIBUTES
> -       select KVM_MEMORY_ATTRIBUTES
> -       bool
> -
>  config KVM_GUEST_MEMFD
>         select XARRAY_MULTI
>         select KVM_MEMORY_ATTRIBUTES
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
