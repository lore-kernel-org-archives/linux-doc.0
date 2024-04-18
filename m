Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2101635A0
	for <linux-doc@vger.kernel.org>; Thu, 18 Apr 2024 13:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713446435; cv=none; b=qNpXt2Qa9/q3Mqpx079Vm+MoOVII2yrt6QpM9ZWjAEPklVWTgU2Q5E/nyF2LwsGET5zR6NtwYPqZgQ0HieppP284KrIB8CGYsWzNx5tndYLrWlZAh187xS2FjIZmuX/HZ7GU5twf7EJALw4/GwTfJwrzwt+f2XDt/t2nwlhSLN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713446435; c=relaxed/simple;
	bh=cwotXz71csJK5NlYG6cUePZxsMutZ9CiCnXSbJcpnco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g3DZ0D3fSBZxMp12vO49s2HxktPb6EnWaGv1mk/GkD5DVDmYj+VeIzJtrTKD+KIR7HKB6HjM3HlhdP9zArm5wJQec/QsdD5ly63iMcdPa4etUi6t8G4rRBD1JK879Qa9rnXRZiYa1vN4El4YPPRzNBLM0xttz1xFdBLVRIRcx5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=TSCNfPRI; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="TSCNfPRI"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7d03a66e895so84057239f.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Apr 2024 06:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1713446433; x=1714051233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gx9GnWevREtFfaeT4x816rwBBhgS4sWYP/+TT0BrELo=;
        b=TSCNfPRI1RBVqjumWW+SebIW/fHuwvPmbonl6jPsmmqibhiG+Shsj8O9jPbUptnrEc
         jj2QOifC1vrvquAmOPI7yIzYoZ3b6DQS6cUWLzHgOhcg8DMd14IgRdpR1Tl123fKkEeg
         bIoI76VZGQAVEbPgD3GqJbLE9CT24DrapGocyc1+lzAxVzYiGi05kNvs0sy7Ng/S3Jvj
         3jQoX6qnJHr9SHckphFFLSYaXM0RFdHdmv2oD+y1MwjYFEHy9VzWjfPF9hPk7moAmxeO
         pGEqoWLyDb0GeRxmTmqegs4Q/Jb1UVbSloOgmHf0NJbFklUEWYKHnEfLn5Hh1bF4+Xis
         DnJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713446433; x=1714051233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gx9GnWevREtFfaeT4x816rwBBhgS4sWYP/+TT0BrELo=;
        b=w7Su5KGZwozIdASPRB0XOeVP110+Gp0ZRZS0DlsZOZecMlFKCueVxa7CndfrmygRkF
         yLd59hl5vM+OwJt5T5iZhUxEC/x+h3Ng8YyTZsk1j+LqqD1eikJYJ8mYjJ8H4dGr0eob
         5EOhMEvvX34AeSFa/ChJb+E2dhSqT2FRKGShoJ2y1/o9bTlo9OAh6LHgRTTn8RbUAUuh
         6HqrvHdqj5PHxBosBzLrFpfbzfJhFqiuoT/bfrZ4ajkVjDppMogSM40YFILPmqI7Sl4a
         8UJi4nrdZLobZKIYDRCs95C1hW3ZLQ1JkyMa2/Qz0sBIP46BgTZBOtio5Cw6YdGwQ1bB
         bDrg==
X-Forwarded-Encrypted: i=1; AJvYcCWon4KDPpJeFDqqR6L3pWBqiJIVrW3/opZNGTl+aXz4qoeAIxFzxU9+kT6rRsJ3gqbjfUFg8+pEOfQT2GKYICbIkHwshdBUYJRS
X-Gm-Message-State: AOJu0Yzb0SYsQSEK9aSjphRRA521aEf7TIKwQA5FjNJtu+M7zEHJEECq
	7bJtY0TPpNyp7bd/imJKZ/plqmky333jUPQ0DpxeD4lxlzfIUGTvLBGsy/x7b9hyrC9uxE211wZ
	qhOgjwyYH7q8yJ7hn/IZjG1Zywl1S0Mar4iiKzQ==
X-Google-Smtp-Source: AGHT+IGMAebq+hy93GujthN3vp/oiNgylMXL32FxuMysUl+JA4YBKBsEzN18erjOu1anh/0QSxfZh2bW0X+CZoU6xFA=
X-Received: by 2002:a05:6e02:1d85:b0:36a:28a8:ca5 with SMTP id
 h5-20020a056e021d8500b0036a28a80ca5mr3399351ila.7.1713446433235; Thu, 18 Apr
 2024 06:20:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240418124300.1387978-1-cleger@rivosinc.com> <20240418124300.1387978-7-cleger@rivosinc.com>
In-Reply-To: <20240418124300.1387978-7-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 18 Apr 2024 18:50:21 +0530
Message-ID: <CAAhSdy33=s_J=0HJ1VfbxPVkBgyTZ1rpM3G15R8rJGbnNA_zeg@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] RISC-V: KVM: Allow Zca, Zcf, Zcd and Zcb
 extensions for Guest/VM
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

On Thu, Apr 18, 2024 at 6:14=E2=80=AFPM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
> Extend the KVM ISA extension ONE_REG interface to allow KVM user space
> to detect and enable Zca, Zcf, Zcd and Zcb extensions for Guest/VM.
>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  arch/riscv/include/uapi/asm/kvm.h | 4 ++++
>  arch/riscv/kvm/vcpu_onereg.c      | 8 ++++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/=
asm/kvm.h
> index 35a12aa1953e..57db3fea679f 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -168,6 +168,10 @@ enum KVM_RISCV_ISA_EXT_ID {
>         KVM_RISCV_ISA_EXT_ZTSO,
>         KVM_RISCV_ISA_EXT_ZACAS,
>         KVM_RISCV_ISA_EXT_ZIMOP,
> +       KVM_RISCV_ISA_EXT_ZCA,
> +       KVM_RISCV_ISA_EXT_ZCB,
> +       KVM_RISCV_ISA_EXT_ZCD,
> +       KVM_RISCV_ISA_EXT_ZCF,
>         KVM_RISCV_ISA_EXT_MAX,
>  };
>
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 12436f6f0d20..a2747a6dbdb6 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -48,6 +48,10 @@ static const unsigned long kvm_isa_ext_arr[] =3D {
>         KVM_ISA_EXT_ARR(ZBKC),
>         KVM_ISA_EXT_ARR(ZBKX),
>         KVM_ISA_EXT_ARR(ZBS),
> +       KVM_ISA_EXT_ARR(ZCA),
> +       KVM_ISA_EXT_ARR(ZCB),
> +       KVM_ISA_EXT_ARR(ZCD),
> +       KVM_ISA_EXT_ARR(ZCF),
>         KVM_ISA_EXT_ARR(ZFA),
>         KVM_ISA_EXT_ARR(ZFH),
>         KVM_ISA_EXT_ARR(ZFHMIN),
> @@ -128,6 +132,10 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsig=
ned long ext)
>         case KVM_RISCV_ISA_EXT_ZBKC:
>         case KVM_RISCV_ISA_EXT_ZBKX:
>         case KVM_RISCV_ISA_EXT_ZBS:
> +       case KVM_RISCV_ISA_EXT_ZCA:
> +       case KVM_RISCV_ISA_EXT_ZCB:
> +       case KVM_RISCV_ISA_EXT_ZCD:
> +       case KVM_RISCV_ISA_EXT_ZCF:
>         case KVM_RISCV_ISA_EXT_ZFA:
>         case KVM_RISCV_ISA_EXT_ZFH:
>         case KVM_RISCV_ISA_EXT_ZFHMIN:
> --
> 2.43.0
>
