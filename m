Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA44449EC1
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 09:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768988500; cv=none; b=PPNamw4p7TVttPze3DnvdO+FnCkj/p1PxX1C8jn89zu9M2C05feboA3OtgCJ8G8icBW+MZqqAU0Vpo1t5LLd6OOxqwxovVVhh/MxHqlcGG6I+68K7nirudo+WhiWN1wfDgMnL/xPi/DS+SX7/++YKV25BvkvM4nUqnEItE2wJF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768988500; c=relaxed/simple;
	bh=bxzThV7tQ3Murw+misd2L3l9CTOTGBERVGRAqk/Z1Uk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CkdkIaefMT9b9ZUJVYMnndRJAzMSlGBuHpcK6U04fNIGQlUVTTplVW2cQHRhaexvXsF6T4jPvIuOCpdFaq8pMy07qJJ4bvO/XUsScIjUxxSJDftzWOsiT8wLodfZUBunndpfiz0BKWHFWiwuETrjQoPFCo8lDGbpX8z/0a1EO2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iko2czaZ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iko2czaZ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so4447135e9.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 01:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768988496; x=1769593296; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UQrmNmrNqyC9vSBp6JJ3q8RaAwfn1AOiBhLRYJqypV4=;
        b=Iko2czaZE397M8iccteVHSU6MrTe9cognIzK4Ju9MJbsLTR/wj2VtdFhQMHDIvFhgX
         D7LX/uuXICJsFLnCMB/qKuN1gGAZmjpLWNjuRQh4CZcKRxaKzLI1CxoPFntNaQANakTe
         AyTmjSFsHpeFbinXSStjIvwOKKtxK33zIFIAqcfugCOF9vKFOWZvuMAwV5rfQ9Gvm6OZ
         xCscRXA102u/cEUwUsiuSktcvo+nd53WfeFosI2ctKgcl3o7xyxxWTeFfUDObYuc57Zj
         0IXlubU0gteYtCX1fgxhXk7iUrbIO2gWNrbvBZ8EUN2ynUl1Db8CVRRGhmVkY4ZRuSqV
         J2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768988496; x=1769593296;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQrmNmrNqyC9vSBp6JJ3q8RaAwfn1AOiBhLRYJqypV4=;
        b=TiVl3863sx1ERrF8baCsJUaSmAO41wjJzagt8cQ2zdHg1pVODEDpmUS10/kQD8VSkL
         NFh/2oeUJo4kSdtFqwjA2SDQyfIVilTRGYYZ3nJLVJICtl51xLs7B+FPuK4na8yxWLu/
         KyGZmqM98m+uDUuSjIrLz97kThKekCABsp+M0UmZy9Cds9rgzfdZ5zoxTxbhicSRo+q9
         UzzKxnIU8PGiLOEHbDd5mrbOSQ/HeFkF1sfujq/xBeItPTSXX7AlqXm+2vVNNSeUoQp9
         BRJa+CoDAiiAZcsjImM6cYFB6FEjBMUwSNaP9IOhofB/3g4IMblbZM3ejd+5U9bKnBAS
         RaUg==
X-Forwarded-Encrypted: i=1; AJvYcCXZHmyywT1hLgimHgyTlqYhbiIP1UzJSh/uDN8Nsjw9w5z3UivyfU4AUgcrx0LZD0crAsl3+P7Wb58=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUe49MBnSgyYZs0QqQeAxeWh/Si+LBeYP42Q8uRICJi75FGuaM
	o8iaBNTLIY7t75ZKZzMgUvfNq881MZbvAEwwvQfxsHq35E9nfe61jrNA
X-Gm-Gg: AZuq6aLcVN6DVA6s0nCvriMN3pGhNRdXO7N27wtMSYnqhSyb3E4RShbc/rHWZ6IGz/y
	yNEmsqeDvZUCMTZo5Ze6E7N7Pns+brcCxXuQUHHwloIz2cs7N29ZmHOo/CLLNmdqD90YtJ2lGbw
	iXCU6thUqe6itmC2mDMy80/7pYT8jr+eHBiPhH74mkqqkvfDyZg8tLKNGtgrAsIRyygkz5yHSCa
	qWH1jUgqzjNax8x+oB3JNfCgJU0mtYJpI8Ddpn1S7UwfUnQ6UYl2sIEaXLvWQrXvedL/rxms9JS
	m5MoiFa8sYXaKMNwNMn4/hEgRjtzM1IdNTNwkhvLlMkerjc4uGiqbjd4C44DEq0U+yIvHYsgE3n
	CJAH9WKv0zLPkNFGLRvXIkgS9NT6U+NokkQtuauXUeDLhgGNVtRcsADvNqxgw/uoEIDRIoSsfiv
	ln1OdYkVGtHrjP5mELnbbp/pFjA1pkDruywiP/hSj7rnUbmSa/yzYAsVNp9iaHZIch55Imbt6tA
	1yq
X-Received: by 2002:a05:600c:1f86:b0:477:a289:d854 with SMTP id 5b1f17b1804b1-4801e53ca36mr276279895e9.5.1768988496073;
        Wed, 21 Jan 2026 01:41:36 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com ([24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8caceesm297259935e9.13.2026.01.21.01.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 01:41:35 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Wed, 21 Jan 2026 09:41:25 +0000
To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
	rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v4 3/7] iio: frequency: adf41513: driver implementation
Message-ID: <kmdqcaewxxg7isappgfxuf5ode5fepbywrdriksmvrzmaykcjd@crpr27tt3bmf>
References: <20260116-adf41513-iio-driver-v4-3-dbb7d6782217@analog.com>
 <aW3dxuelYDM67pqZ@smile.fi.intel.com>
 <texwv5s2tvcy34bwr4iruj5xofmea663pwletmpqpuh66zulmv@m7qvjgqbhalv>
 <aW40ylvMwVhqNQMw@smile.fi.intel.com>
 <hgy3bcrqqsvt7pobhnzuvwzhb2taetpxltkaxpigmmlvmlirod@v6anhmrsvv2r>
 <aW5kk6K30Izckvg5@smile.fi.intel.com>
 <e5lcg5kkey3c6u2l4rlzzpolp7qkudhcofyzcx5s2tjbh2iwkg@js3fisv23zyj>
 <CAHp75VepcSZo_E4_UxhKRfHrMFDd7huJg14m8=6zVo4ENKFXkA@mail.gmail.com>
 <vvdk3whhwua73g63eetnmn46t2cpbpkzzkx7m6wsbverp7gcvs@mi7cipis3i4t>
 <aW-Fai68pk1tAeyY@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aW-Fai68pk1tAeyY@smile.fi.intel.com>

On 26/01/20 03:38PM, Andy Shevchenko wrote:
> On Tue, Jan 20, 2026 at 01:07:49PM +0000, Rodrigo Alencar wrote:
> > On 26/01/20 01:24PM, Andy Shevchenko wrote:
> > > On Tue, Jan 20, 2026 at 12:43 PM Rodrigo Alencar
> > > <455.rodrigo.alencar@gmail.com> wrote:
> > > > On 26/01/19 07:07PM, Andy Shevchenko wrote:
> > > > > On Mon, Jan 19, 2026 at 04:37:09PM +0000, Rodrigo Alencar wrote:
> > > > > > On 26/01/19 03:42PM, Andy Shevchenko wrote:
> > > > > > > On Mon, Jan 19, 2026 at 11:21:59AM +0000, Rodrigo Alencar wrote:
> > > > > > > > On 26/01/19 09:31AM, Andy Shevchenko wrote:
> > > > > > > > > On Fri, Jan 16, 2026 at 02:32:22PM +0000, Rodrigo Alencar via B4 Relay wrote:

...

> > > > > > > > The current implementation is kind of a stripped version of
> > > > > > > > __iio_str_to_fixpoint(). Would you prefer something like this, then?:
> > > > > > >
> > > > > > > Do they have most of the parts in common? If so, why can't we use
> > > > > > > __iio_str_to_fixpoint() directly? Or why can't we slightly refactor
> > > > > > > that to give us the results we need here?
> > > > > >
> > > > > > __iio_str_to_fixpoint() only parses "int" chunks, adf41513_parse_uhz
> > > > > > was modified to accomodate the u64 parsing removing unnecessary stuff.
> > > > >
> > > > > But why? The fractional part most likely will be kept int (it's up to 10⁻⁹).
> > > > > The integer can be bigger than 10⁹?
> > > >
> > > > Correct, integer part of the frequency value goes up to 26.5 GHz
> > > > (uint_max is approx 4.3 GHz). Also, with the dual modulus, the PLL can
> > > > achieve micro Hz resolution.
> > > 
> > > µHz is not a problem since it's up to nHz.
> > > So, the difference so far is the integer part that can be 64-bit.
> > > Again, can we factor out something to be used for this and for the
> > > __iio_str_to_fixpoint() cases?
> > 
> > I am not sure what you are suggesting,
> 
> To make changes to reuse the code.
> 
> > but I am avoiding changes to iio core at this point.
> 
> Why?

I understood that core changes would require more than one user
supporting the change.

> > If any other user needs similar behavior,
> > I'd say we would need to have __iio_str_to_fixpoint() implementation
> > modified, so to create a version of iio_str_to_fixpoint() that handles
> > long long variables. Possibly consuming simple_strtoull instead of
> > doing the manual parsing.
> 
> That's the problem here. With Yet Another Cool Parser this all becomes
> unmaintainable very soon

Considering that the need for a new parser for 64-bit parts is only driven
by this specific PLL driver, I wonder how things become that unmaintainable.

> (basically as you said when new comer needs a third
> variant of it). This is not good. Instead better to create (amend, expand)
> existing test cases, split out a foundation API that parses 64-bit parts
> (maybe even for fractional as well, dunno) and evolve a needed (sub)API
> from it.

I don't disagree with you though, I suppose I will need a green light to
move on with this?

Kind regards,

Rodrigo Alencar 
