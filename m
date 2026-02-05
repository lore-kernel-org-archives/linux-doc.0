Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249133A7F5D
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 10:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770288839; cv=none; b=I9MRxqNPkZB56sHuyDSgLZ5jy4EV0R2gMPCMe45ryx0/8zwnwak3WOyPkINySUqPdHua1+qXWb4ZFPot/TU2J2OSg9VVYM0mN7ZrIySLl5DY4FI/1miU+1450fs9U27j4nKEP13hngnz9CLMx7XpeA34cODduH4rrsZXIKafRuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770288839; c=relaxed/simple;
	bh=dxFq6aqpPeZS/KnlY9gG7jWe91WmosMBfsS9OGUv+zA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OsF2e0yBUXESBnRac5XsuX729v6gvtClaXGFVfX37XQvoMaqFkiGYs1wl8PpH16Zt8703YxDYmDXQ9GFDOSyyFgecsiYMh1TE77UQup0ddVuKBwc/zqOqhoa4GZXm0+WuWJPoyf09EEWiLveBZJqP/e7roa7bUBhMfUJxZjfSzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y7wVITrd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y7wVITrd"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4801bc32725so7304835e9.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 02:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770288837; x=1770893637; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5MpsejmhVxhP6NeQbHNzOvF3lV3oAS4n7Jzmwih0cw4=;
        b=Y7wVITrd4H2B2VrYNm16a5O9nGvyzthwy9v1r9BUHq9OC7edUAU5W9PmGyeBEsABvk
         EFPcJu2+Ed3JzR3zaFkQniktMvPfwSZ8H5p/9WCv+G+ity1CyJ6sF68T402KDojqSLfY
         sJHm6DsckdO3soPvxoUby+kVKiDrCTnG2YKy2Rk/Hd7hcXCv1K+syLIQESU4GJLZ+oPg
         WDTIbTiaISw4Ha6dAqn7lVixg4V1UqLsHH09CY9GU6cjOOvJ3YgNyPyRxlTOBhfk8Qgi
         yQUl1QIZ92Rypj+Q2euwEiRfVBn0CyIwlcPeMmffpMIkhrPSOaA2U3x/THTXrtWgaugr
         Aiew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770288837; x=1770893637;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5MpsejmhVxhP6NeQbHNzOvF3lV3oAS4n7Jzmwih0cw4=;
        b=CNUbxD2P0V2Y7RzXIyYckzjfh/4mXs5AJarEGWBEVa0u9jCijWBIF1mMx4qPEWXU/A
         HHc2dktss7fsy+C/EQTRpEz04H7lauBlOrobpM9QdZEEL0Id3h3rS0RJPNw0yLgDxy9w
         HMf2gFgO9PCYdzsKmN23BzSsoBosbmIfTRmbaczfPHxPoDk5YoWAeSg/9uCn3EqSwM94
         EIXk1rCmG1lCjex+F1PWZNWsKOZW+FWrji4BFYoTPvym/8CnaXtJ6yLz5EXt+sY39kc+
         sBW7Zg9x3DL4bf2SjH22xogSpQ5viMgpd0X8T5WMOam5W7FYm8/TliEZE0gpkxSp8LaJ
         EAWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw4firvaJZCkE/Ty0gYvxLXVpFl0nqXx6bxQC/V5liReJlbt12wxkZJe2Snz5vnBkTddfDugtfzUA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1hGNtczeG+4VY7/WJWdYyKPBtN+Tr7Y7ku1Tncfkj0zBEq2t8
	+6f2KMZRJx9e9TZJTZWkQdIjCIv6+So50eZBk2HraOvugYahiTQoCy+OZvSQ9Uw0aE4=
X-Gm-Gg: AZuq6aI5uimbiJctgKWYE3yEiYoKM466HHJtFsGN3Blwvffx5wpH8AW0BUJXDjp8QUh
	TOuRYqd5sySviuzod8jZThN7q9JCngFBGq9ZrLyiJQUZ4+wdmirvPz8rNbLG1DAGREqW9g5K/mm
	qC8JBlYJaUi1CCrSS7ZDpn2bCjHDp5Q+qOKKsI0h2z87l3/rpWq4I5VI7Q+ODXGLm29cbfWt8lT
	jjy4rfpBT9Hl0+dnfmiw5ccU/Y2xo2P/4Pi3ddjxr5GhMWsxTYD2Ql/xr4cFU7FvQSxUnyGJQwD
	tDwPkQitpsetD+z3jBpqIyfVr1x/Ave8/5Fl/yxzFOdXdUKR/GENnFs4ivqQ36L7LxAcKvmFFhP
	XPtIiMzxdHLenbkoILo+dq//BCLW+xzuHqd8jagqzZ1ClTtArCHPaLMGFNGw06IvXIRnQ+v4V85
	Jco8x9gN0z9f/BCtNPIw==
X-Received: by 2002:a05:600c:6290:b0:47e:e20e:bbb7 with SMTP id 5b1f17b1804b1-4830e990a83mr75256515e9.25.1770288837395;
        Thu, 05 Feb 2026 02:53:57 -0800 (PST)
Received: from draszik.lan ([212.129.81.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d4a6b1sm50273325e9.11.2026.02.05.02.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 02:53:56 -0800 (PST)
Message-ID: <09c1ac114ab108d5f186ee581617a524b9651e96.camel@linaro.org>
Subject: Re: [PATCH v2 08/12] leds: flash: add support for Samsung S2M
 series PMIC flash LED device
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>, Lee Jones
 <lee@kernel.org>,  Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo
 Choi	 <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jonathan Corbet	 <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-doc@vger.kernel.org
Date: Thu, 05 Feb 2026 10:54:16 +0000
In-Reply-To: <20260126-s2mu005-pmic-v2-8-78f1a75f547a@disroot.org>
References: <20260126-s2mu005-pmic-v2-0-78f1a75f547a@disroot.org>
	 <20260126-s2mu005-pmic-v2-8-78f1a75f547a@disroot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

On Mon, 2026-01-26 at 00:37 +0530, Kaustabh Chakraborty wrote:

[...]

> diff --git a/drivers/leds/flash/leds-s2m-flash.c b/drivers/leds/flash/led=
s-s2m-flash.c
> new file mode 100644
> index 0000000000000..1be2745c475bf

[...]

> +
> +static int s2m_fled_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct sec_pmic_dev *pmic_drvdata =3D dev_get_drvdata(dev->parent);
> +	struct s2m_fled *priv;
> +	struct fwnode_handle *child;

[...]

> +
> +	device_for_each_child_node(dev, child) {

If you switch to device_for_each_child_node_scoped(), you can get rid
of the goto and the struct fwnode_handle *child declaration at the top,
and you plug your leak in your early error return a few lines below.

> +		u32 reg;
> +
> +		if (fwnode_property_read_u32(child, "reg", &reg))
> +			goto next_child;
> +
> +		if (reg >=3D spec->num_channels) {
> +			dev_warn(dev, "channel %d is non-existent\n", reg);
> +			goto next_child;
> +		}
> +
> +		if (priv[reg].dev) {
> +			dev_warn(dev, "duplicate node for channel %d\n", reg);
> +			goto next_child;
> +		}
> +
> +		priv[reg].dev =3D dev;
> +		priv[reg].regmap =3D regmap;
> +		priv[reg].channel =3D (u8)reg;
> +		priv[reg].spec =3D spec;
> +		priv[reg].pmic_revision =3D pmic_drvdata->revision;
> +
> +		ret =3D devm_mutex_init(dev, &priv[reg].lock);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to create mutex lock\n");
> +
> +		ret =3D s2m_fled_init_channel(dev, child, &priv[reg]);
> +		if (ret < 0)
> +			dev_warn(dev, "channel init failed (%d)\n", ret);
> +
> +next_child:
> +		fwnode_handle_put(child);
> +	}
> +
> +	return 0;
> +}

Cheers,
Andre'
