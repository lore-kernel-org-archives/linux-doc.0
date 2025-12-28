Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179E28460
	for <linux-doc@vger.kernel.org>; Sun, 28 Dec 2025 13:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766929610; cv=none; b=rtG0KdA5daAJa4qqnXTQBVawPC+zB8sCRQ+OSPvIrD9w/PRjyiX8YtBUtH2ySxtvvqs3j1uN0elJjrCuQKYqsQ//cQzTZhi/nwmqrTXhooPrVKqV5AO+8JXvFs1qTqQfBzybj5x6c7v/7CpnsTGFdAkazk4UeLVmNAp/s45TcaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766929610; c=relaxed/simple;
	bh=qz2EpIgyf//vEb2FjkXoztZUuK4dLJ2baPo7y+61YYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q63xCwpdUt2P6PjfenOUYH9G/kbbmSz8GbqN6VfXJi5mc260qlJ7nIP7mw2YyD+LD+7p9uTuKuVwmaGL8qQKoVCe1N/948QxL3JopQOil0n+IDiV2K5MY7dY3dvdlWEAEMhA+5xG32MeBmMM0pA04/b3jzfAva65NXRak0A3Ljk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=fQuozb4s; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="fQuozb4s"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so1721184566b.3
        for <linux-doc@vger.kernel.org>; Sun, 28 Dec 2025 05:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1766929605; x=1767534405; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QmyVj6XGPrQWTnO1cmBaHu2RF/dDjLmm14QhvwLLo4=;
        b=fQuozb4sCSNgGu/oEoN0IqWVIHkN+aNOo2eVeSrhZvRzMo4es/foZd18ZEA1/MDxhV
         VZO/35dwCsNtiZCYk/Aj3qF3WXiXuhWKGts9UOMYo/+VVvmT5CgAqDE4RVg/vDqsnij6
         ZNRWh+QYWSxdryYfoBldV2vzPSqq1Jn0TnqyquEAoEzEtFGfXGdSKHdxI2rH+LOG+HH8
         n6pNr/bZQDNerQbEsfB1onlqs2RSKe17vesemGslox7TxshWGAHw1AN47K85wAGAeehM
         bCIBC23GpE6D0YEOf22H//Ua9OsebhGBU6bXDjMixO2WFlafHN4bHGnFdysxutIDioL/
         4wZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766929605; x=1767534405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0QmyVj6XGPrQWTnO1cmBaHu2RF/dDjLmm14QhvwLLo4=;
        b=ZJ1qRUw4lyQjAa31dS9wZalBRe4dLjzsV10skypC7chr/yyQhzb6p6CkJ/19HmFZy0
         q2RtMEN0xhstGA4CMSdz81XhKrywsxKLs9QuUt0f2lxHxz5zFCfVQKy9IEbFr8nIXz83
         FpmQSeRLwAFLurm6Kz1feKfq28kNWwzJsDYGUjtuz50Fp2o1haIeHPP4eHn8INDHNPlK
         QQlyG6RMQhNZ82FG4Q29xhzGhRrkySWOgwSntXzD8WP9dacTVGsPCRtklR5ioPuXXJJh
         UlbdLN5SoPgZ6PZ29LlSdLq3hOMuK3C/Jgy21k3IeXTFb+NGYlYPgcbWjwtc7bteYdAy
         temg==
X-Forwarded-Encrypted: i=1; AJvYcCWUn+IVf26nA+ZJU1FFIpXeHVQGaVAJshNyEwMvmSSzSX6kuTs6m5ZgawW8rXbvGvxZ8vdzXygK4a0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfv0zdrEq/1VUueBQobmJsmuS4L7Zyln9GnkjFxK4rRL8G39B8
	K/gE7zMgdRxdHo44QgItW5t7FJJJ0haVsFCNuFK2s5xdHfXLMnOs2D2tu4cno1+zMZuBGdwMvMe
	dsBJQcyHgUeQRcMu5MRVbAV+r8mHTkPVo3dwemeAIPw==
X-Gm-Gg: AY/fxX7PlEqx6y/ecLlDp98ZLMPROQzdvYMNNFnau2Zh45tWNqhl/OfZ8riSZl8xoHR
	2+TXQZOhgG4119haoo3ClseGzwf9foWaneBSsIXdaTd6duUAGywFXgJf1aOFyY90MboUy+qZLXo
	tnMtYsbAFNEw8N+YEqXNL5ZjdCn/2MVg1nE12pnxCQeZTVRw8l4dk6tYprROU+MkVU09K/xKaMY
	oRZgJ+Q3m5dtz3t6P0Gqdd6r6Owape9Q+qEsrD3LGy1Y7/tpHtyNgh2q2LWyHt9Mua/nV1YQPmH
	F+x3bQlBVFjmWZsmjJGnhYFWOAc=
X-Google-Smtp-Source: AGHT+IEdC99j0nCePFhLwmZTnJWkgU+x4D2zxqHSfh/qzCdOT5Mo/lWPNRvdETHSYcJYPuMj/crY4IJKLKDSNORCHKs=
X-Received: by 2002:a17:907:6e9f:b0:b7c:e4e9:b13f with SMTP id
 a640c23a62f3a-b803717d9b0mr3040706066b.39.1766929605212; Sun, 28 Dec 2025
 05:46:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523101932.1594077-1-cleger@rivosinc.com> <20250523101932.1594077-7-cleger@rivosinc.com>
 <38ce44c1-08cf-4e3f-8ade-20da224f529c@iscas.ac.cn>
In-Reply-To: <38ce44c1-08cf-4e3f-8ade-20da224f529c@iscas.ac.cn>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Date: Sun, 28 Dec 2025 14:46:34 +0100
X-Gm-Features: AQt7F2p1_7ko8w_PwIifz2AmUk0sbTmFCv2I3iETmZt8Ofoon78QtnnXQgqC8zk
Message-ID: <CADGDLFjttq5knxRpqktHVEbwTWEAwgJ-p50ajV=Q8b31cZvJxA@mail.gmail.com>
Subject: Re: [PATCH v8 06/14] riscv: misaligned: request misaligned exception
 from SBI
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Deepak Gupta <debug@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Vivian,

At the time vector emulation was added in OpenSBI, I asked Nylon if it
was going to be backported:
https://lore.kernel.org/opensbi/CAHCEehJ7JDhhF_C8jngHezfBJjWp+0m6Gzvsphk+BL=
MvyYdEXA@mail.gmail.com/

Seems like it wasn't backported :) So yeah, it definitely needs to be
added to the kernel misaligned handling code.

Thanks,

Cl=C3=A9ment

On Thu, Dec 25, 2025 at 11:14=E2=80=AFAM Vivian Wang <wangruikang@iscas.ac.=
cn> wrote:
>
> Hi Cl=C3=A9ment and riscv maintainers:
>
> On 5/23/25 18:19, Cl=C3=A9ment L=C3=A9ger wrote:
> > Now that the kernel can handle misaligned accesses in S-mode, request
> > misaligned access exception delegation from SBI. This uses the FWFT SBI
> > extension defined in SBI version 3.0.
> >
> > Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/cpufeature.h        |  3 +-
> >  arch/riscv/kernel/traps_misaligned.c       | 71 +++++++++++++++++++++-
> >  arch/riscv/kernel/unaligned_access_speed.c |  8 ++-
> >  3 files changed, 77 insertions(+), 5 deletions(-)
>
> This causes a regression on platforms where vector misaligned access can
> be emulated with OpenSBI (since OpenSBI commit c2acc5e ("lib:
> sbi_misaligned_ldst: Add handling of vector load/store"), because this
> disables that with FWFT. This means that vector misaligned loads and
> stores that were emulated instead get a SIGBUS.
>
> This happens on Sophgo SG2044 and SpacemiT K1. Notably this causes these
> platforms to fail Zicclsm which stipulates that misaligned vector memory
> accesses succeed if vector instructions are available at all [1].
>
> I'm not very certain why vector emulation support was omitted in this
> series. Should we perhaps add the same emulation support to Linux as
> well for the sake of these kind of platforms?
>
> Thanks,
> Vivian "dramforever" Wang
>
> [1]: https://github.com/riscv/riscv-profiles/issues/58
>
