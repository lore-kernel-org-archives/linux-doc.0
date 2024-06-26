Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB1DBE71
	for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 15:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719416714; cv=none; b=lkjh9p7CnFipx2AYt2QosQGSLbZCKgRgLyYqA5P8IckWBShNkW0nxXe0iPY7AC6IJVi9oJllzCln2HfT0vyFz7IqMimNK0qG2xPQF6mbN85HxcHFm2iBuHfU/kPoJMFRLbm82fYdo8ypZTna+HtZGXOY8QThPblZx/YUojdPToQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719416714; c=relaxed/simple;
	bh=WayeiOd8YzfiEyklqL/MSnBPl8oIxEOQuUPnOW2/F9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g1tTRohP5Nsqq1r+o1B3nRqX3sB7dItNWsTM4LYS9IbkRbOwT55ZtJDDH90zy/BJWrGsJeJKUcgcznMpZzCivizKa1bvhuI6dMQ1HowOYZzcrAEFAuI07Z907EGfQF2j33DH2Ea24iFu1GiZ/+I/R640Lulh5rMHXiXF2mCg0fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=lntkEOSG; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="lntkEOSG"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec002caf3eso103839341fa.1
        for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 08:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719416709; x=1720021509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbWm8cqE0oE3vKB/XJ40+CrH2tyCa/GZQ7NMjRIgGSc=;
        b=lntkEOSG51P2+EhhRQugknTbdI/E6/i8/kQOfrJ6STj9fOoLSZF8eISzH/HNDZQU2Y
         FXSjSlffKPc4D5c5RoI+fYJBDhhq/AqQiazb6QSyxJ6MDPLQFQdG1qvd4O0ha6+OlSgx
         ODVQKRUglyPdjMPdULtbOG1eKDSlyN9aSmUMUAiGBvkxONn0jr3BaD3hdZUncbM7PcvL
         OV+tz7aIrJ1sRTKrk5W9+rfRMIU7JFnzBBOnTXH3Y8izAEjKZdhXudoAIcJoPjM3mV3c
         OAZPbzYo10OzwTFerAgAc8tUlCUHifMuLWCW3OzWOaFngEl9p6iwPlYkwX83wOfHstgL
         F9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719416709; x=1720021509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbWm8cqE0oE3vKB/XJ40+CrH2tyCa/GZQ7NMjRIgGSc=;
        b=C5zwX/fNVKc69liYTeNbx/ZCpsW/isxmx6v7F7IOewuIRx1ljI1DcgO26QG6ipEFkt
         JGfuuIlVralP7WuJ29nXLdBFIsrQv6MY8KPtvYIzkWmEqb41zVDB1hx4bkvN9tCd/BP2
         tjwenFPV9pi5RXUTYD09ATlYEhkQ3B4hjINBH21dbo5UXhb9H+hPvhvKdESAZmD1LIPb
         BS3rNTP3IzU6WGMT3GKWFw4RwdNbfcW2iZPa0f3nGvEbJWMKW7kOdzTyOdT9D04XbzuM
         yrDmjAQlsOJlXMtkP3Oprjv0Pz2rrdJBVhGMn3p9rx1jQ+kxDeccdaRx+RF5JmEKqX36
         gRfg==
X-Forwarded-Encrypted: i=1; AJvYcCWizxPzohpWSWaxBSKy48fV8kFZvFLloiA+nefn8vT/X6lIVx1dQhvlhuOM8cqF/73UIdOOgPgWWAPuU2nV67WkylIwOMyhnAp/
X-Gm-Message-State: AOJu0YyfO8DVyBVr3w3gc1HBxu4l3qizz2o8t6InfJACRKVeNaJ1DHnb
	ysHR5Y5GjO7HRryQHxAAjO9sjFuo9N2mCWVM0PtXlEcjCSr8PVewrKcOUeO5uhUuiG+a6seuFAa
	dOaITMkJNy08BcyDePN+sI7xMO9FwQxKHQKohaA==
X-Google-Smtp-Source: AGHT+IEjXKzu6GdnHpvC2XZ82qS8kZJyBd0JNRnPe8Oday4QWzxFjQqHYSizzqD4CkgJRyGLJvUbzx2STfJIVw12W/A=
X-Received: by 2002:a2e:8416:0:b0:2ec:4397:5ce7 with SMTP id
 38308e7fff4ca-2ec5b31d0e0mr72977401fa.39.1719416709468; Wed, 26 Jun 2024
 08:45:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625165121.2160354-1-evan@rivosinc.com> <20240625165121.2160354-3-evan@rivosinc.com>
 <20240625-kindle-sanitizer-c52b48ed9b86@spud> <CALs-HsuEc9ympGsQP3bvXaowiAj0bq3nvD=9CcX0NNMza+79OA@mail.gmail.com>
 <20240626-ungraded-legend-65480eabd255@spud>
In-Reply-To: <20240626-ungraded-legend-65480eabd255@spud>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 26 Jun 2024 08:44:33 -0700
Message-ID: <CALs-HsuCu-C04vnGRV69S4TQx_URZGmKRbK+ekARR6ZM_SNVHg@mail.gmail.com>
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

On Wed, Jun 26, 2024 at 7:34=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Jun 25, 2024 at 12:08:09PM -0700, Evan Green wrote:
> > On Tue, Jun 25, 2024 at 11:35=E2=80=AFAM Conor Dooley <conor@kernel.org=
> wrote:
> > >
> > > On Tue, Jun 25, 2024 at 09:51:21AM -0700, Evan Green wrote:
> > > > In preparation for misaligned vector performance hwprobe keys, rena=
me
> > > > the hwprobe key values associated with misaligned scalar accesses t=
o
> > > > include the term SCALAR.
> > > >
> > > > Signed-off-by: Evan Green <evan@rivosinc.com>
> > > >
> > > > ---
> > > >
> > > > Changes in v2:
> > > >  - Added patch to rename misaligned perf key values (Palmer)
> > > >
> > > >  Documentation/arch/riscv/hwprobe.rst       | 20 ++++++++++--------=
--
> > > >  arch/riscv/include/uapi/asm/hwprobe.h      | 10 +++++-----
> > > >  arch/riscv/kernel/sys_hwprobe.c            | 10 +++++-----
> > > >  arch/riscv/kernel/traps_misaligned.c       |  6 +++---
> > > >  arch/riscv/kernel/unaligned_access_speed.c | 12 ++++++------
> > > >  5 files changed, 29 insertions(+), 29 deletions(-)
> > > >
> > > > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/a=
rch/riscv/hwprobe.rst
> > > > index c9f570b1ab60..83f7f3c1347f 100644
> > > > --- a/Documentation/arch/riscv/hwprobe.rst
> > > > +++ b/Documentation/arch/riscv/hwprobe.rst
> > > > @@ -215,22 +215,22 @@ The following keys are defined:
> > > >    the performance of misaligned scalar word accesses on the select=
ed set of
> > > >    processors.
> > > >
> > > > -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance o=
f misaligned
> > > > -    accesses is unknown.
> > > > +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN`: The perfor=
mance of
> > > > +    misaligned accesses is unknown.
> > > >
> > > > -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_EMULATED`: Misaligned acces=
ses are
> > > > +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED`: Misaligne=
d accesses are
> > > >      emulated via software, either in or below the kernel.  These a=
ccesses are
> > > >      always extremely slow.
> > > >
> > > > -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned word acce=
sses are
> > > > -    slower than equivalent byte accesses.  Misaligned accesses may=
 be supported
> > > > -    directly in hardware, or trapped and emulated by software.
> > > > +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW`: Misaligned wo=
rd accesses
> > > > +    are slower than equivalent byte accesses.  Misaligned accesses=
 may be
> > > > +    supported directly in hardware, or trapped and emulated by sof=
tware.
> > > >
> > > > -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned word acce=
sses are
> > > > -    faster than equivalent byte accesses.
> > > > +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_FAST`: Misaligned wo=
rd accesses
> > > > +    are faster than equivalent byte accesses.
> > > >
> > > > -  * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned ac=
cesses are
> > > > -    not supported at all and will generate a misaligned address fa=
ult.
> > > > +  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED`: Misali=
gned accesses
> > > > +    are not supported at all and will generate a misaligned addres=
s fault.
> > > >
> > > >  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int =
which
> > > >    represents the size of the Zicboz block in bytes.
> > > > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/inc=
lude/uapi/asm/hwprobe.h
> > > > index 22073533cea8..e11684d8ae1c 100644
> > > > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > > > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > > > @@ -66,11 +66,11 @@ struct riscv_hwprobe {
> > > >  #define              RISCV_HWPROBE_EXT_ZVE64F        (1ULL << 40)
> > > >  #define              RISCV_HWPROBE_EXT_ZVE64D        (1ULL << 41)
> > > >  #define RISCV_HWPROBE_KEY_CPUPERF_0  5
> > > > -#define              RISCV_HWPROBE_MISALIGNED_UNKNOWN        0
> > > > -#define              RISCV_HWPROBE_MISALIGNED_EMULATED       1
> > > > -#define              RISCV_HWPROBE_MISALIGNED_SLOW           2
> > > > -#define              RISCV_HWPROBE_MISALIGNED_FAST           3
> > > > -#define              RISCV_HWPROBE_MISALIGNED_UNSUPPORTED    4
> > > > +#define              RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN      =
   0
> > > > +#define              RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED     =
   1
> > > > +#define              RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW         =
   2
> > > > +#define              RISCV_HWPROBE_MISALIGNED_SCALAR_FAST         =
   3
> > > > +#define              RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED  =
   4
> > > >  #define              RISCV_HWPROBE_MISALIGNED_MASK           7
> > >
> > > How come the "old" names do not need to be preserved for userspace?
> >
> > It depends on what exactly the big userspace compatibility rule is.
> > This preserves binary compatibility, which I think is the big one, but
> > breaks source compatibility, though with an easy translation to fix.
> > We could keep the old names around, but then it seems sort of silly to
> > introduce the new names. I introduced this patch upon request, so I
> > don't personally have a horse in the race on this one.
>
> So apparently this isn't quite Palmer actually wanted. In today's call
> he suggested that he'd send a new version himself, but also that what we
> should do define a new key for scalar /and/ new add new defines values th=
at
> contain the word scalar, retaining the old defines. The values can of
> course be the same.

Ahh, got it. I'm happy to spin this.
-Evan
