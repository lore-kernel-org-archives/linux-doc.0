Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7E08460
	for <linux-doc@vger.kernel.org>; Tue, 15 Apr 2025 20:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744749990; cv=none; b=bDI941vFD/Tc+y42PV8TaL2Op3Ies3sbpypT0h/xri8ZJHMsE2F77QaoJdHODsd9zf/YNiE4/wItP/R0eyMniIrck94ngaxlDPEZZc+4o8pmAY9plYt/VMO9Ov7tqF+l7+dTkmxOHirXAhOODaAMaUKDguo/gqaXRD3/6EXkJg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744749990; c=relaxed/simple;
	bh=TygAyc8ZcamwcaK7R4ldaqjD/sb+gNyDwakhRjNo3Oo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TttHGlfEoeMe8Hk7sRp4Yac+MvKsuxT/NwD9ETFikchXAcMyFLQNjkR8BaxaEM8LEDi+TW2DenLErbCjGrgNJ6MV/dmDx+fACfI9vZ5ZeOXPmuFWpB5SBV/05OA+x+iSjqkOq7TN93bRefMUaAo+iaOAw3Jamkrwdu8f6lpJuIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Jibk6yjx; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Jibk6yjx"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72b938f6014so356173a34.3
        for <linux-doc@vger.kernel.org>; Tue, 15 Apr 2025 13:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744749987; x=1745354787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xe9yiz5hRk6Ih7N2Ac32P9e4ZYaPgsUiw3u3c/ePwGs=;
        b=Jibk6yjxEJ5kBPWKSm8G5V8pxgYtwwfDtD8VaX2T41RZCkMdHsmhAkzCskyHxfywjp
         WRl6ml709hO38lFn+o1POmPSBQN5vjMzNLNJCLbnBx2ip/yCBeSMbSoPW8nHUrVV79rb
         Tik5rbPlKaSlqAivcqqeP6edbMWohqkFG4Zmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744749987; x=1745354787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xe9yiz5hRk6Ih7N2Ac32P9e4ZYaPgsUiw3u3c/ePwGs=;
        b=e+tXLpAk8NQKaZfE/9O113Mt4K9cEdrNvg2RA9Optr6fbO7GmUrIr7sTuXciz3shQS
         O2EJcy4e+85AZX51MKKBlBsZUbkjDvQxl+CUYvxM72p0efwlSPrbPc/uPF0QTN0ppOz3
         7Dn2FoF1gBuxz8aiVYM3gsF6ditDVEKHUvnkkFkyLq+WYj4o9K8aL8fOMiIOrIudfj43
         n/HF8BBLP0ccT01G3TTb4dB4c2tgTwFMh2CsEpJ7xvW/nUJ51qVyxmYpuueZNe72Woua
         qYoDFKVb1uFICywpzLR/7+UCUUb8A0dg/dG0P75/ER067VJPRSz7JADIrGJDa95zylKp
         uuWw==
X-Forwarded-Encrypted: i=1; AJvYcCXPg7cde+1Y+uJ+gXwds0aAQMK30RDkAPwUvYnx5blP08uCmboKq4Or62qAauuU86QF2d+AJakb+4g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc2QoSmKw0fZ1CAJkpgbnfOcVb77TtGIE5ijfFCotb9oelOtoH
	Mr7QDpIpnD42vKDyMF++pXlVpbHoVgP5PL4DTnuYbW99m/EG4eGFKsstZaVpJ8crufz8IyLX81J
	BDxWvtgO2Mr5TB1Le0Sx8kn9mXIDkGCTmbsh4
X-Gm-Gg: ASbGncsxVi779tWpIkHPLPe4sdVlg/s64Q54r6+rVls5+2nmuhjC3V04gwonSEGMGz7
	0AJCUJznJSbNiC1Dt1g5FjowdFP4bI6f2VqD1cGDdm6HRX/ggBmBbB8MauKGP12G+zOAOfVokzz
	P5KGdM7BuFLqp4NtLC/3XyqlIg0voA73lu0XVvHsmSF/xvmhwtHg==
X-Google-Smtp-Source: AGHT+IF1laZWfAr2YIqlDARR+3dKjqHrGIZm755fOrYIwd7mc6DGetjqrkzit1gFufVSqqgi3FL0ISL0YLiHKXN9uFo=
X-Received: by 2002:a05:6808:1582:b0:3f4:210e:c0f2 with SMTP id
 5614622812f47-400acc3f649mr216633b6e.0.1744749986835; Tue, 15 Apr 2025
 13:46:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <648AB3031B5618C0+20250415153903.570662-1-wangyuli@uniontech.com>
In-Reply-To: <648AB3031B5618C0+20250415153903.570662-1-wangyuli@uniontech.com>
From: Jeff Xu <jeffxu@chromium.org>
Date: Tue, 15 Apr 2025 13:46:14 -0700
X-Gm-Features: ATxdqUEmIxsEAScvJDNIReMH4unvMuy3JinsyoEKeBkvV32K_0n2IQ9VdZ-tyfo
Message-ID: <CABi2SkV2v-48Mhn9qLzx08KatToWMpgc63HAWn8RKe8Y8HXWPA@mail.gmail.com>
Subject: Re: [PATCH v2] mseal sysmap: enable LoongArch
To: WangYuli <wangyuli@uniontech.com>
Cc: corbet@lwn.net, chenhuacai@kernel.org, kernel@xen0n.name, 
	akpm@linux-foundation.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, kees@kernel.org, hca@linux.ibm.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, xry111@xry111.site, tglx@linutronix.de, 
	thomas.weissschuh@linutronix.de, Jason@zx2c4.com, zhanjun@uniontech.com, 
	niecheng1@uniontech.com, guanwentao@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yuli

On Tue, Apr 15, 2025 at 8:40=E2=80=AFAM WangYuli <wangyuli@uniontech.com> w=
rote:
>
> Provide support for CONFIG_MSEAL_SYSTEM_MAPPINGS on LoongArch,
> covering the vdso.
>
> Link: https://lore.kernel.org/all/25bad37f-273e-4626-999c-e1890be96182@lu=
cifer.local/
> Tested-by: Yuli Wang <wangyuli@uniontech.com>
> Signed-off-by: Yuli Wang <wangyuli@uniontech.com>
> ---
> Changelog:
>  *v1->v2: Modify mseal_sys_mappings/arch-support.txt.
> ---
>  .../features/core/mseal_sys_mappings/arch-support.txt         | 2 +-
>  Documentation/userspace-api/mseal.rst                         | 2 +-
>  arch/loongarch/Kconfig                                        | 1 +
>  arch/loongarch/kernel/vdso.c                                  | 4 +++-
>  4 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/features/core/mseal_sys_mappings/arch-support.=
txt b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> index c6cab9760d57..a3c24233eb9b 100644
> --- a/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> +++ b/Documentation/features/core/mseal_sys_mappings/arch-support.txt
> @@ -12,7 +12,7 @@
>      |       arm64: |  ok  |
>      |        csky: |  N/A |
>      |     hexagon: |  N/A |
> -    |   loongarch: | TODO |
> +    |   loongarch: |  ok  |
>      |        m68k: |  N/A |
>      |  microblaze: |  N/A |
>      |        mips: | TODO |
> diff --git a/Documentation/userspace-api/mseal.rst b/Documentation/usersp=
ace-api/mseal.rst
> index 1dabfc29be0d..ef733f69003d 100644
> --- a/Documentation/userspace-api/mseal.rst
> +++ b/Documentation/userspace-api/mseal.rst
> @@ -144,7 +144,7 @@ Use cases
>    architecture.
>
>    The following architectures currently support this feature: x86-64, ar=
m64,
> -  and s390.
> +  loongarch and s390.
>
>    WARNING: This feature breaks programs which rely on relocating
>    or unmapping system mappings. Known broken software at the time
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index 067c0b994648..54ed5b59a690 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -69,6 +69,7 @@ config LOONGARCH
>         select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>         select ARCH_SUPPORTS_LTO_CLANG
>         select ARCH_SUPPORTS_LTO_CLANG_THIN
> +       select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
>         select ARCH_SUPPORTS_NUMA_BALANCING
>         select ARCH_SUPPORTS_RT
>         select ARCH_USE_BUILTIN_BSWAP
> diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
> index 10cf1608c7b3..7b888d9085a0 100644
> --- a/arch/loongarch/kernel/vdso.c
> +++ b/arch/loongarch/kernel/vdso.c
> @@ -105,7 +105,9 @@ int arch_setup_additional_pages(struct linux_binprm *=
bprm, int uses_interp)
>
>         vdso_addr =3D data_addr + VVAR_SIZE;
>         vma =3D _install_special_mapping(mm, vdso_addr, info->size,
> -                                      VM_READ | VM_EXEC | VM_MAYREAD | V=
M_MAYWRITE | VM_MAYEXEC,
> +                                      VM_READ | VM_EXEC |
> +                                      VM_MAYREAD | VM_MAYWRITE | VM_MAYE=
XEC |
> +                                      VM_SEALED_SYSMAP,
>                                        &info->code_mapping);
>         if (IS_ERR(vma)) {
>                 ret =3D PTR_ERR(vma);
> --
> 2.49.0
>
LGTM, thank you for taking care of the documentation as well.

Reviewed-by: Jeff Xu <jeffxu@chromium.org>
