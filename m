Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E71E2D4B60
	for <linux-doc@vger.kernel.org>; Tue,  6 May 2025 02:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746499785; cv=none; b=I0HyLxtj+1Kyd1b0tHb6QTuPK1tWNyPHsFfjlByvBwvoe1KoSOCMpuXzEa05m/Ba8Co4HKWvOBo9Ms2gV8RnP9Lo/4tr/GbNW2tadL/b5kOH0dS6g4j3LM1Fd+AeylkS56+ZiHndWD/MULIqrHe5TO4FbyWkKh1Jq3kPB+rpAHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746499785; c=relaxed/simple;
	bh=BVcS6y/RkytdfYbg6aiFphNw4k53SlFmqyW2ahlf+8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufzjUcwhQpmXQHR1LvyCzCXalyuGKVtx0hhD3hkCBN+cSVEcEvvKRUnP+nmxD4EaBTiByo/oJC0kfIErg22JTr/vm/VumJjyjOKUlAiDa0ApNtoXU28E7jkUoX3Nc03PKxd0HK/YQvLj7i7jcwRB83ja0QQlOYpsGEeYUUx9XA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KTjtg1OE; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KTjtg1OE"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so4599528b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 05 May 2025 19:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746499782; x=1747104582; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q0+JSDpYT5BNX3k6gPTP+QpNOml9kj6YJgCfvY0JCRs=;
        b=KTjtg1OEHaijcvjo+g0DgZpMEWvryOFq4uOnmLvDSZPE3l2KjSX2P4zaX2XVZosm+J
         NyeEkECA21eh5/ct5hV+99+fu76Oymt6THZe40hSXSO9eYiCB6okRSEZjhNzUZr5TVt/
         +ZllpcB7MgSLRdW0LAbb9J5lLI90bV2245AYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746499782; x=1747104582;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q0+JSDpYT5BNX3k6gPTP+QpNOml9kj6YJgCfvY0JCRs=;
        b=Cbc2QMUiY1/PcSd0yIEg43YOApYW1Sg15oLC0BSPK0nOeXxZtwZHyoVgQ0X5eglWW/
         wxAVB+8/6Ne0cYPurbhU0UWQDeUxLtkZDiqOTXOIof/Phu3E8fMN2uiHiV8z6Bu/HJJa
         cCE/sH8F9YNiLfnL9LSjxlx4Ehy+Ilj964wnB2cbCc+4+3EmjVtnlfE4d8L6Q64enfuH
         wPUeydXJtbyO7yTxU6+M5vHt9hpKUgEhuD0ruuPNwX25YjQeg3vx5Zf4+t1khckMWZDF
         O/CJdwpVe84c5OL4yvwMWanvaisH0fAICweU0kuuymp5fblcPlJum/2BgtNog1fxnGBH
         xKFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUFrak0GZ/qCZOCBzFkvBgYpWTjhbIxcanuA8W60tublyeEouI/6SsSD5hdYINzhZmPTnyByv0G3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLaziF5iBHpHSX36oUoW0oCyRE5he+3ersZ+N+LXMqI67Xo+vF
	k9Q+qQmBSxEks/THF4HjR6PL1L0xoJAE6/440LNtfZjkDX96o8iF7cErslg+EA==
X-Gm-Gg: ASbGncv5dWfMJWEbzvR2qxZj+i/PSnAMu/Ey0kFGR+5DsQ8+BCcPr0jpdVOtG2VfHWw
	Oja0q9EVgSMbG5DyaoIe4nn5+MiXoCbxR9MfNK4rZLeuI6USOTR7AQRIwmLXLGnxnY89uH7jnI0
	QURiDMI5QCQLDTaXJExNCubcdJ8OUu8y4Bq90FQv6lJHp9xhr4ngtF08qIKrS2AaLhjTrWt/uHp
	iXfItKveV7ltrQ0azezbyuQ3tgvk/txfLYdDvAf9Va812oq8vXf/IrDAwoIziZG5GOmuDD4jLXu
	CuZm/+lv8wnQXSRA2NjvpZQttBMRavwDrw==
X-Google-Smtp-Source: AGHT+IEEZ1PfoCNd1C1LjNnH37ZRF5k8qCVtLcVSMSDNAUIZcoEsuzle0aPuWxV/v0FJ4LrYSFQ+Ew==
X-Received: by 2002:a05:6a20:2d2b:b0:1f5:619a:8f75 with SMTP id adf61e73a8af0-20e96108b51mr15452923637.2.1746499782489;
        Mon, 05 May 2025 19:49:42 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:d4bd:e7e5:608:dbd7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c6b6d8sm6384494a12.69.2025.05.05.19.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 19:49:42 -0700 (PDT)
Date: Tue, 6 May 2025 10:49:37 +0800
From: Sung-Chi Li <lschyi@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (cros_ec) register fans into thermal
 framework cooling devices
Message-ID: <aBl4wcX889otz_ms@google.com>
References: <20250502-cros_ec_fan-v2-0-4d588504a01f@chromium.org>
 <20250502-cros_ec_fan-v2-3-4d588504a01f@chromium.org>
 <b2432c5c-2589-4cfe-821f-47e5128af2d0@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2432c5c-2589-4cfe-821f-47e5128af2d0@t-8ch.de>

On Sat, May 03, 2025 at 09:27:18AM +0200, Thomas Weißschuh wrote:
> On 2025-05-02 13:34:47+0800, Sung-Chi Li via B4 Relay wrote:
> > From: Sung-Chi Li <lschyi@chromium.org>
> > 
> > Register fans connected under EC as thermal cooling devices as well, so
> > these fans can then work with the thermal framework.
> > 
> > During the driver probing phase, we will also try to register each fan
> > as a thermal cooling device based on previous probe result (whether the
> > there are fans connected on that channel, and whether EC supports fan
> > control). The basic get max state, get current state, and set current
> > state methods are then implemented as well.
> > 
> > Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> > ---
> >  Documentation/hwmon/cros_ec_hwmon.rst |  2 ++
> >  drivers/hwmon/cros_ec_hwmon.c         | 66 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 68 insertions(+)
> > 
> > diff --git a/Documentation/hwmon/cros_ec_hwmon.rst b/Documentation/hwmon/cros_ec_hwmon.rst
> > index 5b802be120438732529c3d25b1afa8b4ee353305..82c75bdaf912a116eaafa3149dc1252b3f7007d2 100644
> > --- a/Documentation/hwmon/cros_ec_hwmon.rst
> > +++ b/Documentation/hwmon/cros_ec_hwmon.rst
> > @@ -27,3 +27,5 @@ Fan and temperature readings are supported. PWM fan control is also supported if
> >  the EC also supports setting fan PWM values and fan mode. Note that EC will
> >  switch fan control mode back to auto when suspended. This driver will restore
> >  the fan state before suspended.
> > +If a fan is controllable, this driver will register that fan as a cooling device
> > +in the thermal framework as well.
> > diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> > index c5e42e2a03a0c8c68d3f8afbb2bb45b93a58b955..abfcf44fb7505189124e78c651b0eb1e0533b4e8 100644
> > --- a/drivers/hwmon/cros_ec_hwmon.c
> > +++ b/drivers/hwmon/cros_ec_hwmon.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/platform_data/cros_ec_commands.h>
> >  #include <linux/platform_data/cros_ec_proto.h>
> > +#include <linux/thermal.h>
> 
> Needs a dependency on CONFIG_THERMAL.
> 

I think adding the `if (!IS_ENABLED(CONFIG_THERMAL))` you suggested is
sufficient, and turning on or off CONFIG_THERMAL both can compile, so I'll only
add the guarding statement in the `cros_ec_hwmon_register_fan_cooling_devices`.

> > +
> > +	if (!priv->fan_control_supported)
> > +		return;
> > +
> > +	for (i = 0; i < EC_FAN_SPEED_ENTRIES; i++) {
> > +		if (!(priv->usable_fans & BIT(i)))
> > +			continue;
> > +
> > +		cpriv = devm_kzalloc(dev, sizeof(*cpriv), GFP_KERNEL);
> > +		if (!cpriv)
> > +			return;
> > +
> > +		cpriv->hwmon_priv = priv;
> > +		cpriv->index = i;
> > +		devm_thermal_of_cooling_device_register(
> > +			dev, NULL, devm_kasprintf(dev, GFP_KERNEL, "cros-ec-fan%zu", i), cpriv,
> 
> What happens for multiple/chained ECs? If both provide sensors the
> thermal device names will collide.
> 

How about changing the "cros-ec-fan%zu" to "%s-fan%zu", which prefixes the
`dev_name()`? Here is an example from a device: cros-ec-hwmon.12.auto-fan0.

> Error handling for devm_kasprintf() is missing.
> 

Thank you for catching this, I will skip registering that device if the
devm_kasprintf() fails.

> > +			&cros_ec_thermal_cooling_ops);
> 
> Error handling for devm_thermal_of_cooling_device_register() is missing.
> 

I think we should continue registering other fans, so maybe we add a warning
here if the registration fails?

> > +	}
> > +}
> > +
> >  static int cros_ec_hwmon_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > @@ -402,6 +467,7 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
> >  	cros_ec_hwmon_probe_fans(priv);
> >  	priv->fan_control_supported =
> >  		cros_ec_hwmon_probe_fan_control_supported(priv->cros_ec);
> > +	cros_ec_hwmon_register_fan_cooling_devices(dev, priv);
> >  
> >  	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
> >  							 &cros_ec_hwmon_chip_info, NULL);
> > 
> > -- 
> > 2.49.0.906.g1f30a19c02-goog
> > 
> > 
