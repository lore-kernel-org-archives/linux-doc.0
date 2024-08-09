Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC4F2941C
	for <linux-doc@vger.kernel.org>; Fri,  9 Aug 2024 21:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723240676; cv=none; b=qFoHxMeH69py5XaZFADro9VktoxPDVNMhgPSDxrQXI7oN0DH0iesiWZMWSlmV7YmS/8zpr2vtf1nnEZrBisAY286aqAu0I/8z3QEbGSDyw2ONjsl3XjpE9Gj9K1UaiBNOzCCmS7iHPT+BilzpcWtpnYsDs8OwdvCseadcmVg1hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723240676; c=relaxed/simple;
	bh=YRZiIuTGHPzGSOaLqzAXYlMZjzBjCKWSzL5v3LOpqx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olp9ysPgGrxDagl6A05Vn5IX8/LfkpSkyO6y055IMA8wuPwIkfGqD5An6GlHYTUSngAkBg2Tlkz1pFf93FpyRiitvvN8aLviUU4EWtTaS/E4beyZ4I41Akzzk+uMextxh6c2LnNBRFDAcE573q4OhskWJSMXkMnBcZqHorQOYYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=F94hUFiU; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="F94hUFiU"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70d23caf8ddso2299900b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 09 Aug 2024 14:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723240672; x=1723845472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/xyikB2Ei/kP6v6qu3Dfjj4bcI3dXovVHvkmH5BSaI0=;
        b=F94hUFiUV5jiAyzX45YSzvz08D25J8riZRtI5Rl0dsJqc9yYWR3dls5pyfr9yTcxmS
         Dn3qEc4SUOLHyyIcUnoBfDc0s8Xd0kwRvNb8Y3V4ps7nJo55TgK6ye9IwN0lR4JqVvJ8
         EwiRGaRMfhWEUy4COBQgnjNZ5MQsVGUQXLzZsS9F3PYkOU4ZbpJKOcXZpklEPBjzYo3v
         /AHH7BkHF7bR/QxTmJxO0WzaYMDUfj8piFrKf7zP0dCXGDpEahXHw+WyeFJZcy+xz8eY
         +e+Z30VR43lduAB7fD6OeFEA6/BpP6fgufEeBuyYNpNMwYGdlENtbrIJGJaMQwT+KhP/
         RUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723240673; x=1723845473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xyikB2Ei/kP6v6qu3Dfjj4bcI3dXovVHvkmH5BSaI0=;
        b=aJINyYCIiZUn/UXcD8TgUIdEV8CM91iCdeXuchwXqzU7JpXpQhTD02ANFS1hY0r7CG
         FQFywpuz1/Q8/pkut7I24SySf15uCUJxOlhq7EKwH2lSUhO7Kpm6/9wANfllagqHAsam
         rT5+DThmLY+g96kL9GRZWUt0Bmi8IZ2R+lJV+lrEc45tsUa15xxMGqa2SnMMcpv1j9/P
         S4ZAIiF9jVAUQiKWMaKiWkH3f0IHXaThsqHc/iCBnEkVuJ8aak4DepIazuEn7JA0wr9F
         BOI8QcOmETB1qNYDdU6PhYrFyhOT/7/8zRfgW3CTV7v30ocSIFOjDETyk8cjH3r3TFG1
         w71w==
X-Forwarded-Encrypted: i=1; AJvYcCWWV/D7cSUs51Uj1XqAVRpSl/MjCSsZx2dlN4VcP7kBVTSP9iVe1pc8hkLwGLVVBLuWZvHrZzK7oYzBC3mQtuue/5fHfrJnm2/M
X-Gm-Message-State: AOJu0YzjVRJfUgai2rm1QLm4PBKOZSK3Sb0sGAiqmOgdOQo4NowNBBtz
	4nchy3KOaszYaHzM++tShGuh72FEF5C6TYXYN6cbkVaeXiwPBiReGtTtga12c0A=
X-Google-Smtp-Source: AGHT+IGBilfw4eReVwGWLB9hQLzymiOUg/hKPc9JEHB5a0oS9qZPfYxcOgqQLKshRKalDD2T65SeFA==
X-Received: by 2002:a05:6a00:6507:b0:710:e4db:a6fc with SMTP id d2e1a72fcca58-710e4dba9aemr955309b3a.27.1723240672503;
        Fri, 09 Aug 2024 14:57:52 -0700 (PDT)
Received: from ghost ([2601:647:6700:64d0:c561:c8c0:63ad:403a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c3dbe9eca3sm145941a12.76.2024.08.09.14.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 14:57:51 -0700 (PDT)
Date: Fri, 9 Aug 2024 14:57:48 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Erick Archer <erick.archer@gmx.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>, linux-doc@vger.kernel.org,
	enh <enh@google.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 2/2] RISC-V: hwprobe: Add SCALAR to misaligned perf
 defines
Message-ID: <ZraQ3PWOY23G2zZH@ghost>
References: <20240809214444.3257596-1-evan@rivosinc.com>
 <20240809214444.3257596-3-evan@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809214444.3257596-3-evan@rivosinc.com>

On Fri, Aug 09, 2024 at 02:44:44PM -0700, Evan Green wrote:
> In preparation for misaligned vector performance hwprobe keys, rename
> the hwprobe key values associated with misaligned scalar accesses to
> include the term SCALAR. Leave the old defines in place to maintain
> source compatibility.
> 
> This change is intended to be a functional no-op.
> 
> Signed-off-by: Evan Green <evan@rivosinc.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> ---
> 
> Changes in v4:
>  - Add the word scalar (Charlie)
> 
> Changes in v3:
>  - Leave the old defines in place (Conor, Palmer)
> 
> Changes in v2:
>  - Added patch to rename misaligned perf key values (Palmer)
> 
>  Documentation/arch/riscv/hwprobe.rst       | 28 ++++++++++++----------
>  arch/riscv/include/uapi/asm/hwprobe.h      |  5 ++++
>  arch/riscv/kernel/sys_hwprobe.c            | 10 ++++----
>  arch/riscv/kernel/traps_misaligned.c       |  6 ++---
>  arch/riscv/kernel/unaligned_access_speed.c | 12 +++++-----
>  5 files changed, 34 insertions(+), 27 deletions(-)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index a994eed75bde..85b709257918 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -247,23 +247,25 @@ The following keys are defined:
>    the performance of misaligned scalar native word accesses on the selected set
>    of processors.
>  
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
> -    accesses is unknown.
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN`: The performance of
> +    misaligned scalar accesses is unknown.

+ enh <enh@google.com>

Thanks for respinning this Evan! With this wording change the patch that
changes the wording but not the macro [1] is no longer needed.

- Charlie

Link:
https://lore.kernel.org/linux-riscv/CAJgzZorn5anPH8dVPqvjVWmLKqTi5bkLDR=FH-ZAcdXFnNe8Eg@mail.gmail.com/
[1]

>  
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned accesses are
> -    emulated via software, either in or below the kernel.  These accesses are
> -    always extremely slow.
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED`: Misaligned scalar
> +    accesses are emulated via software, either in or below the kernel.  These
> +    accesses are always extremely slow.
>  
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned native word
> -    sized accesses are slower than the equivalent quantity of byte accesses.
> -    Misaligned accesses may be supported directly in hardware, or trapped and
> -    emulated by software.
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW`: Misaligned scalar native
> +    word sized accesses are slower than the equivalent quantity of byte
> +    accesses. Misaligned accesses may be supported directly in hardware, or
> +    trapped and emulated by software.
>  
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned native word
> -    sized accesses are faster than the equivalent quantity of byte accesses.
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_FAST`: Misaligned scalar native
> +    word sized accesses are faster than the equivalent quantity of byte
> +    accesses.
>  
> -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
> -    not supported at all and will generate a misaligned address fault.
> +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED`: Misaligned scalar
> +    accesses are not supported at all and will generate a misaligned address
> +    fault.
>  
>  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
>    represents the size of the Zicboz block in bytes.
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> index 635753084275..1e153cda57db 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -83,6 +83,11 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS	7
>  #define RISCV_HWPROBE_KEY_TIME_CSR_FREQ	8
>  #define RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF	9
> +#define		RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN		0
> +#define		RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED	1
> +#define		RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW		2
> +#define		RISCV_HWPROBE_MISALIGNED_SCALAR_FAST		3
> +#define		RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED	4
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>  
>  /* Flags */
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index 2d0f4f6a32c3..cea0ca2bf2a2 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -178,13 +178,13 @@ static u64 hwprobe_misaligned(const struct cpumask *cpus)
>  			perf = this_perf;
>  
>  		if (perf != this_perf) {
> -			perf = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
> +			perf = RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
>  			break;
>  		}
>  	}
>  
>  	if (perf == -1ULL)
> -		return RISCV_HWPROBE_MISALIGNED_UNKNOWN;
> +		return RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
>  
>  	return perf;
>  }
> @@ -192,12 +192,12 @@ static u64 hwprobe_misaligned(const struct cpumask *cpus)
>  static u64 hwprobe_misaligned(const struct cpumask *cpus)
>  {
>  	if (IS_ENABLED(CONFIG_RISCV_EFFICIENT_UNALIGNED_ACCESS))
> -		return RISCV_HWPROBE_MISALIGNED_FAST;
> +		return RISCV_HWPROBE_MISALIGNED_SCALAR_FAST;
>  
>  	if (IS_ENABLED(CONFIG_RISCV_EMULATED_UNALIGNED_ACCESS) && unaligned_ctl_available())
> -		return RISCV_HWPROBE_MISALIGNED_EMULATED;
> +		return RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED;
>  
> -	return RISCV_HWPROBE_MISALIGNED_SLOW;
> +	return RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW;
>  }
>  #endif
>  
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index b62d5a2f4541..192cd5603e95 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -338,7 +338,7 @@ int handle_misaligned_load(struct pt_regs *regs)
>  	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
>  
>  #ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
> -	*this_cpu_ptr(&misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_EMULATED;
> +	*this_cpu_ptr(&misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED;
>  #endif
>  
>  	if (!unaligned_enabled)
> @@ -532,13 +532,13 @@ static bool check_unaligned_access_emulated(int cpu)
>  	unsigned long tmp_var, tmp_val;
>  	bool misaligned_emu_detected;
>  
> -	*mas_ptr = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
> +	*mas_ptr = RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
>  
>  	__asm__ __volatile__ (
>  		"       "REG_L" %[tmp], 1(%[ptr])\n"
>  		: [tmp] "=r" (tmp_val) : [ptr] "r" (&tmp_var) : "memory");
>  
> -	misaligned_emu_detected = (*mas_ptr == RISCV_HWPROBE_MISALIGNED_EMULATED);
> +	misaligned_emu_detected = (*mas_ptr == RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED);
>  	/*
>  	 * If unaligned_ctl is already set, this means that we detected that all
>  	 * CPUS uses emulated misaligned access at boot time. If that changed
> diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
> index a9a6bcb02acf..160628a2116d 100644
> --- a/arch/riscv/kernel/unaligned_access_speed.c
> +++ b/arch/riscv/kernel/unaligned_access_speed.c
> @@ -34,9 +34,9 @@ static int check_unaligned_access(void *param)
>  	struct page *page = param;
>  	void *dst;
>  	void *src;
> -	long speed = RISCV_HWPROBE_MISALIGNED_SLOW;
> +	long speed = RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW;
>  
> -	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_UNKNOWN)
> +	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN)
>  		return 0;
>  
>  	/* Make an unaligned destination buffer. */
> @@ -95,14 +95,14 @@ static int check_unaligned_access(void *param)
>  	}
>  
>  	if (word_cycles < byte_cycles)
> -		speed = RISCV_HWPROBE_MISALIGNED_FAST;
> +		speed = RISCV_HWPROBE_MISALIGNED_SCALAR_FAST;
>  
>  	ratio = div_u64((byte_cycles * 100), word_cycles);
>  	pr_info("cpu%d: Ratio of byte access time to unaligned word access is %d.%02d, unaligned accesses are %s\n",
>  		cpu,
>  		ratio / 100,
>  		ratio % 100,
> -		(speed == RISCV_HWPROBE_MISALIGNED_FAST) ? "fast" : "slow");
> +		(speed == RISCV_HWPROBE_MISALIGNED_SCALAR_FAST) ? "fast" : "slow");
>  
>  	per_cpu(misaligned_access_speed, cpu) = speed;
>  
> @@ -110,7 +110,7 @@ static int check_unaligned_access(void *param)
>  	 * Set the value of fast_misaligned_access of a CPU. These operations
>  	 * are atomic to avoid race conditions.
>  	 */
> -	if (speed == RISCV_HWPROBE_MISALIGNED_FAST)
> +	if (speed == RISCV_HWPROBE_MISALIGNED_SCALAR_FAST)
>  		cpumask_set_cpu(cpu, &fast_misaligned_access);
>  	else
>  		cpumask_clear_cpu(cpu, &fast_misaligned_access);
> @@ -188,7 +188,7 @@ static int riscv_online_cpu(unsigned int cpu)
>  	static struct page *buf;
>  
>  	/* We are already set since the last check */
> -	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_UNKNOWN)
> +	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN)
>  		goto exit;
>  
>  	buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
> -- 
> 2.34.1
> 
