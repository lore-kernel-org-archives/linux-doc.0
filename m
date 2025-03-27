Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA98E20B209
	for <linux-doc@vger.kernel.org>; Thu, 27 Mar 2025 08:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743065644; cv=none; b=GO+4PHo0NQUkosksZaT0S46cYKWWr2dD8uFpyAdbq/WqY6tbr2rzSaj5s6XLKGIYiDx7lcR58m2DLPvga17HvPUsNPDhhvkUrFIMufWxcANmYZnD1hB1qD6iMxBgGYF9A2/UuoltMuEjriHiz7yedVBvgBj58nS86f2BHx2spIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743065644; c=relaxed/simple;
	bh=PW/45Pu+M+b6KNAQI6fPCnwWPz3+7C8d0e9+28MR8CU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFRj2oAuEoTmfmdsSyy74AmFpPKhel9/DHCNaPqVt/oGebf7wZ2JOvN9i8/UjF4Tl9sX4KJ9NuMBCaQ+ZueAdXo4clcIN+L33h2WXGzpJcht2D5hcsrlCCh0TLRkNAUTQyLBA7HoirRcEI2UPLq6lQLwHLJfkQKnbDCnFN1Hwns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Jpj7/+8Q; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Jpj7/+8Q"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3995ff6b066so302816f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 27 Mar 2025 01:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743065640; x=1743670440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6BySgb+YX1n0zynhi5aTDP7DfGbWcQJepmiGx4Uznek=;
        b=Jpj7/+8Q9CL1DsqmYgXtK759KduLLFncv/EhmtgM+LFRu6zf2ZJ7ar8ax7yi2hpZii
         8Wdipe/bNX8pBgzH4k9VJoVqDytLNVriXGfxS0oukO7qb9GjKQw9s2UWRTnolwd1rcvD
         4pQcoGFRYDmjoz3URNQK/bPHSEYd4Uf5N0PZnVo7q4na1NXQRuxTJ7E5hwiHo9ffcDnZ
         9TPwTqU4NOOfb6XI0VBWD5yHJg6c+VRx5eG2REY+xPjqxNwvG/1X25Z5ASydX0SfDlxV
         9UmSHhdiVgGOfYjqQoD/Ykv3ywWLCT7X2ETnn6euSUkMQwDUdyfQMzuviSjCIhloscnB
         AWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743065640; x=1743670440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6BySgb+YX1n0zynhi5aTDP7DfGbWcQJepmiGx4Uznek=;
        b=nEda82FwRdBrIUG/8GroCIduq/Wc1asixSIgJg0l/fTLroYmadMUlhiepiLS12XGb1
         cA34RiHu2oRaLfS4QWO5VtD1BnycnXm16XhlcHN9Y98XlVV9iRrv8lG69AqXHuWDPZBZ
         3t4/1UmjyhOHIxCf0dZUr4PzP2wqOgiKFFydbe41j9ltS8w5MmLjFXjlxt7In+Rdxmso
         mo53Am4OjTnyohpuDd6w0U/ZtZy1eXXbEDKScUjeHDdDfahTDwBPdiyDU1Agm6nhb6A1
         XwZVi0dyTgiqNgj/uBlaa08JpZhxI7izYeb6qpw6YvWdHuV1xSygs6TtzuB8s28kXpSC
         pa1g==
X-Forwarded-Encrypted: i=1; AJvYcCWvF+kBnrA0dR1Nz2mehETyUyWpvbOAXMd0y44A7AOizJ2l4jT9cSyS8cQopHF9xzra/rcdtJ61ajg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZY7PKBnCUpk7mLjJpnViGAMXiPEmJIs9QRxf6jU+ilHi1uGbH
	o/h9VzJrSw6QHKnAPOi9bjxAvHrLaGRp7iDutJxY5JDtAbdXKGCojUdXkGZbYwk=
X-Gm-Gg: ASbGnctEPpXWz/Wh3rYzF0VVXUTyK5B72Mvs8MUl68RIzgKC64ToM5pA7nW7PnjGn/8
	kiyrUgAwrZrL0mkVxDYHQjcY7oRnwj+Csc/NmUMJK8oI7FuDj0dz8X02HTNlQB6e1BQrr2mJhpd
	KQUMLyNBzHO+M5EXvEmfx38wamPLoBF7svhe+yQYZRqN07RtUR4QcoZoDFrAoOr07w7P19tftrb
	JP8htvXwEhDlpt+oC6jZhAsH9SDX3zih4nSqgm52MueYpfykVVDG30TrDdVWaJZ2Ov684OpIPZE
	oegvhN+7G8uboffAiU+mXorLj7gXBP56z5Vvi3efGiN1p1ZkDpiJfZp7qxWpfbv2EwxKAjSFGjB
	CD0Up4VwAHj/672rrEiY=
X-Google-Smtp-Source: AGHT+IFyJgQNJ+z2yf/1utBG5Fac687BQ3VUHvz4BzbtEjnzkLxmOA5Hg+XZeYpBEVbRsM1UcB+q0A==
X-Received: by 2002:a5d:64a1:0:b0:391:4674:b103 with SMTP id ffacd0b85a97d-39ad176bad5mr2449680f8f.39.1743065639708;
        Thu, 27 Mar 2025 01:53:59 -0700 (PDT)
Received: from archlinux (host-87-14-238-193.retail.telecomitalia.it. [87.14.238.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6445sm19355197f8f.71.2025.03.27.01.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 01:53:58 -0700 (PDT)
Date: Thu, 27 Mar 2025 09:52:47 +0100
From: Angelo Dureghello <adureghello@baylibre.com>
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Jonathan Corbet <corbet@lwn.net>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] docs: iio: add documentation for ad3552r driver
Message-ID: <uvpbdx7nzydkzigvtkx2loz2swkdrikgcbhgnlnwa3umk6ejk6@miwwdfqy3leu>
References: <20250321-wip-bl-ad3552r-fixes-v1-0-3c1aa249d163@baylibre.com>
 <20250321-wip-bl-ad3552r-fixes-v1-1-3c1aa249d163@baylibre.com>
 <Z-R_fiDpOqV6yXcd@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-R_fiDpOqV6yXcd@debian-BULLSEYE-live-builder-AMD64>

Hi Marcelo,

On 26.03.2025 19:28, Marcelo Schmitt wrote:
> The doc seems to be all about the high-speed setup despite classical SPI support
> being mentioned. It would be interesting to see how the regular SPI and hs
> ad3552r IIO devices differ from each other (wiring connections, IIO device
> interfaces (attributes, debug files, ...), any other relevant peculiarities).
> Some comments about that inline.
> 

had to add this file mainly to describe ramp generator usage.

The ad3552r (classic SPI) is quite old stuff, may work with whatever
controller with classic simple SPI (SDI/SDO/S_CLK/CS) so no particular
wiring diagram or explainations should be needed. 

> On 03/21, Angelo Dureghello wrote:
> > From: Angelo Dureghello <adureghello@baylibre.com>
> > 
> > Add documentation for ad3552r driver, needed to describe the high-speed
> > driver debugfs attributes and shows how the user may use them.
> > 
> > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> > ---
> ...
> > +==============
> > +AD3552R driver
> > +==============
> > +
> > +Device driver for Analog Devices Inc. AD35XXR series of DACs. The module name
> > +is ``ad3552r``.
> > +With the same module name, two different driver variants are available, the
> > +``generic spi`` variant, to be used with any classic SPI controllers, and the
> > +``hs`` (high speed) variant, for an ADI ``axi-dac`` (IP core) based controller
> > +that allows to reach the maximum sample rate supported from the DACs, using the
> > +DMA transfer and all the SPI lines available (D/QDSPI)..
> Is D/QDSPI about dual and quad SPI? If so, what about saying that more clearly? 
> 
> > +The high speed driver variant is intended to be used with the ``adi-axi-dac``
> > +backend support enabled, that is enabled by default when the driver is selected.
> > +
> > +Supported devices
> > +=================
> > +
> > +* `AD3541R <https://www.analog.com/en/products/ad3541r.html>`_
> > +* `AD3542R <https://www.analog.com/en/products/ad3542r.html>`_
> > +* `AD3551R <https://www.analog.com/en/products/ad3551r.html>`_
> > +* `AD3552R <https://www.analog.com/en/products/ad3552r.html>`_
> > +
> > +Wiring connections
> > +------------------
> > +
> > +::
> > +
> > +    .-----------------.                .-------.
> > +    |                 |--- D/QSPI -----|       |
> > +    |   DAC IP CORE   |--- SPI S_CLK --|  DAC  |
> > +    |                 |--- SPI CS -----|       |
> > +    |                 |--- LDAC -------|       |
> > +    |                 |--- RESET ------|       |
> > +    |_________________|                |_______|
> 
> This only describes how the HDL IP connects to the DAC which is the high speed
> use case. Maybe add a diagram for the regular SPI connection wiring or say that
> the above is only for the hs setup?
> Also, what about adding a link to the HDL documentation page?
> https://analogdevicesinc.github.io/hdl/projects/ad35xxr_evb/index.html
> 
> > +
> > +
> > +High speed features
> > +===================
> > +
> > +Device attributes
> > +-----------------
> This is only describing the debugfs file. What about also listing the usual
> IIO device channels and attributes (out_voltageX_raw, out_voltageX_en, ...)?
> 

they are already documented, since part of the iio stuff.
Please see Documentation/ABI/testing/sysfs-bus-iio.

> > +
> > +The following table shows the ad35xxr related device debug files, found in the
> > +specific device debug folder path ``/sys/kernel/debug/iio/iio:deviceX``.
> > +
> > ++----------------------+-------------------------------------------------------+
> > +| Debugfs device files | Description                                           |
> > ++----------------------+-------------------------------------------------------+
> > +| data_source          | The used data source,                                 |
> > +|                      | as ``iio-buffer`` or ``backend-ramp-generator``.      |
> > ++----------------------+-------------------------------------------------------+
> > +

Reagrds,
angelo
