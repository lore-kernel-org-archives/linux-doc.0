Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FE82690D4
	for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 14:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740492457; cv=none; b=FDE5hxWX7li126TYILVu8cz5Og89E0bBGHntjNNOoUNRoZxL6lCAfnDAPG5MQv7tiDNTgBTvp1uhtfq6bLculaCRmIOlHce+cFotgZolHzxkldzG4RABM7pdn8F7DZDaC9v/FmR+tw1yI7nJ8iaeqtG9FKeN9YPCq5w36+VsFEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740492457; c=relaxed/simple;
	bh=ETtbGfre+8vSSFzKt9ffhumK3/zdteTUO6XQ0C3bBjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIwW9+AMGU62r0z7rvjevWs9SX+CaOasbtaEbr+9sDW6k96/oAt0sjn7JL7tK+s9ZRjXEzp0NklC0tNFefvG41NXjykllRUkTTcB/J3i47h5/DJYM++/csFq0Sesx5TSt4GZmZqbLL3t6Ud061skF2V1K4sUFgMfXlH7n/Qnp0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=LH+T2tIp; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="LH+T2tIp"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dec996069aso9115146a12.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 06:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740492454; x=1741097254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52CPMxSHvISiy3Wem3SvA0rcU6ZBPvQeZSq+VknVkPQ=;
        b=LH+T2tIpPx+3OFkO6sCUd9tdPB58WVN9RwewDrON/AQztGGEv9RlSftC4ODM2NS+iB
         qcLeORO43fsyj4vHCpIHTsfzGJ1ol01bXOm6YYMQi1Pct63mD+fTiLoR1yeMW1vOJDGR
         b38XW7xtR6fzG83GdfyqrU3ti2D5kWzanUGzJK0Mb2TdENfkPKQx7x79VMnXranmSg2E
         aTdrEfKx/tR4RdbTpvaKi1s5nlPqa3znvzx0oJOFAGiwBSArwqUwdXq/i+XKHaRSQ0UP
         gFUXrmFh+UtbgVOr9OdrnXLM6LJZgur13cE9D7cigFe6vLK7oQ/dPjrfJcZc+dwLiitv
         qbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740492454; x=1741097254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52CPMxSHvISiy3Wem3SvA0rcU6ZBPvQeZSq+VknVkPQ=;
        b=sWkrBecP3/EAF6ieSNGeULj6N0TgvyCG2SpkRpiuDrYkIx1pHysrwKvX2FczGuRCE/
         A9dk6NB58pD0bJ6d6J5Wo/laUwp5df+d4wmBwwa5oVtgBiOLA4hJPYcxUy73GK4E3kmT
         R8lxRlPpmuq1j5pGcRE6dOqzBr1/1hv/1fMEE9qf1bbOQgJMVI5ocEJOo2JNiNQ1McM6
         Rj3rdwdjDA9ydXnLCVGtTs8WFcvCKzWlHItDVoN+Wpv0D3WC61k9ldUoLw5ADSyzpzNF
         XtqMIbJbw8G9pUkk2GAjajeKmPSgVZOXMF2nERajEjoynocUJxsOsrhDqjfuu4+3kA7z
         wCag==
X-Forwarded-Encrypted: i=1; AJvYcCVpsJGebQC2EVHEMyJD7eteop62goG/Q0WhOKpCqlGDDPbPSWXvDIFAppV30UdEUNRrJtxfMS+eJxc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbcY3WKoTZIMyLrUALkJhCOhCrmo2ikM9JcroHuVcFtwmww64Y
	RhxcYNnwD1y4VlMFRxKJDEsmlRMIAxYAfhVwulgEHFLKB4ii8mj0eu7jVGhG/bBdVV+UsiRN+fN
	WhuLV7s+v79ltBPNwZV/nr1wOpReixBD4AJY+bg==
X-Gm-Gg: ASbGnctWSeAP8gWbUw0Ak7rcaV7HvWIBAiwgFfVUrh1xnZ3ID2Rt/vqFSX5J/7o5dTr
	fRfTTXNuM94UCB5XIzv6SQWjPCTSQ9g+cMTegRTFELw9u4yRQezfbMRsTJ+4zf6adVKqVfqqKwX
	9b9mtw+ng=
X-Google-Smtp-Source: AGHT+IEQN2EDCAAeHFkbNRXvx783uJdY53BszHXjfFa/MVQdphVBraQZDPpAVQvXLTkAQT+0PQSNrmUIWMt1Q9RBz8w=
X-Received: by 2002:a05:6402:42c9:b0:5d3:cff5:634f with SMTP id
 4fb4d7f45d1cf-5e0b721e1famr17991883a12.24.1740492454054; Tue, 25 Feb 2025
 06:07:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115024024.84365-1-cuiyunhui@bytedance.com>
 <CAHVXubhapunBD_+cZ=WeEp9GPJec795xOWSnMKmh_iSH09r2Yw@mail.gmail.com> <CAEEQ3wkeLrTFVqVZEAYSsROSLHzkC-EeKvuPHmW=qH3CxamwhA@mail.gmail.com>
In-Reply-To: <CAEEQ3wkeLrTFVqVZEAYSsROSLHzkC-EeKvuPHmW=qH3CxamwhA@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 25 Feb 2025 15:07:23 +0100
X-Gm-Features: AQ5f1Jq1ao-dkwxD2tcF7rBD5LcSaT1gKrmPFXFhH7IkW09oLtBAZAZXrkzMTtc
Message-ID: <CAHVXubhCOivB8oxG7gcCNKTfK0DgHdu721SxsyGX2E4XAjbi6w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5 0/3] Enable Zicbom in usermode
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: ajones@ventanamicro.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, samuel.holland@sifive.com, 
	shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 2:27=E2=80=AFPM yunhui cui <cuiyunhui@bytedance.com=
> wrote:
>
> Hi Alex,
>
> On Tue, Feb 25, 2025 at 9:21=E2=80=AFPM Alexandre Ghiti <alexghiti@rivosi=
nc.com> wrote:
> >
> > Hi Yunhui,
> >
> > On Wed, Jan 15, 2025 at 3:40=E2=80=AFAM Yunhui Cui <cuiyunhui@bytedance=
.com> wrote:
> > >
> > > v1/v2:
> > > There is only the first patch: RISC-V: Enable cbo.clean/flush in user=
mode,
> > > which mainly removes the enabling of cbo.inval in user mode.
> > >
> > > v3:
> > > Add the functionality of Expose Zicbom and selftests for Zicbom.
> > >
> > > v4:
> > > Modify the order of macros, The test_no_cbo_inval function is added
> > > separately.
> > >
> > > v5:
> > > 1. Modify the order of RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE in hwprobe=
.rst
> > > 2. "TEST_NO_ZICBOINVAL" -> "TEST_NO_CBO_INVAL"
> > >
> > > Yunhui Cui (3):
> > >   RISC-V: Enable cbo.clean/flush in usermode
> > >   RISC-V: hwprobe: Expose Zicbom extension and its block size
> > >   RISC-V: selftests: Add TEST_ZICBOM into CBO tests
> > >
> > >  Documentation/arch/riscv/hwprobe.rst        |  6 ++
> > >  arch/riscv/include/asm/hwprobe.h            |  2 +-
> > >  arch/riscv/include/uapi/asm/hwprobe.h       |  2 +
> > >  arch/riscv/kernel/cpufeature.c              |  8 +++
> > >  arch/riscv/kernel/sys_hwprobe.c             |  6 ++
> > >  tools/testing/selftests/riscv/hwprobe/cbo.c | 66 +++++++++++++++++--=
--
> > >  6 files changed, 78 insertions(+), 12 deletions(-)
> > >
> > > --
> > > 2.39.2
> > >
> >
> > So a v6 needs to be sent with:
> >
> > - the fix for hwprobe_ext0_has() reported by kernel test robot
> > - a rebase on top of 6.14 since patch 2 will conflict with
> > RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0
>
> Thank you for the reminder. In fact, version 6 was sent out almost a
> month ago. Reference:
> https://lore.kernel.org/lkml/20250124035959.45499-1-cuiyunhui@bytedance.c=
om/

Oh sorry, I missed it somehow!

I think we can fix RISCV_HWPROBE_MAX_KEY when merging the patch.

Sorry again and thanks!

Alex

>
> >
> > Do you think you can do that soon so that it gets merged in 6.15? The
> > patchset received a lot of RB so it would be too bad to miss this
> > release.
> >
> > Thanks,
> >
> > Alex
>
> Thanks,
> Yunhui
