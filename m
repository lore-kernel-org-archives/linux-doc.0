Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D751D516C
	for <linux-doc@vger.kernel.org>; Wed, 11 Feb 2026 13:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770817950; cv=none; b=IPBB0J+bQ8DxrFzr0wudI9U9V0xEzZ5i27ZMzYrnqW2PDve6WP4X5Xgg8RLe+gmP9uJkW3cUwA2kp54xcgkaykbam9ff/t2fggCbr8o2jrKiytqwpD2KhkAhQ+lGAgWGpC7y9sdjaLzXnjOXXq8BIjMvMC2TFNtAl4NfCsvAUBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770817950; c=relaxed/simple;
	bh=xwxehR5oQQHV52su04cZTdDPKzeRjgxC3haKlVGJdcM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cFwMFy5Jv3DuP6FyWWAntcPF+L2SiLBJ8AcdtlUpx99jZsoY9Ez+fUD0WmaRq33WEhFzw+WvsSCrsUzDPITXv26GwjKCpjyCAPGhvomFJ8/ND58ymOMQ+rh5CEs86HpBr0uiSqeTBmlzC3l1q1mduD7JjgewcAMBtrDIqFjgV9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1pCuEWR; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1pCuEWR"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-48336a6e932so24357285e9.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Feb 2026 05:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770817947; x=1771422747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PvZw46mbzAoDzNjnv6pKObISf6Xw2iB0KdRFCcx6jrQ=;
        b=K1pCuEWRddPvzYzgWciyTOo5xx4v7sKUEMDB17KNfeFkp7ihE/iFjuSIv5i4vet0Oh
         wabxSuSVIun6vDXr8JRh7J8OpbhG1pI7JMHBGeZyFGWStxsPzkBVrRu8qAB2Oc7PkARu
         mmsHOUQZXTO4FJYIpsX9J/PgOfW0IhFK/KdMNUIg33Nl52csOJqwGp7Ab056KMNYd+Z1
         M3B6pNH2CHAA1rDwAfs61McXQPhi2LoAuxGqrNBUYR/zuapZhxwynymVpGXNUywoZyR+
         x8/i/bfgDc6DiOfvbmK/DuShTz5/k7EbfI27veLMjsS0fyg7JdNO1CpdhNgal86i7J9N
         4EPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770817947; x=1771422747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PvZw46mbzAoDzNjnv6pKObISf6Xw2iB0KdRFCcx6jrQ=;
        b=Z9MktIm8wLxlrkoUqBcl2HTBT5ANKdbxyy478in/5YBm/MpYI/MJEfj1mBIB5jUw3k
         8zTnXceA/f3LeyHB9ZxgagfphSaZuqIOwpvDFa4iP08bgmIhe2l5PKiDmyHVzsmfy/88
         k6Anay1RF79UJtmsSkeucA8ZwUG2wzIyprKHq7tkGj5dKPClKQI5p98oEYSs15hRSbgA
         MvfFEoQlKVQpykYyAkv3o+DoJOxCimxyMQPxKRnyKkKqOVH3iNFnEO6lOjVAALA9xbtI
         xqUUT7lvQiRCpU887Is5tfuIy3dASKTFCa0WPMHC0vyPRR2WRtVXiUIcTXkwMGNgdKqh
         yuiw==
X-Forwarded-Encrypted: i=1; AJvYcCXQsyAawtneT265qzRKCbYOEgg2n2UsXsE2ZIQAlpnRNQPd7USu1Wk/mCVT4UyJO/NhhjAuOrfXoWI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8HkMWmZDPtShQDGwUmZ0C1QlbT33Toart5diEr0dzyv5KWWrD
	1qAs6Olnr3BA6lpXxp5BK70oCkv2aExYOMS2E4ZtW18sSGGcMpqdHuDJUcmu7YoD
X-Gm-Gg: AZuq6aI/VR2vrfLw6imOeKgXLSkEBIQRYDZrgYjfzSyYmigtuCltJ85PD53fILt9Ah6
	5wArEjsfd9g4KVCoAujZk24wpwgnfrPvNsir4d3RUqxuJ0hTP4NN6vrf9OydsTIgAL26S3j9Zxo
	Uj/0XpVHyy1WcAFKdsYcsM/aORv5xZBKrgegVyC8YpcKuHHrgkLKH4UO7fyVDrMpB2TsPRWw+tI
	3aLU1R4J41dhcFe5odsTxYUt5g5Wb+RzsnHnWIGpODvq4SFIxu8pYcGb+E1sASMiSVhKeSKvXh4
	nyUa1Yo+4PSZSJfDWUOhbY1nXisKijQcI0w/KNo1uM6AeJiN/kKfB6ecV/0I9axkDX4zYPXrn/G
	EtL/yng8xpOAb00OUeSb3tCNgImLS/YU0MhCriMKa5zlGLauHetWI+pvqD5Wc3lnbtFvEgCaLSx
	6UxGlt+BCnA1kJWMMtuBX5y9lpR9vi8f5GyqulgHcYKbOWFKHW5++qwG9vaRDJsO4hR7sFaUgX+
	VUvm8YZydH7z4NS
X-Received: by 2002:a05:600c:34ce:b0:479:2a3c:f31a with SMTP id 5b1f17b1804b1-4835b8f8aa9mr35063395e9.1.1770817946925;
        Wed, 11 Feb 2026 05:52:26 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com ([24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d7e50casm121420995e9.8.2026.02.11.05.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 05:52:25 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Wed, 11 Feb 2026 13:52:18 +0000
To: Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v6 8/8] Documentation: ABI: testing: add common ABI file
 for iio/frequency
Message-ID: <ecfpri6dr4kidvecyulzip7m2bmuw5refocls7vdtruqinrklc@dzm5vmk7ul5r>
References: <20260130-adf41513-iio-driver-v6-0-cf46239026bc@analog.com>
 <20260130-adf41513-iio-driver-v6-8-cf46239026bc@analog.com>
 <20260207172458.7f2cca90@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207172458.7f2cca90@jic23-huawei>

On 26/02/07 05:24PM, Jonathan Cameron wrote:
> On Fri, 30 Jan 2026 10:06:49 +0000
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> 
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Add ABI documentation file for PLL/DDS devices with frequency_resolution
> > sysfs entry attribute used by ADF4350 and ADF41513.

Here it mentions that this would also work for ADF4350.

> > 
> > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > ---
> >  Documentation/ABI/testing/sysfs-bus-iio-frequency | 11 +++++++++++
> >  MAINTAINERS                                       |  1 +
> >  2 files changed, 12 insertions(+)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-bus-iio-frequency b/Documentation/ABI/testing/sysfs-bus-iio-frequency
> > new file mode 100644
> > index 000000000000..1ce8ae578fd6
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-bus-iio-frequency
> > @@ -0,0 +1,11 @@
> > +What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_frequency_resolution
> > +KernelVersion:	6.20
> > +Contact:	linux-iio@vger.kernel.org
> > +Description:
> > +		Stores channel Y frequency resolution/channel spacing in Hz for PLL
> > +		devices. The given value directly influences the operating mode when
> > +		fractional-N synthesis is required, as it derives values for
> > +		configurable modulus parameters used in the calculation of the output
> > +		frequency. It is assumed that the algorithm that is used to compute
> > +		the various dividers, is able to generate proper values for multiples
> > +		of channel spacing.
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 0d9b7cf86aec..748eeb6f5bd2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1639,6 +1639,7 @@ M:	Rodrigo Alencar <rodrigo.alencar@analog.com>
> >  L:	linux-iio@vger.kernel.org
> >  S:	Supported
> >  W:	https://ez.analog.com/linux-software-drivers
> > +F:	Documentation/ABI/testing/sysfs-bus-iio-frequency
> I wouldn't add this here. Whilst for now we only use the defined
> ABI in this one driver, I'd not expect it to stay that way.
> 
> If we do think it is very drive specific move the file to
> sysfs-bus-iio-frequency-adf41513

The file Documentation/ABI/testing/sysfs-bus-iio-frequency-adf4350
contains the same ABI description, should that be removed there
in favor or this one? If so, in MAINTAINERS, what is the best place
for this ABI file?
If not, for simplicity, I may just rename the file to
sysfs-bus-iio-frequency-adf41513, as you suggested.
 
-- 
Kind regards,

Rodrigo Alencar
