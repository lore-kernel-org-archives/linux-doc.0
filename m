Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8374F4AECE
	for <linux-doc@vger.kernel.org>; Fri,  9 Aug 2024 18:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723229403; cv=none; b=d2ALpAOjwSnqbmARJEkoRmzM8IJsBbMLIYf8zRXDeeZ4jW9pLcLlq2W9ST0xOaMPgp8wgB8U01A4Y/LrIy6qIzoiOJ5orVMNikvzrIzdc3WUxDWWvuIbQII8wWuZ0O+r6NIm7cg56GP+WDFlmLgXHq+LB6uHz1+fUyr1S0vdkNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723229403; c=relaxed/simple;
	bh=QAES32h+gct60eeb5URYRuTt6zu7HhIZyf2cvOuY89o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAlQ1ihyez8ap7UlsYRy50s6spoAhwy98cIC8P/49KS/ebhgIplxyieREomFqlsT4hO6Tb4ML8kDfyDytm3ykRL+v1hIrUeA5pLQoFo8eILczHtjnWE+hMje/sA/1JT51yzuszBZLfcESpwPuGRHgoDms8nMx1RQP0HtRKdxL58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=gUnBpOlX; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gUnBpOlX"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fd9e70b592so19348155ad.3
        for <linux-doc@vger.kernel.org>; Fri, 09 Aug 2024 11:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723229401; x=1723834201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pTR80LART49AwfTCZhDaQ9X3675Tbg/ziI9l0jgP2i4=;
        b=gUnBpOlXv2g1BPWaX9eI0eM+U0hzwRQH5Z8ztWjpNpgm+ZpEoWevDHjUEeOhqwqJFe
         voacAhmpEVUkOmFGevrcbtnZ/S53SSBl47nE8LxCKW6wXL3TzUonhjVVgzJ4DUW06cad
         2anxw4Uv7iGLxFVlsP6uCos1QcWAj/l0NvqS5smD3iMZb+kDPTeRavV84DGxbstj3Tdn
         XqKVZXBbtHmRjqyy+Fy8mQyCvifC09P4Etn0XdM34F+QZXUYa6c8ziHzYQoL2DFi24nC
         50s/FfqZ8joJwhajnmuzqI0yrzcSlhls2mJF5+7G/NhYq0xp3Wxp42IH4HeUnP20tCEh
         aJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723229401; x=1723834201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTR80LART49AwfTCZhDaQ9X3675Tbg/ziI9l0jgP2i4=;
        b=QBlpUgrfnBG9jrZb45MFrAnpuuqaJv7Wu8ICkzj02u+zEQ4ifmzvn3HUfY75qYdXwf
         jyb0F0HNhL0PMHCYDF7rZU6EsPvdR79iEDZ3W4ilGK//T2tgZPHnTXDkP1v8ztc+Kan5
         4IoTO4j4l8Qp7lqteymee7jILSnNxR0CWjkJol1xWAaRcuS6sLpJ+rH3Axha0zDhPkAo
         qqOvZ3O9HqYLZBY6d7HBjJeVy221jVN8pA2vYON8YUQ9laUCLzHcosHQt2FZK1Z62e0J
         lGCPrSnd/Out68HApHSQ4n3OacGExKxSjF345uKVazv9pCmoiaZUg8YSLQwq/L5i4jg+
         sTzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz/F+9wlEpGuDHewZ5H3ySZCDh07gmtBaJ2JTnq40LOXdR8Ct3hFf6gtYy+lfxLlSnRGFQULwXAfJH75HPWgtGy3GVNCjg8UNZ
X-Gm-Message-State: AOJu0YzN3afF+juhpxOBh2qdK87cw6yBMOauZCArUbyvey6ZIw7YW1mS
	o5fk01aMc5jBzxlkmr2s+A9i53FWZrI+qSDN0QYzHkHaikrsB7DKNDcuHKaypY4=
X-Google-Smtp-Source: AGHT+IGn2lIs6m4F9PqnQxrCoDxM9ibXdCJFJLnZ4eHgEWlgh5F8ljLu/bemuIJyW9+rcge+TfIiJQ==
X-Received: by 2002:a17:902:f707:b0:1fd:70f7:220d with SMTP id d9443c01a7336-200ae59eef4mr25979215ad.40.1723229400814;
        Fri, 09 Aug 2024 11:50:00 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:c486:937c:35d4:b6a2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bb8f8b08sm864425ad.64.2024.08.09.11.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 11:49:59 -0700 (PDT)
Date: Fri, 9 Aug 2024 11:49:56 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH 1/2] RISC-V: Add Zicclsm to cpufeature and hwprobe
Message-ID: <ZrZk1EACQoo1+9jm@ghost>
References: <20240809162240.1842373-1-jesse@rivosinc.com>
 <20240809162240.1842373-2-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809162240.1842373-2-jesse@rivosinc.com>

On Fri, Aug 09, 2024 at 12:22:39PM -0400, Jesse Taube wrote:
> > Zicclsm Misaligned loads and stores to main memory regions with both
> > the cacheability and coherence PMAs must be supported.
> > Note:
> > This introduces a new extension name for this feature.
> > This requires misaligned support for all regular load and store
> > instructions (including scalar and vector) but not AMOs or other
> > specialized forms of memory access. Even though mandated, misaligned
> > loads and stores might execute extremely slowly. Standard software
> > distributions should assume their existence only for correctness,
> > not for performance.

You left in the > characters.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> 
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> V1 -> V2:
>  - Add documentation for Zicclsm
>  - Move Zicclsm to correct location
> V2 -> V3:
>  - No changes
> V3 -> V4:
>  - Add definitions to hwprobe.rst
> V4 -> V5:
>  - No changes
> V5 -> V6:
>  - No changes
> V6 -> V7:
>  - No changes
> V7 -> V8:
>  - Rebase onto 2d1f51d8a4b0 (palmer/for-next)
>  - Change commit description
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 5 +++++
>  arch/riscv/include/asm/hwcap.h        | 1 +
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/cpufeature.c        | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 1 +
>  5 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 3db60a0911df..22c118df520b 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -239,6 +239,11 @@ The following keys are defined:
>         ratified in commit 98918c844281 ("Merge pull request #1217 from
>         riscv/zawrs") of riscv-isa-manual.
>  
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`:  The Zicclsm extension is supported as
> +        defined in the RISC-V RVA Profiles Specification. Misaligned support for
> +        all regular load and store instructions (including scalar and vector) but
> +        not AMOs or other specialized forms of memory access.
> +
>  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
>    information about the selected set of processors.
>  
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 5a0bd27fd11a..c93d957458f0 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -92,6 +92,7 @@
>  #define RISCV_ISA_EXT_ZCF		83
>  #define RISCV_ISA_EXT_ZCMOP		84
>  #define RISCV_ISA_EXT_ZAWRS		85
> +#define RISCV_ISA_EXT_ZICCLSM		86
>  
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
>  
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index b706c8e47b02..a9370968fc9f 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -72,6 +72,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 46)
>  #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
>  #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
> +#define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 49)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 8f20607adb40..2f54d811a9b8 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -314,6 +314,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  					  riscv_ext_zicbom_validate),
>  	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts,
>  					  riscv_ext_zicboz_validate),
> +	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
>  	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>  	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
>  	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 8d1b5c35d2a7..01eea29a56cd 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -107,6 +107,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  		EXT_KEY(ZCB);
>  		EXT_KEY(ZCMOP);
>  		EXT_KEY(ZICBOZ);
> +		EXT_KEY(ZICCLSM);
>  		EXT_KEY(ZICOND);
>  		EXT_KEY(ZIHINTNTL);
>  		EXT_KEY(ZIHINTPAUSE);
> -- 
> 2.45.2
> 
