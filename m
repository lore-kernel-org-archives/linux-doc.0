Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750FF233D7C
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 09:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736759255; cv=none; b=PpNmc4lTJQ4/w101PvQmdoLTg7WpU/BtcijGztob3SvvCQg/Yr7Jsviq7c/LXk2kOrpnIJciCTWrpQRjlDLzwCfBvSVV9ZZ1myVbIeACjTnoh7P7GOBAkEqtKKoSKTw67VeJTVKkt+KX+oKDMJQoMz89IYyG6F8Ny7ZkVCDlHj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736759255; c=relaxed/simple;
	bh=Jkk4NHk5y0fssBl5XxVtpJb+jCj46C488a8+4yqZP/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6ocws9V4S6XGy7ifWWcEjPQZwAeDuXY54dNL+PHILYKtenDWHmEJOztmCX6EPYIw4tzE/ktTwPofhoV0MoTo7GxNPOZbxglmJVQJKLsJ/b/YFr06tojiZWzcvkihLhbmg0ihX7Z/6tJGrqgsv7IIwYuc2EwQuyCsDGVoCVNv3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=aejWKP59; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="aejWKP59"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43675b1155bso46107435e9.2
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 01:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736759252; x=1737364052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LPr/Cux6nSmjbpyf8eRLWCzO219lB+r54/sYhftR878=;
        b=aejWKP59SZ70TGkYyXnnWgJsNlSbAXKfcNHglrb4ls2xmKQ5u4CNmoif78EP7uDuwY
         DVP0Wk38dHh45ZxI0VbvgRWvcAS/hqmXOFDI/xqqAO4UxeKaRzXRuTEoId9h2R+0MG0i
         pOmkJGCj9Lu3VHOHN8JTEKyjwyN1/YL9HSLpMKpk/ZFy2BrUZb9dgCrc0AP8OtT8Webh
         YByoCz5ytgPPFPUzGuja3mLYNeB3sHP5Wmlns99T6SCH3Xtfzjr1EjvEnilDGi5hg+Td
         ePAW4Kg8a8HvxIkrEjcPl4G9RKNg0zzsxW92/s/5V0PvURV9WswQYRDg/yE+18/7xzMO
         3vWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736759252; x=1737364052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPr/Cux6nSmjbpyf8eRLWCzO219lB+r54/sYhftR878=;
        b=gX6x1OhRliQcKBojzmGp7Vedfoc68yDo1qGxYgLQP7zFXeJfAJ9dQPUYd8KoTF/j0a
         hLaODl+nTAvMSBkrHMjugvrVCDWeWyBErAJB4x4p+vOdRbd1ZNToGzXxzRCXvssTn/QP
         cf7vRxpM86rW/wYAXHabIaDB7s99rzUcVfhySy0QeOzM2bQ/8b+bWv11UDG53ZMmpR1K
         0HSld+7TT/rsXLFW/7IKSWnkJbluy5CRLl/NLlQxWNY2fo0c6zFdjgcJSxOi0+9hwgOS
         KVxrbUyEzW7JhaC/l7sw+lN/o1kZrjcwpfn/ypNXAy0tNH4V886b7lzPRN7J1QXMH9XH
         g7lw==
X-Forwarded-Encrypted: i=1; AJvYcCWW8bN1TXC1vHjvsuhCO9uCUNwybgVGJjb9BTFEv+j+Jk05rZxN3UFIzfyZRAm2LHuJWaGyL64iPaM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Pt0VeEmPXYI1ZQlOQGxvL34Mx2bR4v/WO332zLBp4qnfGGss
	Q3g2wVRmfzQw2p//fhE3qN/WCYFuxQp/x0bOGjoWpLJaRdY3edCydjL84S9pjT8=
X-Gm-Gg: ASbGncuC589L4i4QvxStfLod8A0iBe2PwsnjUK0tEHWEhNRr1PiVZog4+9b3wR/LoVP
	6TJoHBLs3C8RF51s0owoinO2r3mwqo5YbOqt1pG/h49wb3GmampsikMa7eGLTz+i6P8B8stFN6X
	P/mbdvhQOsYz5qnHbP1nRsg2XGABiaUIqu6Ic+PZUYv1tgy8IdqymZu0rA1j3N+dH5IxMy9Nr2H
	TEwiHOd3vUOPKg7LuF2A6F+agwzyh7Uttd7espEPmVJ/w3kfZ/VkqGZpNsz5sUUcgm8T6Y1fChy
	Ws9xW54ZYCrN5SbNvK0XrYkKRAMUoeqtyM/wkOHZyg==
X-Google-Smtp-Source: AGHT+IGWhnKG6PDAHyN3fg3+EZGqPP/Y3MyVqJx3DpMCFMMoPVW/b/U+uXO14R6PTUpJ6lUOkTGrIg==
X-Received: by 2002:a05:600c:5491:b0:434:fddf:5bfa with SMTP id 5b1f17b1804b1-436e268626emr168383345e9.2.1736759251595;
        Mon, 13 Jan 2025 01:07:31 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9d8fb99sm138522765e9.3.2025.01.13.01.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 01:07:31 -0800 (PST)
Date: Mon, 13 Jan 2025 10:07:30 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: alexghiti@rivosinc.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	samuel.holland@sifive.com, shuah@kernel.org
Subject: Re: [PATCH v3 2/3] RISC-V: hwprobe: Expose Zicbom extension and its
 block size
Message-ID: <20250113-65f27ad723c0f6585f86ae7f@orel>
References: <20250113083635.73826-1-cuiyunhui@bytedance.com>
 <20250113083635.73826-2-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113083635.73826-2-cuiyunhui@bytedance.com>

On Mon, Jan 13, 2025 at 04:36:34PM +0800, Yunhui Cui wrote:
> Expose Zicbom through hwprobe and also provide a key to extract its
> respective block size.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 6 ++++++
>  arch/riscv/include/asm/hwprobe.h      | 2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
>  arch/riscv/kernel/sys_hwprobe.c       | 6 ++++++
>  4 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 955fbcd19ce9..7a47cbdbcf8e 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -94,6 +94,9 @@ The following keys are defined:
>    * :c:macro:`RISCV_HWPROBE_EXT_ZICBOZ`: The Zicboz extension is supported, as
>         ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
>  
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICBOM`: The Zicbom extension is supported, as
> +       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
> +

This should come after RISCV_HWPROBE_EXT_SUPM since this document has the
defines sorted in the order in which they are introduced (although I
personally wouldn't mind if we ordered them alphabetically instead)

>    * :c:macro:`RISCV_HWPROBE_EXT_ZBC` The Zbc extension is supported, as defined
>         in version 1.0 of the Bit-Manipulation ISA extensions.
>  
> @@ -273,6 +276,9 @@ The following keys are defined:
>  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
>    represents the size of the Zicboz block in bytes.
>  
> +* :c:macro:`RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE`: An unsigned int which
> +  represents the size of the Zicbom block in bytes.
> +

Should be moved below RISCV_HWPROBE_KEY_TIME_CSR_FREQ

>  * :c:macro:`RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS`: An unsigned long which
>    represent the highest userspace virtual address usable.
>  
> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> index 1ce1df6d0ff3..89379f9a2e6e 100644
> --- a/arch/riscv/include/asm/hwprobe.h
> +++ b/arch/riscv/include/asm/hwprobe.h
> @@ -8,7 +8,7 @@
>  
>  #include <uapi/asm/hwprobe.h>
>  
> -#define RISCV_HWPROBE_MAX_KEY 10
> +#define RISCV_HWPROBE_MAX_KEY 11
>  
>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>  {
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 3af142b99f77..892dd71a3793 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -73,6 +73,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
>  #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
>  #define		RISCV_HWPROBE_EXT_SUPM		(1ULL << 49)
> +#define		RISCV_HWPROBE_EXT_ZICBOM	(1ULL << 50)
>  #define RISCV_HWPROBE_KEY_CPUPERF_0	5
>  #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
>  #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
> @@ -90,6 +91,7 @@ struct riscv_hwprobe {
>  #define		RISCV_HWPROBE_MISALIGNED_SCALAR_FAST		3
>  #define		RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED	4
>  #define RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF	10
> +#define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE	11

Move below the bit defines of RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF
(notice how its bit defines are indented, indicating they belong to it)

>  #define		RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN		0
>  #define		RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW		2
>  #define		RISCV_HWPROBE_MISALIGNED_VECTOR_FAST		3
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index cb93adfffc48..affcc3e58df9 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -107,6 +107,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  		EXT_KEY(ZCB);
>  		EXT_KEY(ZCMOP);
>  		EXT_KEY(ZICBOZ);
> +		EXT_KEY(ZICBOM);

This list is in alphabetical order, which means ZICBOM should come before
ZICBOZ.

>  		EXT_KEY(ZICOND);
>  		EXT_KEY(ZIHINTNTL);
>  		EXT_KEY(ZIHINTPAUSE);
> @@ -278,6 +279,11 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>  		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
>  			pair->value = riscv_cboz_block_size;
>  		break;
> +	case RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE:
> +		pair->value = 0;
> +		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOM))
> +			pair->value = riscv_cbom_block_size;
> +		break;
>  	case RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS:
>  		pair->value = user_max_virt_addr();
>  		break;
> -- 
> 2.39.2
>

Thanks,
drew
