Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028F134DB7E
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 10:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771843067; cv=none; b=BoJFIR1UuFY2o47jJAbG2C2rOmPomxXEu08gK9ueuG/RLqDhkem1Q3GATYOs/vcIssaumLbagtBAxNU0uXeflEoHafALH5+zJWpaSOB8gEpMjCc8p3exJ5QeWa95gAzlS/MMRR40g1nvzRuSwlvq2qKFOosp3oIu2OSxyIgZBok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771843067; c=relaxed/simple;
	bh=zT1ymARhK/pXKsQRMgVO73M73Z/1yu0UpdoXBvjpeyA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3GgDxhZECE2sbaLzcMgWRQ0BWN5ixDI7gfT3i0AIsMV/YFHY2PE5MUM3uAm+ewpBwNu/HCdZx+H6rKgheQYY8XWUL4bq13SMnPD/BSfV8B1neCB6hACdiGnx+1NhXBmoFggjv9xXfL/xx9jtwmtjdloOxjdaiPs2ZMEgnW4Aws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bcl64j3b; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bcl64j3b"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4833115090dso39465885e9.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 02:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771843064; x=1772447864; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qSdtkc+pH53KLgyifPEPmqXMhFd02h+G9d/1irb/6Lo=;
        b=Bcl64j3bWDypWKDIgmmaiEBFOYqwpTTMvBU/4kmVeXcDb/aY1LCSGkGXkHUOHSsrCe
         6gyo8z57OW0qbT9mPBHEQQrQmvBbNlZdRlYM7VAUtBx2F4fLU364qvCcOwoAkGqC+0hO
         Wjt1eQDUQ6OPD9KWaZhsvlKEtur776UVbdojffEc38BhjTRHTUSXmOM8fK/3dSjAYUUW
         S85B3WROJ5Er3W74uTjPx3sEEAgju8+jvhTTjpkK2EqvlPlVqv/C8t/pUAbYd/+D+gXO
         OdviQl0FsvjpuTskSzJ3p8lpDwbPm0Q4J0A2ijPeRop2piIr7rP5mrRLD8oR5/ovhsKC
         48vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771843064; x=1772447864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSdtkc+pH53KLgyifPEPmqXMhFd02h+G9d/1irb/6Lo=;
        b=wSddu5QcQHiF3/beCQt3Onu40tkQhasiYZW+A+VAJ2/li8rnTXLPhtO6ExFZtoJc+X
         Yrf9lsXNiymkunpG96M5CBD0nBfQI8Bx4JMg8OjiY5Xo23xqGlweaWPwEbzeUqbJURCo
         HsamAE9kORYsEMDlivSJxIwWbXAASi4ISdRuhQ1cPg3lSrP5Wt+90MoCq86MbF/2xw+E
         VwrbzpqBTIldftQcZM+JXaRWUT8Dr5s1N1E7MS3dZku8FoBKsdzSLHmH1J3POtsG/R/A
         Tef6v37yum1gi0o5aliKSTVc6GbKOcDg3NO46qf3d4LiQZuOriqvQMNUlw5+lLy0T+Zx
         YrHA==
X-Forwarded-Encrypted: i=1; AJvYcCUQFuaBHPUgsXE//6bJ5sJwwMXH1Rs6ej6GQbKVhB8DTr1QUqDyY1JNq7dsLrWv/Qy6vG49qdcq46U=@vger.kernel.org
X-Gm-Message-State: AOJu0YypPHfFo9NF591UlrHOM0dXcOc2QsTLmV3XfqlUi//wSDEAXIGh
	1Q0t7oPp2cwbHFXu033aNXLKVVxPgk0O7tUL6++Kdebh7up76HdaVVfL
X-Gm-Gg: AZuq6aKo/2b+Sfadwjd6blzqv8ZHOwsoOliNzGwfemf8djQBVq8yBT2YPpfInd23y1m
	94OFb8PzX/7z7xPTwovWs9LOK5N9xcqPL9/mH+0ThSeuragVPnxXfoyCkZZ/nt1KonTeHTdM+RO
	m9qFGLc+Vss/1FyFiyeu0QlkFNaN7GG9DJXeQSTL5O89Q0JVKT5QzvYoimWg2533l9TPkNkR30T
	QTwNC96wVfpP03uX7paNxqlwG6mcgNjeP6T3LCr+4H4x+pURyQdg3hMUqVm/mRsnjXn2g7LvqWo
	tRfIx9MPqTTXNeaEvpecmsPN+KWFZWY28pDdhjalwkkDUJZyAU4pGItUmVvB7/YNuVpVddprQKH
	djXjow+QB/vqZ5hd+IHHQ+ma9kIAaFGNtuo19o5592/cn2q1WVSRlHknLri8BfPAF7EJjroQth6
	Bvy04fj9d+H/ZROdazTajKy5xUBImG59bJ5hP78xNTJG/y4+f6Xzh9BYJE7Ck1fxwMWDSVIwszN
	Qoya9y0+hI9j12gzdYsaTCFSZ8VrXosGjuL448BGhWpC5OMLyWiB9zS8Fiiqg==
X-Received: by 2002:a05:600c:c4a2:b0:480:20f1:7aa6 with SMTP id 5b1f17b1804b1-483a95e96e4mr123633655e9.21.1771843064096;
        Mon, 23 Feb 2026 02:37:44 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a429e49csm132820845e9.4.2026.02.23.02.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 02:37:43 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Mon, 23 Feb 2026 10:37:36 +0000
To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Jonathan Cameron <jic23@kernel.org>
Cc: 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>, rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: Re: [PATCH v7 2/8] iio: core: add fixed point parsing with 64-bit
 parts
Message-ID: <zb752y7tnjzsc35na572o4sip6efwv3i4lha4ls6fhdrr52h5v@bfgy65cmae4p>
References: <20260216-adf41513-iio-driver-v7-0-b0ed387ab559@analog.com>
 <20260216-adf41513-iio-driver-v7-2-b0ed387ab559@analog.com>
 <20260222172912.60a103c0@jic23-huawei>
 <aZwYshRxNgSh3CWk@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZwYshRxNgSh3CWk@smile.fi.intel.com>

On 26/02/23 11:06AM, Andy Shevchenko wrote:
> On Sun, Feb 22, 2026 at 05:29:12PM +0000, Jonathan Cameron wrote:
> > On Mon, 16 Feb 2026 15:02:17 +0000
> > Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> > 
> > > Add iio_str_to_fixpoint64() function that leverages simple_strtoull()
> > > to parse numbers from a string.
> > > A helper function __iio_str_to_fixpoint64() replaces
> > > __iio_str_to_fixpoint() implementation, extending its usage for
> > > 64-bit fixed-point parsing.
> > > 
> > > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > Hi Rodrigo.
> > 
> > This looks fine to me, but given earlier discussions I'd ideally like
> > to wait for a final review from Andy.
> 
> It all depends on the series from Dmitry Antipov.
> Can somebody help reviewing the patch 1 there?
> https://lore.kernel.org/linux-hardening/20260212125628.739276-1-dmantipov@yandex.ru/

can we push for the exposure of that function to kernel modules?
We have discussed that in v6, and I understand that:

EXPORT_SYMBOL_FOR_MODULES(_parse_integer_limit, "industrialio");
in lib/kstrtox.c;
 
#include "../../lib/kstrtox.h"
in drivers/iio/industrialio-core.c

is not a good call...
 
> When it's in, we can continue on this one. TL;DR: for me this is on hold.
> But if you see the need to have the driver being in IIO, please add a big
> fat FIXME to make sure we will get this all being sorted out in the
> (nearest?) future.

I could add the FIXME into iio_safe_strntou64() doc header. It explains
the context:

> + * The implementation of this function is similar to _parse_integer_limit()
> + * available in lib/kstrtox.h, but that header/function is not available to be
> + * used in kernel modules. Hence, this implementation may need to change or
> + * removed to reuse a new suitable helper that is properly exposed.

-- 
Kind regards,

Rodrigo Alencar
