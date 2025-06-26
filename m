Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C737226B2AA
	for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 10:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750934982; cv=none; b=g9i5PXcui0vNOrPQzb0N9LKPRN2ZSQGDUroQJpc+O7Qm6i3kUnjl+P+ohm0AQEH+ajlHiqBSFSjhyTLIUOe+iAmpd30a7H/H0IWLGa91BIszPeDhn/H+3V0nfrWexXsHjp03awh8z8cRO8KGZinonKeD0dWgHbxyhacSEactLhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750934982; c=relaxed/simple;
	bh=rBGBxF+i3sBjEDYBJzXyfsL97dNuu5H4YUuYuuclALQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rA+q9CVvjKO+/oHYczuj4bUgk70NsFZUoKPoQT6bESveNmHCYmKqXpim1W0rqW340Y3ht6lPW+VFj8nQQJ+cFh6QtUXYRDXWYMHzm64xfAdoSkC7AQJHcezC36tSW5+qkBXW7VtkE0O2eILPSt+NtR6qJ/L3D87Ao7SgSCt3WN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=g/qC2zeH; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="g/qC2zeH"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so489343f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 03:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750934979; x=1751539779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1a0bjQkrE0lXOwbpfOZiZMnL8XuL0L+bDp2YasyQuLw=;
        b=g/qC2zeH57dA3Ddn2gBt06KrRw5rhOs/KrOwGt5DINU95mZqhr06obNUacy9cV+p5A
         DkE92d60c4gDQGnhO+CGFGzW53ioXrpTr6HnuWHdi4UnDFQzAKvPk0RjSdQqw+aVgITa
         ZyT0LT1n1amgAVYFYuv0b5fl+3xIBz5Vqf91wD14ojgXD3qyOORIJWH90WtMnkvqjnfZ
         wc1p1Q/dh+qGKr3a+ESg5QBXmrD5IyQCqt3j3cRZVWEL90bZBuFvn0Nb2fxaHTsQKIH6
         NSmUD9PQEZEOzzzi3WV6KhXNQKKwUtt7V70JJilpBtA2xLL4p+iboVRooAhwo9nJZDoa
         LVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750934979; x=1751539779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1a0bjQkrE0lXOwbpfOZiZMnL8XuL0L+bDp2YasyQuLw=;
        b=DIs9Hx9XnQ6f03y/+OWZSC+Vik+Lp+Sv9xtMF3zbrAmxXJKkg+Y9cmbro/XVcjebJy
         RMJoNkZhu3a4n32qSbUImlfXNhm2piUN3SEZ26jP5ia8FYv+7a8/1nvEHb/ZvIpMvCT2
         qz2vkfwqtf21xrMH98TFrbMhAHUaPxNbX5yLuniB8OjWn+khvoCUrcQo0GSioGgrcovZ
         eY9dCXhE0y14GbbYm/H+kDDGoPGrt6dtPhrQwdtT8CCehObl3VZrzKz5G/bPuTEDgMU1
         8mcdA/l1mu+E+85H40PQK9lge4eUhk3woifQbbcoxSL3oNG4Zw680aFu+ajNiAj0asDa
         TB2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+M2QAnTfGEfFUgUKHWMluw74lT3c93Dj5myCfK1PQeuqj/RIursZgzZrHNtnCThvft+8KSuWY2jg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYoC107HIO2V3lkuMLBG9000GUWjWAiUsqxe0c2o+fEySZcqSw
	m9oJfMBAZCF3IVPhZXsR5DijgdGKRP1ttPOqP72kLWeZ5yGjVA3j0Q5S3LT7139LxIg=
X-Gm-Gg: ASbGncv/fpfdCSqwx3ECe0BG5x4efCRz9KunpFvz46R94VZv6ZdVj1tb4H0P8cO82x4
	gyRVq5Zr88fZQEf7Wc1H7Lfs9BdLMNJD9LLiLszKCq2mKk0EcwrmBZdf7cn4MTV4NaYkMyw85D3
	54t9b5eC0+vHz1J/frI7jRP8o65dFUzcxMOT1+Q9p9SUAWTQQDpPflMrz9kgpiSTj+fEkq8X+eG
	JN/ksQeQlXQo2NJcp1+LNXokQW+DeyiUsyrnY/Ds4NiArDr3UqsnishvaxoQu5h6H/12PaT8eVk
	5NAoYtsg3mv2vf4RD8JucTmEohfV1UA73ySS2+IUFnP3RfyEJMYW5h3/5BzT
X-Google-Smtp-Source: AGHT+IHq/vFRkJj/oJMZi+3J+q9S/bpmTny3iypeXTqCnR6Swc4ofLBoKTbFvUTAYU6DIEK0HRcCDQ==
X-Received: by 2002:a5d:64e1:0:b0:3a6:d92d:9f7c with SMTP id ffacd0b85a97d-3a6ed5e9c5bmr5333270f8f.9.1750934978974;
        Thu, 26 Jun 2025 03:49:38 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6f3a79377sm1808780f8f.20.2025.06.26.03.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 03:49:38 -0700 (PDT)
Date: Thu, 26 Jun 2025 12:49:37 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Jonathan Corbet <corbet@lwn.net>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Subject: Re: [PATCH v4 6/7] riscv: Add tools support for xmipsexectl
Message-ID: <20250626-af013235ad8d22421b2fe5b1@orel>
References: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
 <20250625-p8700-pause-v4-6-6c7dd7f85756@htecgroup.com>
 <20250626-a1aca9887bbf5410741e17c4@orel>
 <20250626-0186dfe9df28f9bb72a91426@orel>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-0186dfe9df28f9bb72a91426@orel>

On Thu, Jun 26, 2025 at 11:34:21AM +0200, Andrew Jones wrote:
> On Thu, Jun 26, 2025 at 11:21:10AM +0200, Andrew Jones wrote:
> > On Wed, Jun 25, 2025 at 04:21:01PM +0200, Aleksa Paunovic via B4 Relay wrote:
> > > From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> > > 
> > > Use the hwprobe syscall to decide which PAUSE instruction to execute in
> > > userspace code.
> > > 
> > > Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> > > ---
> > >  tools/arch/riscv/include/asm/vdso/processor.h | 27 +++++++++++++++++----------
> > >  1 file changed, 17 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/tools/arch/riscv/include/asm/vdso/processor.h b/tools/arch/riscv/include/asm/vdso/processor.h
> > > index 662aca03984817f9c69186658b19e9dad9e4771c..027219a486b7b93814888190f8224af29498707c 100644
> > > --- a/tools/arch/riscv/include/asm/vdso/processor.h
> > > +++ b/tools/arch/riscv/include/asm/vdso/processor.h
> > > @@ -4,26 +4,33 @@
> > >  
> > >  #ifndef __ASSEMBLY__
> > >  
> > > +#include <asm/hwprobe.h>
> > > +#include <sys/hwprobe.h>
> > > +#include <asm/vendor/mips.h>
> > >  #include <asm-generic/barrier.h>
> > >  
> > >  static inline void cpu_relax(void)
> > >  {
> > > +	struct riscv_hwprobe pair;
> > > +	bool has_mipspause;
> > >  #ifdef __riscv_muldiv
> > >  	int dummy;
> > >  	/* In lieu of a halt instruction, induce a long-latency stall. */
> > >  	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
> > >  #endif
> > >  
> > > -#ifdef CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE
> > > -	/*
> > > -	 * Reduce instruction retirement.
> > > -	 * This assumes the PC changes.
> > > -	 */
> > > -	__asm__ __volatile__ ("pause");
> > > -#else
> > > -	/* Encoding of the pause instruction */
> > > -	__asm__ __volatile__ (".4byte 0x100000F");
> > > -#endif
> > > +	pair.key = RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0;
> > > +	__riscv_hwprobe(&pair, 1, 0, NULL, 0);
> > > +	has_mipspause = pair.value & RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL;
> > > +
> > > +	if (has_mipspause) {
> > > +		/* Encoding of the mips pause instruction */
> > > +		__asm__ __volatile__(".4byte 0x00501013");
> > > +	} else {
> > > +		/* Encoding of the pause instruction */
> > > +		__asm__ __volatile__(".4byte 0x100000F");
> > > +	}
> > > +
> > 
> > cpu_relax() is used in places where we cannot afford the overhead nor call
> > arbitrary functions which may take locks, etc. We've even had trouble
> > using a static key here in the past since this is inlined and it bloated
> > the size too much. You'll need to use ALTERNATIVE().
> 
> Oh, I see now that the next patch is handling the kernel cpu_relax with
> ALTERNATIVE and this was just the tools cpu_relax. We don't want to make
> a syscall inside cpu_relax though either, since it gets called in loops.

(Another follow up to myself...)

I guess with the vdso cached result it should only be a handful of
instructions, but it still seems odd to embed a call in cpu_relax.

Thanks,
drew

> It'd be better to just call the standard pause (0x100000F) even if it
> does nothing. Or maybe there's some define that can be added/used to
> select the correct instruction?
> 
> Thanks,
> drew
