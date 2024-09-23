Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80681885B9
	for <linux-doc@vger.kernel.org>; Mon, 23 Sep 2024 08:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727080506; cv=none; b=blX1US57EuTh+ax9CkzBuI04RbsWD9OFFSt9jMygHAEv9C4rNbn5iFeBrdIcLmSRjGjB0b228AsWZbkD33USCGuXoLdBcP5Vd7ppM8qddqC23jt3gFmvjQCeUfl9z+vP1yvI3k3hczGi2C7VovS+lRUwPqoRRA2/pY9xTwPjb7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727080506; c=relaxed/simple;
	bh=WCn0BjX16f0sbfaNXaV5vArZJvaoV0TjIkATMCuqyzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f7zRW28FIzKnz8vfwl/S+YozZlJ/V+LjtMRXcU8+bsqtuwk1Qw5ew+km19wFiKpqzSg6Xk0h84DFc/PJWqDjCp3nhWQJu0e6co2drsiv8eHRhoVwruCf7GdGq8GVAmaNGdXMEpIS+cmHqcCB4mvv8k22a7krpAz3oxNvRzrEN/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YmPukJah; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YmPukJah"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f8ca33ef19so4226641fa.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Sep 2024 01:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727080503; x=1727685303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCn0BjX16f0sbfaNXaV5vArZJvaoV0TjIkATMCuqyzc=;
        b=YmPukJahIBWJ4D4MaecjXhemlkGwS2BQFoTIMwpY5qBktTKhdxV6pC7JK9D3Kbm7Qj
         4Ye7Lu3iMOEXaH5tIIAnozRmSFvUzKPv/hQzZY6UkFVGsTJPbYrGx8D2NhJa5TDeG1o0
         03yPubG8wZq18S+xZewQWlDNUl2Gr9/WoRkexoq34VQHHOIZiCv//i4+FhIOW//dnBJb
         e9bPsSvfcNh2N6VnUNVSM26N6hLcFdg+421bZfqqs3LfLxR3hXJvr9THWu9rIpiG4q5T
         dmqNxpR0WUSpbyuYqRJlNiAxWxiPNHxCXuPKpelwC9+DUAPXEW4+7n4o0YndBqNPfZag
         WLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727080503; x=1727685303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WCn0BjX16f0sbfaNXaV5vArZJvaoV0TjIkATMCuqyzc=;
        b=ePxnu6KuBvW5v6CNQdwEpe87v6/kXW4XquxtzFnYeGwRP9ASUKrRW4oG39QtFnIJAY
         OiFN+tBc4sG6HxfOQ8LsIXp1/kIPfR6fag1gTD4AzpvqfKmN+FPT2YarYh2uDP6pfYHE
         ff0Sv9ix3IlS2QpJOz7/gKyVG9TpDfcG3nHZYjlzjMrKRSFts13F/YxBi702LIcpEeiR
         MM4nFj2MI4nn9PdXa9OetqGvdXZG8U6IEQlGR4tEsj/jynyAzgaGdh5YwRaze/G3puwX
         jc8GcnLGTsqubaOiy9SQVUt72sQyejrU3EV474EbwTH3/dZbvJr5YSZI5jwuBxdzw5mS
         jRiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTaQirOXoi3qefYLtA5xgicPWmm+h8cxfOkIaDC+2IcpZrCI7N37V7gcsaCAlbn2DDt6Eln304/Go=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEqq30Zv07gBGZWeJA9w5pRxV5tcvhwKKBGGBkmXiSr88b9Vik
	IWiv6v9vLgs0gWECD5rZpHWVtAVcCvurQsLNGhpTLwDU6owAuqLlxxaVE+I+YCVIPu+fZ5qxFYt
	vm58h4DfD9zqN+ZiA6j2ubiyZWClJhRPiTXOUKg==
X-Google-Smtp-Source: AGHT+IGB0HmD4yUCXfyiEGHZvou7JbCti99d3PK2v6+1ygu6PUNxbcxYam6wZ0jMVxzgb9p/QjTuS1exJPMjEaQahlc=
X-Received: by 2002:a05:651c:1543:b0:2f7:c7f3:1d2e with SMTP id
 38308e7fff4ca-2f7cb31c4e8mr59626701fa.19.1727080502814; Mon, 23 Sep 2024
 01:35:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240920-ad7606_add_iio_backend_support-v2-0-0e78782ae7d0@baylibre.com>
 <20240920-ad7606_add_iio_backend_support-v2-10-0e78782ae7d0@baylibre.com>
In-Reply-To: <20240920-ad7606_add_iio_backend_support-v2-10-0e78782ae7d0@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 23 Sep 2024 10:34:51 +0200
Message-ID: <CAMknhBE51oUjNZVE1mq1xtdOzAG2fpxXW7S+haMGQosdweaZsQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] iio: adc: ad7606: Disable PWM usage for non
 backend version
To: Guillaume Stols <gstols@baylibre.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Michal Marek <mmarek@suse.com>, linux-pwm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, aardelean@baylibre.com, jstephan@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2024 at 7:33=E2=80=AFPM Guillaume Stols <gstols@baylibre.co=
m> wrote:
>
> Since the pwm was introduced before backend, there was an example use
> whit triggered buffers. However, using it may be dangerous, because if

with

> the PWM goes too fast, a new conversion can be triggered before the
> transmission is over, whit the associated mess in the buffers.

with

> Until a solution is found to mitigate this risk, for instante CRC

instance

> support, the PWM will be disabled.
>
> Signed-off-by: Guillaume Stols <gstols@baylibre.com>
> ---
