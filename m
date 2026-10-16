Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7873CF208
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 13:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157585; cv=none; b=FNwkJb3lEUmttWuKgU7PQ2enPkPtTWG4FqMVGmIJmrhRoisnlJ/9sPDVI9NE+o7LqQIhD+Nbfpt4zsZNxrd+Jn0J2rc+wcX2QAAk2rwXwVRQyYRnmAq9iMzrrD/vQS6DC2svHXBUjgjrOdpBD5M6RbNS0M/rWNTzIIXJJHGvcI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157585; c=relaxed/simple;
	bh=i95j2QTUxUV26LtH2QgoMoHAgaPIWZwAcc2BGKU59l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ccgZurzYFLB69APY2E4eOuMTMm+qxEFFU0ZbOoRcCR4mEF/T+zYCA57RyE1hYsl69U7Xl/FblxxqSREqKRRTRnLHdOZjf6ysq01Ok0ckB2L5xvNz/VLrmcU5nyEbURqr5ekQFZyq8zKT2OMRmrCEHijjD5AvAXgT6dP/FYRrW/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKUVLRIo; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKUVLRIo"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so300145eec.1
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 06:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792157583; x=1792762383; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FlBbDxtOReq89XnhI+hKh5wvHROzNIJb82m4kgAxxcQ=;
        b=UKUVLRIoql6W06i8ezjS31iaAk7KvWBvGVOBgmvSXKrgPS9UCORkxEZPhZTx2PrqkV
         GWRFfdosErzFasjwqAEteJdlfl/tIMz8cGrOcraO9m0SAtNwOPCU0RjOlNyZ7qIkFNjm
         vGF6lmDP6TB/vh00Rjpm18Uo+GJA+dusPpEjFzUPH1FEqM5qoT/V3u1K5jHB+f0SArsR
         gu4ykqKF1zwP70AOlxTl+OPoCakgHdWJdx3ukMcmyZOD2D/R1qRuAUXLPCyzIOxh8IFr
         i8akSintCeOkUQm/fB7g3IQ6pZzs863gCThTA0J06z9J/sWzrdNvCQixogl47yvC4ziR
         4Czw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157583; x=1792762383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FlBbDxtOReq89XnhI+hKh5wvHROzNIJb82m4kgAxxcQ=;
        b=NX2GnhYcTGZ2ibgxI4sB+PEgQNfKYw8AyBiu9nTlFLliGk6qlql6dQgGujO9gaIWba
         LPK4G5ukEL3Rlk6WbYPwIzuJnJ9fc7U6BqMNSAIxlSGiMFueS5QaHtrMTcdc8OoPjNht
         5vn1SVYO5+ccSImNfQ+JFwXV0/mjmxk8ggow3RB9biGpZzKmozGrYknG3FhyOcBBr1+c
         SepnQUKADAF+xIsWLGUqNj21fXLxrZRhb9EWsfPIJdM5blsi6GN2MUEzO45LMtw0c2cZ
         gNSqgdTewbZexS70Fcwvbbk/Ak4Opf65tPob3h3/RojbBcW7JmRLRGNltH8ULu/KVmmM
         n2Eg==
X-Forwarded-Encrypted: i=1; AKwUvBz7gyM4QoMivHoO/9pFUMY+77/pdFMeMj2WfjIg0iHi9zpjodInfzksMy5WZv+8uJ2NOZ8WuT/M62A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdf2t18FQa/yL5O46tu62QIlVW+tyZIKQC0TF3uKEJ40oxtyRf
	l+PDEshmhi4f/Ij115983f8r9Mz15UnIkwF1+5wsP8cHN6vTT3Mcz0TG
X-Gm-Gg: AYBFou35AjKBm28NArzIzyCM0+LYIrXszuJSHjnnTzY0DGUVue8Nn9MOUYjjSzWjMW3
	QjAypEw18qaQLvFf4OgkgoLK2znvPkQSb5GPKTOP+AuJRWwtDNv1Mi5heYyRiPYELjpGYgEEy8T
	GnVGvFLOcxC/vxrWOaG/cv6cFk7yuMYpU5HRWb06pu4/QDdZ7JWslJQsXRbfuo/NS5+qCnSX8+h
	B4of+V9bOX9Zk8V8gMtP7a1lOWwJCr5VKxyn8gtrNiPum8ZWrNt2DjuSvA9xwowwThuB0RPKKSq
	0of6e22PJ+U7T4ZcZVtbfxaYy3mHBbFHKZnwuKsh1xsfJf8w2nOjMKZtnfslNvwXk6ezQ55wFWm
	w0+U8K33LTJ+UNRptBWI05184mUn1d/qzYMdF+EKkJ8veSy1NAYwF41nM2B8Ozm+jJapMiMmmBk
	ts2r4dE/ljicy3aO2tHZEuwQTF4Ubc5w3qqIcpjnS2Rz4KoirZ6+Sn1232a7Dx0TgM9cHr/5KVO
	lM2/A2kIgZy42H0E9mn3s6Gepa3wyc2GBu6TtAEJsEcgXvDsO8x3L9uQc/Zrd5eyKdyUtLbZI0=
X-Received: by 2002:a05:7300:ac81:b0:34d:de2e:1fca with SMTP id 5a478bee46e88-3537dff5a5cmr44216341eec.21.1792157582543;
        Fri, 16 Oct 2026 06:33:02 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (158.95.44.30.netskope-rdns.com. [158.95.44.30])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b792bsm6964225eec.5.2026.10.16.06.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:33:01 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:32:55 -0300
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@analog.com, devicetree@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 02/10] iio: backend: add devm_iio_backend_get_optional()
Message-ID: <qxuz5guawnr4higgwnwvbhag7zfw6d2derwy6j5dz2uhccevvc@dsucxvhq53ef>
References: <20261015-ad9910-backend-support-v1-0-3c21648c8e26@analog.com>
 <20261015-ad9910-backend-support-v1-2-3c21648c8e26@analog.com>
 <atEeZPOLASHAcnjF@ashevche-desk.local>
 <atHjHqyxXj6jkObW@nsa>
 <w7waqang6lriwbcq6o5s5yuedouuwgacmnj55qsjpzjrv3jut2@cthvkakgyhpi>
 <atIkZa0noHjcl13X@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atIkZa0noHjcl13X@ashevche-desk.local>

On 16/10/26 16:19, Andy Shevchenko wrote:
> On Fri, Oct 16, 2026 at 08:18:08AM -0300, Rodrigo Alencar wrote:
> > On 16/10/26 09:45, Nuno Sá wrote:
> > > On Thu, Oct 15, 2026 at 09:41:40PM +0300, Andy Shevchenko wrote:
> > > > On Thu, Oct 15, 2026 at 01:49:42PM -0300, Rodrigo Alencar via B4 Relay wrote:
> > > > 
> > > > > Frontend devices might not need a backend driver to rely on. An IIO device
> > > > > that supports backends can behave differently when they are not available
> > > > > and that should be acceptable. Such parts may provide basic functionality
> > > > > solely using the control interface (SPI for instance), being able to have
> > > > > extended features when a backend is present.
> > > > > 
> > > > > Add devm_iio_backend_get_optional(), which returns NULL when the backend
> > > > > is not described in firmware, i.e., when the io-backends property is not
> > > > > present or, for a named lookup, when the name is not listed in the
> > > > > io-backend-names property. Other errors, such as probe deferral, are
> > > > > still returned.
> > > > > 
> > > > > To make that possible, a named lookup that does not match any entry of
> > > > > io-backend-names now fails with -ENOENT, the same error returned when the
> > > > > io-backends reference is missing. Also, the missing reference is no longer
> > > > > logged as an error, leaving that to the caller.
> 
> ...
> 
> > > > >  		ret = device_property_match_string(dev, "io-backend-names", name);
> > > > > +		if (ret == -EINVAL || ret == -ENODATA)
> > > > > +			return ERR_PTR(-ENOENT);
> > > > 
> > > > No. Please, use device_property_present() instead.
> > > 
> > > Oh right! Totally forgot about that internally :). And it fits into my
> > > internal point where I don't agree much in treating -ENODATA the same
> > > way as property does not exist.
> 
> +1
> 
> > Say a frontend consumes multiple backends, but some of them are optional.
> > If we care only about the presence of the property we would fail when
> > trying to acquire the optional ones when the required ones are defined.
> > am I thinking correctly?
> 
> If there is an empty property for names, shouldn't we simply fail? I rather
> would consider the firmware table to be broken in such a case.

Not exactly for an empty property case (or not only for that),
but for a match_string() error:

https://elixir.bootlin.com/linux/v7.3-rc7/source/drivers/base/property.c#L539

-- 
Kind regards,

Rodrigo Alencar
