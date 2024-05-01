Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F8DDDC3
	for <linux-doc@vger.kernel.org>; Wed,  1 May 2024 16:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714581971; cv=none; b=hvC2ffBnnMaq2w4u+nEtyNQhtpkgShl4MGSs66mErpaML/gGiQwn7T5b5+96BTYjmSll5Ie8yYCONdUA43tQV+oBRTzGxPHD8AYy19gtRYlTHc65jjiTK/ob9up9qsatEbDIV//PSgbM2geUI+Yfj07miP7RdtDM18/XLhCaTM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714581971; c=relaxed/simple;
	bh=krDJy1o6nlqSmGBvYIH6mBjLgfXcSgWyqs7rmpIkNjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SifsWeRTN+0u5c0xRKt6R9jINSNd1DojY+oflFLmlpF/xjlIJ9MBW91AfiIXLDu9KhXQMe8AeDa0xJFIiu3m5ZHYxvTrzhrJy4/kE2ZMGEoxglv5PWObNerhQGs9lTLwN0Lwou2AzwcuyymwGO3cqvH9Ytwk2niLD7xXiYpaW0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=eoop2eVD; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="eoop2eVD"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5dcc4076c13so745984a12.0
        for <linux-doc@vger.kernel.org>; Wed, 01 May 2024 09:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714581970; x=1715186770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HNAlEVQt8bQKb4hVjkj/tzVzfjylPjyKPm1CNtyCLJI=;
        b=eoop2eVDk48ExcE0bVPSW1rCgmLVpjyQVEDmghnYayVtrHC0td9Ii5c04MmvmqsiwL
         G2rN8mR0x2PXM4TCpWU5JLRYDBeTX+bn+hlrNKoPt4SaBmNc/IbAmm+qAZT8Ch7cQPc2
         b0sWDkV7pq5C3YNK0WXJi1BXdR/CvVsjGbGcnUr3g+xUeb+ZX1q27f4us1sDAnqGe3LK
         l72eIyJZYL0x/SY7JkFL98OZSgFWoX5i3SyvfDefSeiTw4N/DnYmhOuuKcfrtxs462Z0
         ol7SwrA6uViYVzANofHxCgMWTOkzHtz9rSGCDG7vx/6KSHL1VbWmqZC9wCkOaC7DD119
         BAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714581970; x=1715186770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNAlEVQt8bQKb4hVjkj/tzVzfjylPjyKPm1CNtyCLJI=;
        b=LNu6B8BgzmQSB6LP1acrLpKLyEFvPpVto4w8UbHxtiIVnEKCSkTScXkg2G3TYugcws
         Wuhtpvbb2zOfW3lDREmSMGzzCXowk93cTygcyE4VFextqTrRhNcbaVcYHPg2t6Hd+IGY
         Ju1Q4T0hvWg+Z01BI3RCmdhQ5yU0rzvjUpSMwot4/w3dhL9kHGMfWYKLnfREEfGaZsDe
         NvVN0fSzt4QZ+NwwJgpe2BTd5KKXFlvtsv6wJFMmgWpZ1TcHVnVJoktrvqTtysgqFSXK
         qK5fHPKcZdwjbXrgBw1n9vUmtWmTmJYlG9WIxsOejyZ2K1qEl9Te9xlRKavR/lGbNevL
         drBA==
X-Forwarded-Encrypted: i=1; AJvYcCUWBaJieQRoqKobZZdeRdg9hl4d7cXWNwxw4bjk67luPgIjugjLjTi3QPnbu3uY5ql5KnUoeksUKxcEwhSzu4MJUsb6oxyAOyUs
X-Gm-Message-State: AOJu0YwlwEYn/6CuRsyZ3zegjIrvtIzPyTqal2Sk085lqgaxGti4Sv+l
	KueMm4DdLRvmKXN2/nycT4s1lKIPre126AuflPB0LOl2ATFqT25KfIRd2GEy+DM=
X-Google-Smtp-Source: AGHT+IH65t3T7Cre6ETXiixVNrR9oMbdBgpbTRkUxmtEpcotJ4qRMx/UYqqnRRVgQ7nCUV3kiM8/gw==
X-Received: by 2002:a17:90a:c78f:b0:2a5:3f30:f5f6 with SMTP id gn15-20020a17090ac78f00b002a53f30f5f6mr274501pjb.20.1714581969579;
        Wed, 01 May 2024 09:46:09 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:1dcc:e03e:dc61:895d])
        by smtp.gmail.com with ESMTPSA id g2-20020a170902934200b001e25da6f2f2sm24328716plp.68.2024.05.01.09.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 09:46:08 -0700 (PDT)
Date: Wed, 1 May 2024 09:46:04 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 03/16] riscv: vector: Use vlenb from DT
Message-ID: <ZjJxzKUHkrVUv9zm@ghost>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-3-b692f3c516ec@rivosinc.com>
 <20240501-showroom-rephrase-66c0929011b3@spud>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501-showroom-rephrase-66c0929011b3@spud>

On Wed, May 01, 2024 at 11:31:45AM +0100, Conor Dooley wrote:
> On Fri, Apr 26, 2024 at 02:29:17PM -0700, Charlie Jenkins wrote:
> > If vlenb is provided in the device tree, prefer that over reading the
> > vlenb csr.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/cpufeature.h |  2 ++
> >  arch/riscv/kernel/cpufeature.c      | 43 +++++++++++++++++++++++++++++++++++++
> >  arch/riscv/kernel/vector.c          | 12 ++++++++++-
> >  3 files changed, 56 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> > index 347805446151..0c4f08577015 100644
> > --- a/arch/riscv/include/asm/cpufeature.h
> > +++ b/arch/riscv/include/asm/cpufeature.h
> > @@ -31,6 +31,8 @@ DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
> >  /* Per-cpu ISA extensions. */
> >  extern struct riscv_isainfo hart_isa[NR_CPUS];
> >  
> > +extern u32 riscv_vlenb_of;
> > +
> >  void riscv_user_isa_enable(void);
> >  
> >  #if defined(CONFIG_RISCV_MISALIGNED)
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 3ed2359eae35..8158f34c3e36 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -35,6 +35,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
> >  /* Per-cpu ISA extensions. */
> >  struct riscv_isainfo hart_isa[NR_CPUS];
> >  
> > +u32 riscv_vlenb_of;
> > +
> >  /**
> >   * riscv_isa_extension_base() - Get base extension word
> >   *
> > @@ -648,6 +650,42 @@ static int __init riscv_isa_fallback_setup(char *__unused)
> >  early_param("riscv_isa_fallback", riscv_isa_fallback_setup);
> >  #endif
> >  
> > +static int riscv_homogeneous_vlenb(void)
> 
> Without a verb, this function name is rather odd.
> 

Maybe has_riscv_homogeneous_vlenb() is better.

> > +{
> > +	int cpu;
> > +	u32 prev_vlenb = 0;
> > +	u32 vlenb;
> > +
> > +	for_each_possible_cpu(cpu) {
> > +		struct device_node *cpu_node;
> > +
> > +		cpu_node = of_cpu_device_node_get(cpu);
> > +		if (!cpu_node) {
> > +			pr_warn("Unable to find cpu node\n");
> > +			continue;
> 
> Hmm, if we fail to find the cpu node, then shouldn't we be returning an
> error?

Yes, I will change that.

> 
> > +		}
> > +
> > +		if (of_property_read_u32(cpu_node, "riscv,vlenb", &vlenb)) {
> > +			of_node_put(cpu_node);
> > +
> > +			if (prev_vlenb)
> > +				return -1;
> 
> Can you return an errno here and below please?
> 

Sounds good.

> > +			continue;
> > +		}
> > +
> > +		if (prev_vlenb && vlenb != prev_vlenb) {
> > +			of_node_put(cpu_node);
> > +			return -1;
> > +		}
> > +
> > +		prev_vlenb = vlenb;
> > +		of_node_put(cpu_node);
> > +	}
> > +
> > +	riscv_vlenb_of = vlenb;
> > +	return 0;
> > +}
> > +
> >  void __init riscv_fill_hwcap(void)
> >  {
> >  	char print_str[NUM_ALPHA_EXTS + 1];
> > @@ -671,6 +709,11 @@ void __init riscv_fill_hwcap(void)
> >  			pr_info("Falling back to deprecated \"riscv,isa\"\n");
> >  			riscv_fill_hwcap_from_isa_string(isa2hwcap);
> >  		}
> > +
> > +		if (riscv_homogeneous_vlenb() < 0) {
> > +			pr_warn("RISCV_ISA_V only supports one vlenb on SMP systems. Please ensure that the riscv,vlenb devicetree property is the same across all CPUs. Either all CPUs must have the riscv,vlenb property, or none. If no CPUs in the devicetree use riscv,vlenb then vlenb will be probed from the vlenb CSR. Disabling vector.\n");
> 
> Oh dear, that's a bit unwieldy... I think you could get away with a far
> more basic message - and you should be able to break this over lines,
> adjacent string literals should get concatenated.
> I'd probably say something like "unsupported heterogeneous vlen detected,
> vector extension disabled", however we should actually check that the
> vector extension has been detected on all CPUs and that kernel support
> for vector is enabled before emitting a warning for this.

Haha yeah I wanted to provide as much information as possible, but I
will shorten it.

I can add an if-statement to only run this code if check if V is
contained in elf_hwcap.

- Charlie

> 
> Cheers,
> Conor.
> 
> > +			elf_hwcap &= ~COMPAT_HWCAP_ISA_V;
> > +		}
> >  	}
> >  
> >  	/*
> > diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> > index 6727d1d3b8f2..e04586cdb7f0 100644
> > --- a/arch/riscv/kernel/vector.c
> > +++ b/arch/riscv/kernel/vector.c
> > @@ -33,7 +33,17 @@ int riscv_v_setup_vsize(void)
> >  {
> >  	unsigned long this_vsize;
> >  
> > -	/* There are 32 vector registers with vlenb length. */
> > +	/*
> > +	 * There are 32 vector registers with vlenb length.
> > +	 *
> > +	 * If the riscv,vlenb property was provided by the firmware, use that
> > +	 * instead of probing the CSRs.
> > +	 */
> > +	if (riscv_vlenb_of) {
> > +		this_vsize = riscv_vlenb_of * 32;
> > +		return 0;
> > +	}
> > +
> >  	riscv_v_enable();
> >  	this_vsize = csr_read(CSR_VLENB) * 32;
> >  	riscv_v_disable();
> > 
> > -- 
> > 2.44.0
> > 


