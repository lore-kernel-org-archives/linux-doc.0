Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402901C5496
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 07:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750231604; cv=none; b=p8X4xbN3lMvQRw5jJHKtwV84Vdbtw9n8sqljJHkouT55eH/f+Y+BptNec8q6AopjCpXx9FgfDA9CDcqtTzM1noBzX4I23bq18Kje8oNalIecCNMszMRsbPnHiUHceWchzZv3s0/vqBy4yf4+EYP3WU0io6DTvZ0vnuONGXKU/gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750231604; c=relaxed/simple;
	bh=+KzNV4oOOMx38wmOYSChoYo8E3X2rejrMJIv37ZNqsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6UJcXERrSbkZ0CsNuX6a77yKFRqFzZhcDwoPf2b1VvvDl3vZEDWU4iIf4ohFA51AA1LGrNqbMstDrbEbgYt1tcEGtz+57FTLWwlbshMB4ZnQE9i0QAk6DaL+6AUic22D/MZeDWFO9Zzoqln8IL6O9TD/BKZoMW77/27/mCh9eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GDAIoRop; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GDAIoRop"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3137c20213cso7781305a91.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 00:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750231602; x=1750836402; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hM1UhMnYVhQUG4NEkfTsgeOJp+Ekml0puj+o8yaatbQ=;
        b=GDAIoRopxPuU4liapuSYuXmAxZFhE+u/eQR9Kcpbz64AFGCXJFrYJoH4IWI8mOEw4X
         0px/HVqYJ3ZgIaGOXm9rkOp5oR3SFArAKvE9IYo4zT4P3I6BwM8FwGw43TmS/PRKtQWA
         OzE+0jB2KLmI+ZDDNS8Kf5H0mYlXuD5FCq9G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750231602; x=1750836402;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hM1UhMnYVhQUG4NEkfTsgeOJp+Ekml0puj+o8yaatbQ=;
        b=vQHsYYQaBUA5RZ8t/pG/WhzMw3NuqJ3wcAD1huCckIUPGaZxyVNhTQU8kmAFJnL49b
         CRTUCexxabPU5vSEI6Nn1no/7KZ5ljwnQjionySRG7sMWL6/wIkIyFA10ZwH1RSZnVOH
         do/wEbYsn3OP4bEkQ1ha/4/HaV0nuixb4b393uD28bcCQDLc3R1xxAyQamHfyNsaSkWh
         QBz4nPIPJADnnOBPK5GNEVPsqvG+D2y/R5iezWsnzdb6rBKC90z6EPKunv5fTS35gF7W
         Zc2vAzpI0DjgBghEvckTQjOc8LJe0ZmvMwnZbJc1fRWtyx9w4U5g9Af2sLMyj+jBYvwv
         2jfA==
X-Forwarded-Encrypted: i=1; AJvYcCXkgfzfFIRptKc9yeXgcGCl9MICphp5523189HgqvnXGk73rMM7/SHK0WRHMVcXilb3H7rRpDeDw+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVP+9RHP9m3aHqd4/szY3dONns0qN0QGksLXnvj2hSv4hEXj/K
	Y4jN+yxi9HUrqgy17dDWTaSq6N1oLiRPILsMW4X3J5JV5YJDkgVbMDaWZFT2E6Z63w==
X-Gm-Gg: ASbGnct7AKSIFJxn/E+lzIvNJPdQ9LDZo8hhCR8Ikyh00VqZjXkqZT7MmShQTRuFJnm
	AbHZX7MoiFYW8T2LMbDn4fhOGDc1aa8AvH/Y2DZv9Suy7NbfjoOzxViFBlJgV5CBCHkGYD4UCU1
	RNln8M7HiC4dn7iKfs5zTk1cVQjVQ15b2xLe50CJ1zc9m5Q15LUbfrgAvNhIRWLfJJgck9BIGak
	rgkSwTkNOxYPS3MguhIwx6/x1P3rFBVGVWO4kSd9woQsIqr0Yi2nE1NCVswZDOq5WDs+JSDP7P5
	M0wibY1V1g903TBXY8Nz4yEZ9AiIoXRMTwjSa75legIj30zcUr8yv5bvEQFPlnSlyQE=
X-Google-Smtp-Source: AGHT+IGmlF2R53aG5doFh6Ww/jme75FfKP3jQE6NmFAaZ7BCSPsq9zGRmtfVZXCsvQQaCwhcGykC3g==
X-Received: by 2002:a17:90b:38c5:b0:311:da03:3437 with SMTP id 98e67ed59e1d1-313f1d05d1bmr23596610a91.27.1750231602456;
        Wed, 18 Jun 2025 00:26:42 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:50f9:5771:52a9:eef9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2369ebca745sm13850295ad.100.2025.06.18.00.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 00:26:42 -0700 (PDT)
Date: Wed, 18 Jun 2025 15:26:38 +0800
From: Sung-Chi Li <lschyi@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: (cros_ec) add PWM control over fans
Message-ID: <aFJqLkkdI86V3fM9@google.com>
References: <20250512-cros_ec_fan-v3-0-a9f2b255f0cd@chromium.org>
 <20250512-cros_ec_fan-v3-2-a9f2b255f0cd@chromium.org>
 <ca2c10be-3dc4-45e1-b7fc-f8db29a1b6a0@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca2c10be-3dc4-45e1-b7fc-f8db29a1b6a0@t-8ch.de>

On Mon, May 12, 2025 at 09:30:39AM +0200, Thomas Weißschuh wrote:

Sorry for the late reply, I missed mails for this series.

> On 2025-05-12 15:11:56+0800, Sung-Chi Li via B4 Relay wrote:
> > From: Sung-Chi Li <lschyi@chromium.org>
> >  static int cros_ec_hwmon_read_temp(struct cros_ec_device *cros_ec, u8 index, u8 *temp)
> >  {
> >  	unsigned int offset;
> > @@ -73,7 +117,9 @@ static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)
> >  static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> >  			      u32 attr, int channel, long *val)
> >  {
> > +	u8 control_method;
> >  	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> > +	u8 pwm_value;
> >  	int ret = -EOPNOTSUPP;
> >  	u16 speed;
> >  	u8 temp;
> 
> Ordering again.
> 
> This should be:
> 
> struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> int ret = -EOPNOTSUPP;
> u8 control_method;
> u8 pwm_value;
> u16 speed;
> u8 temp;
> 
> or:
> 
> struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
> u8 control_method, pwm_value, temp;
> int ret = -EOPNOTSUPP;
> u16 speed;
> 
> <snip>
> 

Would you mind to share the sorting logic, so I do not bother you with checking
these styling issue? Initially, I thought the sorting is based on the variable
name, but after seeing your example (which I am appreciated), I am not sure how
the sorting works. Is it sorted along with the variable types (
"u8 control_method", "u16 speed", etc)? If that is the case, why "u16 speed" is
in the middle of the u8 group variables?

> > +static inline bool is_cros_ec_cmd_fulfilled(struct cros_ec_device *cros_ec,
> > +					    u16 cmd, u8 version)
> 
> "fulfilled" -> "available" or "present"
> 
> > +{
> > +	int ret;
> > +
> > +	ret = cros_ec_get_cmd_versions(cros_ec, cmd);
> > +	return ret >= 0 && (ret & EC_VER_MASK(version));
> > +}
> > +
> > +static bool cros_ec_hwmon_probe_fan_control_supported(struct cros_ec_device *cros_ec)
> > +{
> > +	if (!IS_ENABLED(CONFIG_PM))
> > +		return false;
> 
> Why? This should generally work fine without CONFIG_PM.
> Only the suspend/resume callbacks are unnecessary in that case.
> 

I treat fan control should include restoring the fan setting after resume, so
I think if no CONFIG_PM, the fan control is not complete. I am good with
removing this check, and if you have any thoughts after this explanation, please
share with me, otherwise I will remove it in the next series.

