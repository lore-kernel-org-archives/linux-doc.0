Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5866C384238
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 20:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781037903; cv=none; b=UMGJJQgIaV2r+EnirmArk08tGz9d00ZVPq5ng5Uh3cFxXg+jQhQms5t1ZXG5zU2pbHWsv3KGJmpaROngqHOE+Qs8LH5qPaZbcw4HWluUMfs5C0Zde8HzxTVXe8tYQSpC87q+L2EG84/zisHAGHC82rh3UzeyDmAUW7V3/I8dvxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781037903; c=relaxed/simple;
	bh=4RkrfyrzqKnxXYZ6+DDtnXffS/hfXv67PVBEUezmkB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afRMl8OfmuqXRZOZr+/lwDMWZcNzDMPM4gJBlNmnjQ0V9ap1RhL8Ruqul3ol0YondcWJWzRrXCGxn1gBoiaqWtjHEHbBpyBVoHOhDn/cj1NT13hB2AGVOsk0CE5xAsjIKSoCYsr7nQb2WBd7GD2QuEtBGmjwbpzxdYrjFNYJ0q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBV4YqQ7; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBV4YqQ7"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf2247e38eso62673455ad.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 13:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781037901; x=1781642701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DrbFaHt/sfzoTAd9VNUt1Zfwuflm4DlAD1twm0YxE+I=;
        b=HBV4YqQ74V8iCEO0Fma8zFD7njmRZH+yFkHEJKvI/KbjUvJ4mplaCk3c1huefqGuWW
         RXscgnWT9ih+vnOimQdWMb1pOndN0AjWIpjf92D1D8l53Qa22TgEkb3nLdTFyHT4fiEh
         g3pdG5W0Midm4zG95l/Mk+Z3kwnQfeiMvgwIhVEEXLPVtCL0RNpZIxdcK8rk8LHBDplq
         /tRTdUlNt4WaS5YFK8RgiOxnbXcIzdfH0rOh7VN+IcZf2J/ruTGf8NkNDe8dfwJXL82W
         ik4piOraqlrZxjaKTmdiZlLWL2tIMj93V+a2dcai+dNgCA6QyRiH0+olvqJ8ZeOcsEXY
         xGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781037901; x=1781642701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DrbFaHt/sfzoTAd9VNUt1Zfwuflm4DlAD1twm0YxE+I=;
        b=awFgL41krCYzTez0+LTE1nRjoiw1dlv87sBHpTnLFRYm+h5SoVXSVdpx1h61orsrhk
         9aFafL7402JuWpmzT97CsPj/IqR62HqLXTnfPIJ2TQYb5nc7oCaCU5qUD8AVlZC9viM3
         eS5LeQSDikZHfFi0e8cQ24VfLadqWxgPN2+mJYgT3gkAJJkcmIK0t2TJ6VRFVkG3eQLK
         uJUXejfvf7VV4MMb/nvh/8/XvkP2gZCLidGcyNA6p0WSM+M0yqGkhOuF1ErAWGoMRWmP
         PaECinUAi8kDBIohg1gYKwgwYizE8AvwFaP0G8v57/VrTEzvdLtc5e0+ieTmrhy7hFDX
         dQWA==
X-Forwarded-Encrypted: i=1; AFNElJ/ufeDafi+mJ30o8uzniEqynKa1Qm6G+jvVwefk7fzxoT6cD6FTGZbqNISLW68Ezthq9AG0xxqpph8=@vger.kernel.org
X-Gm-Message-State: AOJu0YynC6V/qb3zXDIXif+ID/wU/zhqC2pEZPqlU21XxGLz84WvSFxn
	F7KQ9SWCLlFLWJrpO6Tb830MseOfwDeV9S6pYDbTWX8rX9UFHLAdYL1n
X-Gm-Gg: Acq92OFZUfreQ7LeCzLfiJqO3iLuHE1R1Da4+AFaO2nnjQDagdroEGO5IpG9EYWgM+J
	UPLVvYjsgj6gZQYONVtdjngTN8IBYwr29KQPraOOCIoTzgkv+Z5jJYVeC11NQcx+zbYPs+PN7go
	BDeWFQH/2NNUQmSE1TWl3ZPICH/G6rboX0YxKdRqkmVwfLF1s7Nayn0vKTnRtn9l+VnetNbjoF/
	ICUzeFdh+usHQd76oHRohHrx7pzQIV4KylUBXv/N7vT1Rbs03Y4/GhPQaUmFAFr8OUf3xtC7SkF
	4QSEdIxAc3Go2omgphNvaUIFXnx4OEcxvqw+2nEt1BFQSqxW6FSf6dPzzwJJiKGUSQKLpA6DkTZ
	yTyvar+d3/qUnT+btm30wnFRZFVN3z6uQzIAMoN1B+oyTVzSVJD7BP6M4S107CWEdnYq6coMGVo
	XtzpRAJqIsmvtsm9QKQbKGmkB1Q8BG9+z5Uuzom710mlnKxvg=
X-Received: by 2002:a17:903:1246:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2c1e821dcbbmr254657545ad.15.1781037901551;
        Tue, 09 Jun 2026 13:45:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6cea3sm218492375ad.7.2026.06.09.13.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 13:45:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 13:44:58 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	richard.leitner@linux.dev
Subject: Re: [PATCH v3 1/3] hwmon: ina238: add support for samples and
 update_interval
Message-ID: <32a5275f-17fa-4439-8bc7-eec824f0584c@roeck-us.net>
References: <20260609-hwmon-ina238-update-interval-us-v2-v3-0-016b55567950@advastore.com>
 <20260609-hwmon-ina238-update-interval-us-v2-v3-1-016b55567950@advastore.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-hwmon-ina238-update-interval-us-v2-v3-1-016b55567950@advastore.com>

On Tue, Jun 09, 2026 at 09:43:10PM +0200, Ferdinand Schwenk wrote:
> From: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
> 
> Expose INA238 ADC averaging count (AVG) and conversion timing
> (VBUSCT/VSHCT/VTCT) through chip-level hwmon attributes:
> 
>   chip/samples
>   chip/update_interval
> 
> Use per-chip conversion-time lookup tables so the same helpers work
> for INA228/INA237/INA238/INA700/INA780 and SQ52206. Cache ADC_CONFIG
> in driver data and update it on writes to avoid extra register reads
> during read-modify-write updates.
> 
> Report update_interval in milliseconds as required by the hwmon ABI.
> Compute it from raw ADC cycle time multiplied by the active averaging
> count, and apply the inverse mapping on writes so programmed conversion
> time tracks the selected sample count.
> 
> Clamp user-provided update_interval before unit scaling to prevent
> overflow in arithmetic conversions.
> 
> Also combine chip attributes in HWMON_CHANNEL_INFO using a bitwise OR
> for a single logical chip channel.
> 
> Signed-off-by: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>

Applied.

Thanks,
Guenter
