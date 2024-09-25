Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A4017557
	for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 16:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727280941; cv=none; b=XNTGsgPo2Pumx7/ZCHoYWYqXuy0kSrI+GIdpXRnfGCiuRbG06G04utEsPFlpO+jPhI+b2sXaIQVp95zRoEWAXoa7FhRC+8QdnOymHLKdTkVI5aOzRPQpMskAiqlQUv6tREQUL12agsFdm9UMIetZpeQhXNpBYDAVWdyz7nKcbec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727280941; c=relaxed/simple;
	bh=pjLBfJBKL96/yiOGl85JwjkjXpyHdfdYInT9dzfmeW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXHNQEwkV88gG0uNX9F86LKPJP2qhIgub3iFBJfs3dTN98eMO+GSdE3TmCuJmL1VbrEvaQ+RtRUzpeUiKavZhpju/cTRmil10XRbTpDASIRmlb6B9fb3f1a+j9Q/uDKF57x54Uc31Weqce2JJKBR6s/6mi2PDIWiCmgCBCvPTrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=i6yjdY3B; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="i6yjdY3B"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5365d3f9d34so25473e87.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 09:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1727280938; x=1727885738; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R9DRuGCTDrBWGkWJB2Lhke3+USvYCcKh82GTpav4EGE=;
        b=i6yjdY3B8tboscmnZE9RakbUA+Y59n4CJ81oMUgLE+BVgnfmMTnueGEYS+BAqwfqvE
         7qYMTy2IJhw7cvQ1ycMT2ac6NmqSYCOGSbbJyJAS/8qsD7gWjI2ATaV75JGvQxHUHNgu
         tesVyRYjhOruESQZlyJnqfIZc6XHUfLWy530jh+P7z1+CvPTQaosq4HyVP4/nLHlQfH4
         ncPOVOTziSZAoJ6KTyV/hG3Do9MfQwlJpeFAhuY62OLmsH6VZEFyTfiLwoCF4f5B2Sig
         QcxHTgLf5MG762r3Oag21/sPh/cmsB1gN6eVCYKn7/34+vdVDNX3iZyEsDuWgIiyuiUp
         0u4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727280938; x=1727885738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9DRuGCTDrBWGkWJB2Lhke3+USvYCcKh82GTpav4EGE=;
        b=a3k69TqYyDswICE9ifybWBcgnkZh0w2aHO/K26uu5iCdk2B4np5f7ZP7+heAEOiWn0
         lQS9VHhoJ+pSQWmbzUYKJO9LPwFHFG0QReiVMgHyuPqT1MSLbDnX39cpjKyzvfp7V6kT
         bVQLoI2ibzvbk6YyZhZrDLHfLYp8x9IsSOasqYdKEueVOUyYg27M002SyFH7tUMgnzvI
         90uWDzfmnqZ9p+2i+wbV0+jcR2vv/+HHMlArcSSZitAENS8khi67zdXi1TqxN0xLcg0m
         W5z+xoirAjTyNBncoffmOZYhDJX+oEJzlFxkoPrFWuvN/WosH835MV57wHAJo93krpgV
         tvrg==
X-Forwarded-Encrypted: i=1; AJvYcCXdS0LF928zm9qNpfnbC5b5CMdHBg3653RgLlTp4tiG8rXCgMR9dyZ8pfYYJFOGJvKbyTsFi6uPwYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9/dtbySX2YutxQuTkxZ211j1hnojzA4J+NkcdgjItbi2jJqo3
	NoW3aV7KUYA8xmwg0OmInAFFOvz7ooXu7IA+HxABUi3SKg/riGC0SPNj7RDpnIA=
X-Google-Smtp-Source: AGHT+IEF6iymB9Yoj9BmfBJ/+k8HdemwHRlRBHcLH4/86ux07B6wbeg9QesHaVHeJbHxjH1GcyhYiw==
X-Received: by 2002:a05:6512:400c:b0:533:d3e:16fe with SMTP id 2adb3069b0e04-5387755cb91mr2304390e87.38.1727280937907;
        Wed, 25 Sep 2024 09:15:37 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9392f34790sm226910766b.31.2024.09.25.09.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 09:15:37 -0700 (PDT)
Date: Wed, 25 Sep 2024 18:15:36 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Evan Green <evan@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: riscv: Fix typo MIMPLID -> MIMPID
Message-ID: <20240925-d0f744b7c2959b9c3dd14b6b@orel>
References: <20240925142532.31808-1-namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925142532.31808-1-namcao@linutronix.de>

On Wed, Sep 25, 2024 at 04:25:32PM GMT, Nam Cao wrote:
> The macro that is really defined is RISCV_HWPROBE_KEY_MIMPID, not
> RISCV_HWPROBE_KEY_MIMPLID (difference is the 'L').
> 
> Also, the riscv privileged specification names the register "mimpid", not
> "mimplid".
> 
> Correct these typos.
> 
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> ask me how I found out..

Hopefully due to someone using the document as a reference when attempting
to use hwprobe.

> 
>  Documentation/arch/riscv/hwprobe.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> index 85b709257918..fb0affa61eb9 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -51,7 +51,7 @@ The following keys are defined:
>  * :c:macro:`RISCV_HWPROBE_KEY_MARCHID`: Contains the value of ``marchid``, as
>    defined by the RISC-V privileged architecture specification.
>  
> -* :c:macro:`RISCV_HWPROBE_KEY_MIMPLID`: Contains the value of ``mimplid``, as
> +* :c:macro:`RISCV_HWPROBE_KEY_MIMPID`: Contains the value of ``mimpid``, as
>    defined by the RISC-V privileged architecture specification.
>  
>  * :c:macro:`RISCV_HWPROBE_KEY_BASE_BEHAVIOR`: A bitmask containing the base
> -- 
> 2.39.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew
