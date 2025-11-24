Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A920C261B9D
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 09:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763976269; cv=none; b=nYqLZkK63ybiFEHjroYVwwvxyp+Vi80V91c3hPafq3jPPNdvZyqvKAt4g9eXf7mi7HqyrRhPoFp8U9tN2uHOp3YfbJjHnmax9mzsYKAuTN5IrP3+i/Y6ovIivsc0XKaTo0uEL/h7ugRMUjy8w6Z9e3LJRTzrU4jh0NBSo39QNRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763976269; c=relaxed/simple;
	bh=P3TNnHmbMQ7RiZfj11COEtOadWn9ZwdSOUvW0u0Lo8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nb5gBV9dFSzvJpNKMWl4zoudPxaBS1FXBIdfUOJJkGyzzgzXneh2X1JyBHDhF3R+PjNNyO6DLJWeSTTCmZLLSt/O4A/BrqbKlODS+nnug9e/hJ9acNazPJhXTAhM+SLtihxPHcgFW4HRmlWE7M3KdVY8joSINcLDxaaoK0WTxUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZdtpfeP; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZdtpfeP"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-641977dc00fso5692830a12.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 01:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763976266; x=1764581066; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=slSocduRhMtJsbQHXkMC9k8pMNaviAqpRIeDggJm8mI=;
        b=ZZdtpfePZFfUT/ZvhU2u/xPyRTq5AfkmYgwBxMgiIm7eNwOoFh9ZRn0tZvJR7Js6bv
         qyaRbzaYX6bvV3RvEsVZm9GQDMRBdu3iRP9eJFDv5Wl2HtYi0i49qYVJA7+2cTVlIPRX
         Lj1AQvJit2VCRos+jwBKM7u2pqXsbuJAaTJ4iZJ6yPn4X81ufl+9M8c8vmCQmVo67kHM
         u7wsRiB1AJTQ9L4ETsKRRXA2AkJKdzSAoM4NbvGh0QP1uwPAqZMZkOCq4LGgCHUhhwMX
         Je8I2P2viPlA2uIsQNLZs2Fwb6gDLY+Cur9+XIHp7LkZyEVBu+X1J0L4XQp4YVzIpUNa
         s6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763976266; x=1764581066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slSocduRhMtJsbQHXkMC9k8pMNaviAqpRIeDggJm8mI=;
        b=c3gbWkGuzyUqD2MS9tmmgROwroVBc/zAHmDKhFAwnsSoGa9phnWDrqyN7gG6HAEPG4
         9dJP2EErittNFXVhmZ3qEFXJeUVYjgsoo7EAo5jq1cwvGdneU1maObQa4fKMY8EEgsre
         eWbaN84TI8vydQ14tfNdRIheGItaF8ehO2QDj61pxyD2QSCwllY6GS9bR2JxqiLTS0/B
         NvLW1g3d+5xg5aukG3VyVcWx3ZUFpHezYCFUrNB1p01I1YJmas0FSB4gdbtfrhbiljoC
         bU8VQz+vx53DIY8YzbMHvEeCkfkVsupJVCCcuwzSRmRZFREKMbq8Ulmy0/Cr8gjItpo4
         rZsw==
X-Forwarded-Encrypted: i=1; AJvYcCUfLVe80r2pmfZx0AVyDYEdyst6BhzGaDwrSBarTrU9wiMuBeoknN2DcJIbdGJqRD995fkOQe5KAQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgjpFH1rxu6k1RvNYR9mHTQFxUuP7bZPtOJOWm2DOFiUi9gXbU
	tNDCYgM9/x6P1Gm+dOYE6ZWQX6kisymUcXrmN+CBZlVH9lEOfClceVuK
X-Gm-Gg: ASbGncvMnbVsN6FOILaG1AosRP0sM0kOY3M1Wtg8IXN1kcY2wElMdz89hiQZDGeSX3g
	Aep4EsdnQW+ueNOm8qbflwn1NotSoHxzmgYx2Y8tynU4Do33i6wWXh2RvsLJOMJj2ZrND7eAJY6
	iPKHwKDc4dqSDk19gIjoJ/zXfj1f7m/IsFo65OqcsvPkzoC+pSKT9kiaUHPT7gxEqnKIB1y83J9
	66VUjSokJxdME2sp/FJ/iLGvLFDPWLEsSP6XjKejkEux0faJjIRj5xu0G9xkgjnLfpy9B7GGtnI
	FCjL5FsuPbRCNK5zmOKqhZkd/kWtyHvykVVRJQUNILzbafJRhsfWjiQ+/kQoR2Kksw7gp/z/XXE
	CNhI+KOhHOy7fAWkprb/Idfi0IsXYCA2Co+P7ukQ/T0O4pxgvG8iErM/KSfaCF3sNypuFOEUg7V
	6bt9q+oH0yZitysljcpAcSnTV2eEKvsHGaI7oU6rhmB/mP/TU+jNQ1rmpWbBwVM1pRL7Jw
X-Google-Smtp-Source: AGHT+IG43taRGXlMb7A2ZG4Z0Lz7XxTi1f/W9lGskn1Ni6JWJYwXfKHzRtFJ/vmRNLd6ClmF9wOYDQ==
X-Received: by 2002:a17:907:8e96:b0:b47:2be3:bc75 with SMTP id a640c23a62f3a-b76718ab22emr1047239266b.60.1763976265537;
        Mon, 24 Nov 2025 01:24:25 -0800 (PST)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([2a02:3033:267:9a21:9532:f12d:5875:dc2c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7655028400sm1195719166b.56.2025.11.24.01.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 01:24:25 -0800 (PST)
Date: Mon, 24 Nov 2025 10:24:22 +0100
From: Jorge Marques <gastmaier@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Jorge Marques <jorge.marques@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/7] iio: adc: Add support for ad4062
Message-ID: <m4a3o4fbs5bhsru6fsmik3qtthvit3565lkp6itjyqzjbd55hd@whjpvtn7xngm>
References: <20251013-staging-ad4062-v1-0-0f8ce7fef50c@analog.com>
 <20251013-staging-ad4062-v1-3-0f8ce7fef50c@analog.com>
 <20251018171032.144a126c@jic23-huawei>
 <ou6qwayt4g7qaoe5dm7tdg6jl5dwquslpfbok6on5r2q2wytyl@wlqxj5y6ircj>
 <aSQMjZbc75cQtFqJ@smile.fi.intel.com>
 <o4kt2of4xql4azufjgiecm4jzuexgm6nkvr7aghbwfk6qd7yqd@r4plggehzces>
 <aSQhTd5Z7KyvHtbG@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSQhTd5Z7KyvHtbG@smile.fi.intel.com>

On Mon, Nov 24, 2025 at 11:11:41AM +0200, Andy Shevchenko wrote:
> On Mon, Nov 24, 2025 at 09:57:26AM +0100, Jorge Marques wrote:
> > On Mon, Nov 24, 2025 at 09:43:09AM +0200, Andy Shevchenko wrote:
> 
> ...
> 
> > I will submitted v2 shortly.
> 
> I think the "shortly" is not needed, please take your time, this seems missed
> v6.19-rc1 anyway.

Hi Andy,

I was submitting when this reached my mailbox. Still, noted the comment
on your next e-mail and no pressure on the release window, I just didn't
have further changes for this revision.

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
Thanks,
Jorge
