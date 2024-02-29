Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E2460DD2
	for <linux-doc@vger.kernel.org>; Thu, 29 Feb 2024 09:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199631; cv=none; b=LTPU+b/AqPKa++5MToGcxZyQeCMdyr/9Vgcwk4unw3tBuY69NC3P3v0W294jfFWMUF21jqS6DLtEaB/6hLQRYZl1SlKXwT5A3RmXvJiDEPUXWlUfrIlZ+8a8yAl/tF6/kI2FCKziWDLBOHp+qW26RYDGrNGQUbDbmjpkl7+YwSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199631; c=relaxed/simple;
	bh=RyCBVNPqEW0zuUlohfUJLkEI2GPhiZBz5mwYpBOsGEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PwgXxXNUohs+zyihbXS66TbxfiPKgd7baWOlTB5vp+1dPxxREUt7zeqNXfSCWJ8iW9smx2QKg2EWCM39xm7f1nH2zg6FpWPw+Tqxt06CHpO6QGvqJGUu/2KfFDcd8ZT51k+QFOtTMsLmBvtzIvKFfZhJz4QXlSjglTJRG7Y/2Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NoB5fSkr; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NoB5fSkr"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6089b64f4eeso6010087b3.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Feb 2024 01:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199629; x=1709804429; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyCBVNPqEW0zuUlohfUJLkEI2GPhiZBz5mwYpBOsGEA=;
        b=NoB5fSkrKSan6ocgY+48JaFctszv3wGxfJInJpm3/w7juxaA2jVAFe+Tk/9D7D+VlO
         7rg9vFrwDh1QtdIeirykcHCRnPNTsNo9HEZsoLXHQpxKidhSKAXgsYX3CVB6rrr8WYmB
         TAiqBls+AVh4DL9LszDTMyK81dUOmNo4T7krWGb+qR7qgNEl+xU/MhkL+3eipI0JcJGo
         Q0JAFs8x+iXikHhB/gol8h88S6SiA/SZ4QmyWMR4vQDrCVef+iZZGlfzqP3GJ0dBZjYu
         vmn/2GSyPmBCuKDAq7boWZ6w0ehm+LrlgUXAXfueQChKt2QLCweRe4VyesezlmFQix/3
         ZViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199629; x=1709804429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyCBVNPqEW0zuUlohfUJLkEI2GPhiZBz5mwYpBOsGEA=;
        b=U5ENzU0fMGCKfTNWlvi7hTEipqqM7w3cpsuKZrEBiijkRCbhgG8E/rwN8nF9T1adKg
         N2fwY1J6ZM025zv9MAOCFDlvc1veg9hXhAFUWArJ3F5Ye8NinsfFygXGHLTCrsoSzsCy
         oLTBQpYi7Xx4VRqiWNDZlAarnyxrJ8OLG72JpiLc54joepz24TACbOfe7VDA2bgsPgAx
         o8aMc1D8T30D7WmXyP4ht3nivA2tCSB3k/+KzIv+TbXerjKdCxPaOHlc2WYRM5/QhfpM
         qt5cxCLwawwaGJiCyWKyoQUASdBPFRrFUn6siep8ChnrFM+5ERiPR20XBHOhJJMAXM/7
         H2JQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2BBYrrWt3ih5jOLVo3YIRaJfauswxjEEdixVaQHl+61KMoyBa9hX3cBdVvlvmQDpiWSqMP55FWG6Ktqpfm0o+cgJfQR70Wuq9
X-Gm-Message-State: AOJu0YzTSW1dIb8cD0s25fZARBLRbECedopAcYSvIN5M01ZUE/0kHSAJ
	43yspyEFcXa6ACMq4wj0FlUNItQLhACtpuJODP40NtgipwgT28pyxDP9Mf9ImbWjcpxh4tEg9pA
	Um7qDIOJicWg+owysUlrJoeeGIffRyd0XwRjfTA==
X-Google-Smtp-Source: AGHT+IHfQ43WG6L84XSpM9t6dnL0FXVQqnymIslzVElLx/G8H6q4X7drU3fbrlbaRUAKc2KmV8CN9kVt8zL8ZNMFCeI=
X-Received: by 2002:a25:aa67:0:b0:dcc:4a0a:d0ba with SMTP id
 s94-20020a25aa67000000b00dcc4a0ad0bamr1560428ybi.63.1709199628907; Thu, 29
 Feb 2024 01:40:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com> <20240228-mbly-gpio-v2-26-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-26-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:40:17 +0100
Message-ID: <CACRpkdb1-KH1L-ZPqzf7Y33wUeFSNvfjnRt6-YM0zxgW_4Y39w@mail.gmail.com>
Subject: Re: [PATCH v2 26/30] Documentation: gpio: mention generic_handle_irq_safe()
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Stephen Warren <swarren@wwwdotorg.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> generic_handle_irq() must be called from a no-IRQ context. Documentation
> advices on using a fake raw lock to call generic_handle_irq() from any
> context.
>
> Since 509853f9e1e7 ("genirq: Provide generic_handle_irq_safe()"), a
> better alternative is available.
>
> To: Stephen Warren <swarren@wwwdotorg.org>
> To: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
I leave this one off from my branch, Bartosz can apply it separately.

Yours,
Linus Walleij
