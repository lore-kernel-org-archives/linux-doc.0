Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FF412E5E
	for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 09:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707902977; cv=none; b=ogcV3CimG09R8ZGpTYNWndK2fC6es08q+H6hSsJpwsRjdwdY2Na4YyRF18XOM9NxFBv6j1qxJ03Y7m4qrvZDKxTpEyogC2we/gBmSs8m0fLEsHveW9sDeuhSifX41AoixzbulfDJV4d+ZOr/KCifRxwChCr3xYVEbhaRwoCuec4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707902977; c=relaxed/simple;
	bh=QGJGbBcSxuCx9Avf+9BT92M2uOkRt65tIyJgEDued6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tufHJWLVl59heyh2c5YzHb1gv6qr2B8Lw3SOX+lUOwWK0va8xgbKpyuzXvJ9q0Ll5Zl2gzt11RZIDyxZGUHdm4Ir8m26nVbzbvkxsDf/7FJJVQkSiAhgifRxjCBvxRopeFDCl8BC+5MWenBbOmmiA/2wFnK4zqsjINt6Oxd/SzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=T0EctImZ; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="T0EctImZ"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7d5c40f874aso2153620241.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 01:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1707902975; x=1708507775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NTlOSe5fjimviBpJdsalrhomrdPQE7oNI7Qj6Alw1M=;
        b=T0EctImZYwp0q3bNcDuI/KHQXguCPWhQPhBEeNS/Y9BGb6Gp+aQCIMaE6Pj/JADY50
         v4xxAiydJaGS20EQkjXt4c6NYdOEVMDMY+0AACTnbSgiCke7pbhmVz74oHowlMaqWVIq
         2T+CWhG9nTDTQhw59tB7YBTOGSv0pGmw52NgVWVWzyA6TP4mERn5OUeo20krThvmmo1h
         cP0/iN4SR+6a4b99EC7SDvsPE1eE/tE/oL/EcFpF/eIDbY6U3GhIt9+5EVO5X8B2cHLp
         Y4WEH67iirem+BIucQ7fru3vIkEQ51Ghm1I1n/odNCJvWAfopng72fJyXMUnauxhJ4ro
         zTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707902975; x=1708507775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4NTlOSe5fjimviBpJdsalrhomrdPQE7oNI7Qj6Alw1M=;
        b=ug9/abkeqC6BdjxqSKmEahgfzZdRp6E6ZYEd2IbyVchFNz5OYv1eaTYooQ/+yWAJmm
         MaUqVR3PypuZi7mZB+BqWOnp0ozMLjNGk7DcksbTaGCDvjLSbcf2RwfjZUmdusX4nzn4
         UYSBN7/BvnT4eIwzaOwEWiQ0wxytBmbhnlMFh2Z5atGx9CZRNg9uUi0L1Vk9ti1v6isv
         9NXQAEgwUWYpsXeYDNLuG8y+gVQym79WTLCXM3dUKizT7k7UkogyWcZO0eJAv1hjTokb
         9Q8oHPf9p8e9u6Anv6iK+t3fwkiKjfaok2E//qmf1OsjU9pKEw6VJM70ORxL1rrjdP9A
         PJiw==
X-Forwarded-Encrypted: i=1; AJvYcCUS3lsL9cL8U74Mcy34BOo40tXdV6E88pDKyDhZY2HVUj9kWSs8xBlxXPxqmNJDDedFI0M4PCB1C6U+z2svvXENyiF+a8FzzfG3
X-Gm-Message-State: AOJu0Yzzy3TDhOSWjD7hN81ibWTHQh64Uzyq9UrAvFGsSSdV3CzvNc8P
	tUFmAh2pevsvEYAQzKqbGofny5uddEsjShDb7w+GmWblL5rHxVwBCCueSminlMAglEYHa0sWo3Z
	s0blbgCaxAHhPh2xwUH0ia9tafj3G2SlsztAANQ==
X-Google-Smtp-Source: AGHT+IH2j8d++4e+u1mW346Mzu8bIt7wE9r3caRvalw9/NdZqNB/8dU8pyZv7IJ5KcYwAbcnPABW8sixlqBXfX1Jc1I=
X-Received: by 2002:a1f:c787:0:b0:4c0:292d:193d with SMTP id
 x129-20020a1fc787000000b004c0292d193dmr2079166vkf.12.1707902975308; Wed, 14
 Feb 2024 01:29:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212093420.381575-1-warthog618@gmail.com>
In-Reply-To: <20240212093420.381575-1-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 14 Feb 2024 10:29:24 +0100
Message-ID: <CAMRc=MfwCQYuouRfU7i2C-YKi64_pTCRCs7jj6evBefj7=Pbog@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: clarify sysfs line values are logical
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linus.walleij@linaro.org, andy@kernel.org, 
	corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 10:34=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> Clarify that line values are logical, not physical, by replacing high/low
> terminology with active/inactive.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  Documentation/userspace-api/gpio/sysfs.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/userspace-api/gpio/sysfs.rst b/Documentation/u=
serspace-api/gpio/sysfs.rst
> index e12037a0f2b4..116921048b18 100644
> --- a/Documentation/userspace-api/gpio/sysfs.rst
> +++ b/Documentation/userspace-api/gpio/sysfs.rst
> @@ -87,9 +87,9 @@ and have the following read/write attributes:
>                 allow userspace to reconfigure this GPIO's direction.
>
>         "value" ...
> -               reads as either 0 (low) or 1 (high). If the GPIO
> +               reads as either 0 (inactive) or 1 (active). If the GPIO
>                 is configured as an output, this value may be written;
> -               any nonzero value is treated as high.
> +               any nonzero value is treated as active.
>
>                 If the pin can be configured as interrupt-generating inte=
rrupt
>                 and if it has been configured to generate interrupts (see=
 the
> --
> 2.39.2
>

Applied, thanks!

Bart
