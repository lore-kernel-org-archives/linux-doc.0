Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F58E15E5BE
	for <linux-doc@vger.kernel.org>; Mon,  5 Aug 2024 18:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722884203; cv=none; b=P7O1iI/B01HJFGrPBL1EMscYu+sgkMrmcv2B0b+kavBWFbs7eArLmc0tjyuMqvEh8oMUcK03pQoDmoZHXNBinvZdnK7XqrJFYUzcCHRmm12n3YdIG0GLsCqO2wdc2auSzzncHqDTkJCtJER6vb9JEkrx7pyDd0QFiJ4rAT1oK4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722884203; c=relaxed/simple;
	bh=QUCe9t3DbMdvdQ1nzM8zE6iXIiJ0GPq3M/3OVa2FyV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nEg2AhmGAqem5lmoX3L3kIjkgpl/84aIIfiGRzhFOnCHqTzGWkjnhmBoOwGC/KC4Ubia+h5apLVJU6KL+fCHCiGiId4NOmSEiGqikNQpdaX/oi/1McULPo7meqoN1wuudXG5QYRS6JFc+1TKdIMTKwYwgmHa6BL7t3VjUxb77Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Gxc3PbrJ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Gxc3PbrJ"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5a1337cfbb5so16266129a12.3
        for <linux-doc@vger.kernel.org>; Mon, 05 Aug 2024 11:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722884200; x=1723489000; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUCe9t3DbMdvdQ1nzM8zE6iXIiJ0GPq3M/3OVa2FyV4=;
        b=Gxc3PbrJLn03i4UeVyIUjeqef5I9O9fE0pc4tYsPul86aMPwEYCGp+v2mKIKmv7gVO
         eYCjVJ5MqrKO5NmcFriT9xCSCKcWNtryfwOwy2VTFXt4rWt7vBoNHjlgXtHZrjK2Rpbs
         0DiLnA+gcY9xRfzfNx0I/0oS6bg0Cto6raQO9HA5SvPw6I6JPtEgDuvjwaW8+cnX7sUv
         eOadfRQN2klYQOtc3Z+rLn1BOfnKs3R4t5ERwfEuLB8I86RzqOR/B1BJePCSOk3cPftt
         Fa6os2b7eAzUs4oH7vWFxzOM0u8WiQp/kEdVBYuOI1WkRTriegJsRm2HR4nM9R6PbxJX
         gFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722884200; x=1723489000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QUCe9t3DbMdvdQ1nzM8zE6iXIiJ0GPq3M/3OVa2FyV4=;
        b=OCB4+dS/zBwcsfXiWJlEZ7vUobQmv7gtdQpJ0Wc5+ujFlqkqTTZyb7/5cLKPMV+3Ib
         xW2rlf0Wi41dYY2AJlZBdBuR8xMDR2mGk5PnONr/7GgK8yPbnQVbsZw/c90pnAmLHaki
         R8Vr86QrC2MxR+zGipIVYtDumUY28LApz9MvPFEXFFP1IJiT/MnZaJX5JlhfWxa+elSk
         CnvlzdMVS6g6m/nFDdSMc2aySbRNJt4tTvvZSiPcSW5f+g5/KeAhDYIqG+6tv3uWyRbt
         BRpn6c/8tDiO6uw00Wdgn6h91u9dpRs8sASn51UvZwb/8SsKX+dlkW5+xUx7ZEo7lV5R
         rv+w==
X-Forwarded-Encrypted: i=1; AJvYcCXfubitdk37AA1cxvTpV59TGpFT90eeoIO7zx9p64aOyzv19FPjfXjdnII0nT/e+pTKnxP/h7IBrGAgohrWY1ZnmtbFPWj0t3rI
X-Gm-Message-State: AOJu0YxKQsLJcalXproBQHXxYF4UpoIR3oDOHDltev6GvnqIyMUTT3WS
	CIToo0VatY+5vboI63xS5Nqj52HkYA62XzzwOFU8PyBGjRqIA6Qz1PliiOXfIJEuqLJoYnbtHdE
	YY7ksGaAnEiFUIOtAkiwwwWR2zsi64gJ947303Q==
X-Google-Smtp-Source: AGHT+IFSMdyIfIbGBGXYm5Kik9d9uEJpH9ScqRFDIie2F6LdTFFPc+B9YVXd8Ov8NJK5dcfMNlMzl3+jbxfpj+TbqFA=
X-Received: by 2002:a17:907:60cd:b0:a7d:c46b:2241 with SMTP id
 a640c23a62f3a-a7dc4fae424mr1075049666b.29.1722884200398; Mon, 05 Aug 2024
 11:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805173816.3722002-1-jesse@rivosinc.com> <CALs-HstYwwgPAOP22V1A6iTX85eRqRp4b4039pewsDHus_dLgQ@mail.gmail.com>
 <ZrEebH2wdjRgfYCB@ghost>
In-Reply-To: <ZrEebH2wdjRgfYCB@ghost>
From: Evan Green <evan@rivosinc.com>
Date: Mon, 5 Aug 2024 11:56:04 -0700
Message-ID: <CALs-HsshaOvxkJ1NhagL0TWqLJAjKAwyoHLEkdq-_n7rpXdF7Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] RISC-V: Add parameter to unaligned access speed
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Xiao Wang <xiao.w.wang@intel.com>, 
	Andy Chiu <andy.chiu@sifive.com>, Eric Biggers <ebiggers@google.com>, 
	Greentime Hu <greentime.hu@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin <costa.shul@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 11:48=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> On Mon, Aug 05, 2024 at 11:38:23AM -0700, Evan Green wrote:
> > On Mon, Aug 5, 2024 at 10:38=E2=80=AFAM Jesse Taube <jesse@rivosinc.com=
> wrote:
> > >
> > > Add a kernel parameter to the unaligned access speed. This allows
> > > skiping of the speed tests for unaligned accesses, which often is ver=
y
> > > slow.
> > >
> > > Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> >
> > How come this is a command line parameter rather than a Kconfig
> > option? I could be wrong, so I'll lay out my rationale and people can
> > pick it apart if I've got a bad assumption.
> >
> > I think of commandline parameters as (mostly) something end users
> > twiddle with, versus kconfig options as something system builders set
> > up. I'd largely expect end users not to notice two ticks at boot time.
> > I'd expect its system builders and fleet managers, who know their
> > hardware and build their kernels optimized for it, are the ones who
> > would want to shave off this time and go straight to the known answer.
> > Anecdotally, at ChromeOS we had a strong preference for Kconfig
> > options, as they were easier to compose and maintain than a loose pile
> > of commandline arguments.
> >
> > The commit text doesn't go into the rationale, intended audience, or
> > expected usage, so maybe my guesses miss the mark on what you're
> > thinking.
> > -Evan
>
> There was a brief discussion about this on Jesse's series about vector
> unaligned support [1]. The original idea was to use Zicclsm to allow
> people to set the unaligned access speed on pre-compiled distro kernels.
> However Zicclsm isn't useful so the alternative route was to use a
> kernel arg. There is already support for a Kconfig, the kernel arg is
> just another option for users.
>
> Link:
> https://lore.kernel.org/lkml/af3152b6-adf7-40fa-b2a1-87e66eec45b0@rivosin=
c.com/
> [1]

Ah got it, thanks for the explanation Charlie! If there are consumers
for this then the concept seems fine with me.
-Evan
