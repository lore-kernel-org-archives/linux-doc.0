Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AA515B10C
	for <linux-doc@vger.kernel.org>; Mon,  5 Aug 2024 18:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722883143; cv=none; b=NIIwtoCdbqvmGk66msWxD2w+nVSU/KHiCxtg67dEPwfiNc7A7MdYV8HqMOsD3ye8E9FGRH+fRKIOMWQovz8BqhpHuDtW2iDnlSxBmPaz4D/se/tOGI/SZa3RZ3okhe+OQDTdWIH/+BMFHwTuhmt8TudzvdDjM4ZHiNDgq+ClDg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722883143; c=relaxed/simple;
	bh=Z0fHi9KsdL/dhg3Iq7FZic1Ag2yGSv3KBsY4wPIKoXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hyvudz1qKQFWyjfsjSc3EerVbAcyuQJId8y4SVhvtS6xXiW+dz6BJjVFxnyP1+UDM6UIPFfTrkTfDRScGT4vB5LPEQr8TH6YfuVt2u3ifaUulDILyWkzsSlWdSUOofZUuhIh1p1XDsRUXhGeFrFAA9B3Jf20GdirCCDmMNCzfAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=bXnClPrm; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="bXnClPrm"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7ad02501c3so436718166b.2
        for <linux-doc@vger.kernel.org>; Mon, 05 Aug 2024 11:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722883140; x=1723487940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0fHi9KsdL/dhg3Iq7FZic1Ag2yGSv3KBsY4wPIKoXc=;
        b=bXnClPrm5Vo+8wowLG5mnLFsfE0X3DO6Xn06uYQT4fsbQAlsGbcgfNO+q/WFPYEPZK
         WYwFbNRw/Q0nN/93zpi4xdFi6hZXeMrPVQjPYE6fuBMidBjdEmm5pVbEZhipf3OYSPNl
         FC5kIXBbzlvAtuAuOSUy/zC20f5EQ9e9Xa+oZVhBQ/2QtbbUwaLsFoAEqASeMUsj5Uz5
         u+enWYgzgPIuIilTZLeKpyHe88ejmPzIfI6s3Xvky8PNow5JcJ+G6MGQhtrHbNyEW2DA
         n+R0fTar9ML/DeqYabZgDbczjMqjcVY21PFgRXdmpO6UTZ4fHb8YVXbohC1xk5/gEb2I
         Gpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722883140; x=1723487940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z0fHi9KsdL/dhg3Iq7FZic1Ag2yGSv3KBsY4wPIKoXc=;
        b=tENMPh9rnk6syo89Nmw6katpI/1WdxOcJze4yZM9Fi5dUPlgyhGB+hrNntjFmHKEGJ
         /QNbxxDmrklsudiFpaC2DnNNXnPNYX4kNTu/C9jQ2oAZ69wuX1G5ofh7bbj7AWcggwLa
         dxLHjYyyZaNi60ZSTDpMtATQjLfB69IhCUyQUk6o/drkMgylfxsGzJzSJ7D/UyoL4WcK
         y0B7aYlJxOuibAXoIT4sriJ3OsEHA/H2/SbTO7HAZZXtE7VhTtSwm23oNprTpdH9gp9y
         Vjo5W54vB60mU4QmGfnzOK7389nhRIT/HPCwtjomxF83gUsvvJUXBWtklTsuM1O5K90l
         W8cg==
X-Forwarded-Encrypted: i=1; AJvYcCUTprGkuENVH03Z+nqUpC8dPOr93Wxmu8UdctHaq+ziwz8RVXCIHuQsxeRK43UzbJ1xdWa9jgUogLeX8bfjgxh7Pkm/3JftFWN2
X-Gm-Message-State: AOJu0YxPv14jOBJj1F0Gh8akVDBLe/jEHBAgBWlvB0U0wOKYB2ixUzSw
	E7GlGOe4/6oRnLWQz8Xqo2fUCn9aJOr0boaaltthvuiOlTM5mtxsFUXQKJObTr5M7z6yTxhE0rm
	Hkwwi7DgfFmPHlRlITOGFcsG7h8spevpw/ODAoA==
X-Google-Smtp-Source: AGHT+IHGDWiYA4gxxfNGX16WDAPwnIZq8VLG/7+YcSFFrHFbrxAB9lU1euM5kVqthhxJ26B5ZI3RZy5fWZ0Q/yhpQmQ=
X-Received: by 2002:a17:907:7204:b0:a7a:b070:92d1 with SMTP id
 a640c23a62f3a-a7dc517b48dmr937619966b.46.1722883139711; Mon, 05 Aug 2024
 11:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805173816.3722002-1-jesse@rivosinc.com>
In-Reply-To: <20240805173816.3722002-1-jesse@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Mon, 5 Aug 2024 11:38:23 -0700
Message-ID: <CALs-HstYwwgPAOP22V1A6iTX85eRqRp4b4039pewsDHus_dLgQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] RISC-V: Add parameter to unaligned access speed
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Eric Biggers <ebiggers@google.com>, Greentime Hu <greentime.hu@sifive.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin <costa.shul@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 10:38=E2=80=AFAM Jesse Taube <jesse@rivosinc.com> wr=
ote:
>
> Add a kernel parameter to the unaligned access speed. This allows
> skiping of the speed tests for unaligned accesses, which often is very
> slow.
>
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>

How come this is a command line parameter rather than a Kconfig
option? I could be wrong, so I'll lay out my rationale and people can
pick it apart if I've got a bad assumption.

I think of commandline parameters as (mostly) something end users
twiddle with, versus kconfig options as something system builders set
up. I'd largely expect end users not to notice two ticks at boot time.
I'd expect its system builders and fleet managers, who know their
hardware and build their kernels optimized for it, are the ones who
would want to shave off this time and go straight to the known answer.
Anecdotally, at ChromeOS we had a strong preference for Kconfig
options, as they were easier to compose and maintain than a loose pile
of commandline arguments.

The commit text doesn't go into the rationale, intended audience, or
expected usage, so maybe my guesses miss the mark on what you're
thinking.
-Evan
