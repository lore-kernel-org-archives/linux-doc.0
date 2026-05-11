Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36993C5544
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 10:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496434; cv=none; b=dk+uXisXZ5Dm53biKjdmctANQ0lH+cD/okExra9BnG9drexRjxU3buLqYXBqsMXzT1zpXMLJyvQx82XbwW+95wz8LTo9wVpjtSj+eowAnMRfkVKpjRYN4cGpEL2uqvVFLibFKlaFf5NKzsKh6vRf8Mj9PfaydrBvT9fTN3uM6tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496434; c=relaxed/simple;
	bh=y8ANxseZcjXB0D/a9PMQdY4ylscTf10eyL70cW6tP+w=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FN3UYwe+BC3iERm2C5BCYOCt3f8kpMKzqn15MMkBvRZV8qXYjdbc1CLajNsWPptydEEDNaObAGnXTPFT5SEhxIt542MknoQir+sBAAlkOzNYh+ajTshxqbCty4V0ybcZ7wyvXJhxW1W3oDSSlfrwt8Io+fJCjhBpKsT/wkpv248=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTAt0m1d; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTAt0m1d"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48896199cbaso38058955e9.1
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 03:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496431; x=1779101231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e96lh8A8aYVtvEFVfiS50ol4K/XN4qkYpcoofOpmoIE=;
        b=OTAt0m1dbZtZfk4M4u/Atrtex9+xcXgOp0eyOkk5xGNlVJc1ezPa+pv8kaP+r14D//
         mYIQfHCUcjQk/2B3+lfbBKBb8y8JKk5pGMdhb7z4hIrNYht2SHFmjivcmVeJbNbDleRp
         ncq8nqifNNu+EcuJpIgDtTrAQyqChRfcI/bNEPNYSmdK0bkpkhxWBkKdy6V6DudIyqCz
         qexVsUnB1onGwBS35VKgSUi99J/ZA/rpj9J8k36sjamMDIawlYracknQBYNeySFf0Ocs
         mhSvU3yvxq1VJlf1IAPv2xQXO7rHRbHN7GmUYV7fxeQ8V7Pha+DaV9xBrDIrqO3Hcfoi
         FH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496431; x=1779101231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e96lh8A8aYVtvEFVfiS50ol4K/XN4qkYpcoofOpmoIE=;
        b=NKHCYkimZ1pzXtHPcRaTvvDvjf3bIORnO2y73SHkJWDRljqplFQzjCcQNIXu6taPRj
         uHp42ajZy9+tqctVutIEsHk2qHJfRGchrspzdXhAQDz2p3aWNRre1AbL1FsjbIwZk6gf
         wMEyISMFCTjjZyAa8oIF5DPG+4sT3hDKvTllw7j67IVKOLZZGJRBuWx+tJc6IGhxk9jm
         5cUY/842+qAMv3lGlwv0MGSYmhmHIxaLbA1kYtBY+LjAJUfvfy5rsmPUD6dKG72p/5cW
         m0zIgVCQIXVKUM5LD3umiz1bk/+R7NnQyRzmZEaOl0LSjKzWEWwAGMslKjEUsHtM3N0r
         /Blg==
X-Forwarded-Encrypted: i=1; AFNElJ/NBjO0u0A4Jw2r2ECs2qEvhC4lGrxD6gy+sDzsNqyqWedhsK470Lvq4OVRuxSW9SnWdoHqk5fDvTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHIrbUIuqa1pejD+wPi513qldrY05IfIS3ffuOguivIRbldGSK
	3n40e//i7A70O+Q5j7T7tGRrNKe9FX7GvoyMcubz+au+nuGaihNdqQ8n
X-Gm-Gg: Acq92OGVInvzMr/FymUMM6mfvGiYmXZoH0zY+lEhuCnbKzwazd8ke8TQa41eWHQqYtK
	WGgzT3Tz5lyH8bR1v1DgHtuksGsJD1O9I3WhGnrzqnQXtBKcfLkDu0+lrzoA66nN6p4XRlg+OqT
	PjaSMy2uE6v3G+TvHHgx3crMTNAahlJDICORdLNoGVgp/dnXjs393iWdNExy54Y+eBt2RhmRrc9
	SQmANUbg2M1yPIIuT0+185augCOuS1IvVVK3vrXHZ9tTLOdQW52VBbap34hNpKW9v16S/fPHNa9
	oxO82t519nJXQLz01l/ua6DWcUwGHxWa4eokWVc5ofM7oLQYoMrxd9X8ORkvEiSStU3hpkfKz+Y
	6Dzvwx9JOcHrEb6k6Z62JHX2NLbWPgsqhEBst7CEM1H3OfIMfrbNvSZNOh0CS38DBp7DMi7m6tV
	ac41Dc4L55ddJLdIIl2yfUjv04eOmrrSZbiRqCajNsXp/8G5+cCG++NY8PaVCA73bAGCqBGDyh+
	2B15KUUd6jKHDiH5hGBQMxM1/dDWE1Va/oheLQtD+tGioAV4g==
X-Received: by 2002:a05:600c:3b96:b0:48a:66a8:9981 with SMTP id 5b1f17b1804b1-48e51f55272mr391731065e9.27.1778496431033;
        Mon, 11 May 2026 03:47:11 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6dafa61esm78368735e9.4.2026.05.11.03.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:47:10 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Mon, 11 May 2026 11:47:05 +0100
To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	rodrigo.alencar@analog.com
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH RFC v4 02/10] iio: core: support 64-bit register through
 debugfs
Message-ID: <4lljp4qxuxqpanjnacteto3pqasjytjp3jysbgntv2jsuzlbsk@2fnit3aiecnv>
References: <20260508-ad9910-iio-driver-v4-0-d26bfd20ee3d@analog.com>
 <20260508-ad9910-iio-driver-v4-2-d26bfd20ee3d@analog.com>
 <agBY5K4qN3jda2up@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agBY5K4qN3jda2up@ashevche-desk.local>

On 26/05/10 01:07PM, Andy Shevchenko wrote:
> On Fri, May 08, 2026 at 06:00:18PM +0100, Rodrigo Alencar via B4 Relay wrote:
> 
> > Add debugfs_reg64_access function pointer field into iio_info and modify
> > file operation callbacks to favor 64-bit variant when it is available.
> 
> To write a value with bit 63 set it will require negative number, right?
> Isn't this  counter intuitive and may lead to rejection of the (correct)
> values?

In two's complement systems it works in practice, but it might be UB.
However scanf with %i accepts hex and octal, which is desirable for register
addresses and values.
 
-- 
Kind regards,

Rodrigo Alencar
