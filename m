Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63EB36074B
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 15:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771859305; cv=none; b=twBu6z2Bue8SYnsWH21H2n2MjFxH1WpKQ5ix4qHHc5oZjTT81bnd8SdblyEXxIIIDmLMjxZAcGCNyibPfUG8paCUk9q7Wr004s3VI/bdje6AbIlIg6kSXBzqsH+yNILt1604bJpDKSdIqlM9oGl5pu0FT9RtQSRp90GK5ByiPHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771859305; c=relaxed/simple;
	bh=JTIUPgwETZRXvFjrA1P5pCHV9Og5U7zf3qDfiYw2YXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieSaZTxiYvEDi4kBS0faG5ikLNr9WJBwwRa3ghdzyI3NHowuz85V2XIKwg2f21lmkikeNT2W4Kh0uLj7rqYpXlfoaQUDFdP59q4UrCpPz3T9X7KvhiR2G2HsLCgHKrwt3UgctcS+/29MvH3d2b/gSx7nwlQJHnRfnpPeO8ygqSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQY6Zf1V; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQY6Zf1V"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5664634a27fso1818796e0c.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 07:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771859303; x=1772464103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JDkTFfTBFUmp0tr3dEyVOuaf9ziHidjokc5/wP5SDcE=;
        b=eQY6Zf1VOXe0lhWB8oL5PbUAytRuIZ2HuHZPxWrHA4uJEldUS6OhbwyKtFXSMYACxB
         H2SGhGJUU0VoxWG1Y9MhQQZHYKSDpI5GP5YVs1yZjEx7JdibyHEbKVRy3Tgo7m5HUfVx
         8ajR2eA+SlQ0R8YtjO74bg9o+GJI910fZwiu5C+/1TSdN0WoSySaI+1JIY9GShUZ33kO
         0oW1g9RAKKp8X0WQ5fZNT0oHrJfJkTdYOL4wgG1BFDgmGbItlmQ+Zikiq52oKBDnzBas
         fI2nYpUxwtiisSdsKPg7AlLiIVHkDnORm/phx2H7+tdX0UCn5DliQvyPclqokhFtuF37
         LdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771859303; x=1772464103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JDkTFfTBFUmp0tr3dEyVOuaf9ziHidjokc5/wP5SDcE=;
        b=qw16WnpX6gKq4URT2hP+LE26+F3kq0halaMMSpO5tFIVpw3enObfgJbePI+MhD5RqD
         tCMHgMY9XHLp2RIs7erT3obgeQFoP3YqNYEvtwD3jHSIH72vhfa5jq1qR2yiy/V7aSFs
         CY5bIlkvtaDRrjS34g80eP6JwGPr/0CoeHMeV5gfo7SWOLN0cNzHAXskvcJmKueVdLg9
         Ss+zJ8Pc6QizYoFjbjkHh29Wecmwcvcydfvkl5M0pWA2ANLg8Nor2zaGXFe0iioDXYWW
         3KwCSrmsECo3+nYoxkaKJpeY64xjfQP1bCW90Vua3Xhge+ZH8Hq9MS5RClBPla0wFjc5
         D8Ag==
X-Forwarded-Encrypted: i=1; AJvYcCV+casvlC4xopuu6HxU1BTOEmHROokbVV9HqAxwc0FRw8hQ4MsNCK6MEsOAgmuZ3zvlY90GwZNuug0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzek62Z24TAI3BZrpG4J47esaelc4EobENGhT9zLzlATDetVNG
	ikNJfc2Q1GfIsHVcwmdxMow0RuasMNzLdpFHemLW9KNlALMJ2msIeAu+
X-Gm-Gg: AZuq6aLEXUniNYLTC4v2mzAy9BNhDjwCwKAVKM9zIPzjcIS23eBaFLTk6fJx+8uxaRJ
	eUFhOEaMvegvlOasLM0ADC0HXty8TmWICP7J9Azr2XsBw1h0loie+C9Pysho7konMR73t0Cx57m
	qlsyrVFstuQz8BQOOJm7O03oN+Y/TOuFJyhaHz2NdHcz/ac5/X9G9jk8tXbJZBxSeAUf+X0L7tD
	PwtNDJrEuv2SriZFbMz7F00dHczga3s++ymNmfIWn0XDZYrmjTsg1LgoEnEK8Hm1B45PIbZSLQC
	J66+ss5IBXE6mI1QItLiCaambzdi5mLPa3czhQ6i0tcDFctW+SnKetU9Dam5lpFiilStRMD3ABz
	ADydDw34qMlDoff0Dvzb68j2L1YDbsduFDa56sUIvCMQvIQrPlhdTR7yl9NyOalyT1CbffrMjVA
	DH95xTF0CZEybUg6uMll9WpNGlMidAbHs=
X-Received: by 2002:a05:6122:e448:b0:567:4aec:a27c with SMTP id 71dfb90a1353d-568e48f3255mr3176975e0c.17.1771859302694;
        Mon, 23 Feb 2026 07:08:22 -0800 (PST)
Received: from localhost ([2804:30c:b55:d700:d4af:2146:3fd9:d3fd])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-568e579c2ccsm9083635e0c.2.2026.02.23.07.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 07:08:21 -0800 (PST)
Date: Mon, 23 Feb 2026 12:08:52 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, michael.hennerich@analog.com,
	nuno.sa@analog.com, eblanc@baylibre.com, dlechner@baylibre.com,
	andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Axel Haslam <ahaslam@baylibre.com>
Subject: Re: [PATCH v9 5/8] iio: adc: ad4030: Add SPI offload support
Message-ID: <aZxthMvaSR3zhZD8@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1771253601.git.marcelo.schmitt@analog.com>
 <20f1dc8eb6bb692eb6eb814a49e54309d973a9e4.1771253601.git.marcelo.schmitt@analog.com>
 <20260222125703.00e3152a@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260222125703.00e3152a@jic23-huawei>

Hi Jonathan

On 02/22, Jonathan Cameron wrote:
> On Mon, 16 Feb 2026 12:00:39 -0300
> Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:
> 
> > AD4030 and similar ADCs can capture data at sample rates up to 2 mega
> > samples per second (MSPS). Not all SPI controllers are able to achieve such
> > high throughputs and even when the controller is fast enough to run
> > transfers at the required speed, it may be costly to the CPU to handle
> > transfer data at such high sample rates. Add SPI offload support for AD4030
> > and similar ADCs to enable data capture at maximum sample rates.
> > 
> > Reviewed-by: David Lechner <dlechner@baylibre.com>
> > Co-developed-by: Trevor Gamblin <tgamblin@baylibre.com>
> > Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > Co-developed-by: Axel Haslam <ahaslam@baylibre.com>
> > Signed-off-by: Axel Haslam <ahaslam@baylibre.com>
> > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> 
...

> > +static int ad4030_pwm_get(struct ad4030_state *st)
> > +{
> > +	struct device *dev = &st->spi->dev;
> > +
> > +	st->cnv_trigger = devm_pwm_get(dev, NULL);
> > +	if (IS_ERR(st->cnv_trigger))
> > +		return dev_err_probe(dev, PTR_ERR(st->cnv_trigger),
> > +				     "Failed to get CNV PWM\n");
> > +
> > +	/*
> > +	 * Preemptively disable the PWM, since we only want to enable it with
> > +	 * the buffer.
> > +	 */
> > +	pwm_disable(st->cnv_trigger);
> 
> Feels like there should really be a way to get a pwm disabled in one call
> so there isn't an edge case of it being on briefly.
> I'm a bit surprised it defaults to on.  I guess this is because DT can provide
> the parameters?
> 
Not really. DT doesn't specify any initial state for the PWM. It might, though,
be left enabled if another device was using it previously. Not a thing I've
ever seen during tests, but it may in theory happen.

We may have devm_pwm_get_disabled(). In IIO, ad7625 and this ad4030 would be
the users of such interface. Would you like me to propose that one?

Thanks,
Marcelo
