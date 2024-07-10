Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83AB36AF8
	for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 15:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720626975; cv=none; b=Qo5nN7xkpBmKETKIhWRAuzngOXLyRpGRtfKY6KQFPQuLYv/KPUm4WldV0hICKA6Asv883OlBZeOSvEA0DEoMx3F3u/jVOSsAIbFeXWkO3pr6TQJiPI/riTw4HIaQ7LwVnMaEG54ENgjtnSOTLLDbj3UyWRr0mWcyhvFxQbipb0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720626975; c=relaxed/simple;
	bh=B/nG4TR56/cwzYMHqCDCNFF2y43gf1Y4lESNrmlv6BY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mB15tm4QfNVQq2c6mNvG2AHPY1gfHIw3OULGLbEUnyTtiQEOsBf5p2V1U0c/OHQ1gzjPw6dBK8Ile4iIp6JmoFUfv5qJISmLy6UoHtYU7wwOWcYs3aug7MacM2mk3aKrFoXBxUYpL0xg7U+AKLgw0gzTcYXLDPjIfmYE69a/Us0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ZTthLxzi; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ZTthLxzi"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a77e85cb9b4so477302966b.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 08:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720626971; x=1721231771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISPkngAyeCTHdiiqdfhGRhrD7gcMn5QvhxpyUZ/8MrQ=;
        b=ZTthLxziALFZ68HvrQ8nyU5KluBqycIZqUnWteKz1XM5wzs8yuAs9O7XOtW11aqeEK
         k4yyftRCct9SCgCcDZFhGM0FpO/EhDiN/7SXgQ72x1LaY6hbCWFCDxFwk+dplsDWUIwZ
         o++A4sX5zj1V3ornTDcfAF3vVlm5ArDZSQrCnwnAMJ4crq4lvHBeLAXQkH4f3W1PxAve
         5GImhS8Ogx8oDjIH6s5Uo456PB3bJyq7u85JWCsjJ5vRnP85lqBdCRFqcc+ee/Kurv/V
         TALLGuBd5q/BQooDt16UW9bd0gsF7UZ8VvP9NUuMsNzrp1IEZlFbjs2KuoKYRmLrPTtX
         /FjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720626971; x=1721231771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISPkngAyeCTHdiiqdfhGRhrD7gcMn5QvhxpyUZ/8MrQ=;
        b=DILaLYT9ECYhuYMKKmlXx8KA8ETTATjqnaZl7tnTKbyz30iI5VAuS1gWcHS9fiGg1E
         kkQn0YR0bzeBAwa3txGkAr+VT8DWszRcqiT28mn6C3+YUKlaMQGkiTo7NVCvRv1a4wyE
         ZHcszJVnlc/XhUBGHLdl4lKWlK0u0VhZjs2tRc4g58IwBr4P64lVrrdwp9dKsNnzjF6c
         yfqsCxrQrcfgtiTwMqA9QCsRNws95QuOdVmBoomqcl+247klH5HT4fpJ02nTJRmtj108
         TwKTycoLZpIVth/hmTgsw8ePU/zefmTTd5CvabLgDdFdyfnrEiYUAerF5ik0a2AgNuXq
         v7Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUjQjesQARhqdMjmh2qQdTrtqs0OXV+6CHt442Vl+YFMCBZrpOktFnTb+rsPsEEs+t4hQduxYjshsk8dIkM8fc1kEm4ncqlcLoV
X-Gm-Message-State: AOJu0Yy+5uX1VbOOTLsZBmgPIE00cCYI9lOrbIrBtI+TQm3vkgzlVnpo
	EnPq1zoaEy9sMAXqYdSs/1ExvyiKc5xYnj1nxS1yRUY/Nchjx0m+64e8Z2ZipCQZhhK82PlBehe
	GQRaY7AANmq7uvdMD+QNMt6vd3oBkRX1fFhSgWQ==
X-Google-Smtp-Source: AGHT+IHs4uU/4yOkk+bzRj18biX0XTt2Rbdp+dHRjb7JtDRHUJObhcKGm+ZUnkDr1LXg3IpCyRDMKsne4rSn0QUuPgI=
X-Received: by 2002:a17:906:e950:b0:a77:e1c2:3ab with SMTP id
 a640c23a62f3a-a780b884b52mr389055966b.50.1720626971164; Wed, 10 Jul 2024
 08:56:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625005001.37901-1-jesse@rivosinc.com> <20240625005001.37901-4-jesse@rivosinc.com>
In-Reply-To: <20240625005001.37901-4-jesse@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 10 Jul 2024 08:55:35 -0700
Message-ID: <CALs-HsvE9PzTrhVO0umh3KaJuLQLdk-h8sYKBg7XA4a-MXAmOg@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] RISC-V: Check scalar unaligned access on all CPUs
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Eric Biggers <ebiggers@google.com>, Greentime Hu <greentime.hu@sifive.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin <costa.shul@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 5:51=E2=80=AFPM Jesse Taube <jesse@rivosinc.com> wr=
ote:
>
> Originally, the check_unaligned_access_emulated_all_cpus function
> only checked the boot hart. This fixes the function to check all
> harts.
>
> Fixes: 71c54b3d169d ("riscv: report misaligned accesses emulation to hwpr=
obe")
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> Cc: stable@vger.kernel.org
> ---
> V1 -> V2:
>  - New patch
> V2 -> V3:
>  - Split patch
> ---
>  arch/riscv/kernel/traps_misaligned.c | 23 ++++++-----------------
>  1 file changed, 6 insertions(+), 17 deletions(-)
>
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/tra=
ps_misaligned.c
> index b62d5a2f4541..8fadbe00dd62 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -526,31 +526,17 @@ int handle_misaligned_store(struct pt_regs *regs)
>         return 0;
>  }
>
> -static bool check_unaligned_access_emulated(int cpu)
> +static void check_unaligned_access_emulated(struct work_struct *unused)
>  {
> +       int cpu =3D smp_processor_id();
>         long *mas_ptr =3D per_cpu_ptr(&misaligned_access_speed, cpu);
>         unsigned long tmp_var, tmp_val;
> -       bool misaligned_emu_detected;
>
>         *mas_ptr =3D RISCV_HWPROBE_MISALIGNED_UNKNOWN;
>
>         __asm__ __volatile__ (
>                 "       "REG_L" %[tmp], 1(%[ptr])\n"
>                 : [tmp] "=3Dr" (tmp_val) : [ptr] "r" (&tmp_var) : "memory=
");
> -
> -       misaligned_emu_detected =3D (*mas_ptr =3D=3D RISCV_HWPROBE_MISALI=
GNED_EMULATED);
> -       /*
> -        * If unaligned_ctl is already set, this means that we detected t=
hat all
> -        * CPUS uses emulated misaligned access at boot time. If that cha=
nged
> -        * when hotplugging the new cpu, this is something we don't handl=
e.
> -        */
> -       if (unlikely(unaligned_ctl && !misaligned_emu_detected)) {
> -               pr_crit("CPU misaligned accesses non homogeneous (expecte=
d all emulated)\n");
> -               while (true)
> -                       cpu_relax();
> -       }

This chunk was meant to detect and refuse to run on a system where a
heterogeneous CPU is hotplugged into a previously homogenous system.
The commit message doesn't mention this change, how come you
deleted it?


> -
> -       return misaligned_emu_detected;
>  }
>
>  bool check_unaligned_access_emulated_all_cpus(void)
> @@ -562,8 +548,11 @@ bool check_unaligned_access_emulated_all_cpus(void)
>          * accesses emulated since tasks requesting such control can run =
on any
>          * CPU.
>          */
> +       schedule_on_each_cpu(check_unaligned_access_emulated);
> +
>         for_each_online_cpu(cpu)
> -               if (!check_unaligned_access_emulated(cpu))
> +               if (per_cpu(misaligned_access_speed, cpu)
> +                   !=3D RISCV_HWPROBE_MISALIGNED_EMULATED)
>                         return false;
>
>         unaligned_ctl =3D true;
> --
> 2.45.2
>
