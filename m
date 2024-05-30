Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159C61DA53
	for <linux-doc@vger.kernel.org>; Thu, 30 May 2024 14:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717079863; cv=none; b=pK0Of2Zl69bOHH6aGdxU7Qg/ovnGLFjP/WMZfW22sEpw07lt1jvUGmqO1fzIgWabf5n43W8MFjSA7R1a//FaLw/BzugYG0raCtONv1mKispgigLxOsPMn1ISKYx9h2tBQaVBTOghc8STXPNiLR8/ilyA23s+NuWaiUVl3um540c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717079863; c=relaxed/simple;
	bh=U3LbKVgqL/u1hQeuo5yC32Kn/VinvVfWfYKY8hhTfFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OVMZaHgVO8RXAMKdxr4W/DMqaYhhyMfGhVjL2uj1Z/bx6PiH8nx6hRviR20dUXI1tUqFqbFENtfoQ3pgHvfN6nFKeDpH6+sMoaPKqfBQQ24FeJUuDJtpEnOw6dWD/1tzP95tWgOJ28W+R65hnY/kOlcByBvXYrNLyFzd8DDz9mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=XNpmgt/O; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="XNpmgt/O"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f48bd643a0so7085305ad.3
        for <linux-doc@vger.kernel.org>; Thu, 30 May 2024 07:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717079860; x=1717684660; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dr7MGcIZCht+4Sl3Mt64k5vSbdLUfxkiP98jMWV/Dt8=;
        b=XNpmgt/OCJUPuhZl+INdzQay53hz0AM0dPZfBA7y6E0fMenHxBAnyL63Q+sO5YHZ0c
         N13gj8ia4eCgTy42l1C/c0/qJnzE/p2bZ+PktrFA5bmpTmKG4pris905n5c/cvx1T5Qq
         aDZbrBT9r5d6/r4yWEO0rAgmlwMXFXrjFEuQD1/sQiu2pROLCVrDPGraSJTdnWuNAM/M
         jC1UJJZfLLLmRj1f2Y3cCdRrkVpM9Mu3VlrvGyuBWIFhDeYI80Dhgtg/NcpnrrOGzYlH
         fwkwj+DeS/UQ6q/NA6+pa7NIzjRGOdXxhbHUh2C645X+cozIdbI6QgL6lrIbVzKRWsHq
         1Fig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717079860; x=1717684660;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dr7MGcIZCht+4Sl3Mt64k5vSbdLUfxkiP98jMWV/Dt8=;
        b=OSCFOFVK/E24YIThNmwmJxeJj2vR2bjGEheoQ17ssPFCOYXhu1ECEzyNf6GYQT+bzr
         c8MKmmJCrpBwIpT1VA2Nc+xBOubBoidUAp9jzsMNboeMXr/KJtY2GhfM50w8fHMxxtyQ
         yHfsC3lB6JyudLHPh/sUUa56fOFjfO4V4USpOHi15VeEwIjYVxbb3tp+vrrjjG071d/J
         yrc8mnxd+gvLJLqqqPSDlR0zXiP3xeRBgQGl6lr3qSIqs535/F4eLsdkWyvecQQBRpHS
         NmAyjZq4QdXywIsQxi/Ys3B0hEf87HUG+hvyd7psRegS74mxCiV3SdgdKTc5OxegmktD
         1gWg==
X-Forwarded-Encrypted: i=1; AJvYcCX0JQgI98ao9ZXSQ3vwJJAfgv8fcRpSe6XsJ3wui4sKx9k6kUGzaeWgMSErmiaj+wZcbeG/VqPeqNiNBcIUfUYlGIxr1SZdR7aJ
X-Gm-Message-State: AOJu0YwHXhhb7QkpAjG0LlcSnKTXYjYZlk82x92up4tEl20kPFeEA0Wr
	XTPsTFqZOg4NBR1CumD2m6As42SMniydz56TLegPhoOAzFkDaxZ4nhQr11dc6To=
X-Google-Smtp-Source: AGHT+IG+P79rec/1kndzK6QyUvlapORFmbEhzvdcFqf7CsaBcI6jLUT7w4JzgE6GE/lZheH1bs1ucw==
X-Received: by 2002:a17:903:2307:b0:1f4:98f4:4763 with SMTP id d9443c01a7336-1f619932a97mr28337145ad.53.1717079860232;
        Thu, 30 May 2024 07:37:40 -0700 (PDT)
Received: from ghost (mobile-166-137-160-039.mycingular.net. [166.137.160.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f466d30277sm103103765ad.63.2024.05.30.07.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 07:37:39 -0700 (PDT)
Date: Thu, 30 May 2024 07:37:35 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>, Shuah Khan <shuah@kernel.org>,
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 02/16] riscv: add ISA extension parsing for Zimop
Message-ID: <ZliPL4yXBAir5pr2@ghost>
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-3-cleger@rivosinc.com>
 <ZlenZ+NvXxOxvqEO@ghost>
 <ZleqVUhDW+xgiTwu@ghost>
 <4d23f17e-cc1e-45e3-9ca2-a884baacf207@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d23f17e-cc1e-45e3-9ca2-a884baacf207@rivosinc.com>

On Thu, May 30, 2024 at 10:12:39AM +0200, Clément Léger wrote:
> 
> 
> On 30/05/2024 00:21, Charlie Jenkins wrote:
> > On Wed, May 29, 2024 at 03:08:39PM -0700, Charlie Jenkins wrote:
> >> On Fri, May 17, 2024 at 04:52:42PM +0200, Clément Léger wrote:
> >>> Add parsing for Zimop ISA extension which was ratified in commit
> >>> 58220614a5f of the riscv-isa-manual.
> >>>
> >>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> >>> ---
> >>>  arch/riscv/include/asm/hwcap.h | 1 +
> >>>  arch/riscv/kernel/cpufeature.c | 1 +
> >>>  2 files changed, 2 insertions(+)
> >>>
> >>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> >>> index 1f2d2599c655..b1896dade74c 100644
> >>> --- a/arch/riscv/include/asm/hwcap.h
> >>> +++ b/arch/riscv/include/asm/hwcap.h
> >>> @@ -80,6 +80,7 @@
> >>>  #define RISCV_ISA_EXT_ZFA		71
> >>>  #define RISCV_ISA_EXT_ZTSO		72
> >>>  #define RISCV_ISA_EXT_ZACAS		73
> >>> +#define RISCV_ISA_EXT_ZIMOP		74
> >>
> >> Since my changes for removing xandespmu haven't landed here yet I think
> >> you should keep RISCV_ISA_EXT_XANDESPMU in the diff here and make
> >> RISCV_ISA_EXT_ZIMOP have a key of 75. Palmer can probably resolve the
> >> conflicting keys when these two series are merged.
> >>
> >> - Charlie
> > 
> > I missed that other patches in this series were based off my
> > xtheadvector changes. It's not in the cover letter that there is a
> > dependency though. What do you need from that series for this series to
> > work?
> 
> Hey Charlie, I'm not based directly on any of your series, but on
> riscv/for-next which probably already contains your patches.
> 
> Clément

There was some churn here so I didn't expect those to be merged, it
looks like a subset of the patches were added to riscv/for-next, sorry
for the confusion!

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> 
> > 
> > - Charlie
> > 
> >>
> >>>  
> >>>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> >>>  
> >>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> >>> index 2993318b8ea2..41f8ae22e7a0 100644
> >>> --- a/arch/riscv/kernel/cpufeature.c
> >>> +++ b/arch/riscv/kernel/cpufeature.c
> >>> @@ -241,6 +241,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> >>>  	__RISCV_ISA_EXT_DATA(zihintntl, RISCV_ISA_EXT_ZIHINTNTL),
> >>>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> >>>  	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
> >>> +	__RISCV_ISA_EXT_DATA(zimop, RISCV_ISA_EXT_ZIMOP),
> >>>  	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
> >>>  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
> >>>  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
> >>> -- 
> >>> 2.43.0
> >>>
> >>>
> >>> _______________________________________________
> >>> linux-riscv mailing list
> >>> linux-riscv@lists.infradead.org
> >>> http://lists.infradead.org/mailman/listinfo/linux-riscv
> >>
