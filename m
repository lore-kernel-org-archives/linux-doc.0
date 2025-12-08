Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91892DEA67
	for <linux-doc@vger.kernel.org>; Mon,  8 Dec 2025 21:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765228370; cv=none; b=ZYDXCZBbQnDkzvlcmCAoZxAKWsEaHvA8J/bNvwR8BVgpX2TQAEAq3FU57Rfs6YxL0527EldoE9eA8v0VOcA4d+80TfK95JvsZF3UyDAQBkUPLo727fYZqBbGT4OJ49m4vhMQ++cLEgms5jG+ED8/8Tg3loIP2Z7wAeojrnLZvp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765228370; c=relaxed/simple;
	bh=/eT67ox63Y2ukyMLEkJ7o4b1T9x/HDKX33n+Cz5ZXX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSXJdt+HupjQPlTt+Nub6cEUJEqTFbJQ1aPbmtOfFJwKCBCz7Ke0bQCQed6XIUYL9iCDDZmgIjs0ngUGMmFQckeBXc1u3p02WbSAOJVtlYfeTPql8uiX69JnjSf3JY4PvWKuIaSpCcFLAJzuPgoGUlIi4vEb1vFOyw6/ND3r9As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cN1qyvL3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cN1qyvL3"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso30737165e9.0
        for <linux-doc@vger.kernel.org>; Mon, 08 Dec 2025 13:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765228366; x=1765833166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rv7pv8F5RO+cWw9DM2GqkbgxyRJgD6vx59IxXgSv8+A=;
        b=cN1qyvL3CuoYUrWP6lMSGlsWS+dW7HAOaUGuL4MorolNH1Be3bero3WQi4OYnUiCi6
         5ejAcNsAtpfY3LL1Ce1a8zGNtfJP5k9ojjYZj7NMsT1iLwsvU3BMuq100YSHiPKTAmZ0
         93aNu+gDtOluYvSNpr+lbIdvLQvweQsyiLOAKcOZCBCD1YXb4MrOS9juZ7c5VSoRwHex
         8rb2bAXPj6xfEd9MPCyhqVvH8tWV3C0gXvffzoIKf7c9tR2ulcwWzwWDYkKelakMUeeH
         8Wwxti7Wxxby0wHoXHclTCmFRVrcjX0ygnO74ErBxUbbBlbJbnel6J9lHzXUASrNtP3r
         TaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765228366; x=1765833166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rv7pv8F5RO+cWw9DM2GqkbgxyRJgD6vx59IxXgSv8+A=;
        b=sSncFDaO8OpehbzvhQ4+nyodWohD00dToPk9YrhYrAlHqp5Nfjke1Lis/imfvVz/dP
         0zcDihoMifHX7RPynZCBAulnbS/fTLAyD3K3yZf9Joi5Wzqob3kgsYup5Qip94eUbUm9
         cqzhCtby1Hj6gSencOQMJP+Gc170cEJUrbuOdnWX1GClV8OFKyX/in/fyoU+0OajJ68g
         XmBwj76Bkw0OISKj/7bM4jd5ODoAgYrFksSODWZ76HfEq1u7zk+MI/FDmYmjq6Fs3d0N
         9Uz8/A+FozvGp3dPwHvd5tQIF0Tfr0MVEpoC6QhUCGz0N99QBs7gBoq4S7EYPvoS74ji
         iRXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNY60vfY10OFaH81uhZDx/+QBABM0OGh8lqk33W/y5+pd24qaM0Gmvp/wZG4iSwJZ1msAxHqL70eU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH6BoEiMWliGzGumWx4bKSk+KPVXHq03i2LbP+oQy640rR3eJX
	jbtMcR0nZySnMNVseXTShQjXkGNDD5/5Mb0Tr9/w78BI4/qrmDGY6Kqg
X-Gm-Gg: ASbGncupk7MHzCMq+WC1TBDCJLb9wQZ2HIHei4fELwtQNh+VoXIMYLKgzGglkGjogyM
	ESa4dUvrnyaTNNjgLobS7yqfYjfcbOXyBDoDkv7SFA/TdIFmLtY9mRFnsrUVJFl3a6+lK9LdtWF
	kYO2/EPrpSnwZ7LNHOdL5QtcPTujZmz37NGh83t1loBX355yXO18+C4cSDb8FNlH+iXtFrA13EC
	zDGR4TO9KcPFHJdNugnDLWMpg1Qr0Z1/DcxcxP7XqpLIAPkUZBV7Dl1z7PdGQyeA/0wFJKb5xfc
	KC6dX9dizkJCDTlzs4Mn6RhuAqW3jTgBp3veMhbb23xx7Gz6IIMvxh43yFNbTpcZ0rPpqWFpZFq
	/pmnpchImrolPd8ab4GadlWSOXGotcwktpbD7exPjEuiWb7U4lmykY60bGUqZCHVXBLKafuFnz6
	r0pBPDfBM5pyo9MiLMm+Wp3J2DqYcgJdQGeze+55rNTnETApFqueZXJPhzLoSZtCQ3hMg=
X-Google-Smtp-Source: AGHT+IGziC8WJUD4dISbRmg+IA/4zSrbcv8g/8vcOpn2B+LAP5qj3Xlp2TJThfuKL3AT7cfP8cG91w==
X-Received: by 2002:a5d:4741:0:b0:429:cacf:1065 with SMTP id ffacd0b85a97d-42f9def752dmr564283f8f.17.1765228366006;
        Mon, 08 Dec 2025 13:12:46 -0800 (PST)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([2001:a61:1226:7701:cdbc:9893:8abf:1309])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfee66sm27548839f8f.11.2025.12.08.13.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 13:12:45 -0800 (PST)
Date: Mon, 8 Dec 2025 22:12:43 +0100
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
Subject: Re: [PATCH v3 7/9] iio: adc: ad4062: Add IIO Events support
Message-ID: <trpmhlupu3vwzrulnctewwnfxwtlbr6iovtw6whyzfpjbwnpdh@rcdykddqwoal>
References: <20251205-staging-ad4062-v3-0-8761355f9c66@analog.com>
 <20251205-staging-ad4062-v3-7-8761355f9c66@analog.com>
 <20251206175231.3522233f@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251206175231.3522233f@jic23-huawei>

On Sat, Dec 06, 2025 at 05:52:31PM +0000, Jonathan Cameron wrote:
> On Fri, 5 Dec 2025 16:12:08 +0100
> Jorge Marques <jorge.marques@analog.com> wrote:
> 
> > Adds support for IIO Events. Optionally, gp0 is assigned as Threshold
> > Either signal, if not present, fallback to an I3C IBI with the same
> > role.
> > 
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> > ---
Hi Jonathan,

> > +	if (!iio_device_claim_direct(indio_dev))
> > +		return -EBUSY;
> 
> Similar to below. Consider factoring out this stuff or I guess wait
> for an ACQUIRE() based standard solution.
> 
> > +
> > +	if (!iio_device_claim_direct(indio_dev))
> > +		return -EBUSY;
> 
> Whilst I do plan to take a look at whether we can do an ACQUIRE pattern
> like the runtime pm ones, for now (unless you fancy taking that on)
> I'd be tempt	ed to factor out this stuff under the direct mode claim into
> a helper that can then do direct returns. That should end up easier to ready
> that this.
I will factor out, adding _dispatch() methods to return directly, so

	if (st->wait_event)
		return -EBUSY;

	switch (type) {
	case IIO_EV_TYPE_THRESH:
		switch (info) {
		case IIO_EV_INFO_VALUE:
			return __ad4062_write_event_info_value(st, dir, val);
	// ...

> > +	if (st->wait_event) {
> > +		ret = -EBUSY;
> > +		goto out_release;
> > +	}
> > +
> > +	switch (type) {
> > +	case IIO_EV_TYPE_THRESH:
> > +		switch (info) {
> > +		case IIO_EV_INFO_VALUE:
> > +			ret = __ad4062_write_event_info_value(st, dir, val);
> > +			break;
> > +		case IIO_EV_INFO_HYSTERESIS:
> > +			ret = __ad4062_write_event_info_hysteresis(st, dir, val);
> > +			break;
> > +		default:
> > +			ret = -EINVAL;
> > +			break;
> > +		}
> > +		break;
> > +	default:
> > +		ret = -EINVAL;
> > +		break;
> > +	}
Best regards,
Jorge
