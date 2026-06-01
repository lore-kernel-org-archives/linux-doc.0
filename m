Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808DD3905F0
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 09:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780305778; cv=none; b=QhPFZNvtocDreWO/mG3B5NYySi5eZXUYAwW2sxuEWx+tLQfqF41X7ZFX3UUYT2BbwreC7A8bfSkU5B871Q6tv8R0BWQslo62WoDg5DtMy8tgjJRLglP5+RMXFa3sgBizphrmQmD3hg9bkDAmFv7gskgNJlqHng7bHGPlPBd44ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780305778; c=relaxed/simple;
	bh=rpfwfbxapnDb7Or8/44PpYyEbjlKfqUuWiCVwRD+Tzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3cjheqifHUxpx5V0pGE3wa08nb2wU9ZgRxuDsUT16N6JW8jt7fXVuCWZGyFAAozEYhgfeFuSZwr2yaEy0+g7amKOuxE00AXcGM0ch9sdyxvS4p98KXDME14mcHAqOFTLETMPY6qO0W2iEgJpRks0dZp7OkESXARP290M+223EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hV4xS2nx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hV4xS2nx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49050bfe053so67091695e9.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 02:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780305775; x=1780910575; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yQQS7y81H0NDGPMnprb/jA6ybDLaFKle7kIHgxmBOFw=;
        b=hV4xS2nxY5vBFw0bqgMY7DV6JJOqu6qq2mKWg7MPySOczZA/V6Sb614qtI8eTrB/kW
         i7Lt1eoRGPU5Kx1Fbqs8UhdQDlsKe+SAPrCNLs4hVLpbWnMb1BbdDWgVHZm7ZnWJujBH
         ZFx6C0iJNXCzxzGpicruap5u4083vIrxoIUf6l5ExdKQr/+C4jMGoBU/KLB3mzDtvqJB
         ESw5E1M+wMyTnGZZCMkhrQs0hWxjBi4jOOMcLXNd9H6r85GTo96khVkAXpYmqSjHm5zi
         dZRNVWYw+s6v5cGAwMifq4b27/vI/CecWKEEBQPOQE8OyChx8gpqYz4Os9AofiWvo3zI
         wvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780305775; x=1780910575;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yQQS7y81H0NDGPMnprb/jA6ybDLaFKle7kIHgxmBOFw=;
        b=N5nfgh4YtVzI6P9ZG+OMeWEBeC0NZa3PeIBLbXSmqMB4cTx2uM5gRoZdcdDSQW3jHn
         z+iCxtopEn6F/P3JyRngJkI0zfEjMlxiL1hqm+3eNjOYw9oF3uIoyn56XhzdkpuQuOba
         n/ODkjXJYqlNI0/VyIdPaztSBGkykqr7ZJlMJtwCUAlv+QkeNz+pfVMlAcvcYybG5FII
         +iX6RU7s3u6IdKFk3dk6BhSiY4PTCkSxqtN39OuRtdDJkA+xcFRtuqz8QI7OlIQMrLJ7
         fZmhVDyIv+Wnif+qgAaOc7LjH4S4IJ1+pDgqBAEFXke9zVjItU2H5y94GG6F/DdjKpjW
         W3Ww==
X-Forwarded-Encrypted: i=1; AFNElJ92Kh7/o1ggKHfFpipUvTW3w1UW9Tuk6ZJ1y1+ZFQAJ+CDdkQCU4jLEyJDCthAJ6mUDPNkkuoE4lvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YywxQnVSgCoPB00CahSAvBmJ+YDbM0uhDHKtvTocH72LV3tpeWj
	dQ74n+sGGVAV5sUvkE1CtyqUDNijpVBb5D4cayZJ/FAImoVmsBpiNOAT
X-Gm-Gg: Acq92OG7+AdtKdCCZ4eCw1oMG8HuHe2JDdi0rQpELt2joPcVhr7MunwBn1qN9HtYrG4
	DxOC8i6Ct64qEjCCvxRGT0T3q2Bohxfe9Y4F4kz389PUZxtEZMW+qiPROEdHEGgLwH+CH1dnd4C
	5dgG4co5h4Q1/7S7FpRrBTm2nrJNBAj5ryvaCaxCYrC47nWdvNWZtk7iUBXd2CK8mJBolctchcW
	tDEpiqNw2xqBfuIkw19lRij5w1q4tuXxKPnNNHbjRoqtPeN6Su40Fz30ryXkiOWedlPySqtl3i3
	Zh5t9lGZJ10d66nmMY2EG8u028QVYk7pQCVsTsHoMJtC+nWigwAdnlwN+kMhZlPnwO/XkErV6AU
	jPmO1Mpns6t79ryZEZLq7r2NpAXBWycCTeivbM/ArC29N19cAxzOt9dYREWJu4I/ogvJ3RFza9P
	oRrPBnAWIWs7fiwinYHGDR4qN42A==
X-Received: by 2002:a05:600c:2a8a:b0:490:9588:bdae with SMTP id 5b1f17b1804b1-490a293bf4amr128209045e9.18.1780305774554;
        Mon, 01 Jun 2026 02:22:54 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0af2d6sm83225405e9.14.2026.06.01.02.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:22:54 -0700 (PDT)
Date: Mon, 1 Jun 2026 10:23:52 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, 
	"linux@roeck-us.net" <linux@roeck-us.net>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"corbet@lwn.net" <corbet@lwn.net>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Syed, Arif" <arif.syed@hpe.com>, 
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Message-ID: <ah1OwT0s21LTSsZI@nsa>
References: <20260529001903.625737-1-sanman.pradhan@hpe.com>
 <20260529001903.625737-3-sanman.pradhan@hpe.com>
 <ahlcnlJJnLfmCZNH@nsa>
 <20260529165132.678448-1-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529165132.678448-1-sanman.pradhan@hpe.com>

On Fri, May 29, 2026 at 04:51:40PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> On Fri, May 29, 2026 at 10:31:20 +0100, Nuno Sá wrote:
> > > +static struct pmbus_driver_info max20860a_info = {
> > > +	.pages = 1,
> > > +	.format[PSC_VOLTAGE_IN] = linear,
> > > +	.format[PSC_VOLTAGE_OUT] = linear,
> > > +	.format[PSC_CURRENT_OUT] = linear,
> > > +	.format[PSC_TEMPERATURE] = linear,
> > > +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT |
> > > +		PMBUS_HAVE_STATUS_VOUT |
> > > +		PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> > > +		PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 |
> > > +		PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_STATUS_INPUT,
> > > +};
> >
> > Any reason not to add regulator support? Given that the device seems to
> > be a regulator...
> 
> Thanks for the review, Nuno.
> 
> The driver was submitted as monitoring-only to start with, and I was
> planning to add regulator support as a follow-up patch. 
> 
> I think the DT binding already includes the regulator.yaml $ref
> so, in that case adding regulator support later won't require
> a binding change.
> 
> If you'd prefer regulator support included from the start,
> happy to add it in a v4.

You should be able to easily support regulators through pmbus. I meant
something like:

https://elixir.bootlin.com/linux/v7.0.10/source/drivers/hwmon/pmbus/mp2975.c#L986

- Nuno Sá

> 
> Thank you.
> 
> Regards,
> Sanman Pradhan
