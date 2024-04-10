Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D190D1836F6
	for <linux-doc@vger.kernel.org>; Wed, 10 Apr 2024 21:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712784890; cv=none; b=lsqYG7aLCRMJ/63NI89Fl15cuBuO37OcChJA1sNYA6xo7CzKPXGQcwmJoFqMtqhJCwi6PgyR7Wnxr6PuUL7VTKz/NWTWtjqlaRNUUHmN2kPG40weX7n2Tz+q2+pCOCc7nyZKF34zWivLhkxT/6r72mJoGaX/1ONJwW3oTU5/2F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712784890; c=relaxed/simple;
	bh=+Zl2pAaKAA2HzyDnhWshXv9VyS5payJIT/fbySA2d9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPgD2JpT4RF2wrPL9gbWHTQyDD33v+g3juxzzn8VfM+cGhIljT/K5/8QrobWhztnh/fkP+kyXTV0stAH45NxfFBEaCO3h/bFjylYvD8gBLe5vOvS274KpjE0wqWuPA1oODXooDRVnpF6pFIeIBq/6wMBEpdweFSMGJ2FYZD2Xrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=kJe1cU1i; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="kJe1cU1i"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6181b9dc647so35372437b3.1
        for <linux-doc@vger.kernel.org>; Wed, 10 Apr 2024 14:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712784887; x=1713389687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCWiTOuyXFMcE85DuFu420bVCS/UPVrh/Hb5YvaLOl8=;
        b=kJe1cU1ikx4LojZpQfBUuxfP/ItKGXMjdEMO09nx+OWzWfUQOJh3h2KQpJKNMdMWqp
         8CJoXoCUzG/HvAVkcHes2ASfIiOlxsX1R/7X4hmP6mSdgVlx2a2XTaP1TqGbE7bf1AWO
         P0KuS97pMWGKTggW1KZjGLnknZyB4wcWaxyd8cawzsS55nwn0rQw0EZDdqNJCEdEkt9Y
         Z5bx5F9SyZHLjZRnX1TsMUMF9fTOg6OEGFXUmN2/f+qYE+MikMSIdGvo3D8i22lHgrVX
         RjwzTPN0Gd21NBgTKTqYRvA5/z0995MByw/4F8OF8ZME0Z24xFciNqclNGcjZdDdVEvG
         ZO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712784887; x=1713389687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCWiTOuyXFMcE85DuFu420bVCS/UPVrh/Hb5YvaLOl8=;
        b=PdAmuenwQ7rfF5uqmk7SZeAC78yHDk3Bb2/8nzjknqFIQLNpglySXd7HcZYGuEJ610
         XSmu3VjHJEfMRaoRvR5BKFnugn53ukoYeuMVwvSVUyj64jSzWhVWZxLzO+Rdz8U6Zzrf
         qejk0i4c2T+CqCAVa8dbD5RNXF4F7QE1bk7Iev6QtKNUHds89pdjXFKVcFumW4y2nVqL
         z81LexDWG4619idOPoqr2z5+NvqfKNSmSxznv51ZLbhg1gB/3SE32NcgHd+65Vo6IfTn
         49yRRGbLBLXldvhOfCtQKrB0kBz3yMGBoIk1RtyvxFHdGbeg2DgxOeTsqbgVRlGSdLFN
         kjrA==
X-Forwarded-Encrypted: i=1; AJvYcCUoXOiiEfFBj+tcF2K0WUAqHUxSFXZq3a632je95egQ+l7mPr9QrQMBQHxYDPHY45JKrIvrldNb4VB+C/513m8WFECQOfasi/Co
X-Gm-Message-State: AOJu0YwAFX9EhP00qfmoKiYTcnbao/iWUa5uj/T0G278EIWY93LVrXdQ
	cd1NhYb+J8ycHGBKKFtwRS5O3wLTiRglwPXxxJ9EQPfA5/hysce/M1zEoov0gk75sPEp0diZURP
	Zvypd5RX0nph4CwJC+6bYyWgVX9NzCZMKGWqXvQ==
X-Google-Smtp-Source: AGHT+IEJg6eBXgbrMvBxZrqHkCbyEafHccYY//puWMRuRRJPxivVjKGGtxP4Mzjd2PLpKtGs9YHHsRYFuI2P7eGObSs=
X-Received: by 2002:a81:e946:0:b0:609:fff2:3bbc with SMTP id
 e6-20020a81e946000000b00609fff23bbcmr3613852ywm.49.1712784886891; Wed, 10 Apr
 2024 14:34:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410091106.749233-1-cleger@rivosinc.com>
In-Reply-To: <20240410091106.749233-1-cleger@rivosinc.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 10 Apr 2024 14:34:33 -0700
Message-ID: <CAKC1njRJRnxj8XjwJ-Yx6Guu=9kSEdaFnxF1e+gXq9ij_j=atA@mail.gmail.com>
Subject: Re: [PATCH 00/10] Add support for a few Zc* extensions as well as Zcmop
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Anup Patel <anup@brainfault.org>, 
	Shuah Khan <shuah@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For the series:

Reviewed-by: Deepak Gupta <debug@rivosinc.com>

On Wed, Apr 10, 2024 at 2:13=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
> Add support for (yet again) more RVA23U64 missing extensions. Add
> support for Zcmop, Zca, Zcf, Zcd and Zcb extensions isa string parsing,
> hwprobe and kvm support. Zce, Zcmt and Zcmp extensions have been left
> out since they target microcontrollers/embedded CPUs and are not needed
> by RVA23U64
>
> This series is based on the Zimop one [1].
>
> Link: https://lore.kernel.org/linux-riscv/20240404103254.1752834-1-cleger=
@rivosinc.com/ [1]
>
> Cl=C3=A9ment L=C3=A9ger (10):
>   dt-bindings: riscv: add Zca, Zcf, Zcd and Zcb ISA extension
>     description
>   riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
>   riscv: hwprobe: export Zca, Zcf, Zcd and Zcb ISA extensions
>   RISC-V: KVM: Allow Zca, Zcf, Zcd and Zcb extensions for Guest/VM
>   KVM: riscv: selftests: Add some Zc* extensions to get-reg-list test
>   dt-bindings: riscv: add Zcmop ISA extension description
>   riscv: add ISA extension parsing for Zcmop
>   riscv: hwprobe: export Zcmop ISA extension
>   RISC-V: KVM: Allow Zcmop extension for Guest/VM
>   KVM: riscv: selftests: Add Zcmop extension to get-reg-list test
>
>  Documentation/arch/riscv/hwprobe.rst          | 24 ++++++++++++
>  .../devicetree/bindings/riscv/extensions.yaml | 37 +++++++++++++++++++
>  arch/riscv/include/asm/hwcap.h                |  5 +++
>  arch/riscv/include/uapi/asm/hwprobe.h         |  5 +++
>  arch/riscv/include/uapi/asm/kvm.h             |  5 +++
>  arch/riscv/kernel/cpufeature.c                |  5 +++
>  arch/riscv/kernel/sys_hwprobe.c               |  5 +++
>  arch/riscv/kvm/vcpu_onereg.c                  | 10 +++++
>  .../selftests/kvm/riscv/get-reg-list.c        | 20 ++++++++++
>  9 files changed, 116 insertions(+)
>
> --
> 2.43.0
>
>
