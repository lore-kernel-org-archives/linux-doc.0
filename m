Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0782561C2
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 19:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760730827; cv=none; b=atu7QsGHIBrQPQeNtnhbSBP6XLsg8PNOyuGx820xSG7zRCtUtMTs+VwoCpErjM59p1neZw7BHeYcuoYFgIoM4RGGRwWo/2qs4YWOt3qvT8L+E1nZTbDjTWTCUs2I+FY5Ay3XoEmv11tEqqCwjmQTm+5b4fj/m9MeHIgps529tCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760730827; c=relaxed/simple;
	bh=i5Hk7l6xoSrN+AXcpR4MGOF8Rj8+Hz0UPLQLCeNrNAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJMYYRgRGhOtq7ag1ztFTPvXuqO4oFbwKYXhVi/q5XxM4x6bZcHHKKZ+9Wc067O4Tz34SMKe7KJoyyCijer+VmilT1tXiK8iKTEHQbqFI/AhiklJQ9CGAmgpRY+FiEbOOeoTnqJe5CpwBxYpRuJ2OtmHrG70P0gsLRQdbWZBctw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBvNa1Ka; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBvNa1Ka"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b49c1c130c9so1411217a12.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 12:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760730825; x=1761335625; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=66FjiNXaw8TmphFF9eNaWop8aMdiITfbjide+1BjBFk=;
        b=HBvNa1KaWts9c2rgQWDkU20KWOrpUxl8AmeijyxnjLCTYQ+yX8wZwQBP1+mInRgJU/
         nDuIMZ3LOacOaNqmO7/rDisXD7QbkgKSFnhRI3vVVV2Rk1Zocd6Qg9ZsXe6kr8D2gTcZ
         yZ5aK+e3qiqVvqypWxOyx0mIZhNcq+NGNtCk1v9VxxGpqYuGZg+F6BH4qArboXz8CpIV
         k3UWekdRN1beDAIdt1uztpZWQ+dLekrvQbUbekmVnrXh5+tjezrS/7+76K8oSX1SRV/c
         EmPO0qDPVpbbDsgTiy8wuNSOAllCtDjcSHPkQ11Pb7VSZ8oUW862fefddu+fzKlY9raP
         5exA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760730825; x=1761335625;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=66FjiNXaw8TmphFF9eNaWop8aMdiITfbjide+1BjBFk=;
        b=J4405hvONdxi23cOmEYvVASkzJFp+lxkbuXdq/gb310BKiZ7joFobd6Z0oNAAVphs/
         wIPfEi3NMHg/VeZh94sdJxClA/q6Ac/AFcduvtCKB/1lHUlplFbBqh3uErmbckG+mhim
         Rg71CqSlfF4rCXpo4RY8yWa8aawn58aQjXW3hPmnmM4eYyAw1UkrqU9ww+oGRXiMC682
         nceSR0vbTDXaHlHsEJbjDpgRAkpvp5twNJj/nJx1FVwSIlQz2nzKZ0PIbaUiIyQkoY18
         jydmT7VHgInHVLvKa/cz3d6CjAI3Fbysjk5Zz+CxWezGWDMm7V+GpyX78Q4czjjiWrCP
         xbRg==
X-Forwarded-Encrypted: i=1; AJvYcCWaVbFaOY1qa9tt9Yv2uly+JdLGlzJr0UVD0otqJFEzOCRE8OIGriiNclIYTR17kJA1xm/AUaiLzxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCux+hujOISwpnRYrR4f8rx4a0s7QDke7XIx0AEIE7XsahPJD6
	cnx9nH6qXQkPWSmnY4/bQ0VSYKS88c1zvd7Eb8d15DplHoDKJGyU5dcL
X-Gm-Gg: ASbGnctDGUkgjLYt9ODDpnEJx2qs3cY3usAu7f/4ZjGKc7ermpb89GsFwsoKgWKNr0C
	pvmIyHjyg4TBrzOGX9oUlgtCPu/SUYqZh8AN1mCdAVOf+TdK+4rLA1GLuZ43sjfVwYKGroX8gTt
	I7T14/OYWoetOoVW2X10vcpMI1JOKo4fNVwMoM0X8ZXTsik0YzrpTdds2xMYVRT2iUFCE7INqKV
	QxCUS347Uhqd/yW6tQdkI/6WlzdBgAVamrUQtN7qG71hKRriF9sDHg6b04PKKDD+7XMUafN2lII
	ZFkcuXZlEP5zLYISwUam+NHaVaUnhe5efEGB3dsUF6H/m88QudXlaulqjEKUgUa2LaoJcEB6fR2
	qcnDWAPQ0hZ1Ir71BAqT6uA4J0CiTskLdcdLFRrJJJsOofFbKqurCeWiFcRXAT/fys00hWxmnfU
	UHjZslAsCc7+w/FhynUPTRdE6TS4soZhk=
X-Google-Smtp-Source: AGHT+IFmw4xfU96UxI5JCpiksAaEuctIniSQG6RkIj6XxJvpDrHo87ypYEHktyPgkIumG9POKqgUKQ==
X-Received: by 2002:a17:902:f550:b0:269:874c:4e48 with SMTP id d9443c01a7336-290cb65ca69mr70425735ad.47.1760730824956;
        Fri, 17 Oct 2025 12:53:44 -0700 (PDT)
Received: from localhost ([2804:30c:402b:1a00:ec78:db53:a246:207a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-292471fd9ddsm3303605ad.89.2025.10.17.12.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 12:53:44 -0700 (PDT)
Date: Fri, 17 Oct 2025 16:54:49 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, jic23@kernel.org,
	michael.hennerich@analog.com, nuno.sa@analog.com,
	eblanc@baylibre.com, dlechner@baylibre.com, andy@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, Trevor Gamblin <tgamblin@baylibre.com>,
	Axel Haslam <ahaslam@baylibre.com>
Subject: Re: [PATCH v5 5/7] iio: adc: ad4030: Add SPI offload support
Message-ID: <aPKfCbZSXxaHICel@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1760479760.git.marcelo.schmitt@analog.com>
 <c12569f251962ad6034395e53cd6d998ce78a63f.1760479760.git.marcelo.schmitt@analog.com>
 <5e3a1d31f3cec340650e2e63db79903b78ab9a1f.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e3a1d31f3cec340650e2e63db79903b78ab9a1f.camel@gmail.com>

On 10/17, Nuno Sá wrote:
> On Tue, 2025-10-14 at 19:22 -0300, Marcelo Schmitt wrote:
> > AD4030 and similar ADCs can capture data at sample rates up to 2 mega
> > samples per second (MSPS). Not all SPI controllers are able to achieve such
> > high throughputs and even when the controller is fast enough to run
> > transfers at the required speed, it may be costly to the CPU to handle
> > transfer data at such high sample rates. Add SPI offload support for AD4030
> > and similar ADCs to enable data capture at maximum sample rates.
> > 
> > Co-developed-by: Trevor Gamblin <tgamblin@baylibre.com>
> > Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > Co-developed-by: Axel Haslam <ahaslam@baylibre.com>
> > Signed-off-by: Axel Haslam <ahaslam@baylibre.com>
> > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > ---
> 
...
> > +static int ad4030_offload_buffer_postenable(struct iio_dev *indio_dev)
> > +{
> > +	struct ad4030_state *st = iio_priv(indio_dev);
> > +	unsigned int reg_modes;
> > +	int ret, ret2;
> > +
...
> > +	ret = spi_offload_trigger_enable(st->offload, st->offload_trigger,
> > +					 &st->offload_trigger_config);
> > +	if (ret)
> > +		goto out_pwm_disable;
> > +
> > +	return 0;
> > +
> > +out_pwm_disable:
> > +	pwm_disable(st->cnv_trigger);
> > +out_unoptimize:
> > +	spi_unoptimize_message(&st->offload_msg);
> > +out_reset_mode:
> > +	/* reenter register configuration mode */
> > +	ret2 = ad4030_enter_config_mode(st);
> 
> nit: if ret2 is not being used at all, maybe just
ret2 is logged on the error message below so I guess I'll keep it as it is.
> 
> if (ad4030_enter_config_mode(st))
> 	
> > +	if (ret2)
> > +		dev_err(&st->spi->dev,
> > +			"couldn't reenter register configuration mode: %d\n",
> > +			ret2);
here we log the error code. We only reach it if reg access fails after
something on offload buffer enable have failed first. We cannot reuse ret here 
because we would be shadowing the original error code.

> > +
> > +	return ret;
> > +}
> > 
> 
> ...
> 
...
> > +	} else {
> > +		/*
> > +		 * One hardware channel is split in two software channels
> > when
> > +		 * using common byte mode. Offloaded SPI transfers can't
> > support
> > +		 * software timestamp so no additional timestamp channel is
> > added.
> > +		 */
> > +		indio_dev->num_channels = 2 * st->chip->num_voltage_inputs;
> 
> Maybe I'm missing something but common mode is not supported for now so isn't
> the above wrong?
> 

Yes, that was buggy. Dropping common-mode channels as last minute change was a
bad idea. I did another set of tests with ADAQ4216 and fixed that for v6. I'll
also re-add common-mode channel support as a separate patch.

Thanks,
Marcelo
