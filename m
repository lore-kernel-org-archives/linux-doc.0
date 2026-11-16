Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846523;
	b=mdh7pJq4ZTxFDBm5A5bWTuhWw+Svo3mzaqfBwaSnkL/MWKAQmvIZKXaV+qrOuvmyLRm7
	 tkQdVcThOLrcv1PTLz8f16xam5h0GoMhJnUcspTe+Q1nNIILy3dOK/uhSJ96sgL4zsKlX
	 t5byEH0WdPSl5nUvmrodySyYRXU5HtqhM5oOehG+e7ZRLEoEuHOhBewgyUJ7W+9R4Ghbi
	 iY9zdJRkOMbJTk/wPwBfivD1zg/OWBVZ4VH+aM5MDrLHqp9amXl5yYNWR+b7jAshEmpKg
	 tfIi5PuE+TiwDwSRcyuJ1w6mPQjKWqWClGl+PDShqbPw7b8O14/FwNmzMVhCk11Qh+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2+nzMcVP/+P9vG+E1zkKZ9XZsaAgRds940lbNhNpcpI=;
	b=dDY5pUYW4wcAgH6ZKe5JE+V6UPhLoEkbl37IwDq9QMLWwy33A0l1NQ+NQ9dqI6aDIP91
	 1k3adsHU99+fnwRoCqxrnPVZW+pNsBElpT4AB66v0I84I+Fn3RJNAgov1I8uuVJ28gsvB
	 ff/vi7Eu504A/p7b+hXl5kGB2TSRpb7Al3i5cj3988J4kLbmu/nIABhy+jgkG85cU0cwR
	 4rSGYMoMkv5jondOIQDJVc4hJUkOGekfJWDeJig0LeZRNXZmyBMo4burga9iAyni3uOc/
	 y4ap96+xZZOyFCYocrDfJkFPXUQn2Z4i12b2t56dLObdnk2ng6Ow8Vkv/BTLZXfxM5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgGsa1h5;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D298A606A32A
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 16:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D298A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgGsa1h5
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a210470b49so30337585e9.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 08:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846521; x=1795451321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2+nzMcVP/+P9vG+E1zkKZ9XZsaAgRds940lbNhNpcpI=;
        b=DgGsa1h52Rts8iMQsAM4EJfolE1WumuJFMv+MANoxbtXJXUOJKjkXxqF7F52ddwi4B
         igJl8Rh2ip7GVy8wPhlLKhruAujaQotXx1zhJlK/t1l3kKd7ciRnftPamiLQwevK64Bt
         k8APXM+6MHR6p9gPx61Vp76+p/B521PwanYfwN3htVEnEoonaZ23QL33BIDUw3R+yf4d
         h4IbGGGBRAapLvL8Rlc4TNDPbcyxFICIxnJoPuMIWyJ/Ovt2fCzL+Zl6ikJ+w7CHqluQ
         Ayy4mBCMc8Z7wwVKi76I1WC/0L03NnAnS2aMKpMAIs0mwzZilY4SpSvU/4y2CBxtQROJ
         IW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846521; x=1795451321;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2+nzMcVP/+P9vG+E1zkKZ9XZsaAgRds940lbNhNpcpI=;
        b=lVRdnlwgu82bzToNfEzrcCYbP/rR4jS4MXE9yanV5F5QYxbVaSr39l6wrtNK5OLU5P
         vvtVz2dCrrfH5NESCCHvwJ72vpL0jta2HkW+wSy9L8QZp+AM89NVYjDCEPfKxuOgXbWR
         MFTA0X+ZNrNhncGYRiHKBN3+S/2eX9R1cRjcZXyWApVKjvBHgPT6ncKnj4v60MlKNmNb
         MmdxRbEpJ5U1LqXev7r7ZZ63OkNJ0NTvkIhAaAq018579PQwXh0DQxZBA5MVG77h6KDH
         /U9iXvpZpewSlXAQcU0U43CGWNXmgHVauYK9eJ3hsHon0+g2CBOcPCs/5cKLleZsjpim
         7USw==
X-Forwarded-Encrypted: i=1; AL+hErF9YLzmiRCBW6TxJhUWoXz5umaUXm5GpHhyveC+FQ6ZF4jLwN8INgq0x3Gtul2d+JewEkjlG1WC6IM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eU24l+ZE5VajK0DrhXLfv4SnXrv/GF4FnciNAIzFVp9a730np
	MBgJybpNO3r+NpL9vevgFc6ihe22H7AGYPH5pUioJ5et7JwBqnbf2GgJ
X-Gm-Gg: AYBFou22n4i9ZXpp4p2aQtWAizOyRv0CYRRGGDiN2lY79Lw2tEZf2+PNEHS9WCevwHB
	d4UJ2zv18aPEuXePhT68sm4zR4x4g2Ep+bYJlUneaTYT7efjWBFH/edCUjUQUrng4Bwew3yunoU
	FpBuWG44yQvMTTC2kXgMVlyXNG9mCtYuV38y5FCW+1+jhpi6n0PTsxli+oaDhsUR/Jvq5VS+XR3
	fWHyyxsB4vxBkf1lBUt0i3xenlUgUlXAn+p/cAn/vCs72V88PxvK7mK7vLiVgJMkcUgLVSIDRK1
	fObjOkPL2rXGCsZGkj2xjIgFyG+JgpSkagUHNXWA8mbWsaq/PKNEkJ03bF49D7ZETNpGpUh3cpl
	X8n6/yHC71M4/5Hzwj101eNsyMD7G4DwxrsS26lDHNqgYiGHpbhMy1lbbtVSxuBuXeuxQ37vux2
	QUMm1W67xJKM+ntl8oyHzbsIdBqgBEN2tQTd09+86EXK6UhQh4T96tSkDD2nmtuiUN+kcRSMNOv
	FHPTH9HhcSJ1auIJcKyo5zld8azxLiijNlqGOZKJxsOWUlhrF+Z/eNtjkx+miq2dv6SzjIx2b+n
	eAXmuSg6CabPf6JRZ2vY9Yfd75H/jGVmGYuv8qNK/jRmpLIMbKhOPMAEOhacm+J0dV2qPunjNDQ
	+g3ZiBwGvmbXLzU52VfVICQc6riaDVl6xLoPpUjdA0bsN6p6Zr7Y=
X-Received: by 2002:a05:600c:3e06:b0:4bb:6947:3e1d with SMTP id 5b1f17b1804b1-4bb6947426bmr119351755e9.20.1794846521012;
        Mon, 16 Nov 2026 08:28:41 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm412165885e9.15.2026.11.16.08.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:28:39 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Mon, 16 Nov 2026 16:28:32 +0000
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@analog.com, devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 08/10] iio: frequency: ad9910: support iio backend
Message-ID: <ika7dmfhhue7il5xgbgx434vjxdwj57dz6kebaossw32vym7nt@gmpxjkkqirgz>
References: <20261103-ad9910-backend-support-v3-0-0e9224ddf7b7@analog.com>
 <20261103-ad9910-backend-support-v3-8-0e9224ddf7b7@analog.com>
 <auoRUS-tsK4X0KoU@ashevche-desk.local>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auoRUS-tsK4X0KoU@ashevche-desk.local>

On 03/11/26 18:52, Andy Shevchenko wrote:
> On Tue, Nov 03, 2026 at 11:53:04AM -0300, Rodrigo Alencar via B4 Relay wrote:
> > 
> > The AD9910 parallel data port allows modulation of the DDS core parameters
> > at up to the PDCLK rate, which requires a high-speed data source. Add
> > support for an optional IIO backend that provides such interface, with
> > data streamed into the device through an output buffer.
> > 
> > The parallel port channels get scan indexes and scan types according to
> > the data destination: 14-bit amplitude, 16-bit phase, 16-bit frequency,
> > or the 8-bit amplitude and phase pair for polar modulation. As only one
> > destination can be active at a time, this is enforced by the available
> > scan masks. On buffer enable, the destination is configured in the
> > backend and the parallel data port is enabled. The sampling_frequency
> > attribute of the parallel port channels controls the backend data rate.
> > 
> > The backend is also notified about profile changes, as it may drive the
> > PROFILE[2:0] pins, and the debugfs source attributes now consider the
> > parallel data port when reporting which channel controls each DDS core
> > parameter.

...

> > +static u32 ad9910_buffer_chan_idx(struct iio_dev *indio_dev)
> > +{
> > +	unsigned int scan_idx = find_first_bit(indio_dev->active_scan_mask,
> > +					       iio_get_masklength(indio_dev));
> 
> Split assignment.
> 
> > +	return ad9910_scan_chan_idx[scan_idx];
> 
> Who guarantees the scan_idx to be in the boundaries?

ad9910_available_scan_masks constraints the possible values here.
will add a comment.

-- 
Kind regards,

Rodrigo Alencar
