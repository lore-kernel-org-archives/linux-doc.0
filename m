Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B0D324B2A
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 21:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763070910; cv=none; b=cJMWtFZBtJmiX3hRrE6RqeQaiO47quSGOcPhfU51Ek01v6TUl9jckWb1VrRjfhsmVX0w1h4JE7uKb+NH5+GWoghPegpdKXi2yl6oHOKdSVa7qYSOHNzLxVEswtYqEdFqo59vOL/iVsI78CDWV5ZgWQvj7U6PxhyqGzva7OzS87o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763070910; c=relaxed/simple;
	bh=rVmOuDbePpQ2bGMVUUhPEgQqgnR0QGJ/V1GBCFoSda8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xoap9E1VxdpEMQGwwbiQGo4mWAjOhXzuBj5vihZkZsEz2asBBK44nVTBx7rXJPxpiGEdKXE5y6xfiXIwhgx1m2JMvs/3KCqDEprBqJaU/ceOwRyVS3+GeOy/a+nAXZfCUjb3+MOTQZKhaa4vuLGgdftaRty49PgFjrAhUX5zSP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEIqNwYV; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEIqNwYV"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so1180245b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 13:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763070908; x=1763675708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VH/u9TyGr8RSTsWUVVlvs3UKeqS3V+ruCDTcFtD8HWs=;
        b=dEIqNwYVG9vuE+ZX4gYBL6p9FjDHiISo5L+ld1kit2Szw7XLS0w7BDK8hFBCjZsHqW
         mkxlRHXxht/2/Mg+BnZUALAYeukGBYz5jE0zduKHHfpE6ibPr+i0ptd+3U71iDsgZKMr
         2fWfu2DAlVTZWFkIFs+OYgdFBeqDWxN562NzYSptx2AeH6LMtG3T8atfQP5GPZStIhXl
         kyBJfZGaNrKa0F03zS5uxJFgxzxCbeooJW+P8HfZurrZfBUTSXRpRipqm/FMEd/eo3Dx
         LmGqrVAOxU0YFsl/tcoauzHtcCc6QU4ClRgn05aLs/jYMLxuSRsWu/8a9okM4mpeA9Gq
         Zz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763070908; x=1763675708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VH/u9TyGr8RSTsWUVVlvs3UKeqS3V+ruCDTcFtD8HWs=;
        b=dZx0+2blfDDYKM+gSDmjTAARkdXvQ132biwHi2Ax8l1Ko7q5gyRtpV/CuIHfvZ5gDu
         vVHTHbbmq9/0NbI8EkZrV7pvIqLAbLnkMw7EqjMcvvc6htDhGPt6Gz7LskgejHmHNhoJ
         fZN/Hz5XcSLgr95WAf5raHoyMhOLpNgvgtCXS8Zm/WpgVUxH4RSxoxbT5o446FqZN+JY
         +pel3l1Ub18FT0TZ9vIx6OFDiki03oS8eK+Limi/wA1BqhPUp/Im9Qp/+NGWUBPxcdkD
         a4Mz0EYhaeIz8lqqc3/niQaHXDRPHFlI3xao0YnJfnSeqa2kDq577ptzvc2ghxhWA5m8
         jHkg==
X-Forwarded-Encrypted: i=1; AJvYcCWEteqrOkkc3HoS8/+THyZm3GinJqbDrkLuzPK9Vrjg6ewsFAeuftXGg4TjX3U1poACO/7waJDGiwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhdZWvIom5UM2v97uoXhjUAii7QyU9O2CCWCAB1LtMVJ1G+OfC
	yWzJiBtM1NtH7gWWnEqWrpvXFnmnCshCJiLjkzgeHZvgXzqAggCj/8hX
X-Gm-Gg: ASbGncsMXZAy7bGwdM8Xa7pDMIkRB/+HPZN/0k0UDnHXeCUecQmA8+QA0COxITm5AVB
	o+7fYKIzsFM+OV3+zOdr5XgX+QF4HC793HUQB11QGgKxRO7eFKjjQuV9OVCYtdJePQlDcyyiloy
	IQ4/g9G7nwxv8j/+qAMEwDLo57WvIIYgrQL7CknZAOeEXMyOfU+96EfAebwln4ZiNyZeW6RKMjl
	Ql2N+pUAlh/Cmng+54A5fo7hMz7EfyXAghSHDBdTwHSyxmdgMCQMrjEco0Ja8F0cuS0ZUk9G4Ai
	aaKNneWTT4E0a0ZaQCq3wuqYpBUw3YpjSNttcqToNDU5sw0kWGMvIjEUFo6ZKGs3xIuJN+tDM7w
	uLQb8YoeAIvLlIdQxNSP5ReWxc4BfnEjZ8A0tAHeqnLUbxTexjiblRBmss2pvO4F8+uiXkeF0kB
	Sl83ld3HAraQ==
X-Google-Smtp-Source: AGHT+IHgNFq0jP1i0r3FaR4AOhj+yV3flfh8AIpVcJiaMVYJcKSzpwSp2u+su9PFlH3VrsqSc59x/Q==
X-Received: by 2002:a05:701b:2803:b0:119:e55a:9c03 with SMTP id a92af1059eb24-11b411fede8mr219766c88.31.1763070907987;
        Thu, 13 Nov 2025 13:55:07 -0800 (PST)
Received: from localhost ([2804:30c:1661:8a00:578a:911c:ac25:24a6])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-11b060886c9sm1319946c88.11.2025.11.13.13.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:55:06 -0800 (PST)
Date: Thu, 13 Nov 2025 18:56:26 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, jic23@kernel.org, nuno.sa@analog.com,
	dlechner@baylibre.com, andy@kernel.org,
	Michael.Hennerich@analog.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, cosmin.tanislav@analog.com
Subject: Re: [PATCH v1 1/3] dt-bindings: iio: adc: Add AD4134
Message-ID: <aRZUCtYzZCY9IQ5U@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1762777931.git.marcelo.schmitt@analog.com>
 <608ab00821af9f766c75d88f59940fed87cb6df7.1762777931.git.marcelo.schmitt@analog.com>
 <20251110-unsightly-blah-410539e95a18@spud>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110-unsightly-blah-410539e95a18@spud>

On 11/10, Conor Dooley wrote:
> On Mon, Nov 10, 2025 at 09:45:18AM -0300, Marcelo Schmitt wrote:
> 
> > +  adi,control-mode:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description:
> > +      Describes whether the device is wired to an SPI interface or not. The
> 
> Can you explain how you don't automagically know this from what bus
> you're on?

No. I mean, I should have realized we can imply SPI control mode from the bus node.
That's one fewer dt property :)

> 
> > +      PIN/SPI pin on the device must be set accordingly, i.e., PIN/SPI must be
> > +      set to logic high for SPI Control Mode, low for Pin Control Mode. When
> > +      absent, implies the SPI interface configuration.
> > +    enum: [ spi-control-mode, pin-control-mode ]
> > +    default: spi-control-mode
> > +
> > +  adi,asrc-mode:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description:
> > +      Asynchronous Sample Rate Converter (ASRC) operation mode control input.
> > +      Describes whether the MODE pin is set to a high level (for master mode
> > +      operation) or to a low level (for slave mode operation).
> 
> I don't really get this one. If this is an input to the device that
> controls behaviour (master v slave) why is an option needed too? Clearly
> this is not a gpio but it seems like it could be one, in which case you'd
> need some sort of asrc-gpios property. Is it not possible to read the
> value of this setting out of the device's registers (maybe it's not when
> there's no spi interface connected?)?
> It's not used in your driver, so I can't look there easily to see what's
> going on.

The MODE pin defines whether the ODR pin will behave as input or output.
Currently, there are no plans for supporting ODR as output but, software would
need to do different things to control the output data rate in that case.
Though, the MODE pin state can indeed be read from a register. Same for DCLK pin
I/O direction and DCLK mode. They are also readable from device's registers.
So, that would be 4 fewer dt props total. Well, yeah, if the device is not
connected to an SPI host (pin control mode) then we can't read those. There are
no plans for supporting this device outside an SPI bus, but we would then
need these properties (or a separate binding). Not sure what to do here. 
Do I drop or keep adi,asrc-mode?

The MODE pin is sampled only when the AD4134 is powered on so I don't think we
would benefit from having a GPIO connected to that (if we keep a property to
describe the MODE pin state).

> 
> > +    enum: [ high, low ]
> > +    default: low

Thanks,
Marcelo
