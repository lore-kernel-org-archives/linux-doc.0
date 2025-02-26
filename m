Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F9221CA01
	for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2025 16:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740586484; cv=none; b=pXOeo5nHmHbkTq5EAS5urcXA3P8ru5KY/bXBC1hTdC8BY/hejOsy8hiBA20xG9cEH9KmkrEiBkreqdCafra0q0an0LQprlLpeIx/FexTWMM0Wsx3uhpOL1trTfZO4u729Qup1l+0g+0IFB6uXSSWfm/awF9QLlpodiR9WD3GDzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740586484; c=relaxed/simple;
	bh=YUF09IcZrXY2wJ5Q8XSoqYhVJAYHJpb87FaMoFZMtBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YvfBq0mSks5TQndfTEerlAgKUkclqoFQXKokYfVDzLLtOh1pp/358Fz6HQw9S3p3k9o3e/YM5lRML8rhj/sKpj9+n7SsOe5u2FNiuiCs98UKkvt4NL7LMv47ej8QalgT5fLo4PItVDDesnBWwCoyoQgug4SUvV/oKjBO77Yw6vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kpIGGbbm; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kpIGGbbm"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-726819aa3fcso3793936a34.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2025 08:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740586481; x=1741191281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=drFcXyyb+twCj8LLQJ+8ciOWTD1LqQ7TVcLVAV9+OvM=;
        b=kpIGGbbmw4G3yS0Lic3Y1if8x85ykN5aT90HCXwNat6XYD2OUDfKtS+izRyO9khd3P
         GsUZPhBwK8AhnLmez5PF7xNhlho1lzw8hu45rOL82+dRZEkfqbDV/tlwKJWIdaFWUe0F
         ff7tDrZTk45VD12J1vi1KJ/uyH1ueZOfq/BAsZL47m7J0eTAAObGWGmLTwwZJwrvmAWq
         BdIvdFg3SQ8+EOaW7XTWS5aYTiLd0meNfDgZ0pAdBegtUQzi7OoC0vy8sBnVDwvbAoXi
         wgSOdvUoIYndW10mM9nsyBhflVlrI9gIAg2Zd3O6bSvxqEZyqqoMa1+3Jz0zgrgrVJkm
         Zhow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740586481; x=1741191281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=drFcXyyb+twCj8LLQJ+8ciOWTD1LqQ7TVcLVAV9+OvM=;
        b=Wq9BF4QPpS2p1GZoDWGjB1KSL+Ljsm7TKUF9c4gsF9/mhHNRhLEKkNe+GUmEUHFrKQ
         6/WaTISZHDcx2EWW4aemwobpF1s/qmDgnnBWhrL14y3UHVhMxKXn8hy7VvJSn0OWOsT2
         mJJNv770glh5l+tIi919yJ2unQqghZ6ZPWbJGpaIrR3Tsluw7Q7J6tfNSoKGi5RDcRhv
         7B4H5nHvD4/V9uY9UFtn3zV3lOLcWQDjapwqeCKCqtl06FJapE88glklEG6KAyTYEsGO
         407RSToM2fugFRD/kjbubVwQV62plhm+wB/qgJbhoFeP8X0fJzSp9TVmuJuDPAFzR7Kj
         MUMw==
X-Forwarded-Encrypted: i=1; AJvYcCVY/tuMe3kgjQ0fpsCfD7vmivX/dugZoa2lTdonejrOg+L+qIi04qXaDiBtlbWzVFQZ8lfEwxUjUZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQK02Z98tU0JByv9iEKCZRmlT4EmrUnBZh7uhNWUQJ08RTWPA1
	nVWQ9+sTLFe1D63t+o44YePPYz3qFHTexyNuq3uXHwBuZslMq5u21xCqqfSCONM=
X-Gm-Gg: ASbGnctpfwQZME+pY1scfNwLYmMeGz5FnEXKL/e4/V2ijrdaQnJCMf2Y36AKNBEnY0z
	AWmt5rQxA5Bz6GgjQW+amK8IY3Zb8d8YZUj/5b5NWnIWZAW7oMDdzwGS36freqNPG8+y8IfHKW4
	qYlTggkDPMgfEc0vJjbXYj2XNAywc1RtoFb+25MG70GzSc+mYqzqn8aexswCm7APYHxVwh/6vko
	u7vK/heELhCHA3j787azRQVHM3RpKcORpOMMKGY39kKt+0tv57Oz/Uf54xym+AopeS5//a8aQ3h
	ADHV1E98m4sVIFRVhCgdNJ1jgS/SvrnQppM2QsVQlxPBZ+wal/+Ddr3vsJb57MY=
X-Google-Smtp-Source: AGHT+IF8NI9+1TFgCQXZV07Lfd20oHa51d15isLN6a4AtwGJl5WnwIxcHmu8nhk4CUGmWxBUTRSMEg==
X-Received: by 2002:a05:6830:6706:b0:727:f9a:8aea with SMTP id 46e09a7af769-728a50c73bamr2345843a34.4.1740586481711;
        Wed, 26 Feb 2025 08:14:41 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7289ded6e56sm750702a34.8.2025.02.26.08.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 08:14:41 -0800 (PST)
Message-ID: <5ad1f95b-ef0b-4e65-9e31-a8166a8e90cd@baylibre.com>
Date: Wed, 26 Feb 2025 10:14:40 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ad7380: add adaq4381-4 support
To: Julien Stephan <jstephan@baylibre.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250226-ad7380-add-adaq4381-4-support-v1-0-f350ab872d37@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250226-ad7380-add-adaq4381-4-support-v1-0-f350ab872d37@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/26/25 8:50 AM, Julien Stephan wrote:
> ADAQ4381-4 is the 14 bits version of the ADAQ4380-4. It is compatible
> with the ad7380 driver, so add its support and documentation, in driver,
> doc, and bindings.
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

