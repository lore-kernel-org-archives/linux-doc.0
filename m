Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2FA22577D
	for <linux-doc@vger.kernel.org>; Thu,  6 Feb 2025 09:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834214; cv=none; b=FOnLcR2jPGMm3mIqVHLQSW3Hvf2ZcQIpr38Dyp999y4bkE2Rn/PhA5LH/DwHZMf7CfWYeKeLWG6hECl/aU423JjAn/tPiWQbnBwC9RNqA/fA6DFXhQptmVNT55PwhwOeFGC68EHot7Qw88QT13yc8exIZhgd0ccGu2XCUbcPGhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834214; c=relaxed/simple;
	bh=SdgHInAsUXSdKixwpkgWNZ1b6pPlCjYH0d4wlVq+enY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h0jK3H2CfIlfCgy0oJjF7wbKdZFIQMJbdtUK2vYYawXD/GY7/GPlPcoUll+XrmBPJXg0J/bTyj0JlFuqAVRwqbxtYZv8ktvdL6Y6m4hcZwCB7D4mDJVlbmOzV3WRuThaZpO0gnGSraLAdyeyK8k9fh/dvetCVVoGo7So/xPY3pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OxNOUIG+; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OxNOUIG+"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30229d5b229so6002441fa.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Feb 2025 01:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738834211; x=1739439011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAC13CYCSM1LP7N2TeDcVK+j1mbZEQhsK8lcbic5FlM=;
        b=OxNOUIG+jXADCLJKP4P6wowQBrbW4U/BSzS4ME//2SNl39zdIkW/e5DAfRo29jsuu4
         gHVuoVlJiIRC1Ug6QM9FvE9FbdSWJhJczEoF/w7U9NW2kfMqCU8pWT8A3wYBJDtczRd8
         p6LicACJi7+eEt3nAj5+5bkBnsQeGseCWYwJhrXp15fO4OIQNGDQ/UR/wJwwzxV/i/PU
         Bz0Mu+enFvxMjHVWNgAQRULeusF8r2V1r87OLlSsWUyGtG1nk4FW+hC7KsRfLda5rUna
         FKWaOxKya3+x6nMJOhvYJh1j6qtkmsxuKdpo+39cFyetIwzh5v9JSVO7WvYN8ei7DVBT
         h/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834211; x=1739439011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tAC13CYCSM1LP7N2TeDcVK+j1mbZEQhsK8lcbic5FlM=;
        b=OG/tSjdVLfbDeJ0p6TqkvdTm1QxjnfEGNrs5bNfUf99TSAzQTB/8uVBnXT4DLTrcop
         QUn2Gh9bj+fkRdzLCIvDQmUh3ohZYCOaQuCZCTEFu50pGwvEzbpOAloTHX5t2ePtloCA
         TfM2FJ3Yd9Y+5uLy40uV1WvM58Taw53X5jGoztIQY1i4kqbcsgpQxPuT+UCznyRLQiWF
         BSDUqE6A5C2EyqUCZeBmSki3m0HqSM+yS+ydd6l3nPrxaT2CIQ6kj4g4hNfOaDjjGtI1
         xL3Rl8LPyyfXeyLmDcacQKh3eBcEjpcocPUGB1Wg4hAbPl5vYRpdzetAwmlWpg4Qv83d
         Ppkg==
X-Forwarded-Encrypted: i=1; AJvYcCVHYnXIuMQmYAHj9Ip4PbgczWABmmgOQrM0aB/OJGaCqFDhSipHyg8R6d3jZLnmXXrhBx8rKUtzVRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRX9x62tiKYiBNk9O/Qmi4r3r1BbU0jaJfIYnIEOitz6Oxne9m
	0vtAZvsN4cVHMiXc179nHvMdWy/zgvn45ybbZGvpbyOqBM0KDFHacJn9BKoLmkS96qFpG76HO3d
	v10dMnueaJrQ7Ih3Bx/wxSk1QoJ/bgqoNYhYaAQ==
X-Gm-Gg: ASbGnct1DP1bqBG4oJEkH8qHh1DOkkGrSr8nXo+7XsUK0Ux+DDSJc12jeUyXmHc9s8v
	5gMNzxGryy2dV93IsxnhmXp+ZnAO2JmvFjrY48D7sGrVde2gNxA/87LsIj/Ajw6Qtvegl13s=
X-Google-Smtp-Source: AGHT+IGCbK5+XwCvq93+VgFVenxmOMdhIuSf3XKRCy/oPksbUb9k5UbqbrA68zfdY7TzalRQv/7sFEWCNRM17b/N9ow=
X-Received: by 2002:a05:651c:2204:b0:300:1dbd:b252 with SMTP id
 38308e7fff4ca-307cf2ecab4mr19091371fa.7.1738834211024; Thu, 06 Feb 2025
 01:30:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129020048.245529-1-linux@treblig.org>
In-Reply-To: <20250129020048.245529-1-linux@treblig.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 10:30:00 +0100
X-Gm-Features: AWEUYZl5g2Z6K7OUBqy6qoL7Spv6SuqCSicSmBmwEYZK1dgCVgMzmZnyxigQlWw
Message-ID: <CACRpkda=jnUV+N_UCdh_c1mKboaxkK25UPTc0XyrUXNNX_EOug@mail.gmail.com>
Subject: Re: [PATCH] serial: mctrl_gpio: Remove unused mctrl_gpio_free
To: linux@treblig.org
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org, brgl@bgdev.pl, 
	corbet@lwn.net, linux-serial@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 3:00=E2=80=AFAM <linux@treblig.org> wrote:

> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> mctrl_gpio_free() was added in 2014 by
> commit 84130aace839 ("tty/serial: Add GPIOLIB helpers for controlling
> modem lines")
>
> It does have a comment saying:
>   '- * Normally, this function will not be called, as the GPIOs will
>    - * be disposed of by the resource management code.'
>
> indeed, it doesn't seem to have been used since it was added.
>
> Remove it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Looks correct.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
