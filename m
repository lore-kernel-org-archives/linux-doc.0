Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD3D1B373C
	for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 14:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722435014; cv=none; b=fIHJ2LZuSec8kJ+7MNC43bhQGcEL5Kl4zAjVJIuOYfVdQZj90tF2ugoIoknUD1AfbEJqPkr3ufKiScatAWQVOFXrr6QZVpCqwSS119dqh/2WN/5GAnlZOIRaUH/GLnvhCjpjeM6x9hJvj875Qho+Czdd5xEhOwcQSXxXdVw9Hfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722435014; c=relaxed/simple;
	bh=dmVOCIu8kbYlKl/Cr9b5rGbdHU19hBCDOxflVjQyj+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CMFTY4gaf/ycroStoTaIeuYubLW9C4EfUmI6Rt8VB9ylydlFX871veF4acJQ0iWWMLcAgYzOpowfUO+ZXpgUi520BQRoiHn79NrO0+WLEwLSLvwTaTvxlBpxdT6w/RKGM42NQXHkmL4d9Puoy3YKlwPAmrV7GFLl/3TK46Pikxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=elfMgnTT; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="elfMgnTT"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7ab76558a9so177681066b.1
        for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 07:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722435010; x=1723039810; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gqyqw/nHSlejBJnG1P+gVR7MBqt6hfQ4M9UtXPV7Jj8=;
        b=elfMgnTTjCM3UmWuyHhfZduzBYb7necRHX8q8rotq4qZO09Q/crQGEbfimYIdPi5VE
         Xul8wBlWaOEj6sFDP+OzNGu0+61bI38lGQzhub8drJMJw1474Hwx9WlEcaDFtKYwdJ+u
         mPgoizyjvEfyNQLMLaG+5nsrSp5j2qmpV4evpmt+AJ1VRtuDQ1+5urj6eyhqisHWOb/9
         X954oagG0F8vyrx4ff6BecFsllcL5c4fwt+P6V7A6vUSFHWqhC2b45V7GYYrvZYVwRWN
         cysllFHa2xVeCHPp1nb3bnQPk7yYxtUDHYG1JZPXd/zrza1jI8q3kj1NFn52K7d3gCXW
         bUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722435010; x=1723039810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqyqw/nHSlejBJnG1P+gVR7MBqt6hfQ4M9UtXPV7Jj8=;
        b=svp3uXZxWQ9l0BiAGZ+pHyjCRqnPEIgWz/5BrDx9JkVTpPF2ri8TNzEyluU47DsfCM
         z3uYhPDltRYAvai0A4uuFG99eMmTPYsJjOKkv/mhJ7TG2Vub7Kd3sdKvjkQRI9okUg2E
         y7MfoYSEucd+RqxE5mhSBhEq73xuPacUBHCFtGyC2ZRFR+dJReaP/f62ORdTXqooOYto
         8/PSeDYsPGQfPquaxUmv9veao7y7++2wN39Petpm6UPcan7JEebBHBqr3XIaNz9c72J8
         9vs75LlXICFpU0boCui0oRupc9zXFNLAKYtIjJzpKPyGSn7tIpVYGuFdhsgXk6c1RPo1
         yNqw==
X-Forwarded-Encrypted: i=1; AJvYcCVDUEfvpqJHTpCM/bFxrr6sOLUkpey/U1TUX4AWds+Luw0i+Jdj8fk9hsGfXebSJYknzZaiP0/jQyxAYS6UxjgJNVLQ9FLyZDSJ
X-Gm-Message-State: AOJu0YyWNqHMHaoH6XYDgHKPZwXsVoqmBVfN7o/5Q1+RwPFcya1dzMUP
	yftYJleTI/xy9CIVA3bLmA+YXhOlDkCm1wxr8ZmB4vxk/IhUcxqjS1J0Mo+hVRw=
X-Google-Smtp-Source: AGHT+IF2QCYCUqjPekfpSqYJ4AImkm365cVwJfODis1nmhKBhNr8Twq9mBAr+HyjSZ/Z5pxT2z9Qdg==
X-Received: by 2002:a17:907:60cb:b0:a7d:88c4:2897 with SMTP id a640c23a62f3a-a7d88c437b8mr345160666b.2.1722435009133;
        Wed, 31 Jul 2024 07:10:09 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad416basm772297966b.104.2024.07.31.07.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 07:10:08 -0700 (PDT)
Date: Wed, 31 Jul 2024 16:10:07 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v4 02/13] riscv: Do not fail to build on byte/halfword
 operations with Zawrs
Message-ID: <20240731-56ba72420d7f745dacb66fd8@orel>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-3-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731072405.197046-3-alexghiti@rivosinc.com>

On Wed, Jul 31, 2024 at 09:23:54AM GMT, Alexandre Ghiti wrote:
> riscv does not have lr instructions on byte and halfword but the
> qspinlock implementation actually uses such atomics provided by the
> Zabha extension, so those sizes are legitimate.

We currently always come to __cmpwait() through smp_cond_load_relaxed()
and queued_spin_lock_slowpath() adds another invocation. However, isn't
the reason we're hitting the BUILD_BUG() because the switch fails to find
a case for 16, not because it fails to find cases for 1 or 2? The new
invocation passes a pointer to a struct mcs_spinlock, which looks like
it has size 16. We need to ensure that when ptr points to a pointer that
we pass the size of uintptr_t.

> 
> Then instead of failing to build, just fallback to the !Zawrs path.

No matter what sizes we're failing on, if we do this then
queued_spin_lock_slowpath() won't be able to take advantage of Zawrs.

Thanks,
drew

> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/cmpxchg.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index ebbce134917c..9ba497ea18a5 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -268,7 +268,8 @@ static __always_inline void __cmpwait(volatile void *ptr,
>  		break;
>  #endif
>  	default:
> -		BUILD_BUG();
> +		/* RISC-V doesn't have lr instructions on byte and half-word. */
> +		goto no_zawrs;
>  	}
>  
>  	return;
> -- 
> 2.39.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
