Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9C320E6EC
	for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 14:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742309845; cv=none; b=n9DMXOkFrbRroKUD+5dqqLNFW+Xtxkka/VDeW7Tl4x+uYVUP4N7m7uDkXgcODEF4PUwTIDhB2myZvAnefJqJv7d6zqBoYDXR2Z9ITbwMernezWf4vJ70xJRc8Zy26mhtZjqVrVD1dCIYMPbacn76uTILIFEccor6C5cSfVNmbAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742309845; c=relaxed/simple;
	bh=ZOrupfj3TMw6uOjftteDDGCFM/An/Fqa3zQeuxkmIrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PYxnL8dpB829NLQfjiebVNYuBGLakjekCROgVi38ARBQSoIo3JgSgdjP3P291vVoMZrHyq3OfHv1AN05w/bUntSs482qLJgcUBphCWDVd+uHmLXtZMrnAt4IU7M+Lw77SD1cESTja0+3GuCkXuMu8PSGHvMxLttiG3x9ctiD0JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=D/sBUmOd; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="D/sBUmOd"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso31920775e9.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 07:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742309838; x=1742914638; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8JrbbTTYqsx2At8tXwwXV3DCT75Flxu7MLSme9mxvoE=;
        b=D/sBUmOd5SacUD8wHJ/G8+J7sKtO5pmP4KB2xJ6fFdjOC/2skknMV1343QZsBllnYP
         XcRFVHpwUR7Zf/DfCSorL25+2Z56aPgW05NQ33JJYOXyepDAq8MQGQXN1KMXRlza1ruH
         PrHu+rnTJmRxEbZzksaKwgn1y1oygBs93gSkTTEJBZfELsrKQejSI5CEpZ4MjdqU/g6h
         6EkAUpxRbnOBSGqixnBirBUIWSShew3JOsRgvH2lqC/AF1oxwyULE/oWUIcHyik8qgp/
         Sv/mds//HGi3fxD982aXTvZ7tmrOger3/KTSi+hwHCrh3i4KoFBaBRXyvAr7K9Hpk/Fs
         lwyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742309838; x=1742914638;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8JrbbTTYqsx2At8tXwwXV3DCT75Flxu7MLSme9mxvoE=;
        b=lu72Nt5UmbD70kaa5hiTjBkKxu6jyhEJVxg4/axd09UWUGZLNN3YxBOefpdRyUIqwX
         zdezNpMAG3WqVSTJHeicBCv87rF3c/91vSZnLPX+37//LNgrpn7MuTthJ4fRRXnMCWrU
         yxR2LNZrSocMmX6Jps6j9QUNKUeNNAUOMTRE0DJD+bz4Fh/yYGL02mgJ8tU8hxagV1Uv
         x6OzTMB2C//FB01JxwExsDOuULgXw7dZVoU7tSgCOPP97yR4xjbRnzdg3vdSi2ZbPXdQ
         U/tTbrIq8c0mrZ7S6+Q5QbxMC867HBXJpg4HWS5Bt9NjEJvudMo+23oGPT2KlSMFE8kX
         cb6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTtTCZX/WguOrTMt7bqpFInOqW5cNWkAmq5eQ4ryG6uwQ1EU1IGut7CgocS1FQpmUeGIaE5sOtwPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyMBjLTlPTdQdAULEPObgDkSK+QmEKlieiuuKiSX0yp7/wY0Iq
	LzPjFS83r9G+76RuAwEhLZEwKMvBsGYm2S+z3of889MwAT1fbynfo5bb4Td/dEM=
X-Gm-Gg: ASbGncs9OKANVcFCrfE1lOWAD0eFcuVY0tTLXabQgAqTq8yXnRiHUHqIjT2DuT1qGRt
	lzzBFeTWr2TfuxnH7t/GF384I5Gfp/LyLLyJ6kGaxdJPwro1gVsk2DHA5MjjPajK4XFWym+8Z2N
	XThLzAnEgph0JadxlGPkUQXxOActnLFURCpAgwSdN+pDrth6u4ifYw45pXhFHI0OQ1sSvP2S2n9
	kcJOpUE+OE/FN0vC7TYK7sSnpnskPzoXTAtlSUt7ZOj6mP75UK6dqRxuZnziHe5ObvQAmSUrfj/
	zLO1X2e96c4LNp+4llK59cmXVEWcNOXD
X-Google-Smtp-Source: AGHT+IHXZ79XlkqSRmU/Q/zKFFol20kZw5HxT+VTDXRKrU5Qs5y3sPBuGNxTg+Htb1G8NWUxJyz+Ig==
X-Received: by 2002:a05:600c:4e51:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-43d3b9ba9d4mr25669455e9.18.1742309838230;
        Tue, 18 Mar 2025 07:57:18 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1fe065b0sm136153105e9.14.2025.03.18.07.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 07:57:17 -0700 (PDT)
Date: Tue, 18 Mar 2025 15:57:16 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, charlie@rivosinc.com, Anup Patel <apatel@ventanamicro.com>, 
	corbet@lwn.net
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed
 tests
Message-ID: <20250318-58828155d9ca2801a21fa411@orel>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
 <20250304120014.143628-17-ajones@ventanamicro.com>
 <1b7e3d0f-0526-4afb-9f7a-2695e4166a9b@ghiti.fr>
 <20250318-1b03e58fe508b077e5d38233@orel>
 <20250318-61be6a5455ea164b45d6dc64@orel>
 <ee650a6c-eed8-4a2b-82ee-868a784f26b3@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee650a6c-eed8-4a2b-82ee-868a784f26b3@rivosinc.com>

On Tue, Mar 18, 2025 at 03:09:58PM +0100, Clément Léger wrote:
> 
> 
> On 18/03/2025 10:00, Andrew Jones wrote:
> > On Tue, Mar 18, 2025 at 09:48:21AM +0100, Andrew Jones wrote:
> >> On Mon, Mar 17, 2025 at 03:39:01PM +0100, Alexandre Ghiti wrote:
> >>> Hi Drew,
> >>>
> >>> On 04/03/2025 13:00, Andrew Jones wrote:
> >>>> Allow skipping scalar and vector unaligned access speed tests. This
> >>>> is useful for testing alternative code paths and to skip the tests in
> >>>> environments where they run too slowly. All CPUs must have the same
> >>>> unaligned access speed.
> >>>
> >>> I'm not a big fan of the command line parameter, this is not where we should
> >>> push uarch decisions because there could be many other in the future, the
> >>> best solution to me should be in DT/ACPI and since the DT folks, according
> >>> to Palmer, shut down this solution, it remains using an extension.
> >>>
> >>> I have been reading a bit about unaligned accesses. Zicclsm was described as
> >>> "Even though mandated, misaligned loads and stores might execute extremely
> >>> slowly. Standard software distributions should assume their existence only
> >>> for correctness, not for performance." in rva20/22 but *not* in rva23. So
> >>> what about using this "hole" and consider that a platform that *advertises*
> >>> Zicclsm means its unaligned accesses are fast? After internal discussion, It
> >>> actually does not make sense to advertise Zicclsm if the platform accesses
> >>> are slow right?
> >>
> >> This topic pops up every so often, including in yesterday's server
> >> platform TG call. In that call, and, afaict, every other time it has
> >> popped up, the result is to reiterate that ISA extensions never say
> >> anything about performance. So, Zicclsm will never mean fast and we
> >> won't likely be able to add any extension that does.
> >>
> >>>
> >>> arm64 for example considers that armv8 has fast unaligned accesses and can
> >>> then enable HAVE_EFFICIENT_ALIGNED_ACCESS in the kernel, even though some
> >>> uarchs are slow. Distros will very likely use rva23 as baseline so they will
> >>> enable Zicclsm which would allow us to take advantage of this too, without
> >>> this, we lose a lot of perf improvement in the kernel, see
> >>> https://lore.kernel.org/lkml/20231225044207.3821-1-jszhang@kernel.org/.
> >>>
> >>> Or we could have a new named feature for this, even though it's weird to
> >>> have a named feature which would basically  mean "Zicclsm is fast". We don't
> >>> have, for example, a named feature to say "Zicboz is fast" but given the
> >>> vague wording in the profile spec, maybe we can ask for one in that case?
> >>>
> >>> Sorry for the late review and for triggering this debate...
> >>
> >> No problem, let's try to pick the best option. I'll try listing all the
> >> options and there pros/cons.
> >>
> >> 1. Leave as is, which is to always probe
> >>    pro: Nothing to do
> >>    con: Not ideal in all environments
> >>
> >> 2. New DT/ACPI description
> >>    pro: Describing whether or not misaligned accesses are implemented in
> >>         HW (which presumably means fast) is something that should be done
> >> 	in HW descriptions
> >>    con: We'll need to live with probing until we can get the descriptions
> >>         defined, which may be never if there's too much opposition
> >>
> >> 3. Command line
> >>    pro: Easy and serves its purpose, which is to skip probing in the
> >>         environments where probing is not desired
> >>    con: Yet another command line option (which we may want to deprecate
> >>         someday)
> >>
> >> 4. New ISA extension
> >>    pro: Easy to add to HW descriptions
> >>    con: Not likely to get it through ratification
> >>
> >> 5. New SBI FWFT feature
> >>    pro: Probably easier to get through ratification than an ISA extension
> >>    con: Instead of probing, kernel would have to ask SBI -- would that
> >>         even be faster? Will all the environments that want to skip
> >> 	probing even have a complete SBI?
> 
> Hi Andrew
> 
> FWFT is not really meant to "query" information from the firmware,
> fwft_set() wouldn't have anything to actually set. The problem would
> also just be pushed away from Linux but would probably still require
> specification anyway.

Agreed. Actually, if we had HW descriptions for every feature in FWFT,
and allowed each feature to have implementation-defined reset values,
then we wouldn't need the get function. The OS would only call the
set function if it disagreed with the value it saw in the HW description.
But this is getting off-topic and we can just agree that FWFT isn't the
right approach.

> 
> >>
> >> 6. ??
> > 
> > I forgot one, which was v1 of this series and already rejected,
> > 
> >  6. Use ID registers
> >     pro: None of the above cons, including the main con with the command
> >          line, which is that there could be many other decisions in the
> > 	 future, implying we could need many more command line options.
> >     con: A slippery slope. We don't want to open the door to
> >          features-by-idregs. (However, we can at least always close the
> > 	 door again if better mechanisms become available. Command
> > 	 lines would need to be deprecated, but feature-by-idreg code
> > 	 can just be deleted.)
> 
> My preferred option would have been option 2. BTW, what are the
> arguments to push away the description of misaligned access speed out of
> device-tree ? that's almost exactly what the device-tree is meant to do,
> ie describe hardware.

Actually, I don't know. Maybe Palmer can point to something.

Thanks,
drew

> 
> As a last resort solution, I'm for option 3. There already exists a
> command line option to preset the jiffies. This is almost the same use
> case that we have, ie have a faster boot time by presetting the
> misaligned access probing.
> 
> IMHO, skipping misaligned access probing speed is orthogonal to
> EFFICIENT_UNALIGNED_ACCESS. one is done at runtime and allows the
> userspace to know the speed of misaligned accesses, the other one at
> compile time to improve kernel speed. Depending on which system we want
> to support, we might need to enable EFFICIENT_UNALIGNED_ACCESS as a
> default, allowing for the most Linux "capable" chips to have full
> performances.
> 
> Thanks,
> 
> Clément
> 
> > 
> > Thanks,
> > drew
> > 
> >>
> >> I'm voting for (3), which is why I posted this patchset, but I'm happy
> >> to hear other votes or other proposals and discuss.
> >>
> >> Thanks,
> >> drew
> 
