Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01B942315C
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 13:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768914482; cv=none; b=abuHlhAvBPBQEjg4ngX5MJn+xnD2LFX7SK/gURndzvxV09VnOXcPyc70Z4w7sNCA6sYpz2rjCN+Q8V96S8e354nYo/q4xrm3BTvDzQ3cgf26N+sHG32+0DrpTFnKgYXEif37MCqc5zko0bb2XESsf3VHg5+BIKB5gSUzB0xpPi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768914482; c=relaxed/simple;
	bh=bYMQBpe4FCapv9lWaTVjMR/wpnPps8cMKnJ2IUEsQXg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eWvevGrxb2E4HA+wZ8haEycmPv8qvorQdAueqs0exJt/tHt+uMcvNEzjS4ArSQ+Sq9tcOKJgtIAzZ533EYur505K4E6hznVcy+IQ0ZrJuL8ff6EMfO7ZjrOb05URcUZgZXvlVc+Sa/0xTGLSBg9bX2CABdcB6yj2TTTC6HojOHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d76yzj44; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d76yzj44"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fb2314f52so2987294f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 05:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768914478; x=1769519278; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SCg4baVejIBy6xrHVH6t/kFxefY8hFGPXKceU7pFofU=;
        b=d76yzj44o/R9AJJiUfKn6x9P5vyO92Yx3QGXamQkGKFEYkHs2t21tPPD4RbWqvoPvU
         QnEZEMRTM0n75T8wDsmP4awtJn/ppMwns/oBfYqtlA3RU0uhNRVWkY66WuWtnDo2Uv/e
         X0wLVAAu5u6vfR2v/Mx5sIkrQR95qFJzdvLg/7klzAmVmWMPlYyBlg+nXP97gYOAXZWY
         yUc2ZMc7U9FuHhypKLgkJ0Igg+PLTnnTQ9QQohwiZs41VpJ92r21RXfxzZXCMaK223EY
         wOeIsG34SMhVJOs6/ahwfSchNfusd/RmAZ23sYlTs6FuPBLvarBmpj0/Wzmq0ccj1YlQ
         Fn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768914478; x=1769519278;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SCg4baVejIBy6xrHVH6t/kFxefY8hFGPXKceU7pFofU=;
        b=dNfOzHPx3E3a7Xj78QiNIoZRojBZ//s//9k8HADS0+moUHwslB9yS6iN48jpDbjhJH
         7R0T1gWJsoFGERWivaGsBIuAa8vM+gR1UuvclS+yox85kugm9oKbTiVnPWcKYA4i+edv
         VqMiVdVJqhmBP46T5JU2vUDFcvozT8qb5v7ng3fISCI+xtNhxV++018BSkqVr5KNf0P6
         ygHJA52jRuNRt5w5HUouJ5hV6BwQdwwoKxAd5W91nvSRYHTy3ogWg03BVvI81/fmRsEN
         heG7tVTA6IvdndKz/CNBTImUMU7prK8izCVId2Koj8CfnxGRgZA0MzMMYRzNs9VYUPGK
         +IjA==
X-Forwarded-Encrypted: i=1; AJvYcCXszF3OhFl5WeM64XI9PimS1/nA8MaTnZM4/D+MZhmN8ak1HtgJdPUIelpVd4jZgcoxHWd33PXfQpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwniAlp1Vn/vWJ9vtOwhZGHHlewwoWFBz3Msr+mMsm1YxemlsFS
	xTsoq5gsZOvhflI/iBdxem2hyhak5bSXMk+w+HtKJbEtp6LRP8wlsAWe
X-Gm-Gg: AZuq6aJlPAWlZym5tkk4ArnaYV94UB3BR05LfxON26R4mPrNuigMFdRfEimGz/DqNXN
	Kxruk0Cdjag3rCoG5qncXZ2LXhuKEJki0hQpRjNISXchpyxVSAMRthzTNPoSWdn/bz00zb8Ew5s
	9mXlKy3vkWE0eoVSPVXLc4yqzAUdK0BHhiHaJY3FEfptbRXlv0my6Aryw7AW7wawMqeqxSvvfht
	vtQlX2axDpOGZcjPrzGR9ZSj1GD4eX7c3R1nqv4z5cQcMNt422l89zJ7z8raMHlotTPrxZYGbmO
	IAkyWSFpb+7vQkiyOvNn1pX+Pzy0y8hP4oc8+3AkkGk0r6QQpu30OUcPlkuzdJz5EhrCtOw8TZ+
	jxXWpT1cuT1iiDNBMOByWITqaFRsibYn+EMAD0MyBWJ9h895oqSF8DOcSb/tGM56ZzycsZbOSDN
	mvn81a+eiDrY7C1VK28w0GnXiP6FGLKuLxzZGkkiHUGKYR96WhGAokdT6Mb8pjeszKQ3QVmWYZW
	r09o3mTd2W9lu0=
X-Received: by 2002:a05:6000:2486:b0:432:5bf9:cf2e with SMTP id ffacd0b85a97d-4358ff3efb4mr3038834f8f.13.1768914477693;
        Tue, 20 Jan 2026 05:07:57 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com ([24.206.116.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356992201csm30156484f8f.2.2026.01.20.05.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:07:57 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Tue, 20 Jan 2026 13:07:49 +0000
To: Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v4 3/7] iio: frequency: adf41513: driver implementation
Message-ID: <vvdk3whhwua73g63eetnmn46t2cpbpkzzkx7m6wsbverp7gcvs@mi7cipis3i4t>
References: <20260116-adf41513-iio-driver-v4-0-dbb7d6782217@analog.com>
 <20260116-adf41513-iio-driver-v4-3-dbb7d6782217@analog.com>
 <aW3dxuelYDM67pqZ@smile.fi.intel.com>
 <texwv5s2tvcy34bwr4iruj5xofmea663pwletmpqpuh66zulmv@m7qvjgqbhalv>
 <aW40ylvMwVhqNQMw@smile.fi.intel.com>
 <hgy3bcrqqsvt7pobhnzuvwzhb2taetpxltkaxpigmmlvmlirod@v6anhmrsvv2r>
 <aW5kk6K30Izckvg5@smile.fi.intel.com>
 <e5lcg5kkey3c6u2l4rlzzpolp7qkudhcofyzcx5s2tjbh2iwkg@js3fisv23zyj>
 <CAHp75VepcSZo_E4_UxhKRfHrMFDd7huJg14m8=6zVo4ENKFXkA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VepcSZo_E4_UxhKRfHrMFDd7huJg14m8=6zVo4ENKFXkA@mail.gmail.com>

On 26/01/20 01:24PM, Andy Shevchenko wrote:
> On Tue, Jan 20, 2026 at 12:43 PM Rodrigo Alencar
> <455.rodrigo.alencar@gmail.com> wrote:
> > On 26/01/19 07:07PM, Andy Shevchenko wrote:
> > > On Mon, Jan 19, 2026 at 04:37:09PM +0000, Rodrigo Alencar wrote:
> > > > On 26/01/19 03:42PM, Andy Shevchenko wrote:
> > > > > On Mon, Jan 19, 2026 at 11:21:59AM +0000, Rodrigo Alencar wrote:
> > > > > > On 26/01/19 09:31AM, Andy Shevchenko wrote:
> > > > > > > On Fri, Jan 16, 2026 at 02:32:22PM +0000, Rodrigo Alencar via B4 Relay wrote:

...
 
> > > > > > The current implementation is kind of a stripped version of
> > > > > > __iio_str_to_fixpoint(). Would you prefer something like this, then?:
> > > > >
> > > > > Do they have most of the parts in common? If so, why can't we use
> > > > > __iio_str_to_fixpoint() directly? Or why can't we slightly refactor
> > > > > that to give us the results we need here?
> > > >
> > > > __iio_str_to_fixpoint() only parses "int" chunks, adf41513_parse_uhz
> > > > was modified to accomodate the u64 parsing removing unnecessary stuff.
> > >
> > > But why? The fractional part most likely will be kept int (it's up to 10⁻⁹).
> > > The integer can be bigger than 10⁹?
> > >
> >
> > Correct, integer part of the frequency value goes up to 26.5 GHz
> > (uint_max is approx 4.3 GHz). Also, with the dual modulus, the PLL can
> > achieve micro Hz resolution.
> 
> µHz is not a problem since it's up to nHz.
> So, the difference so far is the integer part that can be 64-bit.
> Again, can we factor out something to be used for this and for the
> __iio_str_to_fixpoint() cases?

I am not sure what you are suggesting, but I am avoiding changes to
iio core at this point. If any other user needs similar behavior,
I'd say we would need to have __iio_str_to_fixpoint() implementation
modified, so to create a version of iio_str_to_fixpoint() that handles
long long variables. Possibly consuming simple_strtoull instead of
doing the manual parsing.

Kind regards,

Rodrigo Alencar
