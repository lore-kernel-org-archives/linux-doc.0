Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603F72163A9
	for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 07:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734594391; cv=none; b=EWaGmYFwSbfVaeQmEOHCZRMCwx2BmroJkBuTi75GwyUdG51KSZ7PC84957fEGlgypowULMEJi8BN119cEdI3lgAJgrlZJxqjlc7WchKghG1BMOdEESbjqDy0cJ5xz0so8P7z+YDjNG1VLQTEHYD2S1d4vVjMV/2Csc1G84eC2Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734594391; c=relaxed/simple;
	bh=7somDA3en/hJolBi8kdko15hS7Vg45ntK/V1RkSgs4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t9VSmF9ptg1lnsFr+jdZSuDOTZbyZLdbfvsVdZJyQ9obk12QrmlG4R7bDTMAtdj+Vc00bX/C273ab5ACKDnwHCHOM6fHtWQre5Gdg9Vn7Uip2OE7z/rNbYzG1Yi7XguqMbA8l8hejpzG9PczxC5cxJCfUMmbmilIX1qWhWrwOMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=fNtPrkBx; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="fNtPrkBx"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-844e161a8b4so15130939f.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 23:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1734594388; x=1735199188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzlfxWAFyTOjTnsD6DMp9PLLcJQhroXi6XJ0Ja4jKS8=;
        b=fNtPrkBxghH49xHCTr69cdcSqidEDMMiFD52lk9xL/LNFTzR3ktQUnJ60kqHpy8+Jl
         88LTjAK//boS0ZHZ1yYHhxvFM9WN3powY0nkj9n+V3tHS2QeSn2lFxbKdS99IiDAH4jr
         0R7AxQihNjiXO3Pw7sW4p4dcFj4LjXaRyfHRhAzDRBm8tinH9ExzvbtG0rAAVRXeZzHc
         SlhjviBBZkgps+t+bVlWKBrR6t8MHSq9zYBhEg/v/PibsdGjgvvT/f7T3C58xblGqWG1
         d2kfFp+BDqlcgkEJfHFrMBWs9hqAQsNvZ59l+abZlb+ToicjWe8zYOM6fjxdIN5j8NlD
         BlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734594388; x=1735199188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzlfxWAFyTOjTnsD6DMp9PLLcJQhroXi6XJ0Ja4jKS8=;
        b=GCu/gVfBVzTDvHEFgw4NPgrEDxlWLJHApSgGpKNV8f6rwydiyjhSSJ/YrguJB6JUN/
         6sWuG29lm/8EOybSBgi8syFw9Wi5DVaK4/5DLtBpgyMCm7wag5sOd88bnWENMDOe56Bf
         2xdHOtHtSLZnLxmtxCBeDLS9W+tQ27lBATAus1muRDi4zF6eZj78xP7kicphRLeERtYt
         5N4OD2lZ4bC0jc/XnjvS33Y0Qjq8gwtwKgbGFTtWhn+Tch2HPev4whoEsokgRaVQ1Or/
         SI4+7lLQ8/YRUjHhatQVg5zi2z5FtyKkec2ibAtRVEiFSjCTzWQU8RfbOJ454xbT5js4
         FC2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsghMI4BQJf3cD2LTAhKLO9lXhMXljDvQMWClnt7JBAi6qLTq+WimRJgDiWGtSAgaEJI2c5vItacY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSX/LvfHJHAr9XXBoPtSep/YL4CVhIikBLG8gyqRSnGsWggPMG
	ro00Ck5pes97paU8g+m6lDQD18WNhO+oX1a0QEDDy9w3ErHT2xpN2yM7lyrei2zUnzfEJf8Qf4M
	hguJLczXPuqET/7zCt6ZcxN+9zEmo0wRTFwWnLQ==
X-Gm-Gg: ASbGncukAL7PoSnCzQblIeTO56xWhh2NEIijwbgXntTDpm8Rwla4BMl2mye1fuXIYfC
	6/0SHcqoalxUGyE5YfOj05mJDk08Fi9PFIW8X0jmq
X-Google-Smtp-Source: AGHT+IEl2VHIINWWOqX/TIjrPphy37QQEWpY//lPf2cQsAGp5Fr2UzQ2zg1QergkXg+gvTvXBtQ46kjIk7rWXXu2I5s=
X-Received: by 2002:a05:6e02:164e:b0:3a7:8208:b847 with SMTP id
 e9e14a558f8ab-3c014994c32mr17541505ab.22.1734594388418; Wed, 18 Dec 2024
 23:46:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240619153913.867263-1-cleger@rivosinc.com>
In-Reply-To: <20240619153913.867263-1-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Dec 2024 13:16:16 +0530
X-Gm-Features: AbW1kvZvVibTIPOmSKzCzxVje5Rw-BrkbRTFTVX8TQ75LxnNOw1pz_vbOq-3DA4
Message-ID: <CAAhSdy0NkNgZraqnrTGtGYn-aM+tJ8hhGF4n3U+JP+VOF2BJfw@mail.gmail.com>
Subject: Re: [PATCH 0/5] riscv: add support for Zaamo and Zalrsc extensions
To: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Palmer,

On Wed, Jun 19, 2024 at 9:11=E2=80=AFPM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
> Since commit e87412e621f1 ("integrate Zaamo and Zalrsc text (#1304)"),
> the A extension has been described as a set of instructions provided by
> Zaamo and Zalrsc. Add these two extensions.
>
> This series is based on the Zc one [1].
>
> Link: https://lore.kernel.org/linux-riscv/20240619113529.676940-1-cleger@=
rivosinc.com/
>
> ---
>
> Cl=C3=A9ment L=C3=A9ger (5):
>   dt-bindings: riscv: add Zaamo and Zalrsc ISA extension description
>   riscv: add parsing for Zaamo and Zalrsc extensions
>   riscv: hwprobe: export Zaamo and Zalrsc extensions
>   RISC-V: KVM: Allow Zaamo/Zalrsc extensions for Guest/VM
>   KVM: riscv: selftests: Add Zaamo/Zalrsc extensions to get-reg-list
>     test

These patches conflict with some of the KVM patches which
I have queued for Linux-6.14.

If you can ACK these patches then I can take it through the
KVM RISC-V tree.

Regards,
Anup

>
>  Documentation/arch/riscv/hwprobe.rst          |  8 ++++++++
>  .../devicetree/bindings/riscv/extensions.yaml | 19 +++++++++++++++++++
>  arch/riscv/include/asm/hwcap.h                |  2 ++
>  arch/riscv/include/uapi/asm/hwprobe.h         |  2 ++
>  arch/riscv/include/uapi/asm/kvm.h             |  2 ++
>  arch/riscv/kernel/cpufeature.c                |  9 ++++++++-
>  arch/riscv/kernel/sys_hwprobe.c               |  2 ++
>  arch/riscv/kvm/vcpu_onereg.c                  |  4 ++++
>  .../selftests/kvm/riscv/get-reg-list.c        |  8 ++++++++
>  9 files changed, 55 insertions(+), 1 deletion(-)
>
> --
> 2.45.2
>
