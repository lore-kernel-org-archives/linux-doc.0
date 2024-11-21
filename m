Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A6014387B
	for <linux-doc@vger.kernel.org>; Thu, 21 Nov 2024 17:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732209582; cv=none; b=HH+eI04MiQq8IQMCAYCMaZm4SKKYrm+3wPSfMyse1zo1bVdeUjHMLXeXZPYbJWjy4AYTh3kWK9evV2pPZJPhoBkTDoeys4z2SccJPL/Jt57Eo6yyqGSW6iVspztIWkBIJe06GFD8ckAFS+0F14iMp9zMfjAx+qdYMXYJ6ScE580=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732209582; c=relaxed/simple;
	bh=n8Wo1iQ52Aw1E64TSb6ntmmEig/Iw/KhYEDmtwYBRLA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVTG5xXukdT6VGSF3L9wLjE5RakoRkYUy0omhlFJI40Tauaayg1BxKFhDB8T6tEE6lzy1CiaqF2XjdRMQ4x4gBg6Q7byQGkHeX/5iMUTatuzSd6eULM+jtT5ZBvW9jjeqLemmIvgOh78fitscl3Xu/mwJSY3N8nTaqISyjyyZhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=ENWjK1wT; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="ENWjK1wT"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5cffb4ff85eso1644063a12.2
        for <linux-doc@vger.kernel.org>; Thu, 21 Nov 2024 09:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1732209579; x=1732814379; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fik5fg6pZ4xpZXDrf0q8ORna4/F0UwRhMO+ozPaBmr8=;
        b=ENWjK1wT3eUfJkxbfMf4px8lL6ij0/oLqYz5HRxPXiVu5yhjRcWni2nH3GEQDUZBiT
         z+VZ322C0k3eoZWvVDNXsiTI8TH7wOmT1Fygk5haGl8ISL7EgR8oDEwa8Rv0VVg9M3y/
         DzRa6dtdTO5r6MH6KhVkU9KnJhtgTEhsx4u+gngQ6B8rVn28mGGH4r+Pe7NHUY3zldzy
         xSaAgBX0uPNWW1PVPqZDEsCNyZEjHQGGBYTe/FhT7k5PAJz0PwbKsjUxJVkB0AO5oApF
         TVZkPm04GhT2lyLuO8jBxXH9F35tiggUihGUIr/elSkokSn1hlDsXNUmqQbbRmuPQyou
         9Evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732209579; x=1732814379;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fik5fg6pZ4xpZXDrf0q8ORna4/F0UwRhMO+ozPaBmr8=;
        b=C3ROlASnUE7u46jtRvBASW4kAvRzwVIqocUzuFZMQp4o9vaWUtbSy6NtVSaYpUamYp
         E30Lac0OgQNy7J+l6xOpKeQTR+A06qBqcafRz8MdLlcv3OVD2PAvYbj9I+Kh4XLTRhCT
         plDOfKhqgqxgCxy70uON5K9S8BNTe8BPZ9JT/rR/bKGMJKApG+4dE/wxEVry86dDDY5U
         Q1Aoj5bWBiVzwAt9XnNvQQgtvej35g5sTnzgkZNI02QqBJSi9BjTk/WmmOHLaKzYhN/+
         75u8ms7zz3utKEAr/R5GP4LK2KZGZGq5sRrpKo+NA99UnvI+TcP8DWq4r388JQ3qeShw
         8e/g==
X-Forwarded-Encrypted: i=1; AJvYcCU72XRA7Wk7sWFZiHq0Lkgq5KPDCCWriEuzsNna8D+18qMMQFbsZDxaE4JiizROdoYeSTEJc7tOYoI=@vger.kernel.org
X-Gm-Message-State: AOJu0YykaZwqbQzFxpWbPeGFjst+Rax9zbc6MOn6rzANPhe0A7gJ1lS+
	t8kpg9RDMoODb/EfgLQ33w8aPj05WXWkjVxLFvO4gIij23iPZrqMXrb36/9yMVn/kfsZITScoIH
	lB/BEpNHj6/yHEZ2KYsi+16nMuia+Zm/XkO8dKAye357UtVFYG7dOphG0KLIZxgVeaM3K0/tlgQ
	me83/sbKO95NboU1kIeZdowTw=
X-Gm-Gg: ASbGncsFG5X+Ge32Yu+GFM5ht6bKcaC7nrgc2sIv5pPgwf6+aA9JNg7rzs7XlKBsZfx
	11Dot8CRRCFbiRz+XG4zy9CIT1jnrmnKuOWDnWC3IROv3plB/Ipm26YHYSIrBeosbhst33KljM5
	p7YQcYvWapzpGJoI38oUSKLTtwqVUZE+IqBmC7sTr6pLScIzk1LxvHKEi4hEsNGR1ES62eqsnH7
	PAdaH++W3B7VraNnDeBrSJJuXmmhHaqjZTmyC0/vYMiiuceU4itPmyTDRS+Rb/+Ek3DKi1uCQfS
	vwlzCmwKOjz/xJHwQg==
X-Google-Smtp-Source: AGHT+IEgydldMZZK3DL67PowCK6G04XlplMKaFxYYjgxXS8/yAqD7Uv47pTRRe/rOwuReXnCnuRW8w==
X-Received: by 2002:a17:907:97c9:b0:a9a:e0b8:5b7c with SMTP id a640c23a62f3a-aa4dd52c717mr743373966b.7.1732209578751;
        Thu, 21 Nov 2024 09:19:38 -0800 (PST)
Received: from admins-Air ([2a02:810d:aec0:2a54:6de0:d3b6:653b:5260])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa4f42d48dfsm102526666b.106.2024.11.21.09.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 09:19:38 -0800 (PST)
Date: Thu, 21 Nov 2024 18:19:36 +0100
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 3/3] leds: Add LED1202 I2C driver
Message-ID: <Zz9rqJ4CXENy7wZm@admins-Air>
References: <20241118145449.7370-1-vicentiu.galanopulo@remote-tech.co.uk>
 <20241118145449.7370-4-vicentiu.galanopulo@remote-tech.co.uk>
 <f6620b99-aabe-4b76-8a60-deae0a9042ae@wanadoo.fr>
 <Zz9pZsQEM29dLu7k@admins-Air>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zz9pZsQEM29dLu7k@admins-Air>

On Thu, Nov 21, 2024 at 06:10:00PM +0100, Vicentiu Galanopulo wrote:
> On Mon, Nov 18, 2024 at 09:13:32PM +0100, Christophe JAILLET wrote:
> > Le 18/11/2024 à 15:54, Vicentiu Galanopulo a écrit :
> > > The output current can be adjusted separately for each channel by 8-bit
> > > analog (current sink input) and 12-bit digital (PWM) dimming control. The
> > > LED1202 implements 12 low-side current generators with independent dimming
> > > control.
> > > Internal volatile memory allows the user to store up to 8 different patterns,
> > > each pattern is a particular output configuration in terms of PWM
> > > duty-cycle (on 4096 steps). Analog dimming (on 256 steps) is per channel but
> > > common to all patterns. Each device tree LED node will have a corresponding
> > > entry in /sys/class/leds with the label name. The brightness property
> > > corresponds to the per channel analog dimming, while the patterns[1-8] to the
> > > PWM dimming control.
> > > 
> > > Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
> > ...

Sorry for resending this, I pasted wrong in the previous one and didn't notice


> > > +{
> > > +	return value/ST1202_MILLIS_PATTERN_DUR_MIN - 1;
> > 
> > Can value be 0?
> > If yes, should the return value be clamped?
> 
 No, it's called in st1202_duration_pattern_write, which is mostly a wrapper,
 called in 2 places:
 line 225: ret = st1202_duration_pattern_write(chip, patt, ST1202_MILLIS_PATTERN_DUR_MIN);
 line 258: ret = st1202_duration_pattern_write(chip, patt, pattern[patt].delta_t); 
 
 for line 258, I make sure in line 250:
                          if (pattern[patt].delta_t < ST1202_MILLIS_PATTERN_DUR_MIN ||
 				pattern[patt].delta_t > ST1202_MILLIS_PATTERN_DUR_MAX)
 			           return -EINVAL;
 that it respects the range provided by the datasheet and supported by the chip.
 
>  
> > 
> > Is it needed?
> > (There is no i2c_get_clientdata())
> 
 Indeed, not needed so removed.
> 
>  
> > > +
> > 
> > CJ
> 
 Thank you very much for thanking the time to review!
 
 Kindest regards,
 Vicentiu
