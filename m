Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E3D15CD42
	for <linux-doc@vger.kernel.org>; Wed, 29 May 2024 06:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716963355; cv=none; b=utR7+4XRXCaepXZYHMPEO5Znqc3C0V8Pb7yDQtgeTlIVEjXj77ZHPc/RgIkwl5/JRIDkfLJ78qVCi1qs23ivp+HTaFocf1RLuTHvebiNb22A2pO+8KK2y2/NXhfb/J7HE/UU1J3qSLcTgrBbO113tBCptEaUSA2VSQF2ZscCWr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716963355; c=relaxed/simple;
	bh=J+6g85MacrkhD1shRZPgIPHazStFB7uwlbQPh89YIGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MXi+HuLnOGUB57rvd6ARa0rapWRc/FzUrSEQvpT2N8QfWv2cv+T0Kpt4A41oHYlHU+Dmehw6Vknz4GxYL4vaiPybHi7lPuvZpl+Kcdmk7pGV3WmNaQWMCq3fehu+B4GT61THNe2M4isWA+MAVXVodSUTPNbiSRZBNyQTjRyBE/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=EGPOj2ZR; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="EGPOj2ZR"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e95a1d5ee2so30903951fa.0
        for <linux-doc@vger.kernel.org>; Tue, 28 May 2024 23:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716963352; x=1717568152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bh0ieLiOPTlnWO1kYS9M0GlqV4zOVJ6IiYKninn4+tc=;
        b=EGPOj2ZRwNYZVsmt/xgNAaN9Qh5qC4/ahKgdB3FqJjCONzi86G8l+ARNLbKC9Del6D
         48MX40fWduWhtP1Hb1LU2oIexalqNfhTR+kkMptf22G5vL2sqPdFTEJ8eu4fuQGyjPfP
         kaSG/5a2e41Pbe6Lbe0Yqa1S9AWjdPaD3FPQHN/oh3/zTx8AbRPCyjS3otOI0XLIrZPE
         ApfiZzQ27DYv0Cc3enDA4yLwPaAvPsSk80YarMdxUkdLD6aT641w2sYMhpLIFtZTcE/Z
         AhNID7YbXTc8dn1q7O0MnOKGgHhWAfnxfKbQT6MBGwB5TjDlUpXTI4+6u0NeWVb+Rf+Q
         PIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716963352; x=1717568152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bh0ieLiOPTlnWO1kYS9M0GlqV4zOVJ6IiYKninn4+tc=;
        b=niUbpZf54ppvD0X0puPmytKRbOIHh8yb8ZydpcOdPeI/ES32yXOAbhITi6Y9BZU2fP
         k8aiawFIesHAEu3eGRPVWAJ+s5gbDEO148kBBkb7BYgnyrAx6smbut8EnkmM0sanSlNK
         wAz+4FbG4AxN8FY7WJnekBveWunMKIs8eO4zUuq85Ms4B8QiyYNYKhJ7PwZyixeVuN0W
         lolHf7gpwWzpUAzjE24q8ctqhHOMh7g0UHkp8a/7Eakw96Gayyjdvv37Bxmkvh0681xF
         4R8Roz0wqZweoCK6ocWny1F5CjtV9+6DMz2LXSf9i/2fNyAYfa2JwCzlcpcUnSM5WBUf
         GV2w==
X-Forwarded-Encrypted: i=1; AJvYcCWJdspuUE0x135Cbn91qIikgpc7A2QaW6NM6cqX7fm2i2y9hcnto3So8jprV6iXnF0oi7LcUpy8+xK9Ss6OuoCWZRTIM/nR3896
X-Gm-Message-State: AOJu0YwRYav8AAHjfCuilKLC6dqlpEUK9dMw3vGbt3ozUPNHsPfYE2gr
	myNQcqz56/883lu8SzXCilyeQxVsMRCDyrgmRWisuzo8Gly3mDq/Qk5RogM8SklFCljMmNXFyzg
	0/PfswbiQt/Bnn/gA1rztdoyaYMW5SQtd9q0zDA==
X-Google-Smtp-Source: AGHT+IEm6bYc2ftZFt2uXoqzzY7bu2Oy5wbaxhF7xACheYlMcKXX+Saw39KXwd1j/qas7p5N+0C1MMzLyv9RtXFbmuc=
X-Received: by 2002:a2e:968a:0:b0:2e1:c448:d61e with SMTP id
 38308e7fff4ca-2e95b096f52mr108173371fa.15.1716963352171; Tue, 28 May 2024
 23:15:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
 <20240528151052.313031-5-alexghiti@rivosinc.com> <20240528-prenatal-grating-2b6096cc2a1b@spud>
In-Reply-To: <20240528-prenatal-grating-2b6096cc2a1b@spud>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 29 May 2024 08:15:40 +0200
Message-ID: <CAHVXubhsqOp2hSxVg7eGjjLN2-iTUFz1AMDTeEvyJh01iypzrw@mail.gmail.com>
Subject: Re: [PATCH 4/7] riscv: Implement xchg8/16() using Zabha
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Tue, May 28, 2024 at 5:22=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, May 28, 2024 at 05:10:49PM +0200, Alexandre Ghiti wrote:
>         \
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hw=
cap.h
> > index e17d0078a651..f71ddd2ca163 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -81,6 +81,7 @@
> >  #define RISCV_ISA_EXT_ZTSO           72
> >  #define RISCV_ISA_EXT_ZACAS          73
> >  #define RISCV_ISA_EXT_XANDESPMU              74
> > +#define RISCV_ISA_EXT_ZABHA          75
> >
> >  #define RISCV_ISA_EXT_XLINUXENVCFG   127
> >
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeat=
ure.c
> > index 3ed2359eae35..8d0f56dd2f53 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -257,6 +257,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D=
 {
> >       __RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> >       __RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
> >       __RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
> > +     __RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
> >       __RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
> >       __RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
> >       __RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
>
> You're missing a dt-binding patch in this series adding zabha.

Thanks, I will add that to the v2.

>
> Thanks,
> Conor.
