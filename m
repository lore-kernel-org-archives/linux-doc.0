Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857EF35C1B0
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 08:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781856785; cv=pass; b=jl5oAJxrqKerChdPr/TohRGkqVWlPIDYVwr1ZE1kaH1EfQjjizzHkyNqoCUm9ByV4T7eCFU/7pOftzeONGKlmXor+UxecBh/MM4BzcERsFzq1uenyb+7pp7tWpg9RMyt2BbEcMPsS71owOJnxR3Tr8DEbA7x4tfc3KXl8adNTEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781856785; c=relaxed/simple;
	bh=mhRQfYgewaEHTKhgMkBt4xMNRF1jHjLdpGKjwA/SfyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O8ytmafU3lwDtpNl6vKVqedNAmsNqbCHZ68ImcqherQNaDWeum4Lsk3WeMmHshrlmueCzZK5nQe4bpcbUUIZs/XZPZFT7VHcLZXZylHyvaqL1opg2B1bn0PVTDdB2+IFK0fxVsbm/3eAmqITkkARoHo2RijtA8pYXZYcV0aBU3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sahczB/r; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sahczB/r"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51765531803so194661cf.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 01:13:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781856783; cv=none;
        d=google.com; s=arc-20260327;
        b=KFez/05dQYSAtxMgXJtd4HLetwPgRj2cekCtP/ttXU9gCqy6U8gvcW54irBWNsoR8n
         FZtKYOW++GmEaX9c6/vCs8Z2f3VKOhO6LdNEJ4ojqMTIQO6Ec8LPNS9cIEParSdc7b7Q
         z3TrgxHcM2+XYoHp1O/dqB1hUxKicMLMy3yzeNeLZKa862y50WlCt59i7P5sO5m8VSjy
         JPByh0JewNYz6Dfj5Ng90AQlCB1InGrR2M3DEhuSLHNrazVhzbo1/itrj7l8Qdto6vOP
         HftAUX92Xb8+ZTifQfU4CIehgIi/WRDFaSU+xMzyBlMJcpLBf73HVyWMy671s2Q6ysh1
         bcQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RFwtLOklkbcVKFnDpfEXKv2zd3HGlCKJCihUf5qCkBo=;
        fh=YEv/QjO4V87w+6AGSH1iy+HpBx3cFmQplOQRZox1+kU=;
        b=HaE7R8bE2A3Lx/tjtESj/iv+eREzeZsbtWh5RB9AYCioeuLzHTwK+/XzQ9EiQBxQ02
         pMyT1gO89zA42jY/rcH0LkHD+0T4BwnVJMMSWxOqZTWyAqSMvmXqIr76J7PkLcXnrz6Z
         ZzC71oD24lRxS0iRYyp0jl5ejyJT+d+hQX92gYq74rxv2Nokb9fd3MmOPw/OgVtkFPSY
         SNIuxdKnfQelRqQqCziFjR0SHT24XREwVHBmKdfBl9XC/jh+72mPveJirQGpfjt3rzrK
         hJPT+gf8n0ZAhSsw7XsNb5sWgrAqm4JjIS6p07ldHCDNSBxAdEdrQZaOdv/SuzFMd8is
         VkaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781856783; x=1782461583; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RFwtLOklkbcVKFnDpfEXKv2zd3HGlCKJCihUf5qCkBo=;
        b=sahczB/rRnzk+ww2AZ1aNgNxt/nON3nOo+Wi824CuV3rJoCfe4RgPy9Elx7/zM/Vjk
         +8RH3kL/rA4+Sx/MXeSPmI9gj0wNz9nj1L5WFKQLCJdqgIdfX4PmOiESOl1iOo6Q4XDw
         sFuuoHhXCjsC03i9YUzkFoPPUhLZa5KWUFkLyDkzGTnP0icEdvlSY4EYgfzaN0ZEOJo4
         eNekKNaU8BYH5zAaXomtPwhTYdNjTggsd5rkZN7GJ4ftJPbItbsPKSPghimp/FGrA2ue
         mlt4+T3aY1PSAHL381lM2lqC1/Uiv9smlERNoSUXwXae7e6bJvPRki9+2p32tA5gzIdg
         hSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781856783; x=1782461583;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RFwtLOklkbcVKFnDpfEXKv2zd3HGlCKJCihUf5qCkBo=;
        b=aOzqBbXpD/T+Xb+uYRpIqyf5hJXluR/8BF7Q/Vvdu+ASZG4Z3WoA0Rr+MmtFDJmDeB
         OruDkFJ1m1dbew6vaxxQ21PL4aTzbebX2CyHLYqFKn68qWGbwANdobu4QLwL2rTqe0la
         FLXbeAvW4DTy4Gt8K22MET3ox5hntzRnjOPJyldtrADvt7roSEFz+yyQohR1SiMH67AZ
         UQChEk3MafgUe6w9b4tGQDco7dP5oT5Nm/n9MWHWrLruIxWAQ0vg+PfjxKaHGvtS1pRJ
         5g97flcGx4tQIBmm69E1Nu5VAeX4HHQmRW5SkfmDvauCcax8yV4lqQrcAw34WA1bfVJl
         hblg==
X-Forwarded-Encrypted: i=1; AFNElJ+vgul5evSsUnBgIEqgyspWm13ni6Byw8X0+6t9JntK2Vr12pubnV568hJQsLKVl8Q1JjBqkDXzx8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YykGqLdnZm+11bPdZzIkunip2Id+iMbHgmjed8D7/5Yt307bj7/
	vEMP0WyhwnVvvpbsMKvpFnwfstNjyQ2SPhDzSiTa0PMTex9PRprakT1tonG7ppyZ1D+DL76+Ow0
	2XdddgFEWk8UydUJpeZSflU2N8tEIwu9dNU6u93S5
X-Gm-Gg: AfdE7cl9RKh/hpxMrDJkxGyy9WoAjj9Vj+2ZZSBPFKLgDYSvAs46TJy7GNL3AdF80Ft
	7rQdFDcRd/oW4qb0CMwW2EMLUk1BW+ABnfjOnJM16o1QcGd8CIPk+d8eC5XFfS519l2JyWsTxwS
	FfT3f3PXnufQ5WPtja9b7O/nHiin6HzP7VDoFEo+voQ2+zuAHXRJk5N5/LkC5fJ23Mj/0cZy/eE
	0C7kCedZ0mU4McFCA0d/2lJRVHaF5mwAjO+WQpo4sjS3kuhOCSRLtX8P2+f50Jc9CBOko+oUQ75
	YfGaGjfW
X-Received: by 2002:a05:622a:1906:b0:516:4f62:85ea with SMTP id
 d75a77b69052e-519e8d3111amr4387331cf.21.1781856782436; Fri, 19 Jun 2026
 01:13:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-5-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-5-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 09:12:25 +0100
X-Gm-Features: AVVi8CcN5N8mHAFYGVLMZrPjXc2jn5V9jAAbKlAQIrOrX_OPU6MaDRc17hIP_FI
Message-ID: <CA+EHjTwrfont5S84MpiwSLfk5doD_RwS96EX88e07c4-1DeMZw@mail.gmail.com>
Subject: Re: [PATCH v8 05/46] KVM: Make CONFIG_KVM_VM_MEMORY_ATTRIBUTES selectable
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
> From: Ackerley Tng <ackerleytng@google.com>
>
> Make CONFIG_KVM_VM_MEMORY_ATTRIBUTES selectable, only for (CoCo) VM types
> that might use vm_memory_attributes.
>
> Also document CONFIG_KVM_VM_MEMORY_ATTRIBUTES to specifically be about the
> private/shared attribute.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

You're missing a SoB, but with that fixed:

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/x86/kvm/Kconfig | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index 24f96396cfa1c..c28393dc664eb 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -81,13 +81,16 @@ config KVM_WERROR
>           If in doubt, say "N".
>
>  config KVM_VM_MEMORY_ATTRIBUTES
> -       bool
> +       depends on KVM_SW_PROTECTED_VM || KVM_INTEL_TDX || KVM_AMD_SEV
> +       bool "Enable per-VM PRIVATE vs. SHARED attributes (for CoCo VMs)"
> +       help
> +         Enable support for tracking PRIVATE vs. SHARED memory using per-VM
> +         memory attributes.
>
>  config KVM_SW_PROTECTED_VM
>         bool "Enable support for KVM software-protected VMs"
>         depends on EXPERT
>         depends on KVM_X86 && X86_64
> -       select KVM_VM_MEMORY_ATTRIBUTES
>         help
>           Enable support for KVM software-protected VMs.  Currently, software-
>           protected VMs are purely a development and testing vehicle for
> @@ -138,7 +141,6 @@ config KVM_INTEL_TDX
>         bool "Intel Trust Domain Extensions (TDX) support"
>         default y
>         depends on INTEL_TDX_HOST
> -       select KVM_VM_MEMORY_ATTRIBUTES
>         select HAVE_KVM_ARCH_GMEM_POPULATE
>         help
>           Provides support for launching Intel Trust Domain Extensions (TDX)
> @@ -162,7 +164,6 @@ config KVM_AMD_SEV
>         depends on KVM_AMD && X86_64
>         depends on CRYPTO_DEV_SP_PSP && !(KVM_AMD=y && CRYPTO_DEV_CCP_DD=m)
>         select ARCH_HAS_CC_PLATFORM
> -       select KVM_VM_MEMORY_ATTRIBUTES
>         select HAVE_KVM_ARCH_GMEM_PREPARE
>         select HAVE_KVM_ARCH_GMEM_INVALIDATE
>         select HAVE_KVM_ARCH_GMEM_POPULATE
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
