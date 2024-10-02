Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EAF1D0F62
	for <linux-doc@vger.kernel.org>; Wed,  2 Oct 2024 16:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727888384; cv=none; b=lfjPk5gWyWugbH94fofMpTOzWYratLmPBMd6/lxEjVZ2NM6aPmetGaEFRJxNAy+vlpt07QeLYdDJlPMA9tG5JX/DSB1Un4ihXHG2yzwCpBAFQHrQHJel99dLQkk1rZUyuceZOQoTdF517GX06N/VXHBorBLGZUhAiwVR0pspdqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727888384; c=relaxed/simple;
	bh=mQQG0qxo3tmSJx7Ys2f8RCMr8U4wdqZNGspopCwU2SQ=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tv5ODcPqNMUugIAJ0XDPkEaFsxD17S7w//fR4j/YboKDQ6HAOfMsT5PDCaxFRYeP02oEY0C/iKYu2cpdF0oVzZCFkmeltT9zlAoOnwL9PfydhNTqxUedBwnfnrSOn0w6U3MpIrJfB98JWvvRDjYLTWXpk46I9RDhHLiy1m2zoTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=iNRkmySF; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="iNRkmySF"
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DF3154057B
	for <linux-doc@vger.kernel.org>; Wed,  2 Oct 2024 16:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1727888373;
	bh=jOHh59GRXNfOUGegaYQL6JngKA1K1v1abGrefUApkfM=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=iNRkmySF7hC/LEdTd/BwobgChPYGM7d/Jk3571q3IxGZI2Yxbnl2g8so+a1mmOdKB
	 aOukgc0m85e+dbd7QDhBjtZBQU01c+cIC1YxEkS+JQhhB8awOwP/vBGoLF+6ufGfP4
	 OdKSC5XUtLNu0LNeYb6mF1HzZ25L1cEg53SYzfjTa4hrUV2x+u6j8SFUp7C5ZYM4dH
	 ISFZlPMxxc7cBkKrL1cH+XrXUOZIw9AGnTEjHAVZz6Z8/BRrU82cAFzilpTXManAzB
	 qt69IavNkQPDcG7EQIolgkTnqWNcaNkkh1dey0tsgyR21pnZZLx4UqG4RwufaFW3IN
	 90Ml0DqS94N4A==
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-27808f6bfefso74218fac.2
        for <linux-doc@vger.kernel.org>; Wed, 02 Oct 2024 09:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727888373; x=1728493173;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jOHh59GRXNfOUGegaYQL6JngKA1K1v1abGrefUApkfM=;
        b=E9mpzGdx4wV0pReNkY9d2Jt9BobRmGPYRow54hywraEJD08OZIMQKrfDFrSr7Wn5dW
         iBMUlCkuyoBHPYwqvVzFcLvB5HItwhZ4c3ovU9EzYhRKKwgLV0KeoJNko7KKXpFUoNAQ
         MN+cDHDq2VqS1wGpQFkieuTssmGaXHBvV7kO9QC1qjv189q2PiUtusEx3581ZF8B49r9
         v4sBK2pI+Urio1/bHzy1e9c+m1QFjR7T+AHgXzVDAk5umjMkUwyinfvgEj8kg7DPx45X
         iEMe5bu1N2WISZwkj5+oIxWY88nwwk7nhkxktU6CykT3YMgcRidlZc303KwsLHIE3C8s
         RrtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzfBv0Plx9FrT8lFtb/oYXnbhR/pjVK4qPTYtI9DF9YhzmInjmwEvV+vAlxxIb0KUEjxrudb4MUCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC+A+3ch9M0HpvtzlJ8zNdrE8w1Kdsdx91ekdB8o0cwq2BSaik
	YD4nyU93c/Vo13jWe6NlNf+7imr1OAOZEIEFEdmTvAci9SwpIjI2Gd80iOhC9gaT5nYVvz6dQLT
	mP4W3swJGY/AbB/OerXqYpbihso4J5B3BcxWrjSsv2hONWiNeH2lP3c0YDO05HWBVDQYja+LWu6
	/EyNgIKWqIQ1khKB088kCoyn2z12zopfBaO1vnXVrWLjqfi5ZJ
X-Received: by 2002:a05:6871:a6aa:b0:287:541:c60 with SMTP id 586e51a60fabf-287889aa2b0mr2470204fac.1.1727888372577;
        Wed, 02 Oct 2024 09:59:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqcxKIhFuRh+HBH4VGMynHVutdUUyzDUM77wrN93IMmYcomKUkacOGnkCdDFPa2rdTrgDyhXCZk9+ZWOlwbms=
X-Received: by 2002:a05:6871:a6aa:b0:287:541:c60 with SMTP id
 586e51a60fabf-287889aa2b0mr2470156fac.1.1727888372149; Wed, 02 Oct 2024
 09:59:32 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Oct 2024 09:59:31 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240911-xtheadvector-v10-10-8d3930091246@rivosinc.com>
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com> <20240911-xtheadvector-v10-10-8d3930091246@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Wed, 2 Oct 2024 09:59:31 -0700
Message-ID: <CAJM55Z95=ga=2qPirda4XjLRX1OWbXRzWwbi9eXYeow_K_ZoQQ@mail.gmail.com>
Subject: Re: [PATCH v10 10/14] riscv: hwprobe: Add thead vendor extension probing
To: Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Samuel Holland <samuel.holland@sifive.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
	Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
	Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Charlie Jenkins wrote:
> Add a new hwprobe key "RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0" which
> allows userspace to probe for the new RISCV_ISA_VENDOR_EXT_XTHEADVECTOR
> vendor extension.
>
> This new key will allow userspace code to probe for which thead vendor
> extensions are supported. This API is modeled to be consistent with
> RISCV_HWPROBE_KEY_IMA_EXT_0. The bitmask returned will have each bit
> corresponding to a supported thead vendor extension of the cpumask set.
> Just like RISCV_HWPROBE_KEY_IMA_EXT_0, this allows a userspace program
> to determine all of the supported thead vendor extensions in one call.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Reviewed-by: Evan Green <evan@rivosinc.com>
> ---
>  arch/riscv/include/asm/hwprobe.h                   |  3 +-
>  .../include/asm/vendor_extensions/thead_hwprobe.h  | 19 +++++++++++
>  .../include/asm/vendor_extensions/vendor_hwprobe.h | 37 ++++++++++++++++++++++
>  arch/riscv/include/uapi/asm/hwprobe.h              |  3 +-
>  arch/riscv/include/uapi/asm/vendor/thead.h         |  3 ++
>  arch/riscv/kernel/sys_hwprobe.c                    |  5 +++
>  arch/riscv/kernel/vendor_extensions/Makefile       |  1 +
>  .../riscv/kernel/vendor_extensions/thead_hwprobe.c | 19 +++++++++++
>  8 files changed, 88 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index ef01c182af2b..6148e1eab64c 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>  /*
> - * Copyright 2023 Rivos, Inc
> + * Copyright 2023-2024 Rivos, Inc
>   */
>
>  #ifndef _ASM_HWPROBE_H
> @@ -21,6 +21,7 @@ static inline bool hwprobe_key_is_bitmask(__s64 key)
>  	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
>  	case RISCV_HWPROBE_KEY_IMA_EXT_0:
>  	case RISCV_HWPROBE_KEY_CPUPERF_0:
> +	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
>  		return true;
>  	}
>
> diff --git a/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h b/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
> new file mode 100644
> index 000000000000..65a9c5612466
> --- /dev/null
> +++ b/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_THEAD_HWPROBE_H
> +#define _ASM_RISCV_VENDOR_EXTENSIONS_THEAD_HWPROBE_H
> +
> +#include <linux/cpumask.h>
> +
> +#include <uapi/asm/hwprobe.h>
> +
> +#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
> +void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const struct cpumask *cpus);
> +#else
> +static inline void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair,
> +						  const struct cpumask *cpus)
> +{
> +	pair->value = 0;
> +}
> +#endif
> +
> +#endif
> diff --git a/arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h b/arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h
> new file mode 100644
> index 000000000000..6b9293e984a9
> --- /dev/null
> +++ b/arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2024 Rivos, Inc
> + */
> +
> +#ifndef _ASM_RISCV_SYS_HWPROBE_H
> +#define _ASM_RISCV_SYS_HWPROBE_H
> +
> +#include <asm/cpufeature.h>
> +
> +#define VENDOR_EXT_KEY(ext)								\
> +	do {										\
> +		if (__riscv_isa_extension_available(isainfo->isa, RISCV_ISA_VENDOR_EXT_##ext)) \
> +			pair->value |= RISCV_HWPROBE_VENDOR_EXT_##ext;			\
> +		else									\
> +			missing |= RISCV_HWPROBE_VENDOR_EXT_##ext;			\
> +	} while (false)
> +
> +/*
> + * Loop through and record extensions that 1) anyone has, and 2) anyone
> + * doesn't have.
> + *
> + * _extension_checks is an arbitrary C block to set the values of pair->value
> + * and missing. It should be filled with VENDOR_EXT_KEY expressions.
> + */
> +#define VENDOR_EXTENSION_SUPPORTED(pair, cpus, per_hart_vendor_bitmap, _extension_checks)	\
> +	do {											\
> +		int cpu;									\
> +		u64 missing = 0;								\
> +		for_each_cpu(cpu, (cpus)) {							\
> +			struct riscv_isavendorinfo *isainfo = &(per_hart_vendor_bitmap)[cpu];	\
> +			_extension_checks							\
> +		}										\
> +		(pair)->value &= ~missing;							\
> +	} while (false)										\
> +
> +#endif /* _ASM_RISCV_SYS_HWPROBE_H */
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index b706c8e47b02..452d0b84f17f 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>  /*
> - * Copyright 2023 Rivos, Inc
> + * Copyright 2023-2024 Rivos, Inc
>   */
>
>  #ifndef _UAPI_ASM_HWPROBE_H
> @@ -82,6 +82,7 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
>  #define RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS	7
>  #define RISCV_HWPROBE_KEY_TIME_CSR_FREQ	8
> +#define RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0	9
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */

I wanted to try this patchset on my Nezha board, but rebasing on v6.11
this conflicts with

  c42e2f076769 ("RISC-V: hwprobe: Add MISALIGNED_PERF key")

While fixing it up I bumped the RISCV_HWPROBE_MAX_KEY as the comment above told
me to do, but now I notice you don't do that in this patch. Is that a bug or am
I misunderstanding something?

/Emil

>
>  /* Flags */
> diff --git a/arch/riscv/include/uapi/asm/vendor/thead.h b/arch/riscv/include/uapi/asm/vendor/thead.h
> new file mode 100644
> index 000000000000..43790ebe5faf
> --- /dev/null
> +++ b/arch/riscv/include/uapi/asm/vendor/thead.h
> @@ -0,0 +1,3 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +
> +#define		RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR	(1 << 0)
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 8d1b5c35d2a7..5a3dc8e66c85 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -15,6 +15,7 @@
>  #include <asm/uaccess.h>
>  #include <asm/unistd.h>
>  #include <asm/vector.h>
> +#include <asm/vendor_extensions/thead_hwprobe.h>
>  #include <vdso/vsyscall.h>
>
>
> @@ -241,6 +242,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>  		pair->value = riscv_timebase;
>  		break;
>
> +	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
> +		hwprobe_isa_vendor_ext_thead_0(pair, cpus);
> +		break;
> +
>  	/*
>  	 * For forward compatibility, unknown keys don't fail the whole
>  	 * call, but get their element key set to -1 and value set to 0
> diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
> index 353522cb3bf0..866414c81a9f 100644
> --- a/arch/riscv/kernel/vendor_extensions/Makefile
> +++ b/arch/riscv/kernel/vendor_extensions/Makefile
> @@ -2,3 +2,4 @@
>
>  obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+= andes.o
>  obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead.o
> +obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead_hwprobe.o
> diff --git a/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
> new file mode 100644
> index 000000000000..2eba34011786
> --- /dev/null
> +++ b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <asm/vendor_extensions/thead.h>
> +#include <asm/vendor_extensions/thead_hwprobe.h>
> +#include <asm/vendor_extensions/vendor_hwprobe.h>
> +
> +#include <linux/cpumask.h>
> +#include <linux/types.h>
> +
> +#include <uapi/asm/hwprobe.h>
> +#include <uapi/asm/vendor/thead.h>
> +
> +void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const struct cpumask *cpus)
> +{
> +	VENDOR_EXTENSION_SUPPORTED(pair, cpus,
> +				   riscv_isa_vendor_ext_list_thead.per_hart_isa_bitmap, {
> +		VENDOR_EXT_KEY(XTHEADVECTOR);
> +	});
> +}
>
> --
> 2.45.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
