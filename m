Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903AF1C8FC9
	for <linux-doc@vger.kernel.org>; Wed, 29 May 2024 21:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717017294; cv=none; b=sSpmoQOLCvjDlxgjUGrJ4z3D1otchmu4fgvADAUDj121WXembC07BtnWrYA3Q2Lu0yeqRrMYrqxRmhgsH+MLIvUSD7e3AG6TMu3qVkR0NIP81SumVMltZ/D0HLSfGYz5J1WOFvb5y/WXnEBPZ2dQzw4kMejXVeijYiuU8JVYKsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717017294; c=relaxed/simple;
	bh=xp+CT/tD0icXUGbC5J0bXRQdnp9X6jvessR57e4Cx/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPrgb3s0iAs20jwzcEsQH6su/2hgZlM9gmcTiG/V4aOoEZC7fdPtiEl5upR/MFB41IAqqRbVFc2rcq0w8M4A75l4gGeqjSVAVuMMjFqUS6Oyb4UnBFj9M3dqqqFXmR6gfLdzcVUtmLhujbVDxI3FhhlPXAZkB+iS58/yunW1By4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ptWh+/Qw; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ptWh+/Qw"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-681bc7f50d0so360322a12.0
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2024 14:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717017291; x=1717622091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DyPCzefD6ExSaxdr+PjCGM46RBwZY2JmPFT75MS1UY4=;
        b=ptWh+/QwXfjC0xiH9R+rH2bP1WiYDhuFIRl235qIWLe4+wFCijZH22VQmsT+7WFaLK
         65BEApyEru27jJPXb0OT1JJxFQ+Qw5W7ffuqzc0M38RV+cdTa5xmbOsVq9znqWx22QcI
         aV+TsNVdlg0bLFfhdkjthRsGwQlDXoVp3smjAJMIKoqEbgBAY2hxSdKac32LhrSG26mS
         yBxLzcXjJvwahrKGw+MRF8yAOWvSRxKWrlbFX/xohLkdGf+zCeC4d1K5o0Hq00pXkf+w
         vBIBgJ7mqVCvHZRVGtLFu7J0KwIUY2d22zHbh5Gq9im61yQ9WZaplSTeA+m8QhHUf0uL
         UjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717017291; x=1717622091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DyPCzefD6ExSaxdr+PjCGM46RBwZY2JmPFT75MS1UY4=;
        b=bCXVWL9nSlRX+yglyBdNU/83gPZoKDPTN7qqXR7Pge+j13e2dCjEtvFCaBT4GpWvrV
         ECUJ47dP86rBFpdhA1zSlFZRddzdGCtEoiMXLeY37sUld6KaOygo0bXO0ZsLMKm0AVIy
         NLU4c7T5NO6nTrlkzCmDnFYAacavdJnC0x+MMlZtLWv6s1p3qqMi1JUG3ZQ4awnlOUj2
         YUNCsHMA9ogBMEZ9kejUin5nwnKQKaJc4qWqrdo/h4LC8XWElO4nK83R6rtF1gkvoCOT
         dGSEBHq0iWo0hajE1Opaq0gvjdjf60JL9EDJJI9KL51mDarx5LnYGl0ir5t5SbI+8Orl
         o4Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWz4sNCRkJnoGbQKj+u5dwE1Oq8xUCPle8EQnyFSF9+/lISaKtxcam5FJw1aOMjmIFcT5z1YN6xdX+63+Qxg3HMMiuR9xYpBvp0
X-Gm-Message-State: AOJu0YwncogaVRrdIsJ8ggKz6cZkKmOJBwXQQ6I8dsla588biDi5XDl2
	+1kYe0/R4cMo9+VKEOvi03T9tB+oZx/SZVNqbaswLMfPxvCs5z8JrvFxBUtppnY=
X-Google-Smtp-Source: AGHT+IG2IgGB1U/59maFbM1d4vodmm/pXlp59to7IcvevJSTn91eUicHERweTS3JUiNUrA0BDLmMlQ==
X-Received: by 2002:a17:90a:e150:b0:2b4:329e:eabd with SMTP id 98e67ed59e1d1-2c1acc2d94amr11415a91.2.1717017290645;
        Wed, 29 May 2024 14:14:50 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:32f9:8d5b:110a:1952])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a77656e7sm237485a91.7.2024.05.29.14.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 14:14:49 -0700 (PDT)
Date: Wed, 29 May 2024 14:14:46 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: hwprobe: Add MISALIGNED_PERF key
Message-ID: <ZleaxvrTZWr8I6AX@ghost>
References: <20240529182649.2635123-1-evan@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529182649.2635123-1-evan@rivosinc.com>

On Wed, May 29, 2024 at 11:26:48AM -0700, Evan Green wrote:
> RISCV_HWPROBE_KEY_CPUPERF_0 was mistakenly flagged as a bitmask in
> hwprobe_key_is_bitmask(), when in reality it was an enum value. This
> causes problems when used in conjunction with RISCV_HWPROBE_WHICH_CPUS,
> since SLOW, FAST, and EMULATED have values whose bits overlap with
> each other. If the caller asked for the set of CPUs that was SLOW or
> EMULATED, the returned set would also include CPUs that were FAST.
> 
> Introduce a new hwprobe key, RISCV_HWPROBE_KEY_MISALIGNED_PERF, which
> returns the same values in response to a direct query (with no flags),
> but is properly handled as an enumerated value. As a result, SLOW,
> FAST, and EMULATED are all correctly treated as distinct values under
> the new key when queried with the WHICH_CPUS flag.
> 
> Leave the old key in place to avoid disturbing applications which may
> have already come to rely on the broken behavior.
> 
> Fixes: e178bf146e4b ("RISC-V: hwprobe: Introduce which-cpus flag")
> Signed-off-by: Evan Green <evan@rivosinc.com>
> 
> ---
> 
> 
> Note: Yangyu also has a fix out for this issue at [1]. That fix is much
> tidier, but comes with the slight risk that some very broken userspace
> application may break now that FAST cpus are not included for the query
> of which cpus are SLOW or EMULATED. I wanted to get this fix out so that
> we have both as options, and can discuss. These fixes are mutually
> exclusive, don't take both.
> 
> [1] https://lore.kernel.org/linux-riscv/tencent_01F8E0050FB4B11CC170C3639E43F41A1709@qq.com/
> 
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 8 ++++++--
>  arch/riscv/include/asm/hwprobe.h      | 2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 1 +
>  4 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 204cd4433af5..616ee372adaf 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -192,8 +192,12 @@ The following keys are defined:
>         supported as defined in the RISC-V ISA manual starting from commit
>         d8ab5c78c207 ("Zihintpause is ratified").
>  
> -* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
> -  information about the selected set of processors.
> +* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated. Returns similar values to
> +     :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_PERF`, but the key was mistakenly
> +     classified as a bitmask rather than a value.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_PERF`: An enum value describing the
> +  performance of misaligned scalar accesses on the selected set of processors.
>  
>    * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
>      accesses is unknown.
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index 630507dff5ea..150a9877b0af 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,7 @@
>  
>  #include <uapi/asm/hwprobe.h>
>  
> -#define RISCV_HWPROBE_MAX_KEY 6
> +#define RISCV_HWPROBE_MAX_KEY 7
>  
>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>  {
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index dda76a05420b..bc34e33fef23 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -68,6 +68,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
>  #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
> +#define RISCV_HWPROBE_KEY_MISALIGNED_PERF	7
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>  
>  /* Flags */
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 969ef3d59dbe..c8b7d57eb55e 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -208,6 +208,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>  		break;
>  
>  	case RISCV_HWPROBE_KEY_CPUPERF_0:
> +	case RISCV_HWPROBE_KEY_MISALIGNED_PERF:
>  		pair->value = hwprobe_misaligned(cpus);
>  		break;
>  
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

I am not sure what the "best" solution is here but making a new key is
most logical to me.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

