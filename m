Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F43B27AC31
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 06:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783665034; cv=pass; b=kj8lQpmMPnBYEyrfDMZjBOBIejGvZCuZJL0J3rUkCp3lL0Dwoicn0fRxlsMVJzzhHKYUO/p+ievIlna/Luhmw5fqzKg4I36gSgvJk3ETww2tzIOVNGcVj4C9IsT2mfgKzX98a4aKfrKwjaCHB404qxXi65XmsKi0RUeomDIF7bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783665034; c=relaxed/simple;
	bh=6X4b53rZef1KKZD4TQJDBFQHHBhHup5eeeap5U4K8mM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DX99XYcdtzws1jA1k8619Z/gLesAAbc0UfhJLu2NRx64MD1ukqMatAL238XRhp2/hj4zBffiqBQ867QwE0rddxCYfMotf7St/oq0t31fB3FWiB7zDYRfm6zddChRx0MWEM8Qbc9WC108PI+2hWTrrYHrCLRlPAQ2Kjd+fJ5hpeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o0tFKQK1; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o0tFKQK1"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-664cdeab266so871682d50.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 23:30:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783665031; cv=none;
        d=google.com; s=arc-20260327;
        b=BLoEBgqs9rTXH/B/pI/mdrXArlT+Z8SC/g/XeAsZmKXH2gfmRPjTHpt80UZ+RMAUWt
         hcdjAqOz4m+YKT5myU/k7mq63x4mAFsBBAB1JXZbYfSniTYONGV2bYM4eMC9tvk5217u
         1pX4Cpot9OwvyGluXq0oQi+PTTly3bcIe/v/foYB1fIde9USNnJjLozFqv9c2k5Rb2Fz
         mv2ypYGaGzAyA7XLjmH7bldjkAVrwRfRCtUOg/7w/+z231W2E9FuAYa0OGP7u43XPZ+L
         kJZ9OkH6NdUBOEHGgY4Vci8zJQFQeWXdHGcCdd6I/IWCr5fa2bqgyx5kW08SYzG5ueDL
         YTTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZT819g/Oq6qSvxizAhqmr/HnAVYEmomTbXe1mM2C/vA=;
        fh=bCHwUXXf1n5V2ke6BQ9aKpip4Ufz03Jhh3zJhZ48se8=;
        b=W3rRlYSXnpSmPrDMJkdSkbdNC/E7MdEcuEO8nfPb/m5LB1sbsQKoTk99eDahPfncp7
         K+/yKLUEWbY3FddTaWW1a/x0xOtrSReRwF0ipxA+XvrpMX2j5zh+ZLWOiU2jYCrc1iE3
         xqkAYSSRBr8iLCP3JigzefNpqR7wmpbVVjmjUtPlDET6TMKw1Z25npxwRewmxcZipyEY
         QHtWWQ0P37atMtntXjP05isM2/TBEmBB7QSSgM64BAxkgM9ejmGt7sudHc/yDnRDeiaA
         dcDt3OwlhVk+bIlOhBgeQj8td/5SSwdwVk9ZxnShSG/qwA9e66nCY/9LB27LmuRMXQai
         hhmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783665031; x=1784269831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZT819g/Oq6qSvxizAhqmr/HnAVYEmomTbXe1mM2C/vA=;
        b=o0tFKQK1nTrmzcKqPrvzT2BSemjMZQsacDQtokEmpGpWSMMvYwxssxtW2cuGpLuKku
         k+pVfIlyh63KxnrGpDdjKfF7tPPJBijGVEMe+iPJg74B9IxLfMbsN9pua2CEBk11Gv9G
         FFq81A6uuF3EICXeDedAPOHLV9WwNYHlNM2DVcwJ0Txzz/Tthpb0Xov72UIoy3a2tYEV
         y8C8n5PrBgDvUWir8CjEk4oIizpkWkrcrA7leWzERsbqYNfRMrJaUBd8xLKzNZ3m7qhl
         kDsqdUmaOqBgzLlMwtQeHGYZHourdgtGVl+oSOWD8MRLN5q7BBxSB61KISycMMGrCukj
         4p7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783665031; x=1784269831;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZT819g/Oq6qSvxizAhqmr/HnAVYEmomTbXe1mM2C/vA=;
        b=M+nABOPJpOPXTKMfpnPiEBc7mG/aS0IKKTJu4Ju9wiWo2+wNgmxVEs0g34/UMkBzAQ
         hu79VqNZ+f7FazeeHHcym4og08zI6EQ5Ri/BopupN/QVnLuH/3Udyp4zIsc3UlvBhxek
         zSs/3nD7B41QZfPzys2pXs+oS/uxO/Bu1JgI6fXI4b7EXQBUldvLoFAuOmnGR3dmubcI
         Z8tURN0Amkuep8nzxJt7lDxyAb721/AfD58Kbp6VUaPNYG+28GUKjXKrxG/IIkQWfX76
         ILMYQlt0V1ZhrlocaUWqfUFBfDUH5skcVpT+tZaRfEhsf6zPrgbO9lHeR+ZCi2yt7WGM
         J0RA==
X-Forwarded-Encrypted: i=1; AHgh+RoN2beMSZTL7XEh62QlzlUDbaOs+QFAPe3tKGF9FUWZK/nyjURN8LpVZC1RbdYjHNN+jlaqGoM2e7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQhs4KUDf+ilDw7YZIyouQtO8E0U2sw47iXRypPGZJOCzT5Mjy
	YBsH6EUhsjuhsPG+eEPBizWzbJ7FTr3XL2iWUWQ0mgQC11TWP2JvvPyWmuePkJeQWbKCJFYXCd1
	dtSu9Xf7qYU7C/4p5o+04kWBO+0LoZnCtEFMy+IM0dw==
X-Gm-Gg: AfdE7ckB5Nf25P55NWsCSqUb+ZGjDWNuV9gtcuhFE4dTaz6154qIqj6DTAOqFayVe+T
	/kVxpGvH8fmi83ad2dMzA0l099Wy1GKtTnvC14pFbq/QXD0EA+H7EqN2pUlkKEYZ5kiWTMnKC61
	sXfbIOwZhlkp9iQqA+cctWHnQ77yDP+yYegr0knMlsvftGqpKvvjSoujgnHZpK4RZLZITI+vV5C
	mGZ6UD+U6DHE8Tdaw5g7AGCb5+HN5zxA5nfa5F/X0cZICSDy6q8AuhStr0h8L5I4cwbaQNxk4Uu
	h6jCtlZBlXSbY+qsDbJ+atUHPX2zGwyXLvMuOsKohf8/EwErh4EJfx9nxgG3YD02JbsdMoHCYC8
	wzdpePXYqRXpErVdH3shP0wIfvcUtN975KqsDeWqNBAQVLXC6IbI3B8L+Iy8XB5BP4i+Lgd4caT
	LUji2hht7mjIx1JH8h3R3Yr+DwD+KBpapkPR1BBrKX70dA7bLJo7RgQHXS5vtsK9+tpddF+HA6y
	ZE4aMJE+OoquDAZYmfEJ3ie/5jVPrtw6lACUU4zas02/+tr8AgP2eUB3eszb1qunXAZ810OP9Xc
	2BUd9RHpib78UgqWTObQXbOyK987PqIo3KjmulPX63KCZv1U8vxj00A6hlNRsWSnFHvEjUY=
X-Received: by 2002:a05:690e:1609:b0:667:9eb2:8ffd with SMTP id
 956f58d0204a3-6679f25cc74mr4981051d50.90.1783665031305; Thu, 09 Jul 2026
 23:30:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701091226.7SWW4TrT@linutronix.de>
In-Reply-To: <20260701091226.7SWW4TrT@linutronix.de>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Fri, 10 Jul 2026 09:29:55 +0300
X-Gm-Features: AUfX_mxLJVuqDQuycLYMMiskfwdItuud7PupTjy9MFHq6Q3HmuV1dekuQzstXtk
Message-ID: <CAC_iWj+xDErhPeKGtsLK=nvPB7P8cQE3g9XCkaWf-d_j85FxCQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Extend the real-time hardware bits with
 some firmware bits
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "jenswi@kernel.org" <jenswi@kernel.org>
Cc: linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	Ard Biesheuvel <ardb@kernel.org>, Clark Williams <clrkwllms@kernel.org>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian!

I'll let Jens fill in the gaps. Some general comments below.

On Wed, 1 Jul 2026 at 12:12, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> I have been reviewing how OP=E2=80=91TEE is implemented and how secure=E2=
=80=91world
> invocations behave. The goal was to determine whether an OP=E2=80=91TEE c=
all can
> delay the Linux side and introduce latency depending on the time spent
> in the secure world.
>
> Similar latency effects are already known for EFI runtime services, but
> this was not documented. To mitigate the impact, EFI runtime invocations
> can be restricted to specific CPUs so that real=E2=80=91time workloads on=
 other
> CPUs remain unaffected. This mechanism, however, is only described in
> the commit that introduced it.
>
> This change adds a firmware section that documents these behaviours
> explicitly. It highlights cases where firmware can delay the kernel,
> information that may be unfamiliar to some users and surprising-or
> concerning-to others.
>
> Assisted-by: Microsoft-Copilot
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>
> I would appreciate an ACK from the OP-TEE camp that I got my little
> research right.
>
>  Documentation/core-api/real-time/hardware.rst | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>
> diff --git a/Documentation/core-api/real-time/hardware.rst b/Documentatio=
n/core-api/real-time/hardware.rst
> index 19f9bb3786e03..fb113848c2f70 100644
> --- a/Documentation/core-api/real-time/hardware.rst
> +++ b/Documentation/core-api/real-time/hardware.rst
> @@ -130,3 +130,95 @@ https://github.com/Linutronix/RTC-Testbench.

[...]

> +
> +OP-TEE (ARM)
> +~~~~~~~~~~~~

That's RISC-V as well nowadays

> +
> +OP=E2=80=91TEE uses a global serialization mechanism (the "big lock"), e=
nsuring that on
> +each core only one OP=E2=80=91TEE thread executes secure=E2=80=91world c=
ode at a time.
> +
> +Execution flows from the normal world (Linux) into the secure world (OP=
=E2=80=91TEE)
> +through the secure monitor at EL3. Linux and OP=E2=80=91TEE cannot disab=
le or mask each
> +other=E2=80=99s interrupts because both run at EL1 in different security=
 states.

That's not always true. It depends on a combination of OP-TEE and TF-A
configs iirc.
The most common though is that IRQs and FIQs are directly delivered to
S-EL1, in which case OP-TEE can mask IRQs.
There's also a difference between GICv2 and GICv3 in the way
interrupts are delivered.

> +
> +Architecturally, the secure monitor can mask or reroute normal=E2=80=91w=
orld interrupts
> +before entering the secure world. In a correct OP=E2=80=91TEE/ TF=E2=80=
=91A implementation, it
> +does not do this for the duration of secure calls. Normal=E2=80=91world =
interrupts
> +remain deliverable, and a normal=E2=80=91world IRQ will preempt OP=E2=80=
=91TEE via EL3 and
> +return control to Linux.

The 'sane' case is indeed where IRQs are delivered to OP-TEE which
exits back to Linux immediately.

> +
> +Secure=E2=80=91world interrupts (FIQs) are possible if the SoC routes a =
device's
> +interrupt as secure. Such a secure FIQ will preempt Linux immediately, t=
rap
> +into EL3, and transfer control to OP=E2=80=91TEE's secure interrupt hand=
ler. Linux
> +cannot mask or preempt this. Secure FIQ handlers must therefore be extre=
mely
> +short to avoid introducing noticeable latency.

There are also 'fast SMCs', which run with IRQs disabled for their
entire duration.

> +
> +The transition from normal world -> secure monitor -> OP=E2=80=91TEE and=
 back introduces
> +additional latency due to world switching and context save/ restore. Thi=
s
> +overhead is typically a few microseconds and usually remains in the nois=
e
> +floor.

That's correct.

> +
> +If the secure monitor masks normal=E2=80=91world interrupts during OP=E2=
=80=91TEE invocations,
> +or if OP=E2=80=91TEE uses long=E2=80=91running secure FIQ handlers, then=
 OP=E2=80=91TEE can introduce
> +measurable latency spikes.
> --
> 2.53.0
>

Overall I think this is worth documenting, but infortunately there's a
wider range of configs and corner cases we have to describe.

Cheers
/Ilias
