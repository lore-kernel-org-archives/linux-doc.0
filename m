Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0BA2750FE
	for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 12:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605291; cv=none; b=ji/0/ezefJaBKRluufJEa+LRlySpixoEijLeMsZBAWDOts758QvYVgxAOi6SvAeyc3Sit8/fkfQGhzEMi4cWQ1vPp1jZymR+lBg0/505Ilpd4NVNnDcTdNvVPIgv+AUF0bt9CKAWZwJH4eCyA2cXdclHzqe4GIWw07SMOxZqO7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605291; c=relaxed/simple;
	bh=jvZ5D7tp1bVrkSUr45nSTmELa6yA2IKS5foYDag26Ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uqHbXQzwL+cZOHAUvBZjHqu6CAZWsUtcXUEpY84RgqQtbsJIR6/IjKTl1Y58F0dvG5aigbnKC3BAVEnQbrxqzuP98iNZ+6nSib4PdUmzMP3A0M/I7nZr764VGSD5f0Fzo/e07cVrDDfIPrqpi90XP7RrchC6PUEGu1OlvR0y2S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HqtQGYmL; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HqtQGYmL"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-333f8ef379dso43354801fa.1
        for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 05:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755605288; x=1756210088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvZ5D7tp1bVrkSUr45nSTmELa6yA2IKS5foYDag26Ss=;
        b=HqtQGYmLKfsGMRc0jArKSeCknNjfKDAphbDNjc+pJdQmhWPclMMbUQqnW9ypy+dtwX
         ucD3pKYlRFucYlWFdNdTGrtvIC5diDQuGEHRR4vFdtIf5XZOGV9DSqgOYVkjV42EEasF
         3gDInV/jXXFF8HR97OmVJTi/927z4dcjchdRNDWUbwLYYje/ExhoAk4yu/h2gjJzSb1U
         IpThk7soP7cbksjzaf73PiV4ZNDl56r3Jy4ZlPxIkT53sZ5LIMQfKL9oP6CUyTo+EoZ6
         pIOZ1KEVleP/008KlBrjOKUQmDWEWhwvajcWiaHoBLBxryFNcF4NXh3srK23yQ2pPX5u
         83Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605288; x=1756210088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvZ5D7tp1bVrkSUr45nSTmELa6yA2IKS5foYDag26Ss=;
        b=PENFlyAq7CBfBXrmkBYKd8PdFtNl2r5E4lZhwVipC6itRTWTSr58jhB4zda6oCiT+h
         E3wR/bmk/VL+mdbolCZ7uxRtoofrOFmxexoWS/GhS4VvD5l1CvyI8vjq1wO33NxW7SJt
         xUWcaNFHK8STCmggriwE5XxMJ0Epq3srRkXjxOD9BaljsJNs5tVY3EstwFyuekHKs7VG
         PRPcgHSqWear7tWIVOKisJuJM+rMV9lKOnS66Hqu2H8A328xuX1kzE85eMiQWyxLKib2
         dagvSCaYONdBgbfOgaTqM+Eo3qTE3FULpnZJtVtT4hVpYXOd4pPq7PqLh1qYE9nz0I2y
         nN0g==
X-Forwarded-Encrypted: i=1; AJvYcCWKSew3DDkajP+YvAYI736wAvwf6HledgKqSm3k5SPMD2PfDWFqTsg6hSLXJWSloBrbReQNaq4y5RY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0UqOlketP4SeHgCbE2C9Cx/E+kRb9mgIUldh9GXme+j6OUGbY
	LViFvsGy0RXOcy/wmT1sIyR44DVijAwrYwydmlrxUD9jyyz1GA5x850vO/UyHa+XvypdHbnajiL
	YrXgGpvYHeaVkEeunT2DTueDu1Z96QfFxjImgG0M1Zg==
X-Gm-Gg: ASbGncuQFTOx5rt0eLlmwujLH0cypXNbI+gY+2orYCkZR4v1nT7JHGGqkk63yKMpwbj
	/XEkHrDW6d3JiH2hEtWe5S6ku0FamSs71assBvahkZr884f0D4A0uxS/ncVKpLAWGgmI969qDPS
	HwePaFjHigWKcxOxqGYacSHUK7nse0ml8mQq5RihOTsRU85HsKRYHedK1V+pd+tB3Mm3ylUth6z
	HbmNgk=
X-Google-Smtp-Source: AGHT+IE3dfVYJKWXUrGRuEJA3+o6pONVlCs6q8ohEH3Jv0GLPiiwaO39fGyN+yXgfnlDzLQo+oRUw/tQcalr7ak4IWY=
X-Received: by 2002:a05:651c:516:b0:32b:533a:f4d6 with SMTP id
 38308e7fff4ca-3353072e501mr6155041fa.34.1755605287796; Tue, 19 Aug 2025
 05:08:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814-ltc4283-support-v1-0-88b2cef773f2@analog.com> <20250814-ltc4283-support-v1-5-88b2cef773f2@analog.com>
In-Reply-To: <20250814-ltc4283-support-v1-5-88b2cef773f2@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 14:07:56 +0200
X-Gm-Features: Ac12FXxaXh8IRrmO0qiQXEL9cXb2hqgOSqLusPCKGVI2Xon1ujnlah0xogXM2EI
Message-ID: <CACRpkda1E=2rCK+vt588FRJatrASx+dDss6HMX4NGoTrL=4mPQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] dt-binbings: gpio: Add bindings for the LTC4283 Swap Controller
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
> Document the bindings for the GPIO controller functions of the
> LTC4283 Hot Swap Controller.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

(...)> +title: GPIO LTC4283 Negative Voltage Hot Swap Controller

This is a weird title. What about

"Analog Devices LTC4283 Negative Voltage Hot Swap Controller GPIO"

So readers understand:
1. This is an Analog Devices component
2. It is GPIOs on the NVHSC not a GPIO with NVHSC

Yours,
Linus Walleij
