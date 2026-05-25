Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BC6380FED
	for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 13:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715056; cv=none; b=sm1oL5T2gwFR/IFEYvdi15pC5RqfpjLzQzcGQSlKUtlLukH8HbHWPZxLpErhBpYxHXuym/sJT0LcY1Yw6PPXvzDMCeUCtEusIOXFCgr1LjRm0a1D79S7S8rIxjpzoF4rpWYfFtTA8WzkEWJ8OKkfBz6ZzUgAlJRZOrY33kNhdLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715056; c=relaxed/simple;
	bh=8QUfqHvbfMaPCgLIrZLjy/3mv0ftTpCmKARkCaMm+Mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nId5j6Ls5HOBhlM4IVpoKv7NAC9mJPLtqef28aOk71aVevAh35tk9cysSU1xxst4SiygBTq1zWTiXZM5bSyOn3i8FqaUQ65CIr6XyT1wxahA3teCSw4rzIaezBYJ/BSc+idoe2yKgKdu+pREzw1PCXHg6EyJW27bfsaZBcw9VZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lDqq8Fy5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lDqq8Fy5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D2E1F00A3F
	for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 13:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779715055;
	bh=qV78+XoJ5yl4lw7jTkTV5DIdhzm9s8UbSBBAw5Rneo4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lDqq8Fy5VgOpZtqbw/qRDQoZe5dLCTdD35zXcL6KXVaVgBelgvs1e5mG3B2iM/g58
	 NHhhq0NehUP2SQ8wGLedA3fC738TOSMGq58KGFNhlDFT2OJI4VQQ+MgxbRLzucKRok
	 la7b0f5OM0RQuLttVAEtt1bljKx4ShOtGzoGjgMQrdzgUZ1UBNN/oFNlWSVDJp+6xR
	 SLPRXxBGAbv6xSSn6BQUJDPYg8Sj5tc0bB3uNq4i66usyTJQ91Df0wiKEjxBaBDLvL
	 iCfy9ed971097MnHZoegWhOSVqQDo86W7+CPzY0MIUDhTaeeuuk0OoVqNw6P8kot97
	 OTmu273JL9Klg==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67b8d9c26bbso19304033a12.2
        for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 06:17:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8MM3tkJU0uRtUbFXwP4XsUtFHI7GqhdvzKI/uH4tYJGvIY7RqB3zIGjZuqr0M1ShR05EUKUtZzbUU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+fBVjgS+FrZhJMrPzJ4+nBmOW7bIo6W89zdfuxxeCugTENUdn
	VZob+Y1ddwfeBMZLZzeCVyj6VDhuKSL1ODDAU+wN+S3Puhp7uyFWycM81fvLeVPZwBVkuyVHKwL
	TboIQyh2I4PWqv53A9JyQwHG5pYD1S+E=
X-Received: by 2002:a17:906:5a58:b0:bd5:7c2:7622 with SMTP id
 a640c23a62f3a-bdd26fcc664mr633046266b.49.1779715053431; Mon, 25 May 2026
 06:17:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525084932.934910-1-ruanjinjie@huawei.com>
 <CAAhV-H4NA7vgyxKnK+N_3C6pWBnwXc2URUyLh_h1m-MO=MnsGQ@mail.gmail.com> <ahQ0WRiMsB011tym@kernel.org>
In-Reply-To: <ahQ0WRiMsB011tym@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 25 May 2026 21:17:21 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5x3m08=acrUr2VOAQ8-r2PhN1xTdr3NihHocoPM5=3hQ@mail.gmail.com>
X-Gm-Features: AVHnY4KF6iz3ZOONNz4YfBuRaFyzFjWLq0_9v1vlnlGZ6xwTI_B6DWjmlURC67Q
Message-ID: <CAAhV-H5x3m08=acrUr2VOAQ8-r2PhN1xTdr3NihHocoPM5=3hQ@mail.gmail.com>
Subject: Re: [PATCH v14 00/17] arm64/riscv: Add support for crashkernel CMA reservation
To: Mike Rapoport <rppt@kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net, skhan@linuxfoundation.org, 
	catalin.marinas@arm.com, will@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org, 
	saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com, 
	pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev, 
	rdunlap@infradead.org, pmladek@suse.com, feng.tang@linux.alibaba.com, 
	dapeng1.mi@linux.intel.com, kees@kernel.org, elver@google.com, 
	kuba@kernel.org, lirongqing@baidu.com, ebiggers@kernel.org, 
	paulmck@kernel.org, thuth@redhat.com, ardb@kernel.org, masahiroy@kernel.org, 
	mark.rutland@arm.com, maz@kernel.org, james.morse@arm.com, leitao@debian.org, 
	sourabhjain@linux.ibm.com, yeoreum.yun@arm.com, coxu@redhat.com, 
	jbohac@suse.cz, ryan.roberts@arm.com, cfsworks@gmail.com, 
	tangyouling@kylinos.cn, ritesh.list@gmail.com, songshuaishuai@tinylab.org, 
	junhui.liu@pigmoral.tech, vishal.moola@gmail.com, kas@kernel.org, 
	debug@rivosinc.com, namcao@linutronix.de, liaoyuanhong@vivo.com, 
	fuqiang.wang@easystack.cn, seanjc@google.com, guoren@kernel.org, 
	chenjiahao16@huawei.com, hbathini@linux.ibm.com, bgwin@google.com, 
	takahiro.akashi@linaro.org, lizhengyu3@huawei.com, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 7:37=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> Hi Huacai,
>
> On Mon, May 25, 2026 at 06:14:52PM +0800, Huacai Chen wrote:
> > On Mon, May 25, 2026 at 4:50=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.=
com> wrote:
> > >
> > > Jinjie Ruan (16):
> > >   riscv: kexec_file: Fix crashk_low_res not exclude bug
> > >   powerpc/crash: Fix possible memory leak in update_crash_elfcorehdr(=
)
> > >   arm64: kexec: Fix image->elf_headers memory leak during retry loop
> > >   x86/kexec: Fix potential buffer overflow in prepare_elf_headers()
> > >   arm64: kexec_file: Fix potential buffer overflow in
> > >     prepare_elf_headers()
> > >   riscv: kexec_file: Fix potential buffer overflow in
> > >     prepare_elf_headers()
> > >   LoongArch: kexec: Fix potential buffer overflow in
> > >     prepare_elf_headers()
> > >   crash: Add crash_prepare_headers() to exclude crash kernel memory
> > >   arm64: kexec_file: Use crash_prepare_headers() helper to simplify c=
ode
> > >   x86/kexec: Use crash_prepare_headers() helper to simplify code
> > >   riscv: kexec_file: Use crash_prepare_headers() helper to simplify c=
ode
> > >   LoongArch: kexec: Use crash_prepare_headers() helper to simplify co=
de
> > >   crash: Use crash_exclude_core_ranges() on powerpc
> > >   arm64: kexec: Add support for crashkernel CMA reservation
> > >   riscv: kexec: Add support for crashkernel CMA reservation
> > >   arm64/crash: Add crash hotplug support
> > I have some bikesheedings about the subjects. Can we unify the prefix f=
ormats?
> > x86/kexec, arm64: kexec_file, riscv: kexec_file, LoongArch: kexec .....
>
> It might look weird in the series, but powerpc and x86 use '/' and arm64 =
and
> riscv use ':' so in the logs in arch/ this would be actually fine.
OK, but at least we can unify kexec and kexec_file.

Huacai

>
> With the only exception of arm64/crash that should have been arm64: crash=
:
>
> > Huacai
>
> --
> Sincerely yours,
> Mike.
