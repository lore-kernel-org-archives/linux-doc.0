Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113B7393DD3
	for <linux-doc@vger.kernel.org>; Sun, 24 May 2026 12:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779625807; cv=none; b=KzQxw/eghiRCUjY0LclUDNgnE1Sbwyj39gohMrQYtJAXcu9HLGetNBUpgTQKtndkaTo81bxzyFh3CUo5JleoOvIt9p4cIoov9ujJXCCB1LodxXra+BfO8sy0FQj3XNNb/9BXgVL6HTzmbHmX5twL2LY4611NDJuELRDD8pcdmhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779625807; c=relaxed/simple;
	bh=ERoTsAxoECnJLoZkCdSBrxZOe8Upzt4O9Uj+YfgixCw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWVCniRdFr7swBYd3wnrVcjoKhed8GPIbO4jBkzKvGPqcr3rSHhLYGYPRltFstD8YdAN5aNS/9bLP33uSP/Pb0hJoERbB9DQeINTCpjldMXKLE/nD4wTWPVnQKkjJq6CmxpRGfDqdTjIjdAeA/+b0vm3xfDj6Ql6IWSLlLLRcGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNjesyUx; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNjesyUx"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49050bfe053so12878795e9.3
        for <linux-doc@vger.kernel.org>; Sun, 24 May 2026 05:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779625803; x=1780230603; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T1o+DvC19PR6GkTpTccEfjTify4jzFt0w17PhEVHA98=;
        b=fNjesyUxCwzSP6/O1jV8L47nm3Lc8Rb3gKfxQztn+6mSVAn7FXb8Rz7msnnsH07K0M
         GIr6IkNtzF+VPW4hCYyLy77k5+C0YiS4Qcj/G4Dtv0dLevVnaUz4laIPGVh2uek3p963
         b2PDIRvK+Z4WLlJH88vrrRFJsmXj7wsImj9wP+eLi16vtmHg0uiy3GCEeSPC5UxtSsnL
         EaqldWS6jq4Q4D8pgj5v/LWSrAnzlsJ0KHU/DOxC0fmxcIgroo49EAFiAAm+7ouKBUnC
         qfBBFdo5mdOdpEG4DJwJVweteUneN9sAlEa25HKkLOZqidGjFGj33EPTBJlWcGjyBF2x
         Fj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779625803; x=1780230603;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T1o+DvC19PR6GkTpTccEfjTify4jzFt0w17PhEVHA98=;
        b=V3CGHgeEFj8k+etreK2Z5Xb45gifvV2u1YcC+Rdy3OhZp48uIzRqYBKIZKZvcCs4Ym
         Y+Aw5NqKb/SnSIwqKvG5RkgnWP0r8gVYlM86QImUMthKzb4YbCugtp2aP4DlMpNxcSWl
         hlQfH1Dki9nAQrI8tJC5VLphorZdJEvHYon2QHrg1Ksw2JGuQ4QlAre6H+2AlfwYd1Lp
         e/yN5ijkArZErClzhGaa7vCb1Sq7gUUvN/BuLrTTkky1igatjQMOFlBe8QbvWjpwVYN5
         eZ30KXEMmfozuapdw7ANNLgMJ92Vf5DBfHmdztmDQDVngGwMWMNROWdVOMMOyQwSotDM
         qlYg==
X-Forwarded-Encrypted: i=1; AFNElJ82VtGcolMo5JdhmAxm6wtNV7qLBSBQRonHtNSsUEnGGi2qZEsUq2my4In7AxGkTv+LuixptXGF/m0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJnamxVJJlLdAAQ5TxR9MhNKBqlaCXC4UWvZG61xdEuss2yVr2
	qAc6O7sd1EWBFlY62tjrXJAZJ1+eXx/28cORvuM4CpKVGt2SGbO+ICSS
X-Gm-Gg: Acq92OFbRjqshxS94vGO8J9AJHNKiDL+8dRdzgZcCumgVcS+UGV5ITbTFnOZ79URzi3
	G/XD2CK3kl7Adca0BOVIhJDEyMwIyMWxvlrZMzihcXq8OIvwpvysT0zc0PJiBH2IZJ7mdaBxGF/
	O0YG6/cLdck3AiXTpDql5drjSXU91tUplzKxarEp87nRtrKyn7CEeDDcWjEquxkFJ0uMYCRTBOX
	YU8X0pZPJPn6s7UY6Tv/dqWsrEvvRpyk0g14d5FasqbnVyBMIyg1Y9CrHcctVzrPYN34QCnVXxI
	jN/z4WIKkwtVjfy/iIumx1wHkgO59MHCsBYRokUT8JG23fFZhl+ogh4tmw+OPTB74zW2G0nskSV
	BPQS76tiQy6EyDRkhNRCfzQm33QL5TgYT0klM/IrqoLcxDF039OiNl+3QqlerjrkF+nSCmFO3U8
	7/+54k2ScugsTPk8shRvbHiEWAhhZPHJcNuI7AmcNB0xv5FdMK1UupzUCqFY5tPM6oy5FFp7rL1
	zg2ucoKM5yiN2xRvMZV2MRdcKxoFZ9O+dWczNqE/nVz2bhBildjDHaoItsj
X-Received: by 2002:a05:600c:3547:b0:48f:e6b9:c740 with SMTP id 5b1f17b1804b1-490428f30bcmr180656565e9.30.1779625803084;
        Sun, 24 May 2026 05:30:03 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490424aa561sm84023815e9.5.2026.05.24.05.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 05:30:01 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Sun, 24 May 2026 13:29:59 +0100
To: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v14 10/12] iio: frequency: adf41513: features on
 frequency change
Message-ID: <ivren25tav5pgaynyrsujqo5zqfp4l52wu7jtlk5cotc62vbjs@nop6xcq6gjyj>
References: <20260524-adf41513-iio-driver-v14-0-06824d9c15f4@analog.com>
 <20260524-adf41513-iio-driver-v14-10-06824d9c15f4@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260524-adf41513-iio-driver-v14-10-06824d9c15f4@analog.com>

On 26/05/24 11:15AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Bleed current is not computed or updated when switching from Integer-N to Fractional-N mode if the PFD frequency remains unchanged.
> --
> 
> commit 299bd27511dd5b2a2354c749631d53bcff158e2b
> Author: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> iio: frequency: adf41513: features on frequency change
> 
> This commit adds bleed current configuration, lock detector window adjustments,
> and phase resync support to the ADF41513 driver when changing the PFD
> frequency.
> 
> > diff --git a/drivers/iio/frequency/adf41513.c b/drivers/iio/frequency/adf41513.c
> > --- a/drivers/iio/frequency/adf41513.c
> > +++ b/drivers/iio/frequency/adf41513.c
> 
> [ ... ]
> 
> > +static void adf41513_set_bleed_val(struct adf41513_state *st)
> > +{
> > +	u32 bleed_value, cp_index;
> > +
> > +	if (!(st->regs[ADF41513_REG6] & ADF41513_REG6_BLEED_ENABLE_MSK))
> > +		return;
> 
> [ ... ]
> 
> > @@ -630,6 +725,14 @@ static int adf41513_set_frequency(struct adf41513_state *st, u64 freq_uhz, u16 s
> >  		st->regs[ADF41513_REG6] |= ADF41513_REG6_BLEED_ENABLE_MSK;
> >  	}
> >  
> > +	if (pfd_change) {
> > +		adf41513_set_bleed_val(st);
> 
> [Severity: High]
> Will the bleed current be properly configured if the device switches
> from Integer-N to Fractional-N mode without changing the PFD frequency?
> 
> In adf41513_set_bleed_val(), if the device is previously in Integer-N mode,
> ADF41513_REG6_BLEED_ENABLE_MSK is cleared. If the PFD frequency changes
> while in Integer-N mode, adf41513_set_bleed_val() returns early without
> updating the register.
> 
> If a subsequent frequency change switches the PLL to Fractional-N mode but
> maintains the exact same PFD frequency, pfd_change will be false. Since
> adf41513_set_bleed_val() is only called when pfd_change is true, the bleed
> value configuration gets skipped entirely.
> 
> Could this leave the bleed circuit enabled with a stale or uninitialized
> current value, potentially preventing the PLL from locking?

This make sense. After adding the suggested guard for bleed enabled I should
have move adf41513_set_bleed_val() to be called bellow...

> > +		adf41513_set_phase_resync(st);
> > +	}
> > +
> > +	if (pfd_change || mode_change)
here..
> > +		adf41513_set_ld_window(st);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260524-adf41513-iio-driver-v14-0-06824d9c15f4@analog.com?part=10

At least, that would be a quick one. We can have another round of reviews on
the decimal parse function... worst case, we can have another week.

-- 
Kind regards,

Rodrigo Alencar
