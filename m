Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0C42F069D
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 10:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567621; cv=none; b=BvtxnWWnQTZwQiAYQge92ZUw3xsMO4XVnUt/F9MKxdSE5hQKTxe4zGJbJLIFKu6XDdYgVsxmoB0/cur5uo6zQdTtAvOd2ZO32SNLnoQ3xMH4C10Q3Jt4ofx+nvpVb+fJ/MhRnpHDU+zq1AHMkaPYnl1M/qnIPk/DPcdnIiwVoC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567621; c=relaxed/simple;
	bh=aWQNwrGhLrvNTQcedUnw5Zv25r/4ZU4XEGrfG6DmwE8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0/amiNvoTIY/QbTkebzFeyQARV2USvbWHahdeFMIZh2kxF5m9dwfX16+pmCNwjino8tLkz2D4rv8nHmy3jLc/UQ5jFoOPBJA/kRLd6ukEh+8HtadlmVS7x/Juo07nlPDs1fgmckOLwaEk7FF9fTQsEmIgdrTRcNVC7fGpQIP3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lf02ons9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lf02ons9"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490aebf33e9so2736055e9.3
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 03:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780567619; x=1781172419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SNSiTxO5U+OGmSsX5QsPHvILMfiW6g2hJB0TI+2zqrs=;
        b=lf02ons9EPlxYHI8acFUzS9EKkvjAwyd7l9jN69qEXMAUVpyPxuiiR1NFZEmULEqQh
         afc/eNmeeULukc7MiGLpKM7BjbYnGOiQygoa4hzCxB46POrftHMuq0Z9rIV9MU5nFhiA
         1YzPDXqw2/tWz+WmpkyBmNqMvtnuntxwEyEFW/HtokTu1pFdGutddJoY7yTnlV5d4aEf
         ePE0fO0adgpjngIJZqVgmaYrr01yjj+BParMG9q5DIy0X0dQyK5SXP0pvFo2WSYaaQ0p
         gI7YeHGv3yVROA+w6oP7cTC0wlU9Z46d6OGHr9L0ZqDbk0rqLqx8zDQ2ji7NuZ0xxe0P
         4oCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780567619; x=1781172419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNSiTxO5U+OGmSsX5QsPHvILMfiW6g2hJB0TI+2zqrs=;
        b=Xjukq3FBhhAvUoqx1SebvsS9FfH0K+bE2RpqLQWxzmiiK6BoA+pI1jesQuhL2AQABe
         lY/fxDFkIIQcDlfgQxH2w5F4EeZdK8/x9aANUOWN4DdsFvhKEGeI1pk9r0Cn7DhQr1aC
         +ds7F0prUVWeHM5LUPlS9IjrtrkAvfIjGXFq9k2/2WnSMLXOCC2/DSoupNJpId/K8bK6
         HBzp0INCnpBh8QCw43UEQIIR/Es7DzdDrs8ICDuw0ah+0SsxnXgUTVlcQBwSD6H7Nlzx
         f2Ovmh1QPx5CdDWV23zOLayZUmI3MK8Hj9B/YXE3LkTjhCo2d8JmGBp03RsJCiteA/Tm
         c7Yg==
X-Forwarded-Encrypted: i=1; AFNElJ+C3yqIjGQgRkq9wbTxN3ElskKw5wqBd/YYXP8FKVFrTWleCdUuv5NePyWw6jyqNfRIvgqgZxOfB8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxGGgZ6bQXXbewVwQceIpFvNKpiqpgd8crbiu3IzJPI6kTJozX
	18qKLKqJqO4F/JlLIwL6YeQtX94DTc0AESJfLgsJughOnNRjZC4ba5Yh
X-Gm-Gg: Acq92OFZ9TYWcaRCkgDVvMpGk+DfzRLsa96hNbO//wAcFQoG80/UvH7TiDhKASInUo7
	uq/S5RsyD/2XG5Ekb20BPpXiKa7DaFUbaqqoYktBtHiGSwZTlnhJV5bSoIw3hGx4ovwyZGvgeMq
	PEhzlPvIuGw9CZJjQO5MUGMLANKx+f5PgJj4W2PIBkIDJl2BGheb2cSGd8KGTasKllBGaT51ZJ+
	gl/Er8LhsZ3NQwVbeWSm8DfLQggbZ6RqBA5NdJUU6M4z9gysgec75KV+GlbdHICHCYhULduv513
	2O9a2hZPHYVnbf6Z3lWz7uFXLAnRNm7Vw0CJkYV1r+wU7WsGlrA77lupglQ/j3QCEbj4ZSdXo9B
	bj9SGxJLARrJBrdDSXysTYBNmnmxcJZbYXCoOhec8n5XAwakXBosnZGvuoya0/xUfkYAR89ZdG8
	JXANVKQOyFmsESX0wSNFV8l/vCsVUbLVl4etdMeYC/XDqi8f9XA0MmHXm8vv2IyDob0slwu4EBI
	8Nt/iy4JvJDUIoFQntGTYRcoAVIwfTyeghuaobCM1td/EJ5t4ttX2WjqHrx
X-Received: by 2002:a05:600c:4695:b0:490:bd1d:472a with SMTP id 5b1f17b1804b1-490bd1d4865mr44724635e9.15.1780567618417;
        Thu, 04 Jun 2026 03:06:58 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39eb04sm62966765e9.6.2026.06.04.03.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 03:06:57 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Thu, 4 Jun 2026 11:06:55 +0100
To: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux@analog.com
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v16 03/14] lib: vsprintf: use _parse_integer() instead of
 _parse_integer_limit()
Message-ID: <a5nlyycxfhwpzczlmud3gjh5qxlugwkow4dyqhtgtjrzjf5q5x@mnmcic2da75r>
References: <20260604-adf41513-iio-driver-v16-0-1a7d09143bc2@analog.com>
 <20260604-adf41513-iio-driver-v16-3-1a7d09143bc2@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-adf41513-iio-driver-v16-3-1a7d09143bc2@analog.com>

On 26/06/04 10:58AM, Rodrigo Alencar via B4 Relay wrote:
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Use _parse_integer() that allows optional arguments to be explicitly
> initialised.

...

> diff --git a/lib/kstrtox.h b/lib/kstrtox.h
> index 00cf3255bdd2..ff84fe434a00 100644
> --- a/lib/kstrtox.h
> +++ b/lib/kstrtox.h
> @@ -12,6 +12,9 @@ unsigned int _parse_integer_limit(const char *s, unsigned int base, unsigned lon
>  #define _parse_integer0(s, base, res, ...)						\
>  	_parse_integer_limit(s, base, res, INT_MAX)

removed the semicolon here...

>  
> +#define _parse_integer1(s, base, res, max_chars, ...)					\
> +	_parse_integer_limit(s, base, res, max_chars)

and here, as per sashiko's feedback:
https://sashiko.dev/#/patchset/20260602203706.103449-1-andriy.shevchenko%40linux.intel.com?part=1
https://sashiko.dev/#/patchset/20260602203706.103449-1-andriy.shevchenko%40linux.intel.com?part=2

> +
>  #define _parse_integer(s, base, res, ...)						\
>  	CONCATENATE(_parse_integer, COUNT_ARGS(__VA_ARGS__))(s, base, res, __VA_ARGS__)

-- 
Kind regards,

Rodrigo Alencar
