Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EFF368D7D
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 11:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781868640; cv=none; b=bQUOL9OTIHPK6az4osiN8wX3MOAe8qtGsDlCrhBDYT42osCJ+7RuBKYPAl+H/2KaKB5eNq6O2U0qHWI+ZAPXxkVnlAFD17yduQ5EKxaKrmydpB7uvdnho0Onczktj0YG04nD/cwoYQAX4RBOfXE2R+O2dIhL4zYKuETqzfphISs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781868640; c=relaxed/simple;
	bh=tKL3KAbOmbB0KsPGhd6YoyVBMOUEnR4k+bBexPz+8pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0AWYChHYPHIs4cOCMDtps0bsD1T6KqFEuVWtQknEY1bMRR68PY0/EYJz3xM38PhCfpRdXa23KQwtory2rAXD+mk1pZO9RR36Y2K+os/nWl2QBQP9MZYDNZP2yA+mlTd55ln5pecZ2T3J06e68zyCpAQE9fLjQfBvgf7gVHSs/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCT4H6t7; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCT4H6t7"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c074142cf6dso305541166b.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 04:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781868638; x=1782473438; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TucRX2gfPFMDDoN8Mlfxd7xl20UMCrUn0QTYPFwhHT0=;
        b=BCT4H6t7TO0sAqocYzDjtDdU/m3P4IPnKn6a5xrNKl40AUnTu9GU7Ca83a0w8SnJXL
         Khde6YIOdVSbQkQfKgawxXJdHQOAi8i0mMaZJVe3rieer7OCZ1/O5PFrxDgDqkYdp2jk
         SAxN/eZOxFD7I+cXchuOVv2GONo9IRh0mpYFNrZAHCT0I4uwIXTD4mLYHD3PQ/JPwuzP
         NWi5woOlZJ5jI8NAyhD0ZZS0N5Nx1w8xDtgp9DxxhnADfvM2I+l7TvAlfh4LIpx3E3k8
         rsoBUK7NGVyvT1FGvKHY6X/Sb2/lpdQe241vlpjwAVh0IkQSL1sKjnsXs6BXp9vSBRXl
         ImIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781868638; x=1782473438;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TucRX2gfPFMDDoN8Mlfxd7xl20UMCrUn0QTYPFwhHT0=;
        b=FI8rVc3hdM7kRiJlbxAcI1rc2RiyZb0XRrOi+Oc5dErgHkDf3BqRWRwB70/pDsc/Nw
         ifzEq9gDd6HSo/xTIB2INacK4ruML4QtX+UtrjyLY37Ma5nFlg2hVcPxaFQQHdB06VEm
         BsjJLGtsobRqVfTOfzMoAOZLiUXjRKdcmUD/qEEiWBBFq7YCgvaFbwCw6Sr2ww+QL9Tm
         dln36EIWhpq7NqRhBdHuHJFToI7ZfbisAJLFiIRP9fgWKO/eTmysKVaYNzdhvYTRouLK
         NY94nM73ZHn2RaCRAHpgTGfkD+CWun5ppDyr3MOezPArUZJu3CSTYXFN8nZsQxiGQkVz
         BvDA==
X-Forwarded-Encrypted: i=1; AFNElJ/ez29UfPBKAG0I4RD+Hpd/CpSaC3jDFnNW2h54UCnm7y3WjIwDqasmaCndJLV08xfEwfsPsBJLIkY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBWPY4kAr3bI5l6m5nWJ3AAWY2LPRpTUYR3ndn39xBQwT3brVV
	7U//J1EJIw+GjNCw11qhiOofEzOg516FDDR88RFex8FEpiEQ5RYOekikJLX7bw==
X-Gm-Gg: AfdE7clKplzFzXZXZjWvBvk2UllXXm0b3uINEIjM83tJw103COnW6oLzZN4b93Z3BB3
	NXKdNYOVz54irByAg7PxzVzpxvxSCqbzUfaCQ2GyWhZxSx30d1Dh5M6MY81QXDGp4CfBnMfJv7/
	RF8nafQ8FsfRfurBqaBWKdIf77yEPgtMRbhl1RwztMwSUutpoin8NMohjWKt5NfDd9DyJ3dj5TR
	/zHP2cvWHY5W4AYt6fJZAQrsvoVb02LKBAc3SNUtayBEBvlBTxYZTzANIhOxpk1f2OQiyN72s7M
	LcaiDsVMwQvr+izFSo1p5MGAAq7gZAsm33Fs4mLqKUrf951E5LDI/XoHnwDGH4LvLvBiuP1Sh/Q
	ewirJJa+ecgfHgIMEYze4b68LktbOR411l52zKQHhs7BWWc/ZPc5ywibOr8rL3p2vAN8i31gUTb
	8+W5Z6
X-Received: by 2002:a05:600d:84ca:10b0:490:e180:2e0 with SMTP id 5b1f17b1804b1-492409fbfb9mr28275055e9.3.1781868623638;
        Fri, 19 Jun 2026 04:30:23 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49245711032sm16710165e9.0.2026.06.19.04.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 04:30:23 -0700 (PDT)
Date: Fri, 19 Jun 2026 12:31:24 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Janani Sunil <jan.sun97@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>, Janani Sunil <janani.sunil@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: dac: Add AD5529R
Message-ID: <ajUniw8HEuAIBr-a@nsa>
References: <20260519-ad5529r-driver-v3-0-267c0731aa68@analog.com>
 <20260519-ad5529r-driver-v3-1-267c0731aa68@analog.com>
 <25mh6grzh7zh3b4uytcqnusyv5zjuf6ia4if3ce3oqzqz56ehi@le72iqv7ye3d>
 <603473ac-30e6-45e5-8a3b-c9902715cc9e@gmail.com>
 <20260614204455.408c4d40@jic23-huawei>
 <076d7d2d-81a0-49c2-af94-bd65ead66c09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <076d7d2d-81a0-49c2-af94-bd65ead66c09@gmail.com>

On Fri, Jun 19, 2026 at 12:33:11PM +0200, Janani Sunil wrote:
> 
> On 6/14/26 21:44, Jonathan Cameron wrote:
> > On Tue, 9 Jun 2026 16:47:23 +0200
> > Janani Sunil <jan.sun97@gmail.com> wrote:
> > 
> 
> Hi Jonathan, Rob, Krzysztof, Conor,
> 
> One possible model that would also allow mixing the 12-bit and 16-bit variants would be to treat the parent node
> as the shared SPI transport only, and let each dac@N child carry its own compatible.
> 
> Rob, Krzysztof, Conor — wanted to get your input on whether this is an acceptable binding pattern.
> 
> properties:
>   compatible:
>     const: adi,ad5529r-bus
> 
> patternProperties:
>   "^dac@[0-3]$":
>     type: object
>     properties:
>       compatible:
>         enum:
>           - adi,ad5529r-16
>           - adi,ad5529r-12
>       reg:
>         minimum: 0
>         maximum: 3
> 
> With a DT example such as:
> 
> ad5529r@0 {
>         compatible = "adi,ad5529r-bus";
>         reg = <0>;
> 
>         dac@0 {
>                 compatible = "adi,ad5529r-16";
>                 reg = <0>;
>         };
> 
>         dac@1 {
>                 compatible = "adi,ad5529r-12";
>                 reg = <1>;
>         };
> };
> 
> The downside is that it introduces adi,ad5529r-bus as a compatible that does not correspond to an actual
> standalone device variant - it would require a parent driver to manage the shared SPI transport and enumerate the
> child devices. The actual DAC functionality is handled by the matching per-child compatibles(12 or 16 bit).
> Is this an acceptable pattern, or is there a preferred way to model this type of addressing scheme?
> 

At some point, I wondered if we can't just have this at spi level? Like
(in the simplest terms) a new spi-peripheral property that would allow
devices to share the same CS. Then we would need an adi,pin-id kind of
property for this device but the bindings would be pretty much as if we
only supported one device.

I see Mark is already in the loop, maybe he has seen this kind of things
before.

- Nuno Sá

