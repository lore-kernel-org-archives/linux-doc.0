Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14C52DB7B4
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770648413; cv=none; b=YT+PWAkwzNHxEovXhM9/jsKL+d7D36Z6dpzBPPc8MM7kbv4Oi+LanXAG9yYI1HlfAW2PdRUyb00xuxavdaTV+FKiyYmeEG+U7u28bl+cBgVdD+PdaokC4Mm8a+2RL8svluXXsdXIciGVeVf+5xiZmVXfVcnbGTJ5aUSoNZlyL4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770648413; c=relaxed/simple;
	bh=lfCZvo1BYY+V3BUBac9tCSWJ7M2G0L0QR1+eQrvTvus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WFA88pD4kkrUItNZLlzvQTX5h9LvbX51iGjo4Mc0kYdA/tYwv/qp693K9RZCdLJaVnTjbPjPF8w1U1gl9thpccq8umTTlvENTOWTXT0larvEO6xMBA/emMNji1KC9oOxq9bOx69y5vWjN8RVYab47kadVyfKG3d293Q3Mi4PtlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsT5x/q8; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsT5x/q8"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64ad9fabd08so1554023d50.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 06:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770648412; x=1771253212; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iupTL7g1VPbKZeaieFodcs5jMThRswgGpkmXziygeYw=;
        b=lsT5x/q8rfE8IzypC1nIhUqjWAsBmO3ZXU7CfVbi5RNThj2vwZzknQySyNd5XOjsro
         vEUUWLz3ytVhzAD/2pbNx2RIvtNrdLhw0oMi2WoxxYRvmcy/xf8cGyW1Tfis68C4/DbH
         9p9q+fAzy0eA6ATyCOx16H5RRMAAzokcLlPOuL+Ootp0qYjDLD4NOTSsggCTZq0/iuy3
         ooM8wQszRbksD/sXTa3w7LyyWCcawECzyDFKPhZzVGa6Muu5PajhWECZE+2TGdwipAHP
         eYPjjtwAjIOsCpYcEtbPg1RIvN0+dshDVR1ZNUUtRWxHJsKTes2wJGwXwxUQY0fO2dmL
         Os+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770648412; x=1771253212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iupTL7g1VPbKZeaieFodcs5jMThRswgGpkmXziygeYw=;
        b=BeKOwa9ONrao7jqXynR0iuUjAuzr8EribyOWyylvTBUod4nCb/TN440nSFBj+U3avy
         BLArkHar9I8UuELlrZMD8qHE5M0GDwuXhhXUAZhgMokQaCnRflglzNHadhZ2n0Pe7u09
         DerkvZ8urTQMkEKYPM9CL4R5Oa/JrQrN7YMifh2csaqsJhJb3DJYUG99DAY45KNcbfas
         ue0rGSfUcO9hFtG4CLx9gMVSb4ocmLuqLM7Nh7CEKUwLuc8D+1pDJqMSeOewOEkGE9X+
         s5phcacFNzmxSPmnGx6PTvmBCyF8G40OnxFZrdCBxtYydwT+09Zf2G8zt5ASPFY8fMp0
         Kkkg==
X-Forwarded-Encrypted: i=1; AJvYcCVJZ40Upad0fZaM2w1MOrWf7hH7TSPzfG8LF6xZoR9nJMCdFTeo2rPpq1+SyqgO15zBCI1ghryT+ks=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhBxu2Ap+K+T7EH+5im0biQTbdXre59zMPvGg715Yc1wpdczee
	FT/P/xldylnfphLGCMyfTn1Lcq8iaHKjMIqt2AlwyjGg0DMBk5Em1HjI
X-Gm-Gg: AZuq6aLX669c4NNPgK0AYJ8WWAhgHQqCypJjKxglfJ4AxUnRYpBEBhsesuiSV6iiEO1
	g2ve1U4x5rChQ1LgPWaccQ/HO+RlxCrdyndpfQBuWUntRK9IpTL7ehKnzaHE7IoLtbj+UgfJr/m
	RPDzKUd4ZiJk7KeEVsEkNcpno5MPlOtS5ngJyH1U9YPiolRBT3l6udQHkAQB/Y/yg7b0aKdwVcM
	JUtVnEXh54pTmXn6lT5IwjVXbpLQGupZoJ09GEQAci0KZ8teSnlQyFdorMWxh6TDscbt/APvZa3
	B890VB8r3yeOw8QI9a110gE58yVmgi6tcERMNl4UFhNenEmuGNvqBE135P4tqCdvAhoTtr2v1Pb
	rXwU5CvVPCkkwfeOz0pgXFVX+ktPtM0JuNBIkNRj4v40VcSRObei1RMHKuFvMF1ktSaya1fH/Cf
	3dPevU8gF/ViZclEak6LgC
X-Received: by 2002:a05:690e:4085:b0:64a:db22:1cef with SMTP id 956f58d0204a3-64adb221f23mr4737453d50.42.1770648412369;
        Mon, 09 Feb 2026 06:46:52 -0800 (PST)
Received: from localhost ([2804:30c:163a:1300:9b68:dd2c:feb4:459b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64ae1076ab1sm3552146d50.5.2026.02.09.06.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 06:46:51 -0800 (PST)
Date: Mon, 9 Feb 2026 11:47:19 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, jic23@kernel.org,
	michael.hennerich@analog.com, nuno.sa@analog.com,
	eblanc@baylibre.com, dlechner@baylibre.com, andy@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net
Subject: Re: [PATCH v8 7/8] iio: adc: ad4030: Add support for ADAQ4216 and
 ADAQ4224
Message-ID: <aYnzd55yYK5xRSpr@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1770403407.git.marcelo.schmitt@analog.com>
 <b437e4ca90df98220f2cabc514c201743e269889.1770403407.git.marcelo.schmitt@analog.com>
 <aYiXKq5SJ3wNl8DA@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYiXKq5SJ3wNl8DA@smile.fi.intel.com>

On 02/08, Andy Shevchenko wrote:
> On Fri, Feb 06, 2026 at 04:02:19PM -0300, Marcelo Schmitt wrote:
> > ADAQ4216 and ADAQ4224 are similar to AD4030, but feature a PGA circuitry
> > that scales the analog input signal prior to it reaching the ADC. The PGA
> > is controlled through a pair of pins (A0 and A1) whose state define the
> > gain that is applied to the input signal.
> > 
> > Add support for ADAQ4216 and ADAQ4224. Provide a list of PGA options
> > through the IIO device channel scale available interface and enable control
> > of the PGA through the channel scale interface.
> 
> ...
> 
> > +/*
> > + * Gains computed as fractions of 1000 so they can be expressed by integers.
> > + */
> > +static const int adaq4216_hw_gains_vpv[] = {
> > +	1 * MILLI / 3,		/* 333 */
> > +	5 * MILLI / 9,		/* 555 */
> > +	20 * MILLI / 9,		/* 2222 */
> > +	20 * MILLI / 3,		/* 6666 */
> 
> In case you would need a new version, or Jonathan is okay to tweak, I think
> it's better to use float in the comments. The above comment explains the
> MILL multiplier for the values.
> 
> 	1 * MILLI / 3,		/* 0.333 */
> 	5 * MILLI / 9,		/* 0.555 */
> 	20 * MILLI / 9,		/* 0.2222 */
> 	20 * MILLI / 3,		/* 0.6666 */
> 
> > +};
> 
> Btw, if this true (if I am not mistaken in the gain values), the question is
> why 0.2222 is much higher than 0.555.

I guess it has to do with how the PGA is set up, but I don't really know.
Those fractions are specified in the data sheet [1] and test results have shown
those are correct. I can't explain why we have those specific gain values, though.

[1]: https://www.analog.com/media/en/technical-documentation/data-sheets/adaq4216.pdf#unique_2_Connect_42_T1
> 
> -- 
> With Best Regards,
> Andy Shevchenko
