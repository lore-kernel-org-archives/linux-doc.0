Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A771F4285
	for <linux-doc@vger.kernel.org>; Tue,  1 Jul 2025 06:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351426; cv=none; b=EHTYouaxHWgQdubpKlcXvLxsGy/5C22NNdV57jpMjphKz7eHwbytLp9v4UHYAbwqcJYGX0FkJxE71ddd0UEpxg5uCz1hRJHXwEAB6bDfPqL90dwZxdcMg+ptr1sAaBC/yG9EnFyR2o127NLj+gupyr5tMX5rUfdkUWML4lP3EaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351426; c=relaxed/simple;
	bh=/jymfu3xRxUL4nTv5dvSQBmcbQG4COg2M3oUtazcjnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i2UOguHPFXNedp5FoIic9NV6a0+9mEbwbEo4z7vifSA21G1JCkMw4/7XR/1hfiidxI0Ko8KK8kF8+7in8hfZRHhJcPuObs8UfrtVZ33qQPBWRmj/3bcL+Ee08OLYQc6xUi6O0QJi6dLaEWVW8Kk6p3a/Vgetyaad/5Ax5XDmlfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=JvpgWZsI; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="JvpgWZsI"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32aabfd3813so30042601fa.3
        for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 23:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751351422; x=1751956222; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jymfu3xRxUL4nTv5dvSQBmcbQG4COg2M3oUtazcjnU=;
        b=JvpgWZsIJFJ9VS/DKqAYe8YiZb63CMCUKXvGJT9eFwv6MprzkdD/o5Qa7GsETny4jX
         k+kGV/JK/VhQvHc4aUjz6EnoP2FejdbOHagajKGfwbTFVoBDpDp/H2uiIrhKD+gNGkq8
         pnOlPawYxc6fALHxherJ2ICajiA4DHjoj01bCVINHQGlqWBxPR63KpNBAqAPv2KTQeog
         cemZNXO4RFgoYetk7GguMlBhMn6E3xf2OGeggJpC+wN4WkMJvjc0b2+SusgBgPQhKb6E
         oDCMHRaCBuJhKzBBwLnTR1iBrZN8ZZEzS8bpzocjmqicls5XuPjQxA3BGc1TLY7VSRyn
         /p6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751351422; x=1751956222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jymfu3xRxUL4nTv5dvSQBmcbQG4COg2M3oUtazcjnU=;
        b=K57TKk/JF9veKmvzhrPvYTtr3G8jS0Gl9bUGg0Fk+PIEofmk9KgGp5oHF2lj3oUHRf
         thZMKeZVBF5LYu89/vz7ZF9MijxazTii+QzFhZjRKSnJgs9r9HP+3NWq0IXJYlgktI/C
         d2qHjmlsd2SHNL+AiVPGM3OgRYbtC9BZ3ekUwewfdCBo7K3fX4KRKrQiYQxojQxNbVDs
         20zoYPqXixNfAB4MaUGWIZLcdySgdNuMeQqDsW7gRGYDVekrAqZMxPybKf/gsvNUChRr
         ovpHkR16eIZMh6TPs5q42YouhcAHcdQcNCRRYHuup4STz9oy50Z30vCM6dygBoZQ622l
         swbw==
X-Forwarded-Encrypted: i=1; AJvYcCUKRyJ9MTXL6UUKtfv7LsQEt8pMszxMSBh4eIZOz6EmMJnR/LLN+Oe6UXrRwTpi7AbyUxVh72OZWTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Dk5ULGXWGDDAOOYTmzK5jIm82r3fmLcAnfAsxEvpp/IaboCe
	O7ZaL1F68yr3Li3Ps5VAirjhne1sKGjS4j8y6pE7+ObOvzF9lcurHVFdJtgWBLeJphNS3dEdyR5
	PvjPvAy0V6Q8+rn30sftdplUZQ6230XD73Md4GbQB4Wd9/oK9aPSY
X-Gm-Gg: ASbGnctLFlMi7Vv+dSkDz88t/UzpL8DjdGltzsDGGnlf5rVCeoRYTY1A9aMwK4deawH
	rVnbeK3Cum9SnIIsk/Y9kOG5ceMQ+WRxFQJ0k2rc8uPOl4AKh8HcIQr8nvgJe5ZIn+n9vT35zPu
	dya4RymFbbuWFv9r8AoCTcuoQMJOJERdkj738Wp2ozsF2x
X-Google-Smtp-Source: AGHT+IGH+LGsRYJu48HNl0J1fqNWuehHDcqXDQ2apcZ5zy2p4HTOSTuf2WNZWxIzC2FQvJFiTjte6PqMiOdGmU15sTY=
X-Received: by 2002:a05:6512:acd:b0:550:d4f3:84a6 with SMTP id
 2adb3069b0e04-5550b89706bmr5181580e87.33.1751351421803; Mon, 30 Jun 2025
 23:30:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625161715.1003948-1-apatel@ventanamicro.com> <87wm8tmcsr.ffs@tglx>
In-Reply-To: <87wm8tmcsr.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 1 Jul 2025 12:00:09 +0530
X-Gm-Features: Ac12FXxY7r-9px3Hqf4aneQ_IL7BH8XKIbw1hzdqfKKMngLAn19g0L7LHBLnNaM
Message-ID: <CAK9=C2Ue36iF8X17n-D70BkMk69bGKb+8dSmro6SEo5i2d+OSg@mail.gmail.com>
Subject: Re: [PATCH] irqchip: riscv-imsic: Add kernel parameter to disable IPIs
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 9:39=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Wed, Jun 25 2025 at 21:47, Anup Patel wrote:
>
> $Subject...
>
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-=
subject
>
> Is it that hard?

Not sure why I chose a different subject prefix this time. I will update
this in the next revision.

>
> > When injecting IPIs to a set of harts, the IMSIC IPI support will
> > do a separate MMIO write to SETIPNUM_LE register of each target
> > hart. This means on a platform where IMSIC is trap-n-emulated,
> > there will be N MMIO traps when injecting IPI to N target harts
> > hence IPIs based on IMSIC software injected MSI is slow compared
> > to the SBI IPI extension.
> >
> > Add a kernel parameter to disable IPIs in IMSIC driver for platforms
> > with trap-n-emulated IMSIC.
>
> Why do you need a kernel parameter for that. If the platform uses trap-n
> emulation, then disable the IPI muck automatically, no?
>

Unfortunately, we don't have DT, ACPI, or any other way of discovering
whether underlying IMSIC is trap-n-emulated. In fact, the DT or ACPI
passed to a KVM Guest is the same irrespective of whether underlying
IMSIC is trap-n-emulated or backed by hardware IMSIC VS-file.

Using software injected MSIs as IPIs is purely a software choice in the
IMSIC driver so this new kernel parameter allows users to override it.

Regards,
Anup
