Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAF13E1713
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 07:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783670388; cv=pass; b=oJKOeWHzfME8c/36IaRD9wbJH8aKqNgPXsOkU/GGAhQCDVu0R6aNU7ltqti1qiV/SPKAzcn/OH0WGegyM5b8iwtNQ9Y3IpcI0HCAl/PC/WFaVrUnEOonisqQYhQ9WHDoiW9rx3GwXyQ76nf8AARQ0G4jDRTb2aOEHVamm3rP+Rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783670388; c=relaxed/simple;
	bh=VOWM6CrABsSE1ZgAmtTX+wv+twEBAQ/PjFUZeWerkIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tb2ONGS4pjjAyGf6nDA8JomZpCaBxFI4hAsGN75gLEIg8RmOX7GjHGmfkNUqq1c6HLCrxmV9i9cl9ncs1qyOXAEQDAhDUxCcTAMMkbvOq8h63j+C/M66ZVFDDkkyqQoNHt9joIr91DiT8x0KGLxSjT/3deRR8MR196Xh3x9JbZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iIANNGyd; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iIANNGyd"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-667971437d6so879694d50.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 00:59:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783670386; cv=none;
        d=google.com; s=arc-20260327;
        b=RSPhkTllW2TQMvgpIRsFmlEyfhuqtLJCH4afu7frP1xu71MkwXEQD+6BDdLekRbpeS
         kzq3QNH+6Hfj/qfUvB/Tf6meRemtjZZSCPbsXEOPH0v6X+x3bMbI2sOR8/V6jFBvPy62
         BaGyvOZNdN7p7167ts6a4ki+Z4B3gTPKvLwttmFWft31b8klPFDyRIFsLgiPO0RqOM21
         0daPakSzosygnO9CW7cIg+v8hTtB2R2VARy7GxZ4dU0IMmReUGGgSro3FNwXeYpx8Brl
         MPiENu2c1LcZ3QzB6eyIBCvuIm5v09R8c5uie69Q9IfsQTVB0qYYlMZSF3OpEM1tnb04
         cJJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VOWM6CrABsSE1ZgAmtTX+wv+twEBAQ/PjFUZeWerkIA=;
        fh=9wPTKKmy/LWwH740OXVKPlEUhvd/v5BRtBspjYwXK08=;
        b=jmy9eNZ8R3klIHDm/E1Osn9+akhjE+hbfD3QJrOh2jT9gWyBcsIyBOVJXxr34kesyI
         21Bd0P9C+r6aTuDRXAy4CJFQCpgf/sepf2u/7jVRbu8yY73qUGuppHdGKWO/yYysFncC
         Awg2/3hcr/aR0p7s+HQOeiClSMUbnCRIE4hHRcU16wXal2JTYwz7mZ1kBcpYgsGRiSiU
         RTDIXApX0O3wBeKHWVdwTHS6WSCYpqLpBxilThcO4eE5N+hGiLeQFgNTvZh2A2vSxrhZ
         gaPzhHsMf/3AOk+hE90pfjBOIRyl5YqsAlQb1mmz7e3WegtM6OfGcmusY+DRWBknXoGF
         1laQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783670386; x=1784275186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VOWM6CrABsSE1ZgAmtTX+wv+twEBAQ/PjFUZeWerkIA=;
        b=iIANNGydPn9B6IsfEs3bw1zmDrsBzGJRxv4Qp9w95AnzrFspRgMY5qTSS4yvvqTJ4s
         cWZq+Cl74kFRxy7zjUzLw2pqHb0f225cwuSNSD0XULtMblY3EzgCis+4eHIfex7t9zET
         EE8L9siQzkxFU8M6vwk16zzgra2C9bUmvaUAjOS3/YlBQwvrqgkEYmHuVH5sObAWOOGZ
         4OM4dZwtZbt9kJmveq8sLteLyQam6z/ViGH/lSixmZAFw6JBKTkkwSzltwBqiAdmrrbi
         AmYBYWS6VQ+tyKNOqBaqIckPsuFYzYqfMrvkjlQbMlIXNTAcitNand7MEJYBCzY5ccBK
         aXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670386; x=1784275186;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VOWM6CrABsSE1ZgAmtTX+wv+twEBAQ/PjFUZeWerkIA=;
        b=V4lxaF++XAZqShCHBJt44l6JBrJo1W9KNbEjiC0gx77PyitgeCqa+dJqRWvgzrSelJ
         VhEfW/hEQAPOLbNNgBMy6VAGJHo04lwUPIpWgP914gr6NPUpwSasZohsg2CiRSjgO1G4
         afHNBmt9gA72i/ajg8zKXXRamKiXCPc50X5iXudA590POToHyyChFBPxAShA5FNh+DqI
         Y0GsRyvpwQp2WqGVk15ZhoAy5r3YycXBMN4L2grZ/kuLLzc1x25k4adhigZN56o+k0K/
         zlaZyBmImipMxtx0W3sgbxUEQgrvhmDKqfMOknnoQXkEAq7K+k9I4H80FQkaQIenwZXD
         cbBA==
X-Forwarded-Encrypted: i=1; AHgh+RrxrNvWOPldRySPExnrpYt60pg6oGQB9xmHJ/tExGiz1ZNnXcdJYrxLJ2pujhyA09oTF49xYOui6EU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC6sU9I9UOCU7iCwYLDPfB3V+pOaKvr3vRu5EKXXskdUdaIB2H
	giuTKEWgS1F+qmcMon1c1jaWdKIGIq3lPkLGWnsBMFUzbWIG6PLxFHGZaOMYF3ITupDeNg6x253
	T6xrZ2xLQzOrVsBgIerDXWLjH40YT70UdTKTaMxGK48R3QkoR4h8sztk=
X-Gm-Gg: AfdE7ckC9E3thUZHz1qLA5Fn6uoeyrF90o/yqoI2iXTKhaFDj0AHC8tpkc+yOELSPEA
	EJJxY+Y3JAn5NsuhxuB0s23K3DrxKsoBY6Ho/RrgxLE/+jgV7plPtIVeCP6CB3HxdVl2ZLsJXF+
	927ozXgC9BJm7ZVmXDiWObsNfHAXbBuQq80NeXQmlUJcJ6W9KN0ZmMotasyYTBl7EYWkLQm2Ulc
	RUq93uP4Dz0vTDNrh2igEhZwyMelQOoUUGJuMJiX+0Cu5XvvvtmqLGYeVEZb8Kbq10XcDntiiFS
	Nj9N8Kre7rawuaQ8O3COuwO8QiY2Y8AbzeNTwUWY/JV77JspLczGfEt+34ZA0RjUcblVkH0hx6/
	nFw6I6tCAO6v6n0xSNK6DeI0nbMnY0BCVl7FkRsIpg0nL5o09qcvh/8DzSeHh+YF+vcpZtsq4z5
	qafLzcIZn5yXBoLpJdar1CB9Ib9VeU7h8EIT+Z/JoJjNMKFSHGIcNAs64Deikh3DHEBjfwZaoaV
	dOsLQdZ09PoiLW0bWB+HOAlmBhConGDTEqxtmbGvMAvpdeXhAned89blB9o2vrs+8t/XlDOVu3K
	xdeBt8JFyGgiFnoiXATujYqB3mFTF+NkVLFN6heGZlHZMMrPvU5R5rvnYeBVoXAvExRcSdE=
X-Received: by 2002:a05:690e:43d4:b0:664:99a3:34a7 with SMTP id
 956f58d0204a3-6679f1ac64amr4926164d50.60.1783670032531; Fri, 10 Jul 2026
 00:53:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701091226.7SWW4TrT@linutronix.de> <CAC_iWj+xDErhPeKGtsLK=nvPB7P8cQE3g9XCkaWf-d_j85FxCQ@mail.gmail.com>
 <20260710073147.XJAJbIwc@linutronix.de>
In-Reply-To: <20260710073147.XJAJbIwc@linutronix.de>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Fri, 10 Jul 2026 10:53:16 +0300
X-Gm-Features: AVVi8CfEoTWISJnCnc9-eLJA2a3H9SubdRhk1-OoqodnM6Xg_e0TDYWFCpSokGU
Message-ID: <CAC_iWjLO3CAAFXE3s15Xcy3pWFK3ge5sWYmHHRBtcccKM2e1hw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Extend the real-time hardware bits with
 some firmware bits
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: "jenswi@kernel.org" <jenswi@kernel.org>, linux-rt-devel@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-efi@vger.kernel.org, 
	op-tee@lists.trustedfirmware.org, Ard Biesheuvel <ardb@kernel.org>, 
	Clark Williams <clrkwllms@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 10 Jul 2026 at 10:31, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2026-07-10 09:29:55 [+0300], Ilias Apalodimas wrote:
> > Hi Sebastian!
> Hi Ilias,
>
> > > +++ b/Documentation/core-api/real-time/hardware.rst
> > > @@ -130,3 +130,95 @@ https://github.com/Linutronix/RTC-Testbench.
> >
> > [...]
> >
> > > +
> > > +OP-TEE (ARM)
> > > +~~~~~~~~~~~~
> >
> > That's RISC-V as well nowadays
>
> I did not find much here. Their architecture isn't the same as on ARM is
> it? But the overall concept is the same, right?

I haven't checked the IRQ vectors on risc-v, but I assume they have a
similar logic since that's an OP-TEE design decision not a per
architecture one.

>
> > > +
> > > +OP=E2=80=91TEE uses a global serialization mechanism (the "big lock"=
), ensuring that on
> > > +each core only one OP=E2=80=91TEE thread executes secure=E2=80=91wor=
ld code at a time.
> > > +
> > > +Execution flows from the normal world (Linux) into the secure world =
(OP=E2=80=91TEE)
> > > +through the secure monitor at EL3. Linux and OP=E2=80=91TEE cannot d=
isable or mask each
> > > +other=E2=80=99s interrupts because both run at EL1 in different secu=
rity states.
> >
> > That's not always true. It depends on a combination of OP-TEE and TF-A
> > configs iirc.
> > The most common though is that IRQs and FIQs are directly delivered to
> > S-EL1, in which case OP-TEE can mask IRQs.
> > There's also a difference between GICv2 and GICv3 in the way
> > interrupts are delivered.
>
> You are saying that OP-TEE can mask Linux' interrupts or if OP-TEE
> instructs TF-A to do so (via config)?

OP-TEE can mask Linux IRQs

>
> > > +
> > > +Architecturally, the secure monitor can mask or reroute normal=E2=80=
=91world interrupts
> > > +before entering the secure world. In a correct OP=E2=80=91TEE/ TF=E2=
=80=91A implementation, it
> > > +does not do this for the duration of secure calls. Normal=E2=80=91wo=
rld interrupts
> > > +remain deliverable, and a normal=E2=80=91world IRQ will preempt OP=
=E2=80=91TEE via EL3 and
> > > +return control to Linux.
> >
> > The 'sane' case is indeed where IRQs are delivered to OP-TEE which
> > exits back to Linux immediately.
> >
> > > +
> > > +Secure=E2=80=91world interrupts (FIQs) are possible if the SoC route=
s a device's
> > > +interrupt as secure. Such a secure FIQ will preempt Linux immediatel=
y, trap
> > > +into EL3, and transfer control to OP=E2=80=91TEE's secure interrupt =
handler. Linux
> > > +cannot mask or preempt this. Secure FIQ handlers must therefore be e=
xtremely
> > > +short to avoid introducing noticeable latency.
> >
> > There are also 'fast SMCs', which run with IRQs disabled for their
> > entire duration.
>
> can their be distinguished somehow from normal SMC invocations or is
> just a consequence that the secure monitor does not enable interrupts
> during transition for some of the "functions"?

They can be identified. There's a function identifier defined in the
SMC calling conventions doc [0].
Bit 31 is always 1 for fast calls and 0 for yielding.

>
> > > +
> > > +The transition from normal world -> secure monitor -> OP=E2=80=91TEE=
 and back introduces
> > > +additional latency due to world switching and context save/ restore.=
 This
> > > +overhead is typically a few microseconds and usually remains in the =
noise
> > > +floor.
> >
> > That's correct.
> >
> > > +
> > > +If the secure monitor masks normal=E2=80=91world interrupts during O=
P=E2=80=91TEE invocations,
> > > +or if OP=E2=80=91TEE uses long=E2=80=91running secure FIQ handlers, =
then OP=E2=80=91TEE can introduce
> > > +measurable latency spikes.
> > > --
> > > 2.53.0
> > >
> >
> > Overall I think this is worth documenting, but infortunately there's a
> > wider range of configs and corner cases we have to describe.
>
> Okay.

[0] https://developer.arm.com/documentation/den0028/h/?lang=3Den

Cheers
/Ilias
>
> > Cheers
> > /Ilias
>
> Sebastian
