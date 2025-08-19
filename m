Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA56335BDC
	for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 12:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605586; cv=none; b=VfSyfyAUd/pKKnkWhJ1hU9dBvSe+oRb3eQBLd85DfRxkUKq/AqcP3tcCUS3m/jR/bm+itzMrS/raJJ1nxcc0X80D+itX+LUPoP86iXKTp2dOgENGv3WKZ+Cc7pfBFMYJR5cX9kLVfrCA94RmlEqsynriVWDh1yWoH8eKvTs+AAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605586; c=relaxed/simple;
	bh=pT7J7NlbzDj0BcguaBhEfkoD9p8GgWTOtMzLwvbVkTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ioyRyhRJXCsN+3xYhWIH9LXcS3wTLcNSw7Wlnvu+izXi9nhJuWPMQtKoDXQsrC55OPuRa1cLBmbrIB1EkDDTCwXtDWvj113tz4SwTAReVH3GB7J1/k654PTNKhyjGtdH89DPhe2WJLco4tddUUhY4GG6M4Kfw0Bnod/14214OnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mHCNJYK9; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mHCNJYK9"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-333f8dd3620so37649221fa.0
        for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 05:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755605583; x=1756210383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pT7J7NlbzDj0BcguaBhEfkoD9p8GgWTOtMzLwvbVkTg=;
        b=mHCNJYK9mo3J7JRL7LLBKUB3sm+8n3Q3l8jiZz0sUCZjmNqgbzNaoPsvT95gz2usZG
         JIfDa9o6DJFez5SH8sGgAmLxZrczNj5p3AVY8CoYQ7Nkgv7wns6D0Im2lRp4SyrJoEqr
         /4MxH2lYVm+c7fBP+30ozGd8P+tsXRBG9sp3W99zB34rxxsZFdgVFQtgMmz6t4r9Gd55
         UjhuykSbX356y2He2eLaZR5aaY5CiChZn3IC09yPMo4DRli8aZ1HFyQGOycCk1Rpshd2
         GEZsSdsLtvYYEgKoserNhWOwVTjmiuQ7ej0l3Wak0CoXCZIH0irMRX3iHLppmvpcvvLh
         f78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605583; x=1756210383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pT7J7NlbzDj0BcguaBhEfkoD9p8GgWTOtMzLwvbVkTg=;
        b=LuvHO/TOJQWKCVzKnRkxg89yzH8c5dwtJcRq40SYmTsHWvYeMLhIWmPXVn4QKd1p1o
         RNp7Ys9zz9S/ZfEoG/9uLSUTlpB7bqhKvbJ/0LXFgdkS/qWP3vIEdObHyS8fr2/XaC2U
         d6kWgJ8mnnX9eMYmuAXUUZmdw5lED1Q7Pae5Ljt6KYtVDpK5wheMZDIGqAUIK8O9llIr
         Iqa7AOjLiWayiXCCWeT8OpTqMQT8cBiBFdOcykglUm0QyREBxO4jaS7Q3AKTP2VQfMnB
         Sl71ZoaWqi2Y4YNgU36byOOSB0D/vsAJldHeV1NetSFdV7nxXnN+jKSsBjgvx8uRSvw0
         IfJg==
X-Forwarded-Encrypted: i=1; AJvYcCWYpncjLlw7dyTEFErkFOZatuuOXyOLVJv5Iew3GWJZSS1Tt+4f/FC8DNvyn/Vl0KGopGMkAXUVTU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YycB1wUcsGOHXltA4tI8hvU2PkgULdbLpn1HpROABShb6M7kZ5e
	h9K2Xl0+PVSVWZo29hQoulbeOBSP5lfYgnhByDCXKSPBAN1JaVJahE2DwdAHJj48uPOUYUvuCqd
	LLrMdOIv80jANw5Cp0DUkutgsPpgp/TBRAZe7O26tKqACtJOcufkbEojoEw==
X-Gm-Gg: ASbGnculiM6Ks87g4UfjInZaLcc01PYdrRxzVXUQjE2sG+aF36aiz57MhlIAwd7hcJp
	NbGpJW1ICyFe+6h4hNbUhk7Mkpriu8qwk6M9js1qbEGEii4vgtq/wlgsIwZtJDYE/nKAYIbK9Lj
	XJwhcQpj6oXKKKxTFRhDvvEE6aAvAuW2yEVpob3f2KCGQWmN/9G4bJJ9dU0pqlAbIquUZawDx2F
	V0B8GI=
X-Google-Smtp-Source: AGHT+IH+aPrIJY+DH1gxYk549l1vaPXfQI5WHK+rOHEK+EYvi2ju0qkAP63ibB4HjpirzJmCyfMVeLvlEsTbS+CROto=
X-Received: by 2002:a05:651c:3041:b0:32b:a961:803a with SMTP id
 38308e7fff4ca-335304ce141mr6002291fa.3.1755605583129; Tue, 19 Aug 2025
 05:13:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com> <20250814-ltc4283-support-v1-6-88b2cef773f2@analog.com>
In-Reply-To: <20250814-ltc4283-support-v1-6-88b2cef773f2@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 14:12:51 +0200
X-Gm-Features: Ac12FXx9DbzpmXtIaYcl4GeGqmQxe243v3rohATjse3LJ-Oaq4DA-z_79QbXSd0
Message-ID: <CACRpkdax9THwKRZmaAHVcKbnBdi1LxjgvibAFOUVnVQJBhBiwA@mail.gmail.com>
Subject: Re: [PATCH 6/6] gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller
To: nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nuno,

thanks for your patch!

On Thu, Aug 14, 2025 at 12:52=E2=80=AFPM Nuno S=C3=A1 via B4 Relay
<devnull+nuno.sa.analog.com@kernel.org> wrote:

> From: Nuno S=C3=A1 <nuno.sa@analog.com>
>
> The LTC4283 device has up to 8 pins that can be configured as GPIOs.
>
> Note that PGIO pins are not set as GPIOs by default so if they are
> configured to be used as GPIOs we need to make sure to initialize them
> to a sane default. They are set as inputs by default.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
(...)

Can you check if you can use gpio-regmap.c helper?

select GPIO_REGMAP

git grep devm_gpio_regmap_register
for example drivers using this.

I think it can further cut down the code to very little.

Yours,
Linus Walleij
