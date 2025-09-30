Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A87246796
	for <linux-doc@vger.kernel.org>; Tue, 30 Sep 2025 17:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759251679; cv=none; b=Ixj9HtLRCwPu6E5STvx1uQOF3T8P7HvsguR5MqOgBFbRPgN3eA/KW+U1TPA4QX/si/dGxAPX5WeWldS/ltEzXwkOhvDzZ6/+v8Gxh5tnWvpEHZp+PRhxScmkNT2zCaQckpe5GyMGDI0IIGYPWCPd8anxexWaKC221OX1C8QBHIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759251679; c=relaxed/simple;
	bh=AmHuuzpem5111casgiRIX7q6S2eHy1ZsEGaomvXBWBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F85zE0/U11F7279flQO0i+jsWj49n0EdBQzU2J39LTkLtSUwz2ux9JltshoQZdrvyNi3tQXK/gyQrjf7b4qnhJVFxUvgMWAQvYc4D7BQJrzS0FAAsWm+QNGxt5sjXgoSxr89eTLm9vghO8Zp1c3V3VF5BlO1XWppMc6mF67EnnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDOOVdKu; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDOOVdKu"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3352018dfbcso5011539a91.0
        for <linux-doc@vger.kernel.org>; Tue, 30 Sep 2025 10:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759251677; x=1759856477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Qn5VqRWJrpHDhx/xNpBlaLWgEArGVytxgRrr8Ys9no=;
        b=bDOOVdKukdiUsInRLL7W1Mr6ucwZPG0GVJ9putQ/fM8dB38/e4znvgFd8TqWdPOWv7
         BkASLLEnQeFq+XOOQdBnVo9SiMm3cq4HzJ76ZdqA2O/vA32XeO03ELa0lNFJO53IQ/yX
         YZM2YnBIUmufFZ0YLh1lphgiEQtMMcMW3NJO50GhlAxvWXQ9O417oWxylwiivmiBQ+uM
         xm5QOfpmFwMsfD0hSlU9O4ytHgUQOFB/KIFUkhR7dNVoFFg5YfdZUiGx2MPuhozQWSjd
         sJk4b+/kPzLR+ZIW6iJwSdjI+5oBC6lhIFYZylIynEqutbXMFgtwNpLlh7P6e7WbVeaR
         Og/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759251677; x=1759856477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Qn5VqRWJrpHDhx/xNpBlaLWgEArGVytxgRrr8Ys9no=;
        b=n/pPwow9ydrdfvKy/H5qUFTjx8AKi7MVf+dJbwr5E+BsYfdpHS8UK8WqSa2TCvT1ON
         PlzLLEdXsCNoz3okDMWUVbxwL1DvDC3ZdfiMmjmuOs9WUXjsA2zOYRxZvD4+7+YtQ+NB
         fWjCErhc2aklTknUS3J0ou1vD7vGL5rfCw7pCx1urkRa7HFkxwCK6zAEKIcJLnm5EET3
         C3c8LMJH4p+xZOXG7ygZaPe3piN0E6n7RxdwoxpmKx0YDVgemUQxTRo+ySC9UQrblJQi
         so14dQxx0zPuV/tjzs6jEM9Y32rdyEaNndaBCCNM/QhMVGd5x5yIUc3ZdjWO82Nlgzzi
         sZ7g==
X-Forwarded-Encrypted: i=1; AJvYcCWgdhB9I0HzFoYAQCyvfMi49BRPmLJPZWQb+4flJsn4ozgpoASeC6wbKEPP9hJgZXJssfjqxIpYz7s=@vger.kernel.org
X-Gm-Message-State: AOJu0YycvE5MxrFWqhnZ8pKiMwfWYmStN5ERDYZdaKlk67fd97s+UYyz
	tXYUFdH2j3tm12lS7O4R15GA2EPfM+AJ+EC12qwI2X+V2tiLnSnMfAbR
X-Gm-Gg: ASbGncvZ/PoxWocn5galWqQyl5CcgcNDvQCNn6QvNeupws2Jpn4rZNWgzHLXBn+yEAo
	4DV6IhyAYZaRtuAnO1vEmEnTiS6JSfc+Wh1akNHT9An7YVg1wiaJZpuaiaMHR6ch/HsQJSe1YG5
	1+qwznp8a1gj3cFagSuMOfaVeB+PsPEF5frnaVaFpxeNpC/PAMXgwrZcag2GWGNXEhmGBdZ3C6p
	J5LQJQV31EOat/WlVsIL1zBIfR8V19w/Uibx+GkE/WPwNDwXnDaWz6BZT8tdmrulDgpMuWlqBmp
	Bxd1xUnjIF4zBAn5SRu0JB1+hQRZCLFN+K6h4lZsg+lNQHiF/SqX9ELRdk0c++4PJ0Eamuqdayo
	fIrzFIBpWaBLFmqbYSMofv94FbUHqgIuIx2ooKx3SuOqbakUbJn3WAfxerf5TZwEIOA==
X-Google-Smtp-Source: AGHT+IGy446EO1dFvrwF+hn4zw2/euRdjV/W41f6FxDTzzbhNgbS5i0TkYtI/qkAdJxguBsSMF5Bfg==
X-Received: by 2002:a17:90b:4ad1:b0:334:18f9:8008 with SMTP id 98e67ed59e1d1-339a6e28289mr264935a91.8.1759251677221;
        Tue, 30 Sep 2025 10:01:17 -0700 (PDT)
Received: from localhost ([2804:30c:b65:6a00:ceaa:2ed0:e81e:8f51])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3399ce47d7csm974066a91.10.2025.09.30.10.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 10:01:16 -0700 (PDT)
Date: Tue, 30 Sep 2025 14:02:08 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, michael.hennerich@analog.com,
	nuno.sa@analog.com, eblanc@baylibre.com, andy@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 7/8] dt-bindings: iio: adc: adi,ad4030: Add ADAQ4216
 and ADAQ4224
Message-ID: <aNwNEHHZ4RXyz92r@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1758916484.git.marcelo.schmitt@analog.com>
 <5dc08b622dac1db561f26034c93910ccff75e965.1758916484.git.marcelo.schmitt@analog.com>
 <20250928111955.175680cb@jic23-huawei>
 <20250929143132.GA4099970-robh@kernel.org>
 <CAMknhBHzXLjkbKAjkgRwEps=0YrOgUcdvRpuPRrcPkwfwWo88w@mail.gmail.com>
 <aNvtfPh2JLdLarE5@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNvtfPh2JLdLarE5@debian-BULLSEYE-live-builder-AMD64>

...
> > > > > ADAQ4216 and ADAQ4224 are similar to AD4030 except that ADAQ devices have a
> > > > > PGA (programmable gain amplifier) that scales the input signal prior to it
> > > > > reaching the ADC inputs. The PGA is controlled through a couple of pins (A0
> > > > > and A1) that set one of four possible signal gain configurations.
> > > > >
> > > > > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > > > > ---
> > > > > Change log v2 -> v3
> > > > > - PGA gain now described in decibels.
> > > > >
> > > > > The PGA gain is not going to fit well as a channel property because it may
> > > > > affect more than one channel as in AD7191.
> > > > > https://www.analog.com/media/en/technical-documentation/data-sheets/AD7191.pdf
> > > > >
> > > > > I consulted a very trustworthy source [1, 2] and learned that describing signal
> > > > > gains in decibels is a common practice. I now think it would be ideal to describe
> > > > > these PGA and PGA-like gains with properties in decibel units and this patch
> > > > > is an attempt of doing so. The only problem with this approach is that we end up
> > > > > with negative values when the gain is lower than 1 (the signal is attenuated)
> > > > > and device tree specification doesn't support signed integer types. As the
> > > > > docs being proposed fail dt_binding_check, I guess I have to nack the patch myself.
> > > > > Any chance of dt specification eventually support signed integers?
> > > > > Any suggestions appreciated.
> > > > >
> > > > > [1] https://en.wikipedia.org/wiki/Decibel
> > > > > [2] https://en.wikipedia.org/wiki/Gain_(electronics)
> > > >
...
> 
> Though, the above is still relying on GPIOs which is not a requirement from
> ADC peripheral perspective. Also, if GPIOs are available, one can just provide
> them through pga-gpios and have full control over the signal gain with the IIO
> driver. It boils down to just telling software what are the logical levels at
> two pins on the ADC chip when GPIOs are not provided.
> 
Though, as mentioned, the state of A0 and A1 pins defines a certain gain applied
to ADC input signal. Because signal gains seem to be usually described in decibels,
the proposed dt-binding allows to provide the gain value in decibels and then
software figures out what A0 and A1 logical levels are from the provided decibels.
The actual levels of A0 and A1 then have to be set according to the provided
decibel gain.
