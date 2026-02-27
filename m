Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B62942E007
	for <linux-doc@vger.kernel.org>; Fri, 27 Feb 2026 17:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772213516; cv=none; b=XlwBfyrTW/SyImwiS1BIk8JLkAJbudT9EfflERNKi/jWVBHe9DY5fZuz9yuprQHPHRCPEyB8fMtfEl5B3izQeYHTZ+6fI5GyDObfu474damRs4UZNdBt2y/89oOS9cI32tvNkMWcAu27EALlzFxk/52PaReR32JvECCYDwuq+9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772213516; c=relaxed/simple;
	bh=jw/s/pmKWEhmoD7t7aQ+CtY5TN0SN7m0nJ9Xg6Tkuv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+IHpQ9kvusgpDdoR18NoF3UWVmAgcRytYLOu+HyMimgxmsp/GHuPHw+5h0DclZ8JMaSRIW/6oWoK8fEk0d39XHdFOjc3UyIRG/32ZkgrHIK3jXE7HhhcppDnFQ4mVDhkr5SSRIrDWdvMQnN0zgiujVeTDDl1q9m/xGsz4Essls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPsZpIvX; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPsZpIvX"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5688b9e4e80so2269010e0c.1
        for <linux-doc@vger.kernel.org>; Fri, 27 Feb 2026 09:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772213514; x=1772818314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JAky2kCQVWEtl6VMaguRiQZeQV4DBOQjkcY8czVQl0k=;
        b=hPsZpIvXs+no3Q3jFavWMAqAEVmf5kwJBM0y+K2GzdqLQK7gRR620xWTVBmyvM6PlP
         9PwugSCz9PAlrtF/Lhlv6lv3Pcr9E6Z+kT2dKyMSi+3Tj5y9I/HEQnFEM0h14wbK8EBM
         OhnMu5KYX5s8XhME/+FZMTR+h/0Q0I0PfEDH/+BXlMd/VpTqWvH3Os6KL7m96ESEVWJz
         1anqJ+K+bgDSgWSzMmSKID3CJmLNAWGw0/WA1CHJTPsd0+zg5Ju3jcm/M+s4lWKHgbjp
         ARMZsjitBp9QlQjZoK8isBZs2cEoSh+MX/YlrW7QRbmqR/GzuxrKtYFDBXcl9cI5xM3b
         4V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772213514; x=1772818314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAky2kCQVWEtl6VMaguRiQZeQV4DBOQjkcY8czVQl0k=;
        b=c8KmDkncknnFl8dt04Zcysunj7NicFt0WDh/dZK/ouusiGJStO+EXg2XvHdjVDuTNb
         sbsXBi3T7frGgCCZiIYJLDnTH1HmLDjg35LfWFgKMbSTR0mlW9/vxuQQgrDBAosawm4Y
         ykR/Ut7IKqG2wWAfdSDfaYHKTCP/yl2y3skNz6XaCv8n6JH7kk2xC7ysRIHfNK9twtcm
         qTHr72FIQ0cnQNlRDm3lhyBc6XLGRHQT0LO9u/g+dxxqKV4PbB2nGV1B7UkCqiNfDrIA
         4KhoXU1AgMRt1PCJfE6pBmXdzXihCdgKfsNkE7i9/6kdh5/arNEXbInDCOHMXooOr5nK
         Ov+g==
X-Forwarded-Encrypted: i=1; AJvYcCUbsZLJxdKpGrXkb7CqAoK631cu+7Q7BiPwHf6CWenS02v/38cqIjmyhhudewco/RA1AD/llr+86A8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEc73bt20UnIzF1OU7OEnt5lFUnDK96L7hdI/IEMsAO1B/XsZX
	uNLNZ0vkPQlLL3wHsdeyN+fUrOlvbb/pYKcH6w7hM1buPft088YVFa9T
X-Gm-Gg: ATEYQzzVx1+3IFjKoxkX+cIyZbEHSNvwT4Lt4nHUW3VKJjJRsejVC5EemVP08hpKKsi
	xINaolp39VZQxfZvXgAR4eD84BM1QjLBQjjlTSbeRFglRRETuXLJb7/4aRLoXvbs9GQvn7vXumr
	kjvyX8DmJ47sR2xAchUprJADhoGvZVSrUFP99Um5Qc0F0qhuyWIUuyYYr4axJtkZJU6uAdvAmNO
	rLZFFnZXcvzyZuXI70GyOLkLyjoH2uNuvu0MF4cZdMz3UIU27HC0vhCHLOCGw/mOv2KZtlL5+WC
	0Uw0/zwmR90UsV+RhD4akrebdnA73H83o7XJzWXpC6nQEqwEzh1y0EjzBhzesa0Mxd+qaSpKVWu
	+M+z69PSz975xXFOEFjBd+yoRhnOWSWzpxokeSnVm/ulFzTeqkaiqANonTgFOFOYRrtC21gXL9Q
	twVsJ2766R9g1GGP2EbyLHuJe+HTjX6ONiRlmzYcYXhIMc6f3SvDReLnoXiMvUYqWpJdyXTuOaY
	yJuTUUUwz6EMd+6qhnn5Qd9ev+aoPV+9tKwp11UktSycABEvjLmJ0TSJutEvPq0afnNZNNe3k+A
	A0c1sar2ehe3ibi3Dxjj
X-Received: by 2002:a05:6122:e22b:b0:567:2200:a6d6 with SMTP id 71dfb90a1353d-56a90a01002mr3817218e0c.7.1772213514423;
        Fri, 27 Feb 2026 09:31:54 -0800 (PST)
Received: from ammar-VM2 (d66-222-145-193.abhsia.telus.net. [66.222.145.193])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449630a0sm46252201cf.6.2026.02.27.09.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 09:31:53 -0800 (PST)
Date: Fri, 27 Feb 2026 12:31:51 -0500
From: Ammar Mustafa <ammarmustafa34@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Alisa-Dariana Roman <alisa.roman@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Docs: iio: ad7191: Correct clock configuration
Message-ID: <aaHVB1lLuXIw3pwt@ammar-VM2>
References: <aaG6Rds7GAf9ZtF8@ammar-VM2>
 <aaHA8U3HrIbg8D46@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaHA8U3HrIbg8D46@ashevche-desk.local>

On Fri, Feb 27, 2026 at 06:06:09PM +0200, Andy Shevchenko wrote:
> On Fri, Feb 27, 2026 at 10:37:41AM -0500, Ammar Mustafa wrote:
> > Correct the ad7191 documentation to match the datasheet:
> > - Fix inverted CLKSEL pin logic: device should use external clock when low,
> >   internal CMOS/crystal when high.
> > - Correct CMOS-compatible clock pin from MCLK2 to MCLK1.
> 
> ...
> 
> > -- When CLKSEL pin is tied LOW: Uses internal 4.92MHz clock (no clock property
> > -  needed)
> > -- When CLKSEL pin is tied HIGH: Requires external clock source
> > +- When CLKSEL pin is tied LOW: Requires external clock source
> >    - Can be a crystal between MCLK1 and MCLK2 pins
> > -  - Or a CMOS-compatible clock driving MCLK2 pin
> > +  - Or a CMOS-compatible clock driving MCLK1 pin and MCLK2 left unconnected
> >    - Must specify the "clocks" property in device tree when using external clock
> > +- When CLKSEL pin is tied HIGH: Uses internal 4.92MHz clock (no clock property
> > +  needed)
> 
> Is it active-low or active-high pin?
> 
> ...
> 
> When I see such a confusion in the documentation I propose to replace HIGH/LOW
> to active/inactive or asserted/deasserted.
> 
> And no need to swap the entries.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
>

I haven't seen anything in the documentation to believe clksel is
active-low. I agree that assert/deassert would remove this confusion. I
can resend the patch with this change and without the swapped entries.

Thanks,

Ammar Mustafa

