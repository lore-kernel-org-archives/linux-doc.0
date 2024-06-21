Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBDA8287D
	for <linux-doc@vger.kernel.org>; Fri, 21 Jun 2024 03:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718938874; cv=none; b=isiBuhSKikQ0yItSkcIVDajIpoHxmF+KGHGFO1lxwd7mzjSeGPZu0rJ1fyHDdB+THEW5AFKucquANB2EeXwXOuJqAKyoOX6Vs3miAYAsKNWWi6uySUtkN94D8+NDcsp3MJ5rI/4qioPoE5TzmIwNzvPLNMp1+Ac36Qxg34QGSqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718938874; c=relaxed/simple;
	bh=T42/A0l4/jfAh5+q9xr8uYc+BrdXsp8hh0BbKZRn4dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PAWOkBUcBuZT3ybBWx2TirA87NamALl25yQNqgQPqdY/1qwLkNLtqueHdZ3Popx9U18GyfcaPhMVHYlKy4VRx8Vd3V5EuZdTbODHDqFnkwWv54R6oIxWQIOek4dO5mlCFtJw8XQOtbky1JpYURPRJekA8jSefRQx88tcj1wYPn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=X9cMNfo+; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="X9cMNfo+"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-25c95299166so837753fac.3
        for <linux-doc@vger.kernel.org>; Thu, 20 Jun 2024 20:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718938872; x=1719543672; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhH4UzFO6eCWAfNDZXl4qF39oiAH3m5hA5swtcyFl4o=;
        b=X9cMNfo+Uz3lxUZOGKyWLUaeYBfdXbLDq4s7dRRYpodzkeid88BoF9x2FZ2ioHa1t3
         +g/Gmk9v48rhd4/135rIS+hY4pK9eEQydPSNCBoV3ldm4cy+ARfTsyk+jjuaEYZPmYg6
         IrkOAAAIBBfTooyhGbFuPSMM2Z/JM99L32F7URGd7+twTkkvkDzvHw3p8FDsjPpC77vO
         ra/iy9otbFH9PEcNZSKRN/e269pcXRrUQQmBB9/Duy3ofzIULxisQ8rvx4/rqd+qlWg9
         kLPIdfy425CV9dw9lRAEFW3gYuVSaf5WqI66TbMGQctXDW8N4Zq6mm8C7wQvUQ7vyVTO
         gTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718938872; x=1719543672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AhH4UzFO6eCWAfNDZXl4qF39oiAH3m5hA5swtcyFl4o=;
        b=UZs4aEmYHrtsRIIUv2eEiMN7ue2lgi8wtpOTq2lp3348G3sb4fvSMhrSZNm8xeIPtm
         nelYCTIrAupmz0ycCaNf3qzZicE4wm/GdBmQTrDYL0Iz/ou1gaD+Yq3RcGL7qcrco0OA
         4Tb8+gZvVtXEuvNC/TNoMJD1w3u1MnskxOGwYrA0/9RX8pspXoDCzrXqWmlotc7IpLUc
         XuCWbJQT2Tz57TlOXshkplOwXwnHwQuGgRmCukmAUEr6J3bILvEn69DBlOKhHQRTWYIc
         bxMzy+H+YTTm8wddb93qtoBFjCcXBLLxtBpxr9xbXmqxusHfEDida8rsAiCqW2t8datT
         omtA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ0YbXcOWkVMVoe4LFaHCjVuBdU403CDRuPEpFJr86CV+pdj+oumwh+IeLpj0KEtC4wPz+KUqJ+75spJxSYf0/RVoI/rlnurC0
X-Gm-Message-State: AOJu0Yy4n66ilM8wRemu2X8JdTca/nuaOB+ly/zwrv7aqsFdDOuV8wW5
	bv2wYbSXzMlUqerMAokfIHG8t8h0xeqaoJFUOjc92dHxLer2wX3MPYGR++4VK7zZe4oKaulJbiB
	mfPQT6lF+J57ZM63gK6FpFdWnkKpRllZ0B1UXGA==
X-Google-Smtp-Source: AGHT+IGyFusLAIbhi8rnMuNWECpZj7QZvd3djKvKk4GFt8o8t2VKFxpjQUmUU64qgidV9DbQZc3wAs4aLywxdskKhs8=
X-Received: by 2002:a05:6870:970e:b0:24c:b80e:ee1b with SMTP id
 586e51a60fabf-25c94d70a03mr8284877fac.50.1718938871743; Thu, 20 Jun 2024
 20:01:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618114653.12485-1-cuiyunhui@bytedance.com>
 <2BA519C8-D258-4D98-AD49-AC7D30D8B0D2@jrtc27.com> <3c20c9f15cd7a9fb1f2e88560c1b089ac8032898.camel@icenowy.me>
In-Reply-To: <3c20c9f15cd7a9fb1f2e88560c1b089ac8032898.camel@icenowy.me>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 21 Jun 2024 11:01:00 +0800
Message-ID: <CAEEQ3w=HZptMOgXp2Rtuz-VtzPabN=h5N3=3wS4AMk3Lo7E7FQ@mail.gmail.com>
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

On Wed, Jun 19, 2024 at 7:51=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
>
> =E5=9C=A8 2024-06-18=E6=98=9F=E6=9C=9F=E4=BA=8C=E7=9A=84 18:11 +0100=EF=
=BC=8CJessica Clarke=E5=86=99=E9=81=93=EF=BC=9A
> > On 18 Jun 2024, at 12:46, Yunhui Cui <cuiyunhui@bytedance.com> wrote:
> > >
> > > From: Palmer Dabbelt <palmer@rivosinc.com>
> > >
> > > A handful of user-visible behavior is based on the frequency of the
> > > machine-mode time.
> > >
> > > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> >
> > I would suggest referring to the user-mode CSR instead, i.e. =E2=80=9Ct=
ime=E2=80=9D
> > rather than =E2=80=9Cmtime=E2=80=9D throughout in names and description=
s, since
> > that=E2=80=99s
> > the thing that user-mode software is actually reading from.
>
> Agree. MTIME isn't even a thing defined in RISC-V ISA -- it's part of
> the ACLINT timer spec, but before ACLINT gets widely accepted, it's
> just some SiFive thing that got copied by many other vendors (and
> vendors such as T-Head even provides CLINT w/o MTIME register (well
> because these T-Head cores have reference source code available, this
> is because of their CPU design uses an external counter fed as TIME
> register)).

Okay, Thanks for your suggestions,  I think this modification is more
appropriate:

RISC-V: Provide the frequency of time counter via hwprobe

A handful of user-visible behavior is based on the frequency of the
time counter.

What do you think ?

>
> >
> > Jess
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>

Thanks,
Yunhui
