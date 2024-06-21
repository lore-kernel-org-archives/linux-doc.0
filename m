Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627D476034
	for <linux-doc@vger.kernel.org>; Fri, 21 Jun 2024 10:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718966063; cv=none; b=bhz6HDtADcjgPfwP3989FO8ZAtHRt0JMG++T255VvU02+lUzHfo59U+jes9VXj2skE3feHs9x+1vm6XPZNpnQHXQXECJn1Laafz7bfCS2ixAipjuSn4TePCGVoPUFvGFSwgxsTabM3zRiMZ9zPD56nxve7Tu9GK5AbVnRbFGUPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718966063; c=relaxed/simple;
	bh=KTDze4UhK+Qdt8yDIqVr+68kui2rsKo2uZ2LpKfsXZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RT4qfNhVziMo001yNZiSh9MNAstYrluqIYY4HBfjelv5G3+iRR28WimifPxp/zR3dxhI6IBgeD36BQY1VoZ4TsjOWuhjSDYMqiPv5yQOVvcf4uS6ONdFSCfTwo+Gz0aqzUMsNMf5ixKOK7mcYJ/mSFaxaa+oLfIMs0sQ5JDsKBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HbQ9PieP; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HbQ9PieP"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-24c0dbd2866so959338fac.0
        for <linux-doc@vger.kernel.org>; Fri, 21 Jun 2024 03:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718966059; x=1719570859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiEIJ+aB3LoELXi0g19POXyK7Fvva+QATDGmieXdJiU=;
        b=HbQ9PiePGP/K51PkFFmxyY7Rcpr8t+skWon4ZEvYbJPVirkHwE6bF4kxTs8qJCY6B5
         B5howHbC8JHyKWfSAEjvBq8Bn0r04HQ7zwmi949k4TTLTCN7yUrT1U9d0FISgPWjphq9
         KZrR2wKYPeE7CaqjA8m6MkZ+0brhFKTmlUn8P4rjcKLRw8hACwFOJClwrsY+Z45Um/40
         Yt7A//OnaRhwBfcV/fE3NDKkFBsMjf/8coP35/DuLShdDeZiTiJYpcjoskC2rDxWhAzD
         33507KUz2FqwSTdWyF5gI4k6At+GszXssNxoRkPWCqzzI+GUxREd/oFYus9wMmkHUJHi
         GBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718966059; x=1719570859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uiEIJ+aB3LoELXi0g19POXyK7Fvva+QATDGmieXdJiU=;
        b=k4K4bChHWafz4E+ptthFVW/gKQ0TxFxgFeL7LxjJ6y1BVraPIWesq+uKbZEwljj2dy
         yJElJfx80t8nH5PhXja53i4p9FpYxWJf8x7gu9ulfGKz01o/R7cv2+8SR8+HutS0CjOZ
         XPx6w6SlMDreNJ5p+G8veSpTrAk5jvF6v85sQndsMui6GK8Uy+DJKkJwpgfHmzciPhfN
         ty+AlNQoKerRgR/GZFZjAQ1Giais+7tHDFq8j7Y1ybzZsV80RK1sHkro6fFN2f4biMuv
         3eFgPPT37/+DqIvoiqG1nYpsyqyqYVw2WBWIeFDnibwBTiZHUQNMy+EoaWDolzV2iKmQ
         28lA==
X-Forwarded-Encrypted: i=1; AJvYcCVUr0zfSTzCrh8P6xaV09nh6DPJ6gvn4v4vE6Ev4nnha8OmIyi8v4Gc/6o4uHREFz4KmwdCTVi04+hcgi67pax8QYUcQEk6caKJ
X-Gm-Message-State: AOJu0YyTJl52n89zo9d8C9piQF3k02r14uD9fKnXMGWeLqv+6BVkusAD
	A7hD6Y7qYQf+Bc+7bouLTeqqiwscoKHIlfPm3A6GPFLX8w3yUPA82b4mlKYYGNtY/xPZzVJKMS9
	rDo+R7Tofgp+Vfo9OHoyEDI2HqIXcmsT5k746eQ==
X-Google-Smtp-Source: AGHT+IFl6dpz/wOwOogwSSMMm3/tdCg8DTplBhqHoRnvMWb06zdb/xiwjF6rv5JWL8TKTe41hMECUKSqGMX19Tn1ZxQ=
X-Received: by 2002:a05:6870:41cf:b0:24c:4fcc:9011 with SMTP id
 586e51a60fabf-25c949a7793mr8938055fac.19.1718966059436; Fri, 21 Jun 2024
 03:34:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618114653.12485-1-cuiyunhui@bytedance.com>
 <2BA519C8-D258-4D98-AD49-AC7D30D8B0D2@jrtc27.com> <3c20c9f15cd7a9fb1f2e88560c1b089ac8032898.camel@icenowy.me>
 <CAEEQ3w=HZptMOgXp2Rtuz-VtzPabN=h5N3=3wS4AMk3Lo7E7FQ@mail.gmail.com> <8fac6e0f11ab5f5fc28be6e73f196b38e99f8c39.camel@icenowy.me>
In-Reply-To: <8fac6e0f11ab5f5fc28be6e73f196b38e99f8c39.camel@icenowy.me>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 21 Jun 2024 18:34:08 +0800
Message-ID: <CAEEQ3wmX9r=Xv=Ue9HOwEvBAHV2=CM5dTiHgd=hzgHBMn27sbw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: Provide the frequency of mtime via hwprobe
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Evan Green <evan@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, costa.shul@redhat.com, 
	Andy Chiu <andy.chiu@sifive.com>, samitolvanen@google.com, linux-doc@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Icenowy,

On Fri, Jun 21, 2024 at 1:18=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
>
> =E5=9C=A8 2024-06-21=E6=98=9F=E6=9C=9F=E4=BA=94=E7=9A=84 11:01 +0800=EF=
=BC=8Cyunhui cui=E5=86=99=E9=81=93=EF=BC=9A
> > Hi Icenowy,
> >
> > On Wed, Jun 19, 2024 at 7:51=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me> =
wrote:
> > >
> > > =E5=9C=A8 2024-06-18=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 18:11 +0100=
=EF=BC=8CJessica Clarke=E5=86=99=E9=81=93=EF=BC=9A
> > > > On 18 Jun 2024, at 12:46, Yunhui Cui <cuiyunhui@bytedance.com>
> > > > wrote:
> > > > >
> > > > > From: Palmer Dabbelt <palmer@rivosinc.com>
> > > > >
> > > > > A handful of user-visible behavior is based on the frequency of
> > > > > the
> > > > > machine-mode time.
> > > > >
> > > > > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > > > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > > >
> > > > I would suggest referring to the user-mode CSR instead, i.e.
> > > > =E2=80=9Ctime=E2=80=9D
> > > > rather than =E2=80=9Cmtime=E2=80=9D throughout in names and descrip=
tions, since
> > > > that=E2=80=99s
> > > > the thing that user-mode software is actually reading from.
> > >
> > > Agree. MTIME isn't even a thing defined in RISC-V ISA -- it's part
> > > of
> > > the ACLINT timer spec, but before ACLINT gets widely accepted, it's
> > > just some SiFive thing that got copied by many other vendors (and
> > > vendors such as T-Head even provides CLINT w/o MTIME register (well
> > > because these T-Head cores have reference source code available,
> > > this
> > > is because of their CPU design uses an external counter fed as TIME
> > > register)).
> >
> > Okay, Thanks for your suggestions,  I think this modification is more
> > appropriate:
> >
> > RISC-V: Provide the frequency of time counter via hwprobe
>
> Sure, or you could just say time CSR, which is a defined CSR in the
> user ISA document, and allow to be read from userspace.
>
Okay, I will update it on v2.

> >
> > A handful of user-visible behavior is based on the frequency of the
> > time counter.
> >
> > What do you think ?
> >
> > >
> > > >
> > > > Jess
> > > >
> > > >
> > > > _______________________________________________
> > > > linux-riscv mailing list
> > > > linux-riscv@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > >
> >
> > Thanks,
> > Yunhui
>

Thanks,
Yunhui
