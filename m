Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79036224AFB
	for <linux-doc@vger.kernel.org>; Thu, 29 May 2025 12:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748522591; cv=none; b=rCqp8EKnX4gL48HSL+PqKSM2PeeQWRI1oya1HCprD8Ke0qsVs7BeRZC2P0ro4CGSv6XqVwjiASlbLSKf9m19Nlc2junvUOj4226HJAXAWtmEujF/pzGxsdKvJuktGDTYRWn7chR7TT57XAVYFL3MPwIWuOTyYiQHjOPPOJtGX1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748522591; c=relaxed/simple;
	bh=V+k0YYVajMtJvjJHVuTTJYUaZiiFudh9Jn7Ksm1pgoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=slUg5a4quTwE8UEHHqI+hGGHgUydGRgTnE564VxwHMcP55MlcTfLvGg+k6xFJHswyQ+mzy1PYuh4iDES7D7AiFWZWaGYzAOoFegkZ7hIkB2361k94rfAKqVbLP8bDerUIsJsquDvIqrj2ulnk+f70o86LfDfs8Pw7SfscKUN2Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=kP6lhdRG; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="kP6lhdRG"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4dc0f164fso821709f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 29 May 2025 05:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748522587; x=1749127387; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mJYtTflbkn898/BLxpK7QKxJtXnTWVg7vYFavAXp8EE=;
        b=kP6lhdRGJGkdXgQzXxmy1ksFt5oU4/5W/LyM1p1LngNC0bZNtI6jROQSrP3jnzjdZl
         Ltb4flIV+bPyYT4hvSKuuYQlJUy/DM0Md4TFDwk5L4NjClsQ6l1qDNUWDWe6lzTsdZpy
         mn0Cfy3cb2NHpD8nn3RLAVLf2l92ajODi23NtUwlVuAWCE7jCSTGZYiACsJNke7l2UWp
         4e0h7xJXJEiEXIHo+Z2yKwQ1Ufmx6b2msJXicZ7ZMiSntjaJe/6qHwg6rbVnwXHWaSEF
         0lnFZdOJW5YBrDMEzPzs0jl7pIvSOiRNqxJgrnS7oCDjqER8i4o/K99GZAGiTaSc48U6
         1YAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748522587; x=1749127387;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJYtTflbkn898/BLxpK7QKxJtXnTWVg7vYFavAXp8EE=;
        b=ajKhj/0RcJr1Eq45koVR0LhLQFRyMMd1oyqwFG91MZ763I9DWsrGBpD7o2/9Xqstk3
         nmp8PGMxLL2JsuOkBz8JTDd2CU+MYDYxfpissMT/s6cBux87ofzVmB1e+sWtbx9ck3nK
         T3sUOayvmFdGbEPcKYpsSqdh5amECwYaoLHs9pWtLA5p9yHzA6rxiNZkL+ihaTrcgNlc
         kd7nBkfqzHGhpxydoyYN/+WAJIUdGj0sl3OHwOk+X5E50rrSfKESq+rIHrXgGRNTzmtY
         DFS/GibwdIKzGqaTJCk+G9FshZrJLFTPKPdruCc9JTAhWrxl8bRhgn+/shcnmOgF2+xV
         aCog==
X-Forwarded-Encrypted: i=1; AJvYcCUq/x/gZESHBmf+iHNp5oW/PEZ1G/Hd2hlNbp5hEWqcxG01Re5Uap6u8QSp1dxjJGuRA3xUMgYIUtw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM5PUq2mQyvIyOL4D0UBd4vwhLMbogpqegBAGE6e0ryl3j4PDl
	QgTd5dTe+jPeEhbMhWwD4Ffztjw/KL+n9s2osxHUu19YdiEnuyeb8IedHxXhJHQ2DNE=
X-Gm-Gg: ASbGncv3JUa4WvgGWLpVbmqmfJxCipw1JzIC4IQq1i0EBjTzV9JEVQHqfCozezuys+Q
	03/AahkqohZb6C9bapCyC/23eQoebKYHLjxpuHD7sOTlTrYYjHWF3W1Cjv8+48/AecssWbRonHu
	MWmfoDB5I8HOVoZzkAJ9dQxlbAXyLCqoj5+YQ4qUvspwfZF/k430gFFkMFvL+6wQ8W9mRpq0kvU
	q6bX4bKSHUvOtGvv850UanEoGQoYcxpR7PKlOMnRYhsKAIcBW2MXOtAzaNNT4iTAciX55i+7NoG
	IIAaMF9Usyq93m7pi/JxtkFfM6D0IDJyFeG6sss=
X-Google-Smtp-Source: AGHT+IH1qVc7QxmWdlIwYswNWc2JM2wrCY/fhXTQ9RO7aSAjTmjiWe3//9USHzfv3DqUERGinpMtXg==
X-Received: by 2002:a05:6000:26c8:b0:3a4:ef70:e0e1 with SMTP id ffacd0b85a97d-3a4ef70e20dmr1890290f8f.55.1748522586703;
        Thu, 29 May 2025 05:43:06 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::ce80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe7415asm1948902f8f.57.2025.05.29.05.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:43:06 -0700 (PDT)
Date: Thu, 29 May 2025 14:43:05 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Deepak Gupta <debug@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v8 08/14] riscv: misaligned: declare
 misaligned_access_speed under CONFIG_RISCV_MISALIGNED
Message-ID: <20250529-84d9bececfab561dfc68b723@orel>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-9-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523101932.1594077-9-cleger@rivosinc.com>

On Fri, May 23, 2025 at 12:19:25PM +0200, Clément Léger wrote:
> While misaligned_access_speed was defined in a file compile with
> CONFIG_RISCV_MISALIGNED, its definition was under
> CONFIG_RISCV_SCALAR_MISALIGNED. This resulted in compilation problems
> when using it in a file compiled with CONFIG_RISCV_MISALIGNED.
> 
> Move the declaration under CONFIG_RISCV_MISALIGNED so that it can be
> used unconditionnally when compiled with that config and remove the check
> for that variable in traps_misaligned.c.
> 
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/cpufeature.h  | 5 ++++-
>  arch/riscv/kernel/traps_misaligned.c | 2 --
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index dbe5970d4fe6..2bfa4ef383ed 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -72,7 +72,6 @@ int cpu_online_unaligned_access_init(unsigned int cpu);
>  #if defined(CONFIG_RISCV_SCALAR_MISALIGNED)
>  void unaligned_emulation_finish(void);
>  bool unaligned_ctl_available(void);
> -DECLARE_PER_CPU(long, misaligned_access_speed);
>  #else
>  static inline bool unaligned_ctl_available(void)
>  {
> @@ -80,6 +79,10 @@ static inline bool unaligned_ctl_available(void)
>  }
>  #endif
>  
> +#if defined(CONFIG_RISCV_MISALIGNED)
> +DECLARE_PER_CPU(long, misaligned_access_speed);
> +#endif
> +
>  bool __init check_vector_unaligned_access_emulated_all_cpus(void);
>  #if defined(CONFIG_RISCV_VECTOR_MISALIGNED)
>  void check_vector_unaligned_access_emulated(struct work_struct *work __always_unused);
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index 34b4a4e9dfca..f1b2af515592 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -369,9 +369,7 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
>  
>  	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
>  
> -#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
>  	*this_cpu_ptr(&misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED;
> -#endif
>  
>  	if (!unaligned_enabled)
>  		return -1;
> -- 
> 2.49.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
