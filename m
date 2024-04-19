Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A10C121
	for <linux-doc@vger.kernel.org>; Fri, 19 Apr 2024 06:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713506963; cv=none; b=ntjlo4s9R6ragKQOdEmH6WUWrnk7ajF6FdxqEb2Ts0gpn4havdKSeqq6NXYp3IrBiIl5jibabwpIfXuLezrMCdw6jhWvo/Yp9pdjrhEvlCpCv63OrHQ9gEUyrBQ3xQ3WMOZV70PKdOIgewcPfi0tp2SZcIucViaqTp6mj/43ak0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713506963; c=relaxed/simple;
	bh=elPfsV609mZWZMdsMAwYLpbQHMPL6SUn7OhzB1+3T1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EK+2DNcSf6VJY0u7Lr4y6pFS6vz4rn53wzXe2b1V75F0YRHwZ9ShLwveqCfzw8pKxIYo3U455Hh9MVp3ikEB4qjbevs4c7oupgJXH9u5fWjKaBulCz/v3Bkw7k+Uugyf8/Wd8WYiCl5YesV41ZHbd92deYFMTak5lEPeRBnuOSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=VbNi7X53; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="VbNi7X53"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5aa241232faso1195131eaf.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Apr 2024 23:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1713506961; x=1714111761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kErwDd2As93lkNVtXxpSNeg6N1vaOM5yfF2rI/SIas=;
        b=VbNi7X53rWtX79EOjlQGwTGaV0PdQu+Qai3Q86Gb+xdJ5A/VlK2s9vCqiPH/E9m9t2
         ShsAoadciOUnaMwPhjOPyAkdK3T7TIUVINKSuoFYs7jWbF6kdHrBxih3yaRUo+EmOyFI
         UVH3Ql8DREoEEoDI1nMoJYwJ9g3a2iFkeQSLLlaoYVPxC2JM5SFHiCakWSDv+rUS6JGi
         R3gLEV4hihEg4+Za021JzcSrEjLEyscTmqmaIpb/lPXfFQz6ibTTMaBw+fso9EaUD4o6
         YsO5IOsU8RsPuK05rc6zbImXNVVL5fSqIB1iQeS/oZYGl/FiUT/Q9YrcvPZ5A3I6RcDP
         aphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713506961; x=1714111761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kErwDd2As93lkNVtXxpSNeg6N1vaOM5yfF2rI/SIas=;
        b=C9CjyAhZ47pKTDn0HEQVIBerrZDXG19eN+MEaGrR67c0bh1R9asBGee0elN3qIaS7L
         sF5ydtRQEnOwQAdDc4Y2TNNSVwY+y/sv11c83e6+x8haSMXJYf35CGhVlkAv7+AXKnVw
         8q3lGhnaqYRJ4mj4MEIddKVR92mQw6hECQWPtfTjjd8hOw69O/G66oIYo79p6STB8rXV
         +uH7hi9uvQT1gN3+NT0PrbWf7FqOBSwvKeFMEN0Hxk8OEaGTNYmT3B3wFqQGufTSiKLb
         ceL0DxIV6qBg7hpu3q5HJfJMcRJJBYnoZ+WCPNxi9RPq9qx8GI3+CShz5DCXALv0dgjN
         E3xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo5rRC5FlF3bDB/81krIhRu+Hg5jymKUeUzq5PIW8LOs0yZlFcE92Clvc7gLeoyzin2vrnkp+SpCnDlw+PWPVJOY7t2Ub0DCtv
X-Gm-Message-State: AOJu0Yw84tsgGkpiTyfE9vW1ynuWEB6U7QUgLnKhLEHQTgImGCTRgUUm
	aTT23FLt+oS4gR9uSNwReufMI6PWliUMZ9n7+qT/Ljm4SpoMMdfYP0uTza8j1PXf3Ulnetp3vST
	K9ZrCDf7duW7hvEmFh6giHv6DvPEVBg3e/HsBrg==
X-Google-Smtp-Source: AGHT+IFiJTLnnWExlyf1jzE8UHpYFqX2X9xmHGVJevF5AC5Z2o5R2kV7+PY0ghjCFO++qBKYcDqZsz70DYQOwrd6nAc=
X-Received: by 2002:a05:6870:968e:b0:22e:7d06:d489 with SMTP id
 o14-20020a056870968e00b0022e7d06d489mr1319197oaq.19.1713506961126; Thu, 18
 Apr 2024 23:09:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240412-zve-detection-v4-0-e0c45bb6b253@sifive.com> <20240412-zve-detection-v4-2-e0c45bb6b253@sifive.com>
In-Reply-To: <20240412-zve-detection-v4-2-e0c45bb6b253@sifive.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 19 Apr 2024 14:09:10 +0800
Message-ID: <CAEEQ3wn97huwhpvTJH7kD2R=xagNRWd=YcoYwGOU17BRYNopgw@mail.gmail.com>
Subject: Re: [External] [PATCH v4 2/9] riscv: smp: fail booting up smp if
 inconsistent vlen is detected
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
	Vincent Chen <vincent.chen@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Fri, Apr 12, 2024 at 2:50=E2=80=AFPM Andy Chiu <andy.chiu@sifive.com> wr=
ote:
>
> Currently we only support Vector for SMP platforms, that is, all SMP
> cores have the same vlenb. If we happen to detect a mismatching vlen, it
> is better to just fail bootting it up to prevent further race/scheduling
> issues.
>
> Also, move .Lsecondary_park forward and chage `tail smp_callin` into a
> regular call in the early assembly. So a core would be parked right
> after a return from smp_callin. Note that a successful smp_callin
> does not return.
>
> Fixes: 7017858eb2d7 ("riscv: Introduce riscv_v_vsize to record size of Ve=
ctor context")
> Reported-by: Conor Dooley <conor.dooley@microchip.com>
> Closes: https://lore.kernel.org/linux-riscv/20240228-vicinity-cornstalk-4=
b8eb5fe5730@spud/
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> Changelog v4:
>  - update comment also in the assembly code (Yunhui)
> Changelog v2:
>  - update commit message to explain asm code change (Conor)
> ---
>  arch/riscv/kernel/head.S    | 19 ++++++++++++-------
>  arch/riscv/kernel/smpboot.c | 14 +++++++++-----
>  2 files changed, 21 insertions(+), 12 deletions(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 4236a69c35cb..a00f7523cb91 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -165,9 +165,20 @@ secondary_start_sbi:
>  #endif
>         call .Lsetup_trap_vector
>         scs_load_current
> -       tail smp_callin
> +       call smp_callin
>  #endif /* CONFIG_SMP */
>
> +.align 2
> +.Lsecondary_park:
> +       /*
> +        * Park this hart if we:
> +        *  - have too many harts on CONFIG_RISCV_BOOT_SPINWAIT
> +        *  - receive an early trap, before setup_trap_vector finished
> +        *  - fail in smp_callin(), as a successful one wouldn't return
> +        */
> +       wfi
> +       j .Lsecondary_park
> +
>  .align 2
>  .Lsetup_trap_vector:
>         /* Set trap vector to exception handler */
> @@ -181,12 +192,6 @@ secondary_start_sbi:
>         csrw CSR_SCRATCH, zero
>         ret
>
> -.align 2
> -.Lsecondary_park:
> -       /* We lack SMP support or have too many harts, so park this hart =
*/
> -       wfi
> -       j .Lsecondary_park
> -
>  SYM_CODE_END(_start)
>
>  SYM_CODE_START(_start_kernel)
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index d41090fc3203..673437ccc13d 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -214,6 +214,15 @@ asmlinkage __visible void smp_callin(void)
>         struct mm_struct *mm =3D &init_mm;
>         unsigned int curr_cpuid =3D smp_processor_id();
>
> +       if (has_vector()) {
> +               /*
> +                * Return as early as possible so the hart with a mismatc=
hing
> +                * vlen won't boot.
> +                */
> +               if (riscv_v_setup_vsize())
> +                       return;
> +       }
> +
>         /* All kernel threads share the same mm context.  */
>         mmgrab(mm);
>         current->active_mm =3D mm;
> @@ -226,11 +235,6 @@ asmlinkage __visible void smp_callin(void)
>         numa_add_cpu(curr_cpuid);
>         set_cpu_online(curr_cpuid, 1);
>
> -       if (has_vector()) {
> -               if (riscv_v_setup_vsize())
> -                       elf_hwcap &=3D ~COMPAT_HWCAP_ISA_V;
> -       }
> -
>         riscv_user_isa_enable();
>
>         /*
>
> --
> 2.44.0.rc2
>
>

Reviewed-by: Yunhui Cui <cuiyunhui@bytedance.com>


Thanks,
Yunhui
