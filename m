Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB17276057
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 14:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741099527; cv=none; b=Tg2zqYWkaZVd9Fr+1XiHkOhQE8e0jJZko17wxVEWhm5mqF7B5rKkZ/BIjwaTri8QYIIXKn3B+2S6AQEeoUP4gRf44CKpyEAZpz7E7IXBXAsHVgeUmRPTKBwPNf7ZUlQk7n6TwLh5ami+3y9a85e9R/NYvQuK5XQuq4olPIIAMpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741099527; c=relaxed/simple;
	bh=jKdpkROggTpGv8i7lEqCeoDnoMhE9yvTEkBnneKoX/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PHB0YKCmNT8lejiLUuvbJ2FE36BhDBogg3+v7g7quW6iCcRzv3Kkh7qrLpAdCzhQAkj2P+xBbeiSSSlp7LjPTwKnrNbu3Dl8YCLluThnmU79YVNFu9lfrrmFJiJuGWeo46zUSnPnzrw7mMH3SOvlKwvcczQ24zLyqm0egGQJszM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rdj8m4rS; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rdj8m4rS"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30795988ebeso61764331fa.3
        for <linux-doc@vger.kernel.org>; Tue, 04 Mar 2025 06:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741099522; x=1741704322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TETrHFzeOASenqMV9S9QwkBZdWbDaJ44vy3Vca6/dVU=;
        b=rdj8m4rSLSJKTDoGbzAdjQsZ3OS+JQmMqW3laXfGaj2lRh17o2j0JK/1P/RPvSYPj+
         54VONGuvrWWINZs68Wh3cW4v2/kcYyiW4XxRny9pL3T+ngO/SYK1dTrWE+hRmd8TCW2a
         Usuwt4U+GghZqCUoRxcNb2iqwq6dTMZP3cc7Tx/ymm5ctquH467NBFazrR9E74AjNTOD
         dowkJOSNFAR9OOThiCmAmNF5Jdjht0qtuCx9VsrH9n5HpOc1LAxgB4p8IG4yXRRBIHq9
         MnKm8oC6X1HK5HFIKWVQ9HihrVHHmYoVjN4AohwahRuqkSeaJKWLl4UZdlr/Vk+Nw20t
         +Hgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741099522; x=1741704322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TETrHFzeOASenqMV9S9QwkBZdWbDaJ44vy3Vca6/dVU=;
        b=qNt7etc7qDfEToEYCTUFZHOXGKpQu1GD4CuJseLj68JNVXHjM5+f8HdU/sB7CyKbCq
         VZ9qLf/VmvO/5St6WnZM7peKcAu1xOLJqIRYbUciAGcHyiTe9ZxibH8DoMbWKOJ550co
         Syn5AlJ56QH7B4H9TnyoerTLbg/mRoHDGVuKLRh2Abf+upSWQxp1Y14fv3R7VTf+g5R8
         Fm1NbO1RRGUkSo+ECoV3/qEQcznBatFX1MruDqaFO3hpn/pxYR/I7iNa28gIMPwKJUqu
         lKexJdndaxlEQbw4zHe7FPPOaWPtyT6wsNVceF8yB2ZEMGj2G03/H7tOJ4OM/NdAifiO
         r8FA==
X-Forwarded-Encrypted: i=1; AJvYcCUR8/Ulqh8d7oBL8NU1cLNnXOtisIvHA0gZRufIu6eqFaD0YJCy1824dlPJGQUqZpW7WV4YPFIsaMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyosMxVvCwtrgDlbRtc/MUFJoJQkCSVZEr9bnQfKG4zgkPpl+NZ
	e2R7JwBSHQbGoiCN7yII1R9FRNrDIkZkL5BRrvPLgcLoiZ+Ty6QfWEm1EdNkkLJFfpuiX4EphrE
	ico7ZHk65MlY1+itBsJl75QaE5jIwHO2mFkBW4Rp1EnrXl8AFX3nEMEj3
X-Gm-Gg: ASbGncsqi5/KSgDVtz/7Up5DYHmYY9B5vCcHzPT5cGlvaZrb3CyQpStQwTyEm1Z8ksw
	cGUbJuPfDFRxFki7geg23FH3kQXUkU/79VA5I6ebj/vBPz7YDVVVDI/e2/Edm9H2ijtiRgIh0DU
	+zAag3rUSJY2nxQqkpswe+7bAEtw==
X-Google-Smtp-Source: AGHT+IETKuyPMVM5CdYgZm14hIMgbe8X/D5820Fs21Iu8QTNB9GUGUO3MUy3gVkpuL3W82B4uH6iGXTKzY4qdWaX2WU=
X-Received: by 2002:a2e:91c3:0:b0:30b:9813:b00c with SMTP id
 38308e7fff4ca-30b9813b714mr64990571fa.27.1741099521825; Tue, 04 Mar 2025
 06:45:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304-wip-bl-spi-offload-ad7380-v2-0-0fef61f2650a@baylibre.com>
 <20250304-wip-bl-spi-offload-ad7380-v2-2-0fef61f2650a@baylibre.com>
In-Reply-To: <20250304-wip-bl-spi-offload-ad7380-v2-2-0fef61f2650a@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 4 Mar 2025 15:45:10 +0100
X-Gm-Features: AQ5f1JpGYBLGOoxbrmddIe3_7MKUmgER6V4l4XNFfg4pNtoeYf3XgHXjFSF6e-E
Message-ID: <CAMknhBFfjo_bWZ7=9LD10y02WTVanCYhQpMNk834k8P3iQ_uFw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] docs: iio: ad7380: add SPI offload support
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 10:39=E2=80=AFAM Angelo Dureghello
<adureghello@baylibre.com> wrote:
>
> Document SPI offload support for the ad7380 driver.
>
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---
>  Documentation/iio/ad7380.rst | 54 +++++++++++++++++++++++++++++++++++---=
------
>  1 file changed, 43 insertions(+), 11 deletions(-)
>
> diff --git a/Documentation/iio/ad7380.rst b/Documentation/iio/ad7380.rst
> index cff688bcc2d9601a9faf42d5e9c217486639ca66..e593ab6037b0da4cebfad1483=
13f21cca7f00fd4 100644
> --- a/Documentation/iio/ad7380.rst
> +++ b/Documentation/iio/ad7380.rst
> @@ -142,21 +142,21 @@ Example for AD7386/7/8 (2 channels parts):
>  .. code-block::
>
>            IIO   | AD7386/7/8
> -                |         +----------------------------
> -                |         |     _____        ______
> -                |         |    |     |      |      |
> +                |         +----------------------------
> +                |         |     _____        ______
> +                |         |    |     |      |      |
>         voltage0 | AinA0 --|--->|     |      |      |
> -                |         |    | mux |----->| ADCA |---
> +                |         |    | mux |----->| ADCA |---
>         voltage2 | AinA1 --|--->|     |      |      |
> -                |         |    |_____|      |_____ |
> -                |         |     _____        ______
> -                |         |    |     |      |      |
> +                |         |    |_____|      |_____ |
> +                |         |     _____        ______
> +                |         |    |     |      |      |
>         voltage1 | AinB0 --|--->|     |      |      |
> -                |         |    | mux |----->| ADCB |---
> +                |         |    | mux |----->| ADCB |---
>         voltage3 | AinB1 --|--->|     |      |      |
> -                |         |    |_____|      |______|
> -                |         |
> -                |         +----------------------------
> +                |         |    |_____|      |______|
> +                |         |
> +                |         +----------------------------
>

It looks like this is just cleaning up whitespace, so should be in a
separate patch.

>
>  When enabling sequencer mode, the effective sampling rate is divided by =
two.
> @@ -169,6 +169,38 @@ gain is selectable from device tree using the ``adi,=
gain-milli`` property.
>  Refer to the typical connection diagrams section of the datasheet for pi=
n
>  wiring.
>
> +
> +SPI offload support
> +-------------------
> +
> +To be able to achieve the maximum sample rate, the driver can be used wi=
th the
> +`AXI SPI Engine`_ to provide SPI offload support.
> +
> +.. _AXI SPI Engine: http://analogdevicesinc.github.io/hdl/projects/ad738=
x_fmc/index.html
> +
> +When SPI offload is being used, some attributes will be different.
> +
> +* ``in_voltage-voltage_sampling_frequency`` attribute is added for setti=
ng the
> +  sample rate.
> +* ``in_voltage-voltage_sampling_frequency_available`` attribute is added=
 for
> +  querying the max sample rate.
> +* ``timestamp`` channel is removed.
> +* Buffer data format may be different compared to when offload is not us=
ed,
> +  e.g. the ``buffer0/in_voltage0-voltage1_type`` and the
> +  ``buffer0/in_voltage2-voltage3_type`` attributes.
> +
> +.. seealso:: `SPI offload support`_

This is referring to the same section, so doesn't make sense here.

> +
> +Effective sample rate for buffered reads
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Using SPI offload, the PWM generator drives the starting of the conversi=
on by
> +executing the pre-recorded SPI transfer at each PWM cycle, asserting CS =
and
> +reading the previous available sample values for all channels.
> +Default sample rate is set to a quite low frequency, to allow oversampli=
ng x32,
> +user is then reponsible to adjust ``in_voltage-voltage_sampling_frequenc=
y`` for

s/reponsible/responsible/

> +the specific case.

Another important thing to mention here is that for single-ended chips
where we have 2 banks of simultaneous inputs, if at least one channel
from each bank is enabled in a buffered read, the effective sample
rate will be 1/2 of what ``in_voltage-voltage_sampling_frequency``
says because a separate conversion needs to be done for each bank.

> +
>  Unimplemented features
>  ----------------------
>
>
> --
> 2.48.1
>
