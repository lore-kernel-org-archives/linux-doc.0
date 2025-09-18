Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C750A2D47F9
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 19:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758223947; cv=none; b=VzF6MGevcjCn1Ey5QCqRjsUhpbaAbdQF8HeFdNXDEP4xKIR/+Rp9JcoMHyFvW8zDeww7FASSJwt0LsXYYl6/DK4Zzr1Z9CP9U2zk8mPGuD7wNsXH9oqVWRWh5wPcJDj7MzAEFUXvbWRcDaKvxJq3Epu6Vad1Ag9YvLwpQhW7a3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758223947; c=relaxed/simple;
	bh=qivYkST2C7b7yAkJHzipE9NJQefbbXWWzWHSNDOD73w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oN9zFKOeR3VD9NwTraDLTtuqCHLbQX1Ek5MqMhBBJt1xhD1HId1JIytAqCO1y8PZvxJDarILA5BveBqe0w7i0/MRcU6GneLA0iFXOm8YvuOOki/7G0w/9Yg3zCSwlbTa59hDJA3VXccVM+RqZ6b1XxbxHkQop615xF6v3gRVRAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Ih3qsp01; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ih3qsp01"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-3357b8aeddaso2010044fac.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 12:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758223945; x=1758828745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8uC46HYcJYoz9+sBv/kVNcz3yRxRfTKz6LdiKNeN6Wo=;
        b=Ih3qsp01kdSLJ2q/2QwIxMJN0GL/kcgzGrUyckPu227ZjWJJL6W5yap9lRy34m11MB
         vGh3SJARh2b92Ugt2v4SFw9IZmd+529d+jyiTZpZeRJdPCTrBy88Meg9O0cOaww1R6Qh
         chRmJ9UYbcR/ZXARIo7Jk9E27jp4RBVgBWQz6Cmz9V/bJmYHlffS7Q2xZsMdoY/5ub0+
         kvPCv7ecBYr5MId493prXKdRR7MtW70zR3yfDi5WP+6JiVNJE1g/+8kM7BZzsfB4vSyZ
         V+OYmP/VIUhL9oznThYpmBe5OHyFZ6Ryd4pRfqhZm21ILSWP54hW++EyF0Nv5dZcAeic
         ERrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758223945; x=1758828745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8uC46HYcJYoz9+sBv/kVNcz3yRxRfTKz6LdiKNeN6Wo=;
        b=ZRMfrj5yYziYcXwhXNyyuxX3hQvqC+5FnGAMkF2JDD46GMbAb5r9S9KFmZuGC04OlE
         eepcNOuYHnmsoPQGrtKcIhWRJbkqpVIMvbjff/JXgJvGo2Vyhyx93rs88jxXtvXTpwkN
         eX4lPCpfV0v3pHenltyb0mQXvx/c+RGqf4HBCUueNat439wGTtR3FKPIqRv+NTW56OG7
         mq5X2j621vRCMeVEmXXoN9kkK0rav78X44od+WcPsPYFiywH9iK7Baz2v3W2hn4PAvGm
         H5OJnZ5i7XX8k9I0r1/syLjhOiFcLOQZRa/SOR0Krfuifz+kOn2AdWxQNVmy0KuIBpxU
         S8vw==
X-Forwarded-Encrypted: i=1; AJvYcCXSBhNCSKP/y84yxveHCaN0R7fym9TplED2KkH9GVDfGf5EtYW5GJdOJgu+PS/UQBKdrfsNkGizZb4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx+G2J8NNd8ujGtWhmVMPnIR+K2gQOrAuSh9pXZoJoLFf5G944
	DODuYg5yHeeYzwdCujR11BbB8Nf7gxcX4lJCcM1B5F62gcHX823LveT/4jplGO6FxbQ=
X-Gm-Gg: ASbGncuJo51gYc2k+rFIRFWEwwvUIugqS+7Nki0daBrJch0CgnGzudprk1P64oX9a2N
	fh9jFUKc3oR7dZ1eVOEmBldyieD4o/5OPKipcUJY7L67y9Z2blWxfpVeGUvGtzuRJLii8WzpH6p
	nlVdHOKJI1fWWAG3ZWr7O5tPYpLVcNus69kcZBP6DJoEz9xsAOgXf1WC//Ti0T5J+Tz6E0w8uB/
	nhWfNLc6n4ZuFmHr6fFyIFC2pm5WXFBNed6u25JT99ubd1DvutfcolzVVeyTtnc1ictbpqTlpE+
	YSTf+ob2iboBPM/bYpPGvQJb/8RwzMXGUNHac4R99lKFzyNSH069YnDg2Rdky6ewEEBzv4dh7yv
	kyUSanuHAx4+sBzC7rIBgZhkdZ2DU2p3at0LgVZGkFnS8WuLlfDXgPWCw2C0/ZL9FylffmXFuk/
	c9rLksKGP6/+keg7fGWg==
X-Google-Smtp-Source: AGHT+IERFs5Dq//LaVtzyCCdTNAhiZ4f4o05CjfcgmjDwNiiOFdseuqJHqY+PhbFovbfmMpCoV8JxQ==
X-Received: by 2002:a05:6808:f94:b0:437:e3ab:fa02 with SMTP id 5614622812f47-43d6c24f008mr346527b6e.26.1758223944929;
        Thu, 18 Sep 2025 12:32:24 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:55b7:b662:4c5b:a28e? ([2600:8803:e7e4:1d00:55b7:b662:4c5b:a28e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43d5c6bcb8asm1132156b6e.8.2025.09.18.12.32.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 12:32:24 -0700 (PDT)
Message-ID: <280f7145-8800-4f50-b316-3a604150a980@baylibre.com>
Date: Thu, 18 Sep 2025 14:32:23 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] iio: adc: ad4030: Fix _scale value for common-mode
 channels
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, michael.hennerich@analog.com, nuno.sa@analog.com,
 eblanc@baylibre.com, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, corbet@lwn.net, marcelo.schmitt1@gmail.com
References: <cover.1758214628.git.marcelo.schmitt@analog.com>
 <b05f763506fdecf0d21a53dde82355418d6fb915.1758214628.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <b05f763506fdecf0d21a53dde82355418d6fb915.1758214628.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/18/25 12:37 PM, Marcelo Schmitt wrote:
> Previously, the driver always used the amount of precision bits of
> differential input channels to provide the scale to mV. Though,
> differential and common-mode voltage channels have different amount of
> precision bits and the correct number of precision bits must be considered
> to get to a proper mV scale factor for each one. Use channel specific
> number of precision bits to provide the correct scale value for each
> channel.
> 
> Fixes: de67f28abe58 ("iio: adc: ad4030: check scan_type for error")
> Fixes: 949abd1ca5a4 ("iio: adc: ad4030: add averaging support")
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

