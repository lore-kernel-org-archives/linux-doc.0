Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64543305962
	for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 01:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773363644; cv=pass; b=LPh6yiA9IJ1zp6zGMhIBUsnnyNq0s7fThN875u0QsPP+2b3XGP4PwswXQGESKdSOM61ihR7/0agUitSSZj6lQZ6sGZMNU2zzmS5tAWwdurHKCx4iNzVkaBvhYnbf2zeuNMCfJ3UfqFYJf1eNymhIiZxngcUg3nKiz52rrJpYtnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773363644; c=relaxed/simple;
	bh=sWXbHUNWyCssRT+Z0j94kKl4zmDZN0doACSqgWVnHEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uAHvSHLOyZs008CnvU3zPnDxGUmSJIOnNmjpF4t8X59DQSK4arvfymOBa1kBMTSa19oeDWSyo2JBvlhiLA6DFG+asYQHmsHdhxpFjdPGKlYriOwngQ6z/zna7IH0irksRZmNVhxhY4ssgbh4wBvcWJDqyG49x9z+n7B2ZFFjM7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZA/lz0jz; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZA/lz0jz"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64937edbc9eso1740191d50.2
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 18:00:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773363641; cv=none;
        d=google.com; s=arc-20240605;
        b=Ii6cM/O1+wvj4kgU2EOLCTsbzbZg+yWIz8q36FOk85IQeXFRo6Jfi9uUfsGvVECZXo
         kiArmvuwaXiNvltgQFFSyKY+k5Sb6dV6MM6XfURGpz7fQiJ9c0bmKj1UTPsV6EyUJ04N
         QpqxFdH562jN3BUXbXfnmJdLTM/zRmhBBHXnuZFdeI2JxCktxiBifznHN8FxbG13qX1j
         k4hTbgt1FnMgfERrXGFKt+hRzRQWeRiRumH5s4GAq2ooJ96v4nvAUjpLnrfF0sVCCosc
         nn66WI9sTKEyizhE7nXnPsoAfVQDWOSf6ds0tv59XrJMA/4EC2mhkFJtm+P4MjSLX9Rf
         jCGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WEIoHUDBRKW7sPjWtgozpXFsqYAeqWilfaHlivAXGTA=;
        fh=w9bS8bc1H9EPQ1ID/onivhJalfhLx+MJQBnXtSWIBno=;
        b=DVqPnKtuJYY8K1sutap+9zbT56zaRRLogG4hOIUuSxqVDPsl2w4Qfb4su5kVf69kzF
         W1QeXvZ/TE9388lAZDoIcp1k9JHWIxgMEfk/tt8ulzrCOutaP8W1uLlvtACcPfhmM4Zj
         xZrrB3Sfr/GL4I8BaATB0C1dYwzngmTJcYzZzMdD5t02xxqdccZHqmqW0RPHfjsb/sxH
         gLABwShN+zxhxA+n8VUuODa9BiNA80NUWImCEq59E86MXcTIrXiEJlgT2elETpJDij1J
         8K1EHbQtNgQQ3giZOYXIHkme5wHU12OMwEXc+PmhxEPtEjBk1qZVU8rT8w+aJCPjP+xc
         lcgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773363641; x=1773968441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEIoHUDBRKW7sPjWtgozpXFsqYAeqWilfaHlivAXGTA=;
        b=ZA/lz0jzZ5SnEt27k5mt290nazi42vhGGnOyNcbDIrJk0WzjSHSUXA0OXFphwHSWli
         WNhDUXBka7oi/+/SldIRtUuf1Po9CwQ6Y0+CSBiC/7rRru2Mvrwgy2C7Lvu84y8UZU3c
         nmLVa2qKS2YKHBiYT/MZ/bSmE8EFdQz3BwQto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773363641; x=1773968441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WEIoHUDBRKW7sPjWtgozpXFsqYAeqWilfaHlivAXGTA=;
        b=im1ev7HWyaF3wkeHqIR9fXrIapMo0ZGdMbd6UNKJbPH7Wmwr1lC0pV8+vni2y5Md9Y
         lmxGINFoUNOpAhv3+l5ChXczwBzHQKMxZ2zlqsembyH+bgc0XwZRuRzck6+Z/lMpKode
         ssd+YWlSsMeCDlbwTizuR78Bieu8QzcfoBlACqX115MUKZhX5/6pJRmnxi/fBpskdjBn
         MYgdifVO9fQoIomIACyzKavd5zsquBXWYtcoFPvJsw2SmTEIOhD6CjQioPhIHonU3fXS
         x5FnGBiYeuoMm51xGfqm7X8kGGSBIPRFe0aNBUDCVRbQu2pK76syuztuWnnQMBUW0o4q
         SOsg==
X-Forwarded-Encrypted: i=1; AJvYcCXfKS2boqeNvi5975oTz27OTdPkuFkPlBWftsqZ1qtjNyZpW+3j4gAEFAW2alMX481+QxynSZLNelc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj/uRZmTa8z/Rn/n12Ptdkm+ufe690E7LcB6WXd7Vk/cg/PZFa
	Huvg/7RCbaxyNzOH8iYHHBcLV6ovtaerVpsVea+TNlRA/0TfHwJS8z6vfGzZsm268SHeIdCGSAc
	u+hMagacbrw7TIh/YzDzuI6Gc/IYRyRbUHZCLUsTS
X-Gm-Gg: ATEYQzzbqQhnIlDLZYUf21NKtcpMXIUVb+Bql26wgybm1j4PwIHMaFTeOwMVsN+srIi
	av8ra+sbWHVM1TrgORCKeIAuzbq99fvYpQS4PPMr0Ny4C4BXhBiMBjk3y6CjwrzF4GRNsUkJ8gN
	15+UBpY0FFd975C5iOZxbwMEWkE8BPOkSGn8FwAhrB5wZbFytlEejJ3pghu5PIDX6ylH1WSM6bK
	Z/8mZVgxc2qOZIAXsNJ+GfaS1EeV5DKsshaVjQdlo1ucFHyY5wgbBaaGhwhu9X9lfMiPOa3NiaH
	1sooynvXwRwPEPtVHEMWS+7JuP2YIEGckw6LNL3x
X-Received: by 2002:a05:690e:23c6:b0:64c:a815:511b with SMTP id
 956f58d0204a3-64e62f59679mr1215624d50.3.1773363641056; Thu, 12 Mar 2026
 18:00:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303-send-upstream-v1-0-1515ba218f3d@chromium.org>
 <20260303-send-upstream-v1-9-1515ba218f3d@chromium.org> <1cc6de61-8b56-492e-ab78-e3aa448f58ad@packett.cool>
In-Reply-To: <1cc6de61-8b56-492e-ab78-e3aa448f58ad@packett.cool>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Thu, 12 Mar 2026 18:00:30 -0700
X-Gm-Features: AaiRm529-VNRFl8j9TL1yc6G4h205p6aiqQ4Ar4V5wWtWy0meX15btognc57fcQ
Message-ID: <CAEe3GZF7ct1ZFH2Zd6AJnO1vBJQZobGaQKO+hTMJjFcCQddq6Q@mail.gmail.com>
Subject: Re: [PATCH 09/12] dt-bindings: input: Document hid-over-spi DT schema
To: Val Packett <val@packett.cool>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, hbarnor@chromium.org, 
	Dmitry Antipov <dmanti@microsoft.com>, Jarrett Schultz <jaschultz@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2026 at 11:25=E2=80=AFPM Val Packett <val@packett.cool> wrot=
e:
>
>
> On 3/3/26 3:13 AM, Jingyuan Liang wrote:
> > Documentation describes the required and optional properties for
> > implementing Device Tree for a Microsoft G6 Touch Digitizer that
> > supports HID over SPI Protocol 1.0 specification.
> > [=E2=80=A6]
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - microsoft,g6-touch-digitizer
> > +          - const: hid-over-spi
> > +      - description: Just "hid-over-spi" alone is allowed, but not rec=
ommended.
> > [=E2=80=A6]
> > +required:
> > +  - compatible
> > +  - interrupts
> > +  - reset-gpios
>
> Why is reset required? Is it so implausible on some device implementing
> the spec there wouldn't be a reset gpio?
>
> > +  - vdd-supply
> Linux makes up a dummy regulator if DT doesn't provide one, so can
> regulators even be required?
> > [=E2=80=A6]
> > +        compatible =3D "hid-over-spi";
> Not following your own recommendation from above :)

Thanks! I will fix this in v2.

> > +        reg =3D <0x0>;
> > +        interrupts-extended =3D <&gpio 42 IRQ_TYPE_EDGE_FALLING>;
> > +        reset-gpios =3D <&gpio 27 GPIO_ACTIVE_LOW>;
> > +        vdd-supply =3D <&pm8350c_l3>;
> > +        pinctrl-names =3D "default";
> > +        pinctrl-0 =3D <&ts_d6_reset_assert &ts_d6_int_bias>;
>
> Heh, "reset_assert" is a name implying it would actually set the value
> from the pinctrl properties, which is what had to be done before
> reset-gpios were supported. But now reset-gpios are supported.

Taken from the original patch. Will fix this in v2.

>
>
> Thanks,
> ~val
>
>
> P.S. happy to see work on this happen again!
>
