Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491A6848E
	for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 15:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715959086; cv=none; b=PrshdvSD8GKULVJYPE96CIys1cbuGnFId/BThHV1XJ+ADEHHVe7fIWJxksi8rV3McYMu+yC0bqawoKjS+khOLHjhfLLVnoKJIUag/tea2MFs0AdLaTJP/3tdoD6oFPhi49M1bPYDHZeA8RJNVJ6dMz11tV//V9+aswgOECtGF2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715959086; c=relaxed/simple;
	bh=VJJtaa3CR6YMvRWAqyg1KE5Ku5S+20oB3+0+lzQy9oI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Icz/xMdQ/Oru4IwbJznV2gyyewKHazrXP7ZsJAGICJDwWH5Z9+0Wad2VHPyIERU9rrOeR60Xqdv2zKu6xl56ItRF2GLZKoKEssPO7ez4CMhz+2SWiIUq/BO61PLoAjI1hs5f6ZwkA+qsjFmRZ4SGXeO1Tinvbe5HdmragHXchgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=GWSAlyKD; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="GWSAlyKD"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-36db3304053so8402945ab.2
        for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1715959084; x=1716563884; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ef3MF8Rs0G3jit24HO3OWy+0DrrgzGDkN37Y+6PEB9I=;
        b=GWSAlyKDzSG/8Lva7AJJemLNxl1/rCKHYRbWzGVGo9u7VdJpzWumg1j6poS3CiCY+h
         Q/vYwL571bEeuIVHMbZUi7rZgeanWwpDfcNQqZWTvE8BU9jQA47+CZoZS3a6she498eT
         mmziej6OAzT0RMLi1XR6sWSe5ECSxo3POPkaFGDb0VkDutbZAxpa98GZ9dfmCG+oyGWA
         acVgxrrCmxIfOMfBd4ua52CwZ2R/XdZHnv+WOrH1xtKuXIIfUXWdR7Zc7tK13EwuXW28
         cEX4iyzGoB4JpcpEa2YQ2E1/cW9e/xsWDm0ki1JlmtvkF3n3j5rYpahRiKWC+usOR2HB
         OXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715959084; x=1716563884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ef3MF8Rs0G3jit24HO3OWy+0DrrgzGDkN37Y+6PEB9I=;
        b=kwgdRjJE+DVoTlj7ghZW0QYMvhqiiWsK0RfknTQFRlyk+NmKLr43XsofeDQB+2zYfM
         SkAVtxZTbdWHWfoyiuiUsXat3xWdYz4KqsuQcT3fBd8klYDcd+KdkD0ajx8DcZ6u19iQ
         AfVVLEHWBgtXAraYIC2NdbIBwEZXuBoX4Z0yusf3oxM98GmbXbo6DXoATHFu3EbfkIOK
         JrUawSOoB5zSzr4UeKuVA9OgbvWtGAYQMuVxoDj52e+KkITy2AF8NW6/Bx236d4y++Dp
         Vaba+KW3UJK8axOw8JFvQ/aXfk6SlMwynsiBJoudq1k4K64qga51PfqIcfmGcuJ9sA+T
         5qUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWls1qKy4DD/z2YKuKXsDiSowMtopeB1fzXDyu2KJUjrzZ2DUGQwoMLnmu/Yttpk+K/fqBpFofrDmMCPLlllH540FB095dJ/XSO
X-Gm-Message-State: AOJu0Yz1vRyuPHLdgr4HvW2rh611EP9jeoxjGp19u4yyhFgQuqwRa/My
	klywRImSI6Wh5A8NvCtHQ3OFDAtkPgQwQ40yI5qYZIqy8kMalOXfjt39hKMmmm6M84dA5d8T+BF
	xraS/Gbk8fa8Tc2N1eiVo+45lnW5V93HUUU3MUA==
X-Google-Smtp-Source: AGHT+IHuY13zH4hhNjNUU8E5CU5OnLiqg38O1otrjb+/eoZzOjdRjWwMMh69eiDOSrh7CQUbUVho6c8rmZEAihhoEvk=
X-Received: by 2002:a05:6e02:1886:b0:36a:1725:e123 with SMTP id
 e9e14a558f8ab-36cc14913bfmr268024205ab.14.1715959084494; Fri, 17 May 2024
 08:18:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240517145302.971019-1-cleger@rivosinc.com> <20240517145302.971019-5-cleger@rivosinc.com>
In-Reply-To: <20240517145302.971019-5-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 May 2024 20:47:51 +0530
Message-ID: <CAAhSdy0Ft5KV5ABBPNjxhy71jY0ypF7S6vhrb7gfq892WQkv1w@mail.gmail.com>
Subject: Re: [PATCH v5 04/16] RISC-V: KVM: Allow Zimop extension for Guest/VM
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 8:23=E2=80=AFPM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
> Extend the KVM ISA extension ONE_REG interface to allow KVM user space
> to detect and enable Zimop extension for Guest/VM.
>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/=
asm/kvm.h
> index b1c503c2959c..35a12aa1953e 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -167,6 +167,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>         KVM_RISCV_ISA_EXT_ZFA,
>         KVM_RISCV_ISA_EXT_ZTSO,
>         KVM_RISCV_ISA_EXT_ZACAS,
> +       KVM_RISCV_ISA_EXT_ZIMOP,
>         KVM_RISCV_ISA_EXT_MAX,
>  };
>
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index f4a6124d25c9..c6ee763422f2 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -60,6 +60,7 @@ static const unsigned long kvm_isa_ext_arr[] =3D {
>         KVM_ISA_EXT_ARR(ZIHINTNTL),
>         KVM_ISA_EXT_ARR(ZIHINTPAUSE),
>         KVM_ISA_EXT_ARR(ZIHPM),
> +       KVM_ISA_EXT_ARR(ZIMOP),
>         KVM_ISA_EXT_ARR(ZKND),
>         KVM_ISA_EXT_ARR(ZKNE),
>         KVM_ISA_EXT_ARR(ZKNH),
> @@ -137,6 +138,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsign=
ed long ext)
>         case KVM_RISCV_ISA_EXT_ZIHINTNTL:
>         case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
>         case KVM_RISCV_ISA_EXT_ZIHPM:
> +       case KVM_RISCV_ISA_EXT_ZIMOP:
>         case KVM_RISCV_ISA_EXT_ZKND:
>         case KVM_RISCV_ISA_EXT_ZKNE:
>         case KVM_RISCV_ISA_EXT_ZKNH:
> --
> 2.43.0
>
