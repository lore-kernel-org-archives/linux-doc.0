Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720441624F7
	for <linux-doc@vger.kernel.org>; Wed,  2 Jul 2025 12:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458844; cv=none; b=j2rgZpjVykrUr9u/tBn9d8Pqwh5N9SvIHTgrrqGIWZaYSKrl0t+bfK3lf+5Cbg/LTyqlqnpfZ2bZBk4oKLUfhsjP34jotRcKCNzhlZpgZBHZ9GlGrAg3M6pTiv6heLJ+oA+Mr+zWXi94YdcEkyMUKBE8p3Zy36nhkyEFie6ipws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458844; c=relaxed/simple;
	bh=9OTuof7wiH6Hbx52Xl5u/63yLGECDDRiBJS39/TBm0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aT5JR7sLPf3hFAvg/6L6tMVtzspiGigi0dbungDY8MyEoSGuW3gGD3yjfHamTkY+ggjEOCSOBNGfFiOM9V0D1PvxAAy6nnu67jtp/YbCmKyxEKbc58wk0UpnKBuaUMCCZDFssaNVY59PlpKfIDxYpGZJxXjOBIH3TxmaYnk/5wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=FcZcpLok; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="FcZcpLok"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32b43c5c04fso75828571fa.0
        for <linux-doc@vger.kernel.org>; Wed, 02 Jul 2025 05:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751458839; x=1752063639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlDIE+NRAJTFxIDdo85+1avglgQbOvm9gC4lDC40yv8=;
        b=FcZcpLokZPKQKUziKGccVI3aFdMxzTlObbbxhxjmG3hBv0bye5TDFOM8VFet3Pg3L5
         /tlSvY9WDiY0XynoIrnn3mifQ16626/wG6lDHoEV+HJGxQtqzZZoBfgtMCNN/rh9VycR
         OkD8T3DrQ5Q13kU4Fjhx9DiqQf7HhPhI3MGb/jDjdjuo3174cJtak9admxP0wujPXR48
         aUNRS4uEJ9W6qBF3rlUDxnUsVwTo3qvlDo4an/YYcsiZRb5VP99XfLfdXVIe/xkzyThr
         I1JVBa7FIIXHgCXsMMKcW4LXR9MOi0BxiKswA5mTN7B5pEp6qzRgkuv52K2zqeouZaJ7
         92Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751458839; x=1752063639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlDIE+NRAJTFxIDdo85+1avglgQbOvm9gC4lDC40yv8=;
        b=uQwkomAh3BVN1eh7x5gXz6A05WJzsJik2V3Hx4ijUsAh+x9JMosHwe1bINem0zQ97E
         EqCErBoTAOm23ecKOhRTeVFjBMkynels/BfnHpsmgo75JWdiLxclTgy86coZRHNoFokb
         SfNAU3kve7/iO+5a0tXYu5pQCDPD4JocIJHtEtgRK+2aH8yfh4oy/Em915nKzTWFtMPI
         1MNUXbTo1JsDZyBri8lukvx4XASrOMSak+XsB0P9r8TeR+SlyTHOMK+hhjyC54dBa0sG
         V1O+tlZSNpUmRNrKDtY2QBKDM/dS7hdOqOg5BNAd7SzPcahKh3dlhtP+mJHrKra1Z8Kd
         0dQg==
X-Forwarded-Encrypted: i=1; AJvYcCVlCu3RVauq/cB0QAN2pSoCeJ8ly7e0vBlMCDALxuAo7Op4GtAKCrfUGa9GHDfmX3J7qd0QBiI/J9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxZyXD/Cbt1VPcqmnSOXl4o4aZvPwu8usWHhs8Cw0uQe89xgHV
	6YPkOSK5D35GuVmmp/tzA82TrxZ+XiAG0NdhTu7aVwxDP0tx7ZRUsIkH8k8XjopBuXSTMGYyMil
	QNXEXT2CfvCu/kjnGwNJFTcdz+NtQljJ47oIQnjkzmw==
X-Gm-Gg: ASbGncunL0FlPDbUetrTm6L4J1OVEux2P/oCFTkHfNDMPMEplE5jg9M2qOe0ncDKCs5
	RdqEqeihWw4/TDUebgozj4HHcq8w4uj/4bCCsKMauICujkWVE627uzKTKCtjwLTpdInMXaWrkYe
	fRgrDFnN9KGhZMdfrTAqVxu6YhF2aYjEO1hHT4g7o7IAfL
X-Google-Smtp-Source: AGHT+IH1lD190ckWcim2q6Zk3SmkYALF/z3+aLiK7gzYQJFBAZHqekWx0X5SLSlbsPJp/7c6iQAutReznlxbFSvgSgc=
X-Received: by 2002:a05:6512:b0d:b0:554:e7ce:97f8 with SMTP id
 2adb3069b0e04-55628ed6c86mr899229e87.15.1751458839282; Wed, 02 Jul 2025
 05:20:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702114633.1490974-1-apatel@ventanamicro.com>
In-Reply-To: <20250702114633.1490974-1-apatel@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 2 Jul 2025 17:50:26 +0530
X-Gm-Features: Ac12FXxE_Q89fF2kuLXVjucIT31RfsCBiQVg9DaPXxssTSlaWFGUaeKT2XWMNbE
Message-ID: <CAK9=C2WH5QuQcKwTuGUAwF_ewkTDurDig0CU_+rJRtP3HHEpLA@mail.gmail.com>
Subject: Re: [PATCH v2] irqchip/riscv-imsic: Add kernel parameter to disable IPIs
To: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 5:16=E2=80=AFPM Anup Patel <apatel@ventanamicro.com>=
 wrote:
>
> When injecting IPIs to a set of harts, the IMSIC IPI support will do
> a separate MMIO write to the SETIPNUM_LE register of each target hart.
> This means on a platform where IMSIC is trap-n-emulated, there will be
> N MMIO traps when injecting IPI to N target harts hence IMSIC IPIs will
> be slow on such platform compared to the SBI IPI extension.
>
> Unfortunately, there is no DT, ACPI, or any other way of discovering
> whether the underlying IMSIC is trap-n-emulated. Using MMIO write to
> the SETIPNUM_LE register for injecting IPI is purely a software choice
> in the IMSIC driver hence add a kernel parameter to allow users disable
> IMSIC IPIs on platforms with trap-n-emulated IMSIC.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt |  7 +++++++
>  drivers/irqchip/irq-riscv-imsic-early.c         | 12 ++++++++++++
>  2 files changed, 19 insertions(+)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index f1f2c0874da9..7f0e12d0d260 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2538,6 +2538,13 @@
>                         requires the kernel to be built with
>                         CONFIG_ARM64_PSEUDO_NMI.
>
> +       irqchip.riscv_imsic_noipi
> +                       [RISC-V,EARLY]
> +                       Force the kernel to not use IMSIC software inject=
ed MSIs
> +                       as IPIs. Intended for system where IMSIC is trap-=
n-emulated,
> +                       and thus want to reduce MMIO traps when triggerin=
g IPIs
> +                       to multiple harts.
> +
>         irqfixup        [HW]
>                         When an interrupt is not handled search all handl=
ers
>                         for it. Intended to get systems with badly broken
> diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/ir=
q-riscv-imsic-early.c
> index 1dbc41d7fe80..c6fba92dd5a9 100644
> --- a/drivers/irqchip/irq-riscv-imsic-early.c
> +++ b/drivers/irqchip/irq-riscv-imsic-early.c
> @@ -9,6 +9,7 @@
>  #include <linux/cpu.h>
>  #include <linux/export.h>
>  #include <linux/interrupt.h>
> +#include <linux/init.h>
>  #include <linux/io.h>
>  #include <linux/irq.h>
>  #include <linux/irqchip.h>
> @@ -22,6 +23,14 @@
>  #include "irq-riscv-imsic-state.h"
>
>  static int imsic_parent_irq;
> +static bool imsic_noipi;
> +
> +static int __init imsic_noipi_cfg(char *buf)
> +{
> +       imsic_noipi =3D true;
> +       return 0;
> +}
> +early_param("irqchip.riscv_imsic_noipi", imsic_noipi_cfg);
>
>  #ifdef CONFIG_SMP
>  static void imsic_ipi_send(unsigned int cpu)
> @@ -47,6 +56,9 @@ static int __init imsic_ipi_domain_init(void)
>  {
>         int virq;
>
> +       if (imsic_noipi)
> +               return 0;
> +

We can skip enabling/disabling IMSIC_IPI_ID in imsic_ipi_starting_cpu()
and imsic_ipi_dying_cpu() when imsic_noipi is set.

In addition to the above, we can also re-use the reserved IPI ID for
devices.

I will quickly send v3. Apologies for the noise.

Regards,
Anup
