Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292E317A906
	for <linux-doc@vger.kernel.org>; Tue, 25 Jun 2024 19:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719342529; cv=none; b=Wl5WG5c99USA4tCt8KemqDa+g9Xrux9KXPiwHWvQVLe8LBws9JErZJoyuyePfD+HF0OCVoSlShaqqJFzGHYyZjYXRUqEX7ysJ+v2Y9P1buEOK0YbYzQNhOBjdVsVQNWpnpxuPFvUcDgZRRhQpKYsrCGT+fgLNBDRtqEWlR5qztE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719342529; c=relaxed/simple;
	bh=iCXSqH+6UU4SulLsAIswpvWVe9yxkOACz3WYkB9p7XE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mt75R6/xg9adgInp74zQeudUYG39wPFoNvcxKHIN4Z3wzy+ScbWv8iYmL9sm9F6v9t8Wwn/eCj3VrZlTIX3G9fA3N+mD3mAIpofxWTfLkCka6NLtyPJ8qPJ9Hejwe469Vm/kraGy/4u4KncKWtvmgCprqgAJwAenjp9tOTO6i7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Wpnm0PFx; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Wpnm0PFx"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a724958f118so387351366b.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Jun 2024 12:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719342526; x=1719947326; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tL4EzYq6ilmDvWnIZB/4gWNot3CMWNGIIwPHhO9IRMw=;
        b=Wpnm0PFxveZgvn24LtQia5WG1uGB+PXXmun2NmshpQORbBkAoX8yLfhRowLak7rWip
         YKdbZY1DA2JUnZYQcFMRegE1DwvOcDWO79MuQoTYoiENPJumfwSOJ5LkIXWSVaqgfM3a
         f/53OsYTpepQ7BqV8KE1QDWmLVZtRBP4YupLiJ75R7gDkmdYh3pwSdfjfY+4kWwnajYe
         LMgoaYu40G6pI2y3rBjZ1eWmkyCBxcmjAB/DHWfCBBFWKrsHQQsVMelh/MZuN+waAF+O
         mDVK0KWei+cK7l3WklaDBuWlRhZpFiAg8Ma6lQe8eY0lK9KliC/eFMXparqLGsKHNwku
         lISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719342526; x=1719947326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tL4EzYq6ilmDvWnIZB/4gWNot3CMWNGIIwPHhO9IRMw=;
        b=BZr3QR3GxHOd3+DUMp7xQTa7Xy1nUPoLJxEn+ERXOADtmfKPmOP0YcbZKU6RckSBxh
         g535FFeXN0/VWOrUEELms1B5qX7GqXzdDQZoQSTdXditTx48/XMZ9ZxpTL/Lmp+vW+ib
         3r+Y0jz7nj2F+FZyGuVCznkuG6AeMh+qY/6HKoimqIe8FAA+tg9enkmdCA1TixfXzLpy
         bD9OB4J0Pde1mFTm6b81eP683n8r1QJ9utZYHm11bHeGWoDjHJ4k1uH994RT5dGhTwH2
         wJX1NopFmj7EYQ8bpFZA+LrRh722A/fVSzaGZfk7GjgBb9HsH8Uwcw+q6H6qxW/NcC92
         JDhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHgmuYnICqQCn5Cwiw6GRuE7OrEQpN8NmvfOI7Fk9/riXLrNi+2Xctgp2Uxo/G7LKSOrJ8q7UbI+CBYnRUrjKMiYgLAHTKf3q9
X-Gm-Message-State: AOJu0YxgNVPYQ3HrcLTa524oOy0befN4hggqxsKMp5kWn8vtFvTSNzWS
	uflKoqwUDC2AXeEKgAqN3dp1VHfUyLhztltBLW3C8ezPdEPwiRsA88Ssl73N/m62vyr/gCK9dUo
	Nqw1HKniOTmhgpHT6Ra4jfWrkSMNQsQOnuHmnQg==
X-Google-Smtp-Source: AGHT+IFgoo2KQUyFKVYcNQsMHt+AG7QRnWDFexuYnSapnWtKPDeO3CINuVI7rn/8LCncVw+v2sU3PjVVf3mqW28I6Oc=
X-Received: by 2002:a17:906:e52:b0:a6f:33d6:2d49 with SMTP id
 a640c23a62f3a-a7242cdb3ffmr713502166b.52.1719342526431; Tue, 25 Jun 2024
 12:08:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625165121.2160354-1-evan@rivosinc.com> <20240625165121.2160354-3-evan@rivosinc.com>
 <20240625-kindle-sanitizer-c52b48ed9b86@spud>
In-Reply-To: <20240625-kindle-sanitizer-c52b48ed9b86@spud>
From: Evan Green <evan@rivosinc.com>
Date: Tue, 25 Jun 2024 12:08:09 -0700
Message-ID: <CALs-HsuEc9ympGsQP3bvXaowiAj0bq3nvD=9CcX0NNMza+79OA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] RISC-V: hwprobe: Add SCALAR to misaligned perf defines
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Ben Dooks <ben.dooks@codethink.co.uk>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Costa Shulyupin <costa.shul@redhat.com>, 
	Erick Archer <erick.archer@gmx.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 11:35=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Tue, Jun 25, 2024 at 09:51:21AM -0700, Evan Green wrote:
> > In preparation for misaligned vector performance hwprobe keys, rename
> > the hwprobe key values associated with misaligned scalar accesses to
> > include the term SCALAR.
> >
> > Signed-off-by: Evan Green <evan@rivosinc.com>
> >
> > ---
> >
> > Changes in v2:
> >  - Added patch to rename misaligned perf key values (Palmer)
> >
> >  Documentation/arch/riscv/hwprobe.rst       | 20 ++++++++++----------
> >  arch/riscv/include/uapi/asm/hwprobe.h      | 10 +++++-----
> >  arch/riscv/kernel/sys_hwprobe.c            | 10 +++++-----
> >  arch/riscv/kernel/traps_misaligned.c       |  6 +++---
> >  arch/riscv/kernel/unaligned_access_speed.c | 12 ++++++------
> >  5 files changed, 29 insertions(+), 29 deletions(-)
> >
> > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/=
riscv/hwprobe.rst
> > index c9f570b1ab60..83f7f3c1347f 100644
> > --- a/Documentation/arch/riscv/hwprobe.rst
> > +++ b/Documentation/arch/riscv/hwprobe.rst
> > @@ -215,22 +215,22 @@ The following keys are defined:
> >    the performance of misaligned scalar word accesses on the selected s=
et of
> >    processors.
> >
> > -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of mi=
saligned
> > -    accesses is unknown.
> > +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN`: The performanc=
e of
> > +    misaligned accesses is unknown.
> >
> > -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned accesses =
are
> > +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED`: Misaligned ac=
cesses are
> >      emulated via software, either in or below the kernel.  These acces=
ses are
> >      always extremely slow.
> >
> > -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned word accesses=
 are
> > -    slower than equivalent byte accesses.  Misaligned accesses may be =
supported
> > -    directly in hardware, or trapped and emulated by software.
> > +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW`: Misaligned word a=
ccesses
> > +    are slower than equivalent byte accesses.  Misaligned accesses may=
 be
> > +    supported directly in hardware, or trapped and emulated by softwar=
e.
> >
> > -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned word accesses=
 are
> > -    faster than equivalent byte accesses.
> > +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_FAST`: Misaligned word a=
ccesses
> > +    are faster than equivalent byte accesses.
> >
> > -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned access=
es are
> > -    not supported at all and will generate a misaligned address fault.
> > +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED`: Misaligned=
 accesses
> > +    are not supported at all and will generate a misaligned address fa=
ult.
> >
> >  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int whic=
h
> >    represents the size of the Zicboz block in bytes.
> > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include=
/uapi/asm/hwprobe.h
> > index 22073533cea8..e11684d8ae1c 100644
> > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > @@ -66,11 +66,11 @@ struct riscv_hwprobe {
> >  #define              RISCV_HWPROBE_EXT_ZVE64F        (1ULL << 40)
> >  #define              RISCV_HWPROBE_EXT_ZVE64D        (1ULL << 41)
> >  #define RISCV_HWPROBE_KEY_CPUPERF_0  5
> > -#define              RISCV_HWPROBE_MISALIGNED_UNKNOWN        0
> > -#define              RISCV_HWPROBE_MISALIGNED_EMULATED       1
> > -#define              RISCV_HWPROBE_MISALIGNED_SLOW           2
> > -#define              RISCV_HWPROBE_MISALIGNED_FAST           3
> > -#define              RISCV_HWPROBE_MISALIGNED_UNSUPPORTED    4
> > +#define              RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN         0
> > +#define              RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED        1
> > +#define              RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW            2
> > +#define              RISCV_HWPROBE_MISALIGNED_SCALAR_FAST            3
> > +#define              RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED     4
> >  #define              RISCV_HWPROBE_MISALIGNED_MASK           7
>
> How come the "old" names do not need to be preserved for userspace?

It depends on what exactly the big userspace compatibility rule is.
This preserves binary compatibility, which I think is the big one, but
breaks source compatibility, though with an easy translation to fix.
We could keep the old names around, but then it seems sort of silly to
introduce the new names. I introduced this patch upon request, so I
don't personally have a horse in the race on this one.

-Evan
