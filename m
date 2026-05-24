Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A691096F
	for <linux-doc@vger.kernel.org>; Sun, 24 May 2026 12:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779626050; cv=none; b=lmEEIa7p8u/h3RwWllH4DsXSbuqhrQ488ZbH69T9CfwfYH4jFWEmhC7ku4+mJ1kurWRrcyAOQIqi9uwyuf2zFl98kSZvrwN+dyrpXGwZbmWxhOBn43W+b871sP46/N6q5JA79wMJFpqtfEyc4Yqr2Urr4imz0323dRyfLWvRxSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779626050; c=relaxed/simple;
	bh=TgUpGivXcE3GRCOQlilyqcL7kMANFeoNnbkUPXeXmfg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqwmkJWIYcGMxXBgswl/OfMQhBnrTxcc9oob8n7UtXoydU/E9uuKKgyZJsBbnnUFjXmKUv/Qz2/6TETxSg8LfEi36Sp2yi30WltSIj/WdhrMYkWoeXYgQpAgPgEja061as7HZ6a0GPsXmGd5JohiACYWBRU7XY6P3smVnXVwI8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9yB55lQ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9yB55lQ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-449de065cb3so8469705f8f.2
        for <linux-doc@vger.kernel.org>; Sun, 24 May 2026 05:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779626047; x=1780230847; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rumEFGIwDr9KysmkiLP4Vdo1+miQl17NpJh6CDjKv/w=;
        b=l9yB55lQ4rGPq2pU8r2IOUyIKStieMc2WGI0149aJcqBaZH7Ks3ILTMcEBYIlqoM80
         V9ZGCZcNaTiSlQ5pi8Wjmm7WFqy7fMu7bivw/bQf6UFe5fK45p0UKTO1XP4mp3LdFYGZ
         1dDBZZzwzhyCHJIqAFtaivh5xdRbFu+KovjO4esq4V5FVlMslhq+UAdFAB/btnuJCW5T
         01TIkcvVTBT7LUjqp63oDaeSGRR4cjZYQvAE/gqRx3dhVltSVc9rKxrlmnZ3T2fJHqH1
         gsarW7+RU/phjQtDYPUE0Wz2YO47sgh+guszQ1ekyy2FbnXpsSpqze2Kj4ageqqtgO/4
         gFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779626047; x=1780230847;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rumEFGIwDr9KysmkiLP4Vdo1+miQl17NpJh6CDjKv/w=;
        b=dpZm7hLRYEuri58WZRmUPtUbK2bqtEF4zD9l0+t8HipItpcXOqYCtLPeLrmIUUTwJ4
         G8iy6XRMXU/qWGT/JebcuJAoJCJ8Rj3ML03ogfFLbI0HuwYbUeGqTwVwJRbyNVb+TW3K
         NBlkvLQQ4DfhV/KI93YivfeleZugIpxEqT3K9ikx2B1P9AvXb9KxvwnrvH+Xb/llyLY8
         FpbDQeSUqsQCza0phKf/RMJ7pnxJ7TCHSNY+23aDqAmgQnXDLENi4SDC8v/yb28gc8+G
         QQDOyemeEf1ew/WNJlWegK9iYGyi5jJdD9xw2znp0H3o26ZEltKz+fCctIpppU9ws/7Z
         pYiA==
X-Forwarded-Encrypted: i=1; AFNElJ99BvSrUfqHI1j98unzwwVDC1au0nVQUc+dUeWIR5RQAdTpWbPjyY4sFVluLuN0Egc0ihEN3dIuTms=@vger.kernel.org
X-Gm-Message-State: AOJu0YwODHkE77CJuU6RFBpzkR71zuWNCNfQogROyibcAwLYUuwvPrRE
	T5qhH5fHv6/mS+LnwTdOYsSXnBobz5kAgAOVJ0wpmZ7YR1WZtfIR8I15
X-Gm-Gg: Acq92OES8NWbDaJsLnZhHz/SMnZnt5mLZjnv/3SaCLh/OhPO2EOonqxgq+7L9aByTGo
	hR5oym9vGThfJ7x1DMTraN7Ux3DQAdoIanKzF6v0gOBCCwGf9v5xW5XNIqZ1nHUsEC38Y3DL8u6
	x3lxjAiFJqwEd+IWPwgtAWWsyH2nziawdUXXBdXgT2kWlGLH/CDyJ8yv39RxLMpsDfQuhNfs/gH
	JtPjMv7KpdO3kpClae3GTe/9UKDUQeHhoEshrI/7/hROH8CyTuupgi3MXydE/z9yQPrAGGKwW6L
	cJqPbs6Xwk6Ma5IVIISSn0G+HSI6/nN7vMO9D6qupdXl/Iy38TRh/VWh03QtsimCwcv0VLMS4Ko
	SXADTwtz7f6+AzqlwIHbuDHbdGM6peAsmjQBxsLLtLkumtS40MJwrQfVRzRaSjVgAubJESARJCx
	GHr8NTbyfqnML677pnbnnFXgwUVJKu3G9TUvvEoh16vlaq/g4q9DYblpbIMmsKp+sxSj7N5Gwjs
	lRprmKOhJG9RCMsVAhyswMuGZVH1lzYS68EG+g46HWM0skdDEjIeIKtreUr
X-Received: by 2002:a05:6000:401e:b0:45d:4b37:7fcf with SMTP id ffacd0b85a97d-45eb367fac4mr18390928f8f.15.1779626046881;
        Sun, 24 May 2026 05:34:06 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d64eb1sm21538521f8f.32.2026.05.24.05.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 05:34:06 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Sun, 24 May 2026 13:34:04 +0100
To: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v14 08/12] iio: frequency: adf41513: driver implementation
Message-ID: <tx7rb3nq6xpggfxnihkn42c57yrkqusib5nsyncfwwdgx7zkrz@zz7l2kc6lkfv>
References: <20260524-adf41513-iio-driver-v14-0-06824d9c15f4@analog.com>
 <20260524-adf41513-iio-driver-v14-8-06824d9c15f4@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260524-adf41513-iio-driver-v14-8-06824d9c15f4@analog.com>

On 26/05/24 11:12AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The driver fails to restore the hardware register state during pm_resume if the device was placed in a software power-down state, leading to power leaks and cache corruption.
> --
> 
> commit 829389d24bcc81427dbc259466ce431d38418a05
> Author: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> iio: frequency: adf41513: driver implementation
> 
> This commit introduces a new driver for the Analog Devices ADF41513 PLL
> Frequency Synthesizer. It supports Integer-N and fractional-N synthesis
> modes, high-resolution frequency calculations, IIO debugfs interface,
> and power management.
> 
> > diff --git a/drivers/iio/frequency/adf41513.c b/drivers/iio/frequency/adf41513.c
> > new file mode 100644
> > index 0000000000000..6f952ccc675e0
> > --- /dev/null
> > +++ b/drivers/iio/frequency/adf41513.c
> [ ... ]
> > +static int adf41513_pm_resume(struct device *dev)
> > +{
> > +	struct adf41513_state *st = dev_get_drvdata(dev);
> > +
> > +	guard(mutex)(&st->lock);
> > +	if (st->powerdown)
> > +		return 0; /* nothing to do */
> 
> [Severity: High]
> Does returning early here when the device is in software power-down fail to
> restore the hardware register state?
> 
> If the system loses power to the device during suspend, the hardware
> registers will reset to their Power-On Reset defaults.
> 
> By returning immediately without writing any state to the hardware, won't
> the hardware wake up in an unconfigured state rather than the requested
> power-down state?
> 
> Additionally, the software cache regs_hw is not invalidated and still
> holds the pre-suspend values. If a parameter is subsequently modified,
> the sync function uses ADF41513_SYNC_DIFF and skips writing unmodified
> registers since they falsely appear up-to-date in regs_hw.
> 
> Could this leave the hardware permanently in a corrupted mixed state of
> reset defaults and newly written values?

This is a similar concern raised before. Any resume path will program
all the registers, which is essentially a power-up sequence. Partial
writes could happen, but they would not be important.

> > +
> > +	return adf41513_resume(st);
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260524-adf41513-iio-driver-v14-0-06824d9c15f4@analog.com?part=8

-- 
Kind regards,

Rodrigo Alencar
