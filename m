Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80AE3793DB
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 14:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647793; cv=none; b=sQNw4LyVtp8mld/JVlbYSvOJbAbYALRhOO8fBh8hzXg+cGOM/MkpELqzsZ1PVwry7s0XyxKBZrDtc7dHB4wG1HlqLsrYk72SdkavJZAHX+L+jV/aZY3Lg/2CFV7zlKrMK0hQ1iRu1qElt7OZSZBAUWCkJTUeVI/72HziDbRcfD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647793; c=relaxed/simple;
	bh=hp0VIwG+tZ4C/xAipi8SSeLZ0cZ7Avit/lMHmraD0wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KLU4pUdKgZ6e21Q7Nat1T5Rm5QTlAutvwQxFxTRoT0iC3jjrh60k0v/1mjMd643meCpP8eYdaGaVS5M8JM7n3OZQylvHVsYOjJeLEYpRHYqHVwfCR5jaNPuVu3E8wga12o7VhuxPX5GrVSlOQJ8ndlTDVUK8yvzXX95J6jhRiNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Er1I+l+i; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Er1I+l+i"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b7da62b487so1442019eec.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 06:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770647793; x=1771252593; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxW9LgCH07BdNp/H9r+dMXWuibZ85UcJq1iPgsYd5Oc=;
        b=Er1I+l+iJUM3BjJlVhftPTss6/TmesRIVac2Xmef6bX9T/tcv+tS2IMH8eNQjavIEP
         EBD1V/dfFcdgxWsKqsm40m/a8Z9G+/6g5ZbmkifWUYkXitnywRvrPj2QSugRDolFv3cz
         d2OI+VST7UFf4DguR0iHHBYx8o007jCZ8LhDjQLoaVzmAFAwO8rJNYIBcobeQZbupLaU
         LWt/XTg35I8EIgHLF92h7znOMP91zFCEeB/46ulWDFNv6ssmZXx4ZoTd9UL3Xi/6r6g1
         MXDV/Ni/AFrShuQbBKHGX14gnrwn09YW/N3aSeWr6aMsfgrJJH1cM3h2ufIo1Nf2YxGK
         u5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770647793; x=1771252593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZxW9LgCH07BdNp/H9r+dMXWuibZ85UcJq1iPgsYd5Oc=;
        b=hENlpbwbxqU22eqmeoGAyeL0J3eMizVwZv6chuccDLO1i0yzOSQqS9H6mSsP9jjFLj
         k69PjL9hTw9C0T/B051UlmBsGFHEXiMhGmIMou6/sLSfETRVnqYZ9gC53EwAzWxJkjr3
         QfKZOeeqLKrvEWVVn5S4r0DELGDAHgKrXVgGd3P3JWg0gj0qBonV2EwIbB7fa8K2/Odt
         7WV/eZMHlS6bV83qm15z/O91PhSO+BpVr4zIqLRX+SPdAy1iyWsC72d4YFAmZKtKd3S+
         BidyaYMLyEdnjYV+DcX8b8c5ypkqKeT0ZoZfS3t5gId1+03hpAJiYO2MOGIBupUrMPWK
         ErPg==
X-Forwarded-Encrypted: i=1; AJvYcCV8u6R7GQFzGZn/A5i1NUCJqQr5N1iJ+1DlDhcW1Ye8Fmf1kYj4tYDeysHA/tfS6yxW/2Zsg79/j/8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0H+6n/ZrkhfQCMf21vuZLjI9NZuIKHcGRgACfGV7O8Q1PYo4h
	eBBP53Qn9vCTlyxSn7vL4J02m8u+xYZU+RoZ4Z9qGKpebsbaiBzvFMDx
X-Gm-Gg: AZuq6aL3OZjCd0ptXRHR3Uk5PmZFL5J0z3QK1ZQGdm+rvguaVK7VT2wp5rHHOSVRiyw
	p1eL19LAjOXYnLlOD9n6TC/xjrz0XeHs4cNTLMCDo8Mw3G7EZwp02FiSeOCLFukQ1g1os4fmHiV
	RITEpCE6s6sre+8OlGZhwyeBuL+f8ZGhf04w10XaoD5JrdOzrIzeCWLMCeQFlhSht1+27LsOWVv
	07iqSuQISB62jVfN0PGCUMjBouv+QbDWbtt8/Jm38Kn4Vf4iK2OqKD6U0bI6Ar22Sl+K687G2/l
	PL5/PGG/fLfSmuoDpsZuJvMm7y5PFdGs20CX2UcxgZDC/yOZGRPFbgSVqB0MXTOwgM1j06S/noj
	8n2U35aHwj+6RpWxZDhUQ5upU/bHbrKtpNecTQCR5dWXSzHMQYaBNNuIKRtMHTADvCwtKiedSxI
	Izp9HUtLqfbFhjnkwsyaS8
X-Received: by 2002:a05:693c:2d84:b0:2b7:b41:bbeb with SMTP id 5a478bee46e88-2b856723b28mr5265050eec.43.1770647790912;
        Mon, 09 Feb 2026 06:36:30 -0800 (PST)
Received: from localhost ([2804:30c:163a:1300:9b68:dd2c:feb4:459b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba6517c316sm3778411eec.3.2026.02.09.06.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 06:36:29 -0800 (PST)
Date: Mon, 9 Feb 2026 11:36:57 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, jic23@kernel.org,
	michael.hennerich@analog.com, nuno.sa@analog.com,
	eblanc@baylibre.com, dlechner@baylibre.com, andy@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, Trevor Gamblin <tgamblin@baylibre.com>,
	Axel Haslam <ahaslam@baylibre.com>
Subject: Re: [PATCH v8 5/8] iio: adc: ad4030: Add SPI offload support
Message-ID: <aYnxCc1wv8MVfv2b@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1770403407.git.marcelo.schmitt@analog.com>
 <315c614e65e40634251e624d73d83fdea4c51c78.1770403407.git.marcelo.schmitt@analog.com>
 <aYiWA5ev2nPF8UxU@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYiWA5ev2nPF8UxU@smile.fi.intel.com>

On 02/08, Andy Shevchenko wrote:
> On Fri, Feb 06, 2026 at 04:01:33PM -0300, Marcelo Schmitt wrote:
> > AD4030 and similar ADCs can capture data at sample rates up to 2 mega
> > samples per second (MSPS). Not all SPI controllers are able to achieve such
> > high throughputs and even when the controller is fast enough to run
> > transfers at the required speed, it may be costly to the CPU to handle
> > transfer data at such high sample rates. Add SPI offload support for AD4030
> > and similar ADCs to enable data capture at maximum sample rates.
> 
> ...
> 
> > +static int ad4030_update_conversion_rate(struct ad4030_state *st,
> > +					 unsigned int freq_hz, unsigned int avg_log2)
> > +{
> > +	struct spi_offload_trigger_config *config = &st->offload_trigger_config;
> > +	unsigned int offload_period_ns, cnv_rate_hz;
> > +	struct pwm_waveform cnv_wf = { };
> > +	u64 target = AD4030_TCNVH_NS;
> > +	u64 offload_offset_ns;
> > +	int ret;
> > +
> > +	/*
> > +	 * When averaging/oversampling over N samples, we fire the offload
> > +	 * trigger once at every N pulses of the CNV signal. Conversely, the CNV
> > +	 * signal needs to be N times faster than the offload trigger. Take that
> > +	 * into account to correctly re-evaluate both the PWM waveform connected
> > +	 * to CNV and the SPI offload trigger.
> > +	 */
> > +	cnv_rate_hz = freq_hz << avg_log2;
> > +
> > +	cnv_wf.period_length_ns = DIV_ROUND_CLOSEST(NSEC_PER_SEC, cnv_rate_hz);
> 
> See below.
> 
> > +	/*
> > +	 * The datasheet lists a minimum time of 9.8 ns, but no maximum. If the
> > +	 * rounded PWM's value is less than 10, increase the target value by 10
> > +	 * and attempt to round the waveform again, until the value is at least
> > +	 * 10 ns. Use a separate variable to represent the target in case the
> > +	 * rounding is severe enough to keep putting the first few results under
> > +	 * the minimum 10ns condition checked by the while loop.
> > +	 */
> > +	do {
> > +		cnv_wf.duty_length_ns = target;
> > +		ret = pwm_round_waveform_might_sleep(st->cnv_trigger, &cnv_wf);
> > +		if (ret)
> > +			return ret;
> > +		target += AD4030_TCNVH_NS;
> > +	} while (cnv_wf.duty_length_ns < AD4030_TCNVH_NS);
> 
> Does the above have a side-effect on period_length_ns? If not, the below check
> should be moved up, otherwise here should be a short comment explaining the
> side-effect(s).

Yes, pwm_round_waveform_might_sleep() might round the period down. I'd add the
following comment to clarify that

	/*
	 * The CNV waveform period (period_length_ns) might get rounded down by
	 * pwm_round_waveform_might_sleep(). Check the resultant PWM period
	 * is not smaller than the minimum data conversion cycle time.
	 */
> > +	if (!in_range(cnv_wf.period_length_ns, AD4030_TCYC_NS, INT_MAX))
> > +		return -EINVAL;
> 

Best regards,
Marcelo
