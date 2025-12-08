Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7616E23F439
	for <linux-doc@vger.kernel.org>; Mon,  8 Dec 2025 21:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765228682; cv=none; b=i9L3tMeha5VVM/joutOH7GnXeAClJO7s2Ibk33l3/Ms901hgmWY38ddtLHRJIp56tZ96TXilGEGLR0yF1G6BO9jkjQNBwA10tchuvhpO2uEo/DQ2hWy7DMVqxB+PEUD3J68nXjMPeKHVqifR8+GAZqaDl7U5RIrJZo7b7nsEEfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765228682; c=relaxed/simple;
	bh=7lZ7yFiwE4BfabfizLUm86ygg5oezWglQcFnqPk03BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQPLMWVUTQlBeXx0O4nb4bjsvHimSoje0r+OHoJ6m3ci1cfZZbnz7QDnl70imGdQLt5xyxo0Xy+5wqdfvPw1kTYluInRPgOGWmJv4GZkykhKph8sEQAltFpPZeXsPs/gPcmOEsCCjcT/fqUb3bQb1atENbflLP2auVzMigruzzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqTD+MRu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqTD+MRu"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso40824955e9.2
        for <linux-doc@vger.kernel.org>; Mon, 08 Dec 2025 13:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765228679; x=1765833479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FevBVXsdxMvnzZIFlQ7ZnJU5t6FuMkK60eiavRkgSq0=;
        b=OqTD+MRuf+ggNDx1WnpmEg4cE/RoBU+ipt1XZtUMbaz+BW+355TEGCSuaKiJazxc2N
         A5HB0OOuhZwMTV3JR4jhJyYe4jUREnY31z2O5E+xjH9R7P+DyStlpHM6xN05XZ9tqtaq
         L/xxwrVrMSLtCaOz+NpH2mKEfc8ozzS4zQDd4xlxzx2/2R/WuutaPzkqHGFjTW52+osn
         R4FtViK4LPl4pxIaRtIyuG8xFXr8+/Ci895DefvmkbUlRBBBTiDjE9tOn4Kl62gC5bbx
         4aV+//PYq61ImeFC0qMif4nR2OHpjs1kkxesuzp/DjJqSlgt/9r0YQxr811IgDg+Vm8G
         u3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765228679; x=1765833479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FevBVXsdxMvnzZIFlQ7ZnJU5t6FuMkK60eiavRkgSq0=;
        b=Ni8qNPrYDGuLJHITwSd4tdgyLkZiMgv5pvWMTDIksZbPJ0N1DH4012Hf5x3+Jp1u/I
         U+zyoe7v1Q4tvQYY0dlQm7BqSCDYm91RxKaECtiYVd8BQURa3CIIp9TEa4GdUpoe0nvz
         kKHd3CbAM+af8qLC61ayyEvlhkYnt1qiyed/M3AIUVIQx+IDo4rL3M8lP0mBinOa2r4w
         7Kkx4FTDjt5zbOeE2CV3peUJOfqbQbQawEN6zDvSkvyu9Vht/BQUfSv3FKBjQZU7KzpY
         +zZrBpxOy4M1vVBa2R9Z1gvNkofsvYf02OehFZLHSPrpit0zADeBaerx4DM4dZZPts53
         lORg==
X-Forwarded-Encrypted: i=1; AJvYcCW892WdsDTPCs5xSILTCW6O9alMomwq1LKPwn580/s6zIM4dG3nfkmtEC3939Avj+mNUFP8cBTGnEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoSstOww0zxlsVtnTTWyVXGVm55H2VT6PGAU7918a6rNm9Dlzg
	SA8FF3KQu/DqMeOb1cwof8vo2msWhEQTGS+8jVY9fbDxOrFvdyNS/zTs
X-Gm-Gg: ASbGncvWVeSCS8SgrOJrO/3OtfWilwImEBaJ9L60GZqPc0VhhArk/GoC4qq0opfewKz
	yaHoQA+AhRGNYGqbParBdOU5134Cru2berO1ajjTLtaFqhlVzc3ROeJWTD1ePjP+FwxkMCYuzkJ
	XUb0gBqmkImupq5rguu4xboQt4DnOeEgIRwpMEkXXhZESYPAeFTRhIN1vPy69xPS6CBv8Q7f0PE
	fdGLbWpxd6UD/rW59SaCkh9cYpe6lNT2IynYXc82AbjXF3x00nh7Yyvr3tTl4ixw7lbOJe4qutX
	VL0NxSmxLfzqZjRlbUY4HtrDpECRWS/87KmmW1n2dH+8Da+L/BkHrklRVWzxVoXuPzLoXHrID1N
	y+vcjAOquRTiAnYZH8v70BHjdSQM6sR2yDJz4VPm3Y1+hyW8RYfVTypk99Z0Mn1Vfyj7X0C44Jc
	lIH/57r6ytI7rIWPmcPi+asOYIc6tGOes+Erj7O9N5db91lyFS7wxgzP0jbMRrMeq9dxA=
X-Google-Smtp-Source: AGHT+IE4yIfqhzMNdQUtI3A3IPxOwF1ZjFVLCMqKqyD/wHiW98WHchIOle5of1otFBu+XeUJTcxuQw==
X-Received: by 2002:a05:600c:4f82:b0:477:aed0:f3fd with SMTP id 5b1f17b1804b1-47a6f9b153amr68618885e9.8.1765228678559;
        Mon, 08 Dec 2025 13:17:58 -0800 (PST)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([2001:a61:1226:7701:cdbc:9893:8abf:1309])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d810c49sm3855035e9.15.2025.12.08.13.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 13:17:58 -0800 (PST)
Date: Mon, 8 Dec 2025 22:17:56 +0100
From: Jorge Marques <gastmaier@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/9] dt-bindings: iio: adc: Add adi,ad4062
Message-ID: <urniyc27qw5ex6jrwqilqykkcbswxbxlsdshnxqcts5gizdaly@a2ncsddzuyh2>
References: <20251205-staging-ad4062-v3-0-8761355f9c66@analog.com>
 <20251205-staging-ad4062-v3-1-8761355f9c66@analog.com>
 <20251206165822.778606e1@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251206165822.778606e1@jic23-huawei>

On Sat, Dec 06, 2025 at 04:58:22PM +0000, Jonathan Cameron wrote:
> On Fri, 5 Dec 2025 16:12:02 +0100
> Jorge Marques <jorge.marques@analog.com> wrote:
> 
> > Add dt-bindings for AD4062 family, devices AD4060/AD4062, low-power with
> > monitor capabilities SAR ADCs. Each variant of the family differs in
> > resolution. The device contains two outputs (gp0, gp1). The outputs can
> > be configured for range of options, such as threshold and data ready.
> > The device uses a 2-wire I3C interface.
> > 
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> > ---
> >  .../devicetree/bindings/iio/adc/adi,ad4062.yaml    | 124 +++++++++++++++++++++
> >  MAINTAINERS                                        |   6 +
> >  2 files changed, 130 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4062.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad4062.yaml
> > new file mode 100644
> > index 0000000000000..a7a2ad761d1f0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4062.yaml
> > +  interrupts:
> > +    description:
> > +      The interrupt pins are digital outputs that can be configured at runtime
> > +      as multiple interrupt signals. Each can be configured as GP_INTR, RDY,
> > +      DEV_EN, logic low, logic high and DEV_RDY (GP1 only).
> This is a bit confused.  logic low / logic high aren't interrupt signals so I'd
> not mention them here.  Maybe something less detailed such as
> 
>     Two pins are available that can be configured as either a general purpose
>     digital output, device enable signal (used to synchronise other parts of
>     the signal chain with ADC sampling), device ready (GP1 only) or various
>     interrupt signals. If intended for use as a GPIO or device enable, will not
>     present here.
> 
> For the binding I'm not sure we care about which interrupts are possible.
> I guess even for device ready we might treat it as a onetime interrupt. Probably poll
> it though - which requires a GPIO not an interrupt binding.  If we don't need
> to use that mode (and can poll a register or something like that) then no need
> to mention that bit.
Hi Jonathan,

Device enabled (DEV_EN) and device ready (DEV_RDY) are not implemented
at this time at the driver. I believe it is fair to briefly mention in
the dt-binding. I will use your suggested description.

Best regards,
Jorge
