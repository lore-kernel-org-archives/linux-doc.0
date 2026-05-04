Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5483849620
	for <linux-doc@vger.kernel.org>; Mon,  4 May 2026 17:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777915288; cv=pass; b=Jxq+WBDu7XvgLXwmhdbBBjN68SyEv0xxPorjkXxsgVN1o/fVeLYsH6CIeHyCiRdM5KCESssFHp9703tNHLuJkefa1ldBjBP2gf4HOX6uKlu9XtwGh4HqZ7PiPTsErxECa7NIIsy8DIVtUtBZouoJfuqtI+j2M3v6vANkEKZJyj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777915288; c=relaxed/simple;
	bh=R1YF+J8AAnhG8MJmuIKJ7+VkdhBmKeB7irsDbb8coF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=baCn7FHV/BWa9H+/zRzbEt/49AAzLXRjI6xrlHwC+ZuLkb2FTDz+zX0QJRqeO3jJ31ET6wXEG8lurgRZ5Yj+iDS7e3wDr6Lx+yB/1+HE2xYRlmWFY0TcdwFT85VsbejYAQWI/eoE+9bfMqygWLwdE1yayS80zHzlptZJEDa5wc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kc1KPwXD; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kc1KPwXD"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so603432f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 04 May 2026 10:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777915286; cv=none;
        d=google.com; s=arc-20240605;
        b=C0APoQi6DpCTeLgruPJ7q33VUjOAXWs7SIOIOqBMiL5sNWpbO6DWfvTYQwTRYxvJqo
         g4qifzFxVZZriakJo3KYu5FIdE8bKoOk0JzkWPVS7vEb21NDuI2ohZ5Fn9RogyWE64SM
         gu4HS1LBVpdaopoR3HxBNr7ngZGZZ+Z5RmwdIEf+hHXHvDZx+tvBQ2DXVAdukLD4sxmI
         Xm9j2Y3wh8ylmjSCKTmk5OFIFl3nqh8Mbprl979TnOJvOkN4/LHrBmiX7z7IEeUoeuas
         /iIdYUb1N9w6wiegQf/9uVmtDO/MdHCQqhVcOhlNoBosFbkOs2MrnEhVPjE+HM+WJGvu
         SCfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7DgWWBkDrHYOZdQTqLg9fJ9ZJacXeXoIWQf4YRL801o=;
        fh=IgJYfKsR9PmUt66QWyGgXz0RdM07qsHUAgAXA9R88Fo=;
        b=Box47eU8cNpT7EVJMsRqto1GFUoId5huSIpo2OZpku3hhllIiFQ51yBYyS56vSUNyt
         8pZCbJUs5GahOUX3TmKh6Gm+8dhthswQta+WWqt4gN9lMv65e5lxPbKKiDUzTh3cnAYy
         5k8XiGZzdjdlGP1KsIxoNPI50mPI6eH59/nPwpsBTu8d0hzplYVsEa9x1zWJ26p6avf5
         t3wil5tv+KvqJKbFgE++6XM/eqNlextV12GzwINw46CKibsJVvdYZLV9Dmxd13/sxfnx
         SkW0+9ydJIMLFTVIvyVUmjnkflS3vMzytttYQm2UdZsCMLBbGrRT+CC97p9JykBnIQjg
         sB0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777915286; x=1778520086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DgWWBkDrHYOZdQTqLg9fJ9ZJacXeXoIWQf4YRL801o=;
        b=Kc1KPwXD9H5rpbNZssRzB9a9fGZlHRZ87bEnAOJm5wI/cBCOELrIUAj+Udtwd+FeYa
         +rvRNe0K/gfHNtPP8gkUaShBSRznhEnT3/1cuR56CxnTLitNDH208bNyt92CyV5KTU5g
         Z/ClHVxiygqy0SuffOaMdMMG4lK+UTW0vtpzhyipCp5YrnDVOSeVvzayBs4s/0Vu/Ieq
         8LBoQM2PaNtCdPJ0GQnl3XHLk3DCQMlmOuJqhN5LwSAwQLLN8DEpWMyS0ikJhzPfUmp5
         7slCrMskmuT/2vDsw3tDnmaTUmhLEWoEe4Thajo0qt3SqcRFuEuGxUydnbPIOdHflgk6
         OYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777915286; x=1778520086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7DgWWBkDrHYOZdQTqLg9fJ9ZJacXeXoIWQf4YRL801o=;
        b=gbd0JKZrCzkKoi5dJw+SI3Y9p6ghNgqJYfFni1wZCFiYSc5vNDsiGpovw9DAEGFYBO
         9q9tX9gPIT6q/AeXcnctblyaj3PBr69crKb+bJC6hNajxc9Wi0BWwkAut5dcmoYcN5Sv
         sQK76g5rPlqpvrDNBMS6MGj8WeTJcO+dJcgF9S7bdV0AViyQE7+I9+Svh0rrgUV0u+//
         XkfRpE2RVBl+W8A7fLrhxDNZ9c1TDMDu43rRsp5XA4U3ozPMpwutM2995TjhiYhI2irp
         1xmw3SqQOnNSLiGLPUswuwiksLBlaw+t9lyJbidqZCSUB2qBGOo7ESxhsRt1pjuQuDob
         9Z2Q==
X-Forwarded-Encrypted: i=1; AFNElJ/Ey+C2GtCDdrFxFg9yPpaDcVPf2Zt52gwia68WVeo6JvY2biI/lK4aY3s5LvIC17te8xfG0HVx7E4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNtNztiItRpMOseqo0L7NJ+gMeM8Tt8f/lWysWiaCCwyIMCG/G
	P7DsnavnupHe90JdcrjsgqL2t5namBTS6p14zvBUnr7X+2s8axL3EWQSe8Sh0OAEK/aUMm/w2r8
	6nb/lHQxS7tdB5SmABDZsQ+ChMV3cPYB7tZBm
X-Gm-Gg: AeBDieubBkJvVDPti5SAKcy/0U/W/Lh10dLcnBd2C7nBUe13a/888LMed+PBUxWpu4t
	G4NX/ye92tUAOZUPjOspeZd72b/uyyhmBW52ixa8J+MrBJyRrWr9wiEfhnVdUQYPcKqs0Ypw79S
	sKdcocHRoyJZiUSAxB8Lp1Ojy/bSmqfIpvSHu3/hDVZOHiKhtiQN7iRd1WFFt7MAoGNCoRcJn7c
	O1WSd2UObOhWUYIROlH0Hy2Vp9ESgom1qhRsfKeYV0TAj0WQS3RfUHj7g2OtMSwXeSJg9b0x7vH
	ss5r4ETj04gE2D90vbm3Y+bggQxO85ut8U9N/3BruKECkjXrLCmXRhwsPo1KR5rjp5hnQn37Qnu
	K8cyGnzeIo10A2UUn+qgloyT8tNMIo6y2VIKHQ2Ttr9D+QQDhCThai0I7h4PF94K+3poelq8O2I
	jrSVaQkbPHJWa7y74ePZ0S/VL6SWcrKLc5qt3p09aFv/ZVpiHiIQ==
X-Received: by 2002:a05:600c:3e07:b0:489:201c:dc46 with SMTP id
 5b1f17b1804b1-48a98640536mr171247125e9.12.1777915285392; Mon, 04 May 2026
 10:21:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_EC262467CD5E46CA97CF2B2FDCBCA0565C08@qq.com> <20260504174326.353b6f02@jic23-huawei>
In-Reply-To: <20260504174326.353b6f02@jic23-huawei>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 4 May 2026 19:21:14 +0200
X-Gm-Features: AVHnY4LbvtKQiYdxkg4LZrXttAQ8Qlb2DtC7x_nAp6OILPD3QcfXEbxhGQlE6_g
Message-ID: <CALoEA-zCU_Pan1oQNLfno4DbQYFNVkSr_cqf3jBC=MA2qU26ew@mail.gmail.com>
Subject: Re: [PATCH v2] iio: adxl313: fix typos in documentation
To: Jonathan Cameron <jic23@kernel.org>
Cc: Wang Zihan <jiyu03@qq.com>, linux-iio@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 4 May 2026 at 18:43, Jonathan Cameron <jic23@kernel.org> wrote:
>
> On Sat,  2 May 2026 14:07:00 +0800
> Wang Zihan <jiyu03@qq.com> wrote:
>
> > Add missing space in "ADXL313is" and correct "a single types"
> > to "a single type".
> >
> > Signed-off-by: Wang Zihan <jiyu03@qq.com>
> > ---
> >  Documentation/iio/adxl313.rst | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/iio/adxl313.rst b/Documentation/iio/adxl313.=
rst
> > index 966e72c01..3662153a6 100644
> > --- a/Documentation/iio/adxl313.rst
> > +++ b/Documentation/iio/adxl313.rst
> > @@ -11,7 +11,7 @@ This driver supports Analog Device's ADXL313 on SPI/I=
2C bus.
> >
> >  * `ADXL313 <https://www.analog.com/ADXL313>`_
> >
> > -The ADXL313is a low noise density, low power, 3-axis accelerometer wit=
h
> > +The ADXL313 is a low noise density, low power, 3-axis accelerometer wi=
th
> >  selectable measurement ranges. The ADXL313 supports the =C2=B10.5 g, =
=C2=B11 g, =C2=B12 g and
> >  =C2=B14 g ranges.
> >
> > @@ -112,7 +112,7 @@ apply the following formula:
> >  Where _offset and _scale are device attributes. If no _offset attribut=
e is
> >  present, simply assume its value is 0.
> >
> > -The ADXL313 driver offers data for a single types of channels, the tab=
le below
> > +The ADXL313 driver offers data for a single type of channels, the tabl=
e below
>
> ooh. That's fun grammar.  Intent is that there are multiple channels of o=
ne type
> but the form used in your corrected version is at best unwieldy given plu=
ral
> singular mix.  "a single type of channel" is fine for instance but this i=
sn't really.

Ah, my bad, the space is fine but reading it a second time - it does seem o=
ff.

--=20
Kind regards

CJD
