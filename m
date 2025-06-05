Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6D5232785
	for <linux-doc@vger.kernel.org>; Thu,  5 Jun 2025 13:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749130420; cv=none; b=A43ieduUjL9ivcLsfECrXbk6SnBJxT4Bq7TgBRi7aTxTZMUoAUBgDYJwlkbk0wFEyDYjMTWnYOYgZRuER1wWi68rJFSc4IwBEZPrLJbnPY+1ozTkz4ZM2+Aq4/Tjvf97E/vG5YrPXacVcJsQHfWEcY0IH9CpZoQRurcZ7o5337Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749130420; c=relaxed/simple;
	bh=VUknEBTdSjzH3vSAyO97+fdwjTdAd0iU+EtfDLbIzJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pn0aRA8pyK42ZNmskV/ESZh8B06YUSIwNYsrYVbqd97j0UVvyV45eMw3yP2N2KCKpj9DUp7nhDHzRj44ef6fAoMZpBZ99d9jHa1MxJiB1ZSpcuR4DLCrg+d68pJIkngYvlK06Nl6fbOCxBo1NpqNpSITuseA8HsRxG2yXeU9/pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oO89MaWR; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oO89MaWR"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5532f9ac219so1185868e87.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Jun 2025 06:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749130415; x=1749735215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUknEBTdSjzH3vSAyO97+fdwjTdAd0iU+EtfDLbIzJg=;
        b=oO89MaWRZQYYIdAXI0QboMa2M695ugR4shKTGo10iJ0LW2logpiSHxfroMIGzb4DcP
         R6oCTjJdKjljUutH3L4DnXSQP1xbN9nXmb2HAPstu7YADkVy7q+iqKaa6CJD2tbePkBg
         zvIk5VnvXTeA2NosMkH0zF6zDTHNSwhGtmOApci4nQ2epnN16XL8fMKNrBNzsMq1xPHq
         /0FzV1Kc4MyBQ4+67xvYcS+Vp/qxCnd0I4GCfFmID9lGAquHmQXz0M+b837i2Aa0Mcv3
         dQn3LX7yzeHuCpLjHdBwgh7mcffoq/DCghjebZli08LnmYU00WifHt+uVauxSTUgORtL
         DZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130415; x=1749735215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUknEBTdSjzH3vSAyO97+fdwjTdAd0iU+EtfDLbIzJg=;
        b=q0CjokoBmbsuPaAOPYm6uvLDpz/rQ3VP8LL2ygKRWTyru379rVu+s92HGmbMnUeIJ9
         dLdKtiOmT14/SAHGybaAZTe6cMJix11DPGeDcd/s1sTlcI/mwd1ZEqw/vaPClfSStKgY
         y8qwpyB1MsDf3qi14rOpp8E79TzC56BOWo7sdc00Nac8cAUpYS5/ZA4Nqn96SZyYBsrU
         SbVYCNpgl7ESSZ1Nv6BRfol9iKpUcQ+FHciq1kf2cZm4JpXeN1KcczwAr2kcHLh/erSP
         9/kVynvbO1LjMq242XQFYas+ORPINrU7I7rMUTF23fHm7ew0KICAui95a96WPQYvgdxt
         hcUw==
X-Forwarded-Encrypted: i=1; AJvYcCVfIXmtQLb95fWwGRQIR5q50pRR5h9KDD96ZRLy+xJUjymvAZ5DfApnhJpNkdyRyj+BWJhxsyP2kFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxavm4PwXN/A8bbJYIo0Qwa+7QciGJ1CvrRcv98PhahlRue6TUY
	DirRZhwlJHiQZZePIXA6TZ3ETJJovrxpGQvX6ZM1jwohu6jBLMEkA7pK5BBqXccl5hoi80qtzV4
	ybCqmcPFsZ82rcyp2yA6V9jZjNjxklJgejdQ1L1W5cA==
X-Gm-Gg: ASbGnctRkAf8EP+S8ND3qaqVjXhE1dt/C40vFl0ENsQrXAYLFCPlA9SgdONyV9M5hk+
	Jlb5m4s2udSEfxc1nRDlVlNqWkH+gqFQfkxvVQsGk1N7SLPIEZ59N2ZG87CyTcOjWDBpEs9kAvO
	Ynie3TAjQ+ng2rOd3+IvpY992QYf5jkgbpvIBt9705mJkqJfxWVSWK6A==
X-Google-Smtp-Source: AGHT+IEgjC4fcmg+OD5IGVLjZUrIMPEfYs/w9+6VTW1vagtiTaUcBabncwsUcBazgBGF/ZYxoheFQtZJR4MPvZFNfsc=
X-Received: by 2002:a05:6512:3c85:b0:553:2e37:6952 with SMTP id
 2adb3069b0e04-55356df1e50mr2121333e87.55.1749130415411; Thu, 05 Jun 2025
 06:33:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250531212331.3635269-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:33:24 +0200
X-Gm-Features: AX0GCFvHxiWRpP5cMCB8iSavv_JwXNB2m6sizTI16LHxsIHw9CZ-Y-5vnZK5ofQ
Message-ID: <CACRpkdYD1F_AGXkeEhKcfS8BZxgznmfj_r3BBaK8LJLQJkDMvg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] gpiolib: get rid of devm_gpio_request()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 11:23=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> devm_gpio_request() is used by a single driver. Replace it there and
> kill the legacy API. Assumed to be routed via GPIO tree.

Excellent cleanup, as always!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
