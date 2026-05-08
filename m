Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7B3351C20
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 13:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778248245; cv=none; b=XY6sx/HnGMuCGp0Vwwv0el0vEp2j890OLDMMuX+IcuPca1nMCr5bCS7Uu6n3i/WdNj4hKMlxrTcMzOhJNYlDJqGAILmpmKakbKkf5An7VafKSHuRBlfBN1/cHrBCxT+v3PFx6vVH/ve5cHoo8evI+4haqOWohiaJrLiSkequDQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778248245; c=relaxed/simple;
	bh=/DW9ChJ+Z4lvrI/8m+Gj6NNDh8t2JT26OuVxVi091XM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stSBx3hL8AAnkiILh61bURQv8lnZGjePd95x5RHLi9fpN4j4bVOzbVz6H8jFfEIFHssuJLlcydTk8coeUV6g7vRp96qq3MoXgrL9iTg3U0j1LAEbyjj8lbUQ0gJf2jg4AbNfJEnCkSk4EwEQk7TGt+MNbH/5w7Mlbm/90Y+Du4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHPxm/4p; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHPxm/4p"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d7e23defbso1222673f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 08 May 2026 06:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778248243; x=1778853043; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NHRSS+oWN6kCe7LyNpMRwfm45OI0qk2PQL4/WD6qye0=;
        b=BHPxm/4pS4YovEdzHEHLVKHBImFvDhZ1oyMnUatu+PEv0Spif1inby1u27Smy5CCUn
         stxKS0zYBstWwwjDaFXgCtVydU/hXRblaVgmiAjKNOGtPgsOW1wjL+El/YfcBVcLA7pv
         AqiWDSIB4ZCos26/RFL1gYdCbgnQTi3VGcgxQabPavrFND1nzAUtC+KVB2/Ph+qyl4rQ
         AEJC2UAwG9gCHX9E+aRTafcNN6ky2+ZxW3s5Jk5log9VR59v/62b7Fnvx2kyiUAeG+Kn
         CZaANAo67HUXD6aAxA1eIdVR9wLqGMR1Dh9dBqmNj1ZtV3uCtcWjhJpWAn4z0nz2d9jC
         0EqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778248243; x=1778853043;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NHRSS+oWN6kCe7LyNpMRwfm45OI0qk2PQL4/WD6qye0=;
        b=YMWvCUbhuhCg7nvnt8zZAwNCB4IYw4/hGpdgFDMo1DNsWOrYy3+4XG5vKBKz/rxTy3
         KLmO1kgQ3wQToNfcfZxe13GPODZ7rHDXqpTovNlMv/z4xfgtlSAe1qgGVCPZJijJlpVG
         KKIO5uuiH2HCeDcmBrCobusEjHqtY/HQo0NAdq4ki6g3ytuA9T5j7xGLePhgyhwFdx2M
         HTuwPGdrcvwqaygfOcKlphTVoMYiUbxFbYQN36C0pHg1+d2kNmRVQpY6ar7nrRn61aQB
         2UNSF9ZWpHKHpl0KWtvZzPW8tGtP3W+71NbnwFNKD1mYKxcBeC5O8dl5UmAMbPChXOZX
         VqKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/dnla4RDfQXz6ZJ67isEu22IJToqW692VqIuTrJj/mlflD3bwPjN6riG7iV9WNGIWXF8CUJTuf8T0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLmFv6EUlATqfBrmhc5KFonDZRhykG19Rdc1xzMtgD23VKlKsQ
	eMSjBgb04AHEFcI9oqX9QNK+o4OGwrISOB+06s+36++b4pN8YcYHGHe7
X-Gm-Gg: Acq92OFWOfwX5UgRQHiZG+IqzaFgI2l2BCmJejv4ZbbMdJTLVTfNosMy7fvY/eMO55c
	MbLcRme0RWrX9HzGEN/+wlBfDsCfuxKzsorrtxRs7PpOr6gLD38xlQ4cI+li05pxPJbp6yW9xS7
	j/YXDgZmjRP3enH1UJ2JNFFLz4Hn0TQ8VH4s3CSYZXzJCUUrv2vtOuJsSYuaN28Ym1iU3ocPrEY
	snBQa1NEPOVgZweHrpXk79DxLITjiE8Qyjq8C0bhZ3YiHsBAwPVU6njLPdjsUzluaIb5oK4jTXR
	MqkaBzStDhB2CFn+Akz/SyZu0+fxYtnn27AGFafn1K+as/yxoLHudWNsktyIC08y2sElW6WUu2c
	2yI1ZxFBmnKVmbuMBFOqtqciPE2vrxjmXJwSnhI2TnrJq0teU9I9xORh2neQVd15ODuw/2Z/MbL
	wExOSlGQG7XuT9LEdrQHu/g6pbICLEMxrHa5Huubsf2oPfunOiYT0FpkTtqGGpKRng1qNGRvV9j
	EKDCNlemXpyW87IN+BFBexImYcdivUAe8v1o+3Bbha0V+8YR3GGTy7qYNmY
X-Received: by 2002:a05:6000:2882:b0:452:c246:ab7a with SMTP id ffacd0b85a97d-452c246ac5cmr13022901f8f.14.1778248242599;
        Fri, 08 May 2026 06:50:42 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491bae13csm4657716f8f.29.2026.05.08.06.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:50:41 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Fri, 8 May 2026 14:50:37 +0100
To: Jonathan Cameron <jic23@kernel.org>, 
	Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Janani Sunil <jan.sun97@gmail.com>, 
	rodrigo.alencar@analog.com
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: dac: Add AD5529R
Message-ID: <zh7iqytpkrfonxv4mup5fcyo7z2ymnizobdu5smxevax2isge6@zug2y6e7rdj5>
References: <20260508-ad5529r-driver-v2-0-e315441685d7@analog.com>
 <20260508-ad5529r-driver-v2-1-e315441685d7@analog.com>
 <20260508134843.7646c4f5@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260508134843.7646c4f5@jic23-huawei>

On 26/05/08 01:48PM, Jonathan Cameron wrote:
> On Fri, 8 May 2026 13:55:47 +0200
> Janani Sunil <janani.sunil@analog.com> wrote:

...

> > +  Specifications:
> > +  * 16 independent 12-bit or 16-bit DAC channels
> > +  * Independently programmable output ranges: 0V to 5V, 0V to 10V, 0V to 20V,
> > +    0V to 40V, ±5V, ±10V, ±15V, and ±20V
> > +  * The device supports SPI communication with Mode 0 and Mode 3.
> > +  * 4.096V precision reference, 12ppm/°C maximum
> > +  * Built-in function generation: Toggle, Sinusoidal Dither, and Ramp waveforms
> 
> Interesting - so this is a DDS, be it a simple one. +CC Rodrigo who has been
> wrestling with one of those recently.  Rodrigo, can you take a look at this
> driver and see if it fits in the ABI etc you've been hammering out? Thanks!

I am not sure how this is a DDS as it does really generate frequencies, so it does
not seem to act as an oscillator. I'd say the minimum for a DDS is an NCO + DAC.
The function generation seem to act only on the voltage levels. There is the step
size and ramp limits configuration that are similar to a DDS with a digital ramp
generator. I suppose that users have some use cases that are often integrated into
the products so they can do less (and the overall system becomes more efficient).
However, those products end up solving too many problems at once and they get too
complex!

-- 
Kind regards,

Rodrigo Alencar
