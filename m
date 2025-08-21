Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A186D23D7D1
	for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 12:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755777985; cv=none; b=sq9LvmP/qk0+gbUcR7obh2E/mnIQt7HS6yEPivFp2MIBjQMoLkcRrQVM8FekCdbU5Y4t5C9KfkMQwyiEzqFVqaXmAqlhXzN+ZM/7Dn+Gr6/ddCxseNDu5WoOeClAG7sG6ZnxLrvn1KtgrDZT77RiZPe/uFoVUZUOpAgePHiMeCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755777985; c=relaxed/simple;
	bh=EqOATe6lxC8lL+rMjGZLssQp3T91Kjl3xSz+jvx0DUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MLjK5M7Do/Fgu24dQy5QOaRCvzDNuORGhHqsAqXv632Zy4DRJfh9+UuWHETHooiaWRmUIp8L9p+joDzn8muLqGth4zHvIou/Q58lI8HrpvaTjmT3OuDdHY0ut4gEq0je+v5k7PrS38KFocVkBVXkVGZlyJw0vu79biASBaBwfh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NzzFcGxt; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NzzFcGxt"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-333f8f5ca72so6756711fa.1
        for <linux-doc@vger.kernel.org>; Thu, 21 Aug 2025 05:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755777982; x=1756382782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqOATe6lxC8lL+rMjGZLssQp3T91Kjl3xSz+jvx0DUc=;
        b=NzzFcGxtagRSaXmQ90qDHpMpg0V+GJbMNS2fMBIsfgZTfzijlYbpMr+k7eo/JxCxip
         DNz1O7FPLl9CEUERoghlQkigiooJ48pppA+nTJBxK8iArpXE7bWo3Ie4L7mbKeuCY/Kz
         zMDQ1pZF2pfiKSyMJ3vzVw7a3imKVC3uj8nSYNQ/X2MkwSa1CT3+58yXllYrAwSYWhKz
         5PebktTTpKQodCnxnU/LKYXmta3it+hOE2UA34wJgGCJ7iAqqIFrWvLnYQua9k/Zj1ow
         KYYAoacyUQF6ef93EgZ+r8F1oVS7NHim1DLVubXi4GW4yO18GnTwCo76S5fvDkYXzkAa
         YiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755777982; x=1756382782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EqOATe6lxC8lL+rMjGZLssQp3T91Kjl3xSz+jvx0DUc=;
        b=cGKDFw1nKsr9pcDuEf1p17b8v/Olx4qeKKouzuhLFQ/I+2TioqcFG6K1ovEIplaaQW
         0zdzC3xm042vVjaC3Yf3Ug5N9K8qVprhXRtOoUlnyeIcHM10UUwmwuo7fSwEtaLVuNnR
         hleKXi9zjLZYdZirXHLFf3JuWQiA9f1ZikIQGAQDlOvbPBeDDFZ+iLBY9Mn0hWSPpePE
         oIAyqumHzHiCXZLj62P6Q/zmDrqONA9RHhtRMUd8i1Lg9uarBwCbpMZK9ZBeJTPPM3/T
         hoBar9sWoU6KRnIuA35mj8wYyobkzvK9wvtsXSa+nCvmDeEdAxx8zj303zmY7A6HKFTg
         dZMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs8FsAZy00H+SMtYFSeuXPOOK311Ws+em+sj3cnR7UV4EvlxN58UCN9qGfnswhaalvvOasUuSf43s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYlwP0LUWFhXqK6wAcFYs8bysuEeO+1R5fdIIEHtJMRLtdf1jV
	DbNVe0FiTYpo+fSaeIg/JwHMfj9yvZlAe7pK3rkQi7TJ1+HWQwmjFY2poR7cLWXxwDx3iRHdjlk
	voOoyFpwz2JX3BoY2NF2cyPM9B7hWQeasVfNm6Ap4RQ==
X-Gm-Gg: ASbGncsDvzvJsNZat3MOf4gfR9aJ4BakbLmQJ7v0Kdu/CEo2xp0MBWZuYE3jFiUz+qu
	bXz5zell8y2p2aDjfCOF5kWYk6kdLY9/oaSat4LRHSNgRWSgvK2Pr5h6SttoADB0e72K96yPwqF
	6l4AAgPkLQzZbLSlSHNjCLkM4xgUM8EIfca8+eudJ+Q7bEM6WI7cjHxrQZLsYy/mSpiyCMCCbPe
	upBi44=
X-Google-Smtp-Source: AGHT+IGVtqYhx03rZLGlR0AUldfQFleIV8XTQ56VN7QoZ+/jtWggdq8uZGuLFW7FEnNgvU5NHrdHkWFWoRsaEWfWGQg=
X-Received: by 2002:a2e:a272:0:b0:333:be30:5adb with SMTP id
 38308e7fff4ca-33549ea13e1mr5180611fa.14.1755777981770; Thu, 21 Aug 2025
 05:06:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com>
 <CACRpkdYWNgU8PxVaxDe3F6Cbb15J5cgEV1-kgDooOHdBoXXs3g@mail.gmail.com> <5f456224-d26f-4cca-a2f2-31418da287c2@roeck-us.net>
In-Reply-To: <5f456224-d26f-4cca-a2f2-31418da287c2@roeck-us.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 14:06:10 +0200
X-Gm-Features: Ac12FXxIcyY_DhShmyxPbMRYnHac2dfkJsh4yDQXH3sgZV0u5dJUBt6Cww9nAa0
Message-ID: <CACRpkdYQa21PeAHTUPY2XRVnknnDS+v3Ci8DGyiYSdJdYVJCEA@mail.gmail.com>
Subject: Re: [PATCH 0/6] mfd: Add support for the LTC4283 Hot Swap Controller
To: Guenter Roeck <linux@roeck-us.net>
Cc: nuno.sa@analog.com, Jonathan Cameron <jic23@kernel.org>, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 6:11=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
> On 8/19/25 05:36, Linus Walleij wrote:
> > On Thu, Aug 14, 2025 at 12:52=E2=80=AFPM Nuno S=C3=A1 via B4 Relay
> > <devnull+nuno.sa.analog.com@kernel.org> wrote:
> >
> >> The LTC4283 device features programmable current limit with foldback a=
nd
> >> independently adjustable inrush current to optimize the MOSFET safe
> >> operating area (SOA). The SOA timer limits MOSFET temperature rise for
> >> reliable protection against overstresses.
> >>
> >> An I2C interface and onboard ADC allow monitoring of board current, vo=
ltage,
> >> power, energy, and fault status.
> >>
> >> It also features 8 pins that can be configured as GPIO devices. But si=
nce
> >> the main usage for this device is monitoring, the GPIO part is optiona=
l
> >> while the HWMON is being made as required.
> >
> > This main device just screams Industrial I/O, IIO.
> >
>
> Really ? I would have assumed that the sensors on a chip like this are su=
pposed
> to be used for hardware monitoring, and that IIO is supposed to be used i=
n cases
> where the data itself is the relevant information. What exactly makes a h=
ot swap
> controller screaming IIO ? Am I missing something here ?
>
> I am not going to argue about this if IIO wants to extend into hardware m=
onitoring,
> I just wonder about the rationale behind it.

It was mainly because the text talks about regulating currents and current
rush, and an onboard ADC. There is admittedly even a bit of regulator
framework-related business going on.

On second look it's fine to keep as hwmon, discard my previous
opinion, I should have looked closer and now I changed my mind.
I'ts good with some pushback!

Yours,
Linus Walleij
