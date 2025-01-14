Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE60236A96
	for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 12:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736858576; cv=none; b=pABG17aK5uDFbJ1C/w68POZiG5YtI+qfZiSxn98J8mg6h99gkK+oz42V4abH5NGb25UQcMX25/dJwb6XlViKACo+C8uC5CW10yIeoCa1kzPFwL8ZzAKAObReGs0OVmR8IB99M5HxUrifVEd0CB5LhZou0HHbTvQOM5EgzeAe+gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736858576; c=relaxed/simple;
	bh=g6ds6X1npbWjUxsB+xGoK9OtDHG1EXdUEvY+n2sqM6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n810hHVXhcoX8qgmA3hjFh2uwaNnE2PXwFT15coXE5I339idj2SbP8DfgNdacycSU0t0f5vChOMo3+0BZFt9I8mQop6i5UXXUUQZHs7fNrqeo5ymaoTP6yANszgMzk7AC4Igh91Yv2AkEgbkeIvc2WjUa4T3Y0q2ofPwMgqbF2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=pX1Gf6ls; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="pX1Gf6ls"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so7285471a12.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 04:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736858573; x=1737463373; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rnsF0zy3GsMYA4HPmzwMOUoBG6xfZOolcTLSwhE6xZE=;
        b=pX1Gf6lsPuqjIlSgMLKLaYg3TL/ynvW00d36lEvS9CISu0A7kPbcZwxePuTGXQV1xu
         6N/DtgzclNpfVDEEfS9G7Sa4ylMBasKphQtx9KNFATY8qG/81iidUAY63zpQtDicJnZJ
         30n0b4G1yex4sEe8MWIIjhTZZJ6OX7op/483YyU6f9Aj++eS2YSR2R83UdCplGsLayRW
         DasRpKWjVQZSQpSlUjr7YRUoT2gy17LkRmkoUpiPGptULKVkduw08+EKR46XE/ACh/ox
         L7D4iUjT1HLhLe3r7RrDaW/rKjHcBIIzz9tD+EnckcuPCBTCeCmAcgvHiG/FIbI6MO52
         a+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736858573; x=1737463373;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rnsF0zy3GsMYA4HPmzwMOUoBG6xfZOolcTLSwhE6xZE=;
        b=P7ESB5Hc8WG7ZkN9NS+iZhURzq4HI35g36I0syolk/cUYL9UoZaX+n9SlsCSrQbhfJ
         2UH/Yn7J6feqAXjvGQkxhVqxOC4W/RlKyljBnqo7Zc7465VCSNtEeMMYoHUwfRGXglkN
         vzrZE8T7nKZLT95mcpFKEw6wKm2PKHIn+W2beHhAoWPuITnh9+EXn2Z1L8PzW9Y5/EmC
         fGaTFDl1x6v96TGQpB4XcTaW4aicNl4SglMlYHf/Ls6pfwrXrGE2I9k7+jO5qYZvUM5p
         2g6+YZDab2ta1JaG+9MqjQtcssi8sxP54+Kwy2p7Y+YrVfo/52ZeACWeKSq7uvY3+Wlo
         Kviw==
X-Forwarded-Encrypted: i=1; AJvYcCVPiqBvT3aK6+BuFYanTvLLJAv9hv/4notpyn40S9wapEvq4y9jwK8Xc+dcly6IGDzUJ8KkVUcFv4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVywnu6dk9ZCM2uSlUrIGUXvNAfEq3WA/HtUlPy8UZKMHSWg/J
	IFeinv4gfMyECWyPMbsAf3R+i5sgXy2BlBXkXpXyQYMZDszi0Zakh4kzercPoyo=
X-Gm-Gg: ASbGncspfP6F1WFe2iZgxd2fpI4T2CFAKYEAoNtcoWQQAsHgD1Bhjvym5HpP+q5yi0w
	mZj3Q9c2F69yMyDTjwjYxdLEfA/XNDJ+VvRIwoYbxhzqw7RrkSpWY3PaeIPwSxPSIDWyqYjyiLr
	enwnX6W75ScSN42I6mp8knoM47sTxRfWXFSm18jYU6cv3nJ1QYUhj+jrrqARgPGhl4o6gvYMNrJ
	amZq7ds/00sEC5ntJ+Vry1T5l0iQoBPNt5/HFmeOtFtp13BhbS4KNoG16He6gHwklenZ9/8+y4x
	QBIYSlJKRYGLMPLbT0pVgT7wBb5FhKh9l+JQEx606w==
X-Google-Smtp-Source: AGHT+IGa+w+7nxPE26Y4gseiHljadCRzoNaxIWh+TeYU2ACFrAbllLGBqDkEYDrnuQQTlrSybqPOXA==
X-Received: by 2002:a17:907:c588:b0:ab2:c208:732d with SMTP id a640c23a62f3a-ab2c2087cbbmr2016364966b.40.1736858572698;
        Tue, 14 Jan 2025 04:42:52 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c2d58sm6155924a12.39.2025.01.14.04.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 04:42:52 -0800 (PST)
Date: Tue, 14 Jan 2025 13:42:51 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, alexghiti@rivosinc.com, 
	andybnac@gmail.com, aou@eecs.berkeley.edu, charlie@rivosinc.com, cleger@rivosinc.com, 
	conor.dooley@microchip.com, conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, 
	jesse@rivosinc.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, shuah@kernel.org
Subject: Re: [External] Re: [PATCH v4 2/3] RISC-V: hwprobe: Expose Zicbom
 extension and its block size
Message-ID: <20250114-6f373c6dd685cf322c89e7d5@orel>
References: <20250114021936.17234-1-cuiyunhui@bytedance.com>
 <20250114021936.17234-3-cuiyunhui@bytedance.com>
 <7c181d03-b0d0-4b81-bbd0-06943a58a287@sifive.com>
 <CAEEQ3wm7-O5U3jjbQ1+XgVvk+G7csMPAxzGoV=K5WczCOsbQ5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEEQ3wm7-O5U3jjbQ1+XgVvk+G7csMPAxzGoV=K5WczCOsbQ5g@mail.gmail.com>

On Tue, Jan 14, 2025 at 08:17:02PM +0800, yunhui cui wrote:
> Hi Samuel，
> 
> On Tue, Jan 14, 2025 at 1:28 PM Samuel Holland
> <samuel.holland@sifive.com> wrote:
> >
> > Hi Yunhui,
> >
> > On 2025-01-13 8:19 PM, Yunhui Cui wrote:
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
> > > index 955fbcd19ce9..0ea7754b2049 100644
> > > --- a/Documentation/arch/riscv/hwprobe.rst
> > > +++ b/Documentation/arch/riscv/hwprobe.rst
> > > @@ -242,6 +242,9 @@ The following keys are defined:
> > >    * :c:macro:`RISCV_HWPROBE_EXT_SUPM`: The Supm extension is supported as
> > >         defined in version 1.0 of the RISC-V Pointer Masking extensions.
> > >
> > > +  * :c:macro:`RISCV_HWPROBE_EXT_ZICBOM`: The Zicbom extension is supported, as
> > > +       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
> > > +
> > >  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
> > >       :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
> > >       mistakenly classified as a bitmask rather than a value.
> > > @@ -281,6 +284,9 @@ The following keys are defined:
> > >  * :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF`: An enum value describing the
> > >       performance of misaligned vector accesses on the selected set of processors.
> > >
> > > +* :c:macro:`RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE`: An unsigned int which
> > > +  represents the size of the Zicbom block in bytes.
> > > +
> > >    * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN`: The performance of misaligned
> > >      vector accesses is unknown.
> >
> > The new key needs to go further down, below this list of possible values for the
> > previous key.
> I guess you mean to put it after
> RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED, right?

Yes, notice how all the RISCV_HWPROBE_MISALIGNED_VECTOR_* defines are
indented under RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF indicating
they're part of the RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF group.

Thanks,
drew

> 
> >
> > Regards,
> > Samuel
> >
> > >
> > > diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> > > index 1ce1df6d0ff3..89379f9a2e6e 100644
> > > --- a/arch/riscv/include/asm/hwprobe.h
> > > +++ b/arch/riscv/include/asm/hwprobe.h
> > > @@ -8,7 +8,7 @@
> > >
> > >  #include <uapi/asm/hwprobe.h>
> > >
> > > -#define RISCV_HWPROBE_MAX_KEY 10
> > > +#define RISCV_HWPROBE_MAX_KEY 11
> > >
> > >  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
> > >  {
> > > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> > > index 3af142b99f77..b15c0bd83ef2 100644
> > > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > > @@ -73,6 +73,7 @@ struct riscv_hwprobe {
> > >  #define              RISCV_HWPROBE_EXT_ZCMOP         (1ULL << 47)
> > >  #define              RISCV_HWPROBE_EXT_ZAWRS         (1ULL << 48)
> > >  #define              RISCV_HWPROBE_EXT_SUPM          (1ULL << 49)
> > > +#define              RISCV_HWPROBE_EXT_ZICBOM        (1ULL << 50)
> > >  #define RISCV_HWPROBE_KEY_CPUPERF_0  5
> > >  #define              RISCV_HWPROBE_MISALIGNED_UNKNOWN        (0 << 0)
> > >  #define              RISCV_HWPROBE_MISALIGNED_EMULATED       (1 << 0)
> > > @@ -94,6 +95,7 @@ struct riscv_hwprobe {
> > >  #define              RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW            2
> > >  #define              RISCV_HWPROBE_MISALIGNED_VECTOR_FAST            3
> > >  #define              RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED     4
> > > +#define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE  11
> > >  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
> > >
> > >  /* Flags */
> > > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> > > index cb93adfffc48..04150e62f998 100644
> > > --- a/arch/riscv/kernel/sys_hwprobe.c
> > > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > > @@ -106,6 +106,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
> > >               EXT_KEY(ZCA);
> > >               EXT_KEY(ZCB);
> > >               EXT_KEY(ZCMOP);
> > > +             EXT_KEY(ZICBOM);
> > >               EXT_KEY(ZICBOZ);
> > >               EXT_KEY(ZICOND);
> > >               EXT_KEY(ZIHINTNTL);
> > > @@ -278,6 +279,11 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
> > >               if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
> > >                       pair->value = riscv_cboz_block_size;
> > >               break;
> > > +     case RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE:
> > > +             pair->value = 0;
> > > +             if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOM))
> > > +                     pair->value = riscv_cbom_block_size;
> > > +             break;
> > >       case RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS:
> > >               pair->value = user_max_virt_addr();
> > >               break;
> >
> 
> Thanks,
> Yunhui
