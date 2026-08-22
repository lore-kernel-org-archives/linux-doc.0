Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3F038AC78
	for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 08:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787385927; cv=none; b=utTAq4bEQ8cFPFT0NBgUlvzuXI0GqiPqCSDyefBsLvJPFuUMJJaWx7ttk8rhREL/IP3fW3xL/5xfGzv0RUG+pCWRNzQ//eNCCPpQ+IGB4Ink9Q5GfZliJYP6V6eeWj0V8BbiBGSKCJkhLVo5GoeB+vlV/e9INQ3+j6xbRobdsuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787385927; c=relaxed/simple;
	bh=GoX7oXsNlvzStweykm47aboyQ60NH9edt6IeKqqks8E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rh6xWAfJ8VwsjJKIj70TJhEU53zJrmWtykfJ41zMTHAz2XlKxV8ZlYlsxA+vdyjI3H+NUalvYEtsTdhYTYDhS62H2ehuA8/S5I5yvigvNL6LJhAX0HuoEL4Xg/IrYy7zEN46/Q+y1uEIqXXj7vxqgUgnM2YdJNchPtwboVujJvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKIugR7V; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKIugR7V"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c214321dc32so355155666b.0
        for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 01:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787385923; x=1787990723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/DwAn7P/v0Ku0NHmQViUiZ0vUb0YJHt5XOnacRA78dQ=;
        b=VKIugR7V+4gwnMXtknTMpF/VDmEbFk/tyXGhtimqn9gYFNjchvwp1sWT1vSo0l9xg3
         Htz+SW1vfEI+2iYZjaLPqzEWt4Rg/OYU3Cz0Qe2sBPU3J+NjrElg85vBrc0VQYH0gW3X
         kf6BCgCnW1OMKHVeLQ/l7M+d0IThN48zxF2tBSiQoIlNzYw5zyqjq6eOdeT6H5f93ZFO
         VVAyK9yTT+YBOUlOh36LPm3Zit4mw+cKW3LMJLanioka2rOim+4c8RiqaDwh7ODFvfMp
         yNnPclcs9YRyc7k4bEthrT5/OGULgxSwilVTz0qVMrabsI0f4UBRJrpiGqEXMh1RAziX
         hILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787385923; x=1787990723;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DwAn7P/v0Ku0NHmQViUiZ0vUb0YJHt5XOnacRA78dQ=;
        b=Xnv6EgD0MGgeJz0MxvwiH6Iv84qa4mBrnk5ZlrsTRipo6YIYC8o1Ilzj6ZZI5aAfT9
         W2vJR324z8nT8dLgALsCXr4Lwyu24wZurkETj+A0Q0qkZnBuvxdAJPXL/qDghRyqUFga
         xorQ587RxOzSk8Ldo/HGdPpqZCPBYuFPwwVWgILRFrAgdv4QbB2dvQxs8QC7h0OiW2oZ
         +qwwEWyfOdeHPWSjmrjIf64lCpB64mHvkbq6fEx7het/B5PLFQQvZjydjn/awd4jf0sR
         mAoLLzcpyDjKWub1GG/FIpMZh3Ha8P1++ZLColJ96odaOHD+mUH2ufF0zWuHEhLmBO5s
         UI5g==
X-Forwarded-Encrypted: i=1; AHgh+RqnF3wkEgu4knLfTMvpG5HgFbHBA+ega6a9mc6jG24AwKiS6+QiJF3fhXpqqiXG5pPjsvT04qPJtRY=@vger.kernel.org
X-Gm-Message-State: AFuF++nyZW5LB7vxF0kX1BKD7jo2gJ8IsmVo5cWWJ+lDpg2kNv2MwZl/
	DhnlMESKNODt92ck7zGACETJ6WWmqN/kwlJoGL2Rn/aN0puxIyHxWjVkkhsgYp3IZ7A=
X-Gm-Gg: AR+sD11yjzFU7blQYwdwfs3jrHS9zWCn91wyGcifjssQmGIyB7SPK+IE7ghgoSRIWCF
	P+MHiILW3AXCvcCb0moiizGQ5yQIDfcJOwgj3IuQQFS9MD2In7yWrG3viCEiCk6S7hll+l03CFz
	0v6HS1JV9/ZMmDsORUiIgq/FsRw2EiEMZXbbQsT2aMw4nuON/fudlQmEjSVAgsRWEwclpLPq8lJ
	ShWv7/ubLHT0zUanEaAt544O5DKeo7mehRFcC37il8woclE1JhjLe/eNsjehhq7AROemwCLP2v9
	aWWszMT8JrkbxYb0FZIwBQ9tcS/C+K2PfJuNAdBi1TJ2UqGvZAr86uLdr7UG9h1Swe3iM+mGOlv
	LBv1FxLyPZW0sf4NiohdH4cPMzFF5vS5tVPudxh+F+9najduAvtpONR2g8yLR1jyYLkQ5dyrWYm
	lttsNH0R26TFL27RDMAsQpZQ8Z5sdbw9SB0Mx0RMdUb5cpqHgvawsj5xTkQtSLkKDfgUNVGeAXt
	U2uZuZU4NWKJuZHnWnsvYDiqLxjEeOIe2cBLoBBlirSz9QicwAE8jIe6Xd1NMqpQe2H0mhWZwBU
	cwUrN4Grhq2PFdZ9HSjL/tH3708bWaQD1cZRSocf2PfmbiRzGU2mg0hJRXs+/zLJHr3SmrtXE1P
	QsEsyig4pEzoKnKPagfUT
X-Received: by 2002:a17:906:f246:b0:c21:61a6:8821 with SMTP id a640c23a62f3a-c246a6cd384mr1064458066b.23.1787385923217;
        Sat, 22 Aug 2026 01:05:23 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24967459aesm190788566b.48.2026.08.22.01.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 01:05:23 -0700 (PDT)
Date: Sat, 22 Aug 2026 10:05:20 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Antoniu
 Miclaus <antoniu.miclaus@analog.com>, Ramona Gradinariu
 <ramona.gradinariu@analog.com>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: iio: Correct ADXL380 filter descriptions
Message-ID: <20260822100520.5b8d56fd@systembl0wer>
In-Reply-To: <20260822073653.54545-1-kmehltretter@gmail.com>
References: <20260822073653.54545-1-kmehltretter@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 22 Aug 2026 09:36:53 +0200
Karl Mehltretter <kmehltretter@gmail.com> wrote:

> The high-pass attributes were described as low-pass filters and vice
> versa. Correct all four descriptions.
> 
> Fixes: b6a097a9af00 ("docs: iio: add documentation for adxl380 driver")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  Documentation/iio/adxl380.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/iio/adxl380.rst b/Documentation/iio/adxl380.rst
> index 654d4c0e84a19..a1c249dc2e51c 100644
> --- a/Documentation/iio/adxl380.rst
> +++ b/Documentation/iio/adxl380.rst
> @@ -39,13 +39,13 @@ specific device folder path ``/sys/bus/iio/devices/iio:deviceX``.
>  +---------------------------------------------------+----------------------------------------------------------+
>  | in_accel_scale                                    | Scale for the accelerometer channels.                    |
>  +---------------------------------------------------+----------------------------------------------------------+
> -| in_accel_filter_high_pass_3db_frequency           | Low pass filter bandwidth.                               |
> +| in_accel_filter_high_pass_3db_frequency           | High pass filter bandwidth.                              |
>  +---------------------------------------------------+----------------------------------------------------------+
> -| in_accel_filter_high_pass_3db_frequency_available | Available low pass filter bandwidth configurations.      |
> +| in_accel_filter_high_pass_3db_frequency_available | Available high pass filter bandwidth configurations.     |
>  +---------------------------------------------------+----------------------------------------------------------+
> -| in_accel_filter_low_pass_3db_frequency            | High pass filter bandwidth.                              |
> +| in_accel_filter_low_pass_3db_frequency            | Low pass filter bandwidth.                               |
>  +---------------------------------------------------+----------------------------------------------------------+
> -| in_accel_filter_low_pass_3db_frequency_available  | Available high pass filter bandwidth configurations.     |
> +| in_accel_filter_low_pass_3db_frequency_available  | Available low pass filter bandwidth configurations.      |
>  +---------------------------------------------------+----------------------------------------------------------+
>  | in_accel_x_calibbias                              | Calibration offset for the X-axis accelerometer channel. |
>  +---------------------------------------------------+----------------------------------------------------------+

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
