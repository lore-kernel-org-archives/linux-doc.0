Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12CD22AE42
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736772086; cv=none; b=g60G6UcWQmtfVo5fK4WyqCfFK45/YwYfRMfV5vlJf9kiLDVM4+0p9sTMHqZFj6QcAE1oAfc4J1JHm7dFyYsEL1euNr4+y7n8MharHE3kLHpGAXTum4ip8V6ZCEnufn+AjildLHuNJZkCWLA22wpF6JkNy6EZ1j5xxFaVkeZ8QY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736772086; c=relaxed/simple;
	bh=1SmsyTH1IuVPTsBVIsHoHeNSWqXgZE34TiZDhielAWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZfNW2EdaTOMA9LNPLFbatzXNhUzKekgxBrlVMVyVLzKGErodUepO8WlzXLHtU59W/xAHWqbxZKo+Xj9OX9LDqglBJD6z172pNXxCjLyGPwzFk+lnZXSdVVolFp+otFeddgRjOnvgF2ovKnDcBTpR2lRNmb/hnelEjkm7gYsOaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=cww5AIgv; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="cww5AIgv"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa689a37dd4so804948066b.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 04:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736772081; x=1737376881; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=huUeYxgEHQ+QkCankWz8xkLpv2eADhRNrifi/EU0k50=;
        b=cww5AIgvCmFzD6r1coQ+CPGHu7YbdkwdpVFm8Wfyg+4ruKBviLXzOGMBPEDvXa8iXc
         8WAZitKg9jLB9l9iwRXu9onHZ/2BOXhCdHETxZZibcIjyvXkoQB8kK+ea9GlJYL1Gp5q
         NgWDM/NYGa8/+G4lwrNOA8/5S+a1AdQBwlfm3MyMNacIzjCpDD9zRwlGpW3m2jxIMvG7
         9l7niNG0p8zaW2RSnnWtWi3p+Dc09qPSYOKUeWcAdlhISliBdfI8aCBr4VHhzX7uGJST
         V+TjsoltJfWvV6ZZVObFBOCMDqgKAcKxO0iuzzj+AzCxq6Exhig4Ssw7iCkPIkW8o2GH
         yB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736772081; x=1737376881;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=huUeYxgEHQ+QkCankWz8xkLpv2eADhRNrifi/EU0k50=;
        b=t+edM/Qzu1QCjXwgz2CZtZ+LwvH/hWKwEnUezZTive6SflnA08Q676IrlDNjlRMHrL
         iqc6PXDhyXfBFnxm4MvgSIOmrKkiUtstobRDYC/LUWeTbiXvpwrQ66loxYKBY+AnP5KB
         NrvH9X8TLtwlbmDPyHQHDigv3Muj6wpIwx5v2v4YpbUZ3a9DOIh5KoviBJQiBk8hpBGk
         tH6j56RH4j6YTNuyXc6sIiOrr9EieLy7lym+0nH0d3lq0sTj2G3/dBxRiSdYaZbntL75
         0Qi4yNhsUNt5grSqT6ARiWAK9/ugVWnaaKqq0kraZp9mtLFWzBu6yTqrBte6yFTFT40m
         kC6w==
X-Forwarded-Encrypted: i=1; AJvYcCU7rh8ch0hpEtMepdWs0wLTCBMNrsRJ6YfMpPkwpVx1sv28uhOWhmQdfJfBW5XextSWkakNRhrwroA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkVuYZ6toJa2HMMmnWM4pQEQNnQ16ZZVSjYDp38QrnOLy7upe+
	8f6z8MjpfBqZVJVp/4YFU7RchePnRbBtdu+7JSUemVUitsWYBuwRJywQWNjbrMc=
X-Gm-Gg: ASbGnctgjx4jRxrN5DvFs/sc3NV2QuWC6OSTCZRuQjZYoymG4dqBgsLpJewMFU8e2iz
	uZulhTb8K28TW4g1DWaAR8fQu4mLjYPeQPCbwu/P7McsU3HR5hovT4Q4yyLNhEDQrqb1Nvf0orf
	29tLyMQ0Y8f3IyY+P4/XcYxvcK4luF2ZWXHDNX/L9kJIPR9mCw81YsEEt/FZ9DXlfceNHsduhCH
	3ZR5gO3Rb4UNz3/KWHJjsyUKaLF1zFWp1GME7q4IZl4a6Gm1f1l5YZPxQ2ecFQIP1DNHw4vo29B
	9AdTlktljV1hKVQNauW/NwsGBsPQcsIfjcvLp1IKeg==
X-Google-Smtp-Source: AGHT+IH/2QV8V4ediKclPA9gLPWZd3mIbosx/ICvvUfzixLKWMRsrnwfp0jkVU/aUAETM94untErKQ==
X-Received: by 2002:a17:907:3f92:b0:aac:439:10ce with SMTP id a640c23a62f3a-ab2ab73e812mr1850195066b.27.1736772080946;
        Mon, 13 Jan 2025 04:41:20 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9564848sm490993366b.125.2025.01.13.04.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:41:20 -0800 (PST)
Date: Mon, 13 Jan 2025 13:41:19 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: alexghiti@rivosinc.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	samuel.holland@sifive.com, shuah@kernel.org
Subject: Re: [External] Re: [PATCH v3 2/3] RISC-V: hwprobe: Expose Zicbom
 extension and its block size
Message-ID: <20250113-da3ae77c9eb1342ac19ec59c@orel>
References: <20250113083635.73826-1-cuiyunhui@bytedance.com>
 <20250113083635.73826-2-cuiyunhui@bytedance.com>
 <20250113-65f27ad723c0f6585f86ae7f@orel>
 <CAEEQ3w=fgb7Jxg6SP_hp0Z+T0Tfb-_Pa4-CzU8PpGUKA+dHxyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEEQ3w=fgb7Jxg6SP_hp0Z+T0Tfb-_Pa4-CzU8PpGUKA+dHxyA@mail.gmail.com>

On Mon, Jan 13, 2025 at 07:29:39PM +0800, yunhui cui wrote:
> Hi drew,
> 
> On Mon, Jan 13, 2025 at 5:07 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Mon, Jan 13, 2025 at 04:36:34PM +0800, Yunhui Cui wrote:
> > > Expose Zicbom through hwprobe and also provide a key to extract its
> > > respective block size.
> > >
> > > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > > ---
> > >  Documentation/arch/riscv/hwprobe.rst  | 6 ++++++
> > >  arch/riscv/include/asm/hwprobe.h      | 2 +-
> > >  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
> > >  arch/riscv/kernel/sys_hwprobe.c       | 6 ++++++
> > >  4 files changed, 15 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
> > > index 955fbcd19ce9..7a47cbdbcf8e 100644
> > > --- a/Documentation/arch/riscv/hwprobe.rst
> > > +++ b/Documentation/arch/riscv/hwprobe.rst
> > > @@ -94,6 +94,9 @@ The following keys are defined:
> > >    * :c:macro:`RISCV_HWPROBE_EXT_ZICBOZ`: The Zicboz extension is supported, as
> > >         ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
> > >
> > > +  * :c:macro:`RISCV_HWPROBE_EXT_ZICBOM`: The Zicbom extension is supported, as
> > > +       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
> > > +
> >
> > This should come after RISCV_HWPROBE_EXT_SUPM since this document has the
> > defines sorted in the order in which they are introduced (although I
> > personally wouldn't mind if we ordered them alphabetically instead)
> OK
> 
> >
> > >    * :c:macro:`RISCV_HWPROBE_EXT_ZBC` The Zbc extension is supported, as defined
> > >         in version 1.0 of the Bit-Manipulation ISA extensions.
> > >
> > > @@ -273,6 +276,9 @@ The following keys are defined:
> > >  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
> > >    represents the size of the Zicboz block in bytes.
> > >
> > > +* :c:macro:`RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE`: An unsigned int which
> > > +  represents the size of the Zicbom block in bytes.
> > > +
> >
> > Should be moved below RISCV_HWPROBE_KEY_TIME_CSR_FREQ
> 
> Why should it be moved below RISCV_HWPROBE_KEY_TIME_CSR_FREQ?

Oh, right. It should be below RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF for
the same reason as above (order of introduction).

Thanks,
drew
