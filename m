Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C11612F3
	for <linux-doc@vger.kernel.org>; Thu, 29 Feb 2024 09:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199887; cv=none; b=pFwP1I8axdSr9Su8Wj+pGjyxo/tQVPNmIfMdBYy2iXfZFf2peDN2mbt9RMTJxKEbwnmC5FnYhoGuIk00U/4cGbmYIoV6YFdy+yNm3atGt1pFwVgtR4mYZdXI0/ZpXklt+PO7GnuxwpYz15unObsvkPJsN699+qlmyqCYJxDiM6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199887; c=relaxed/simple;
	bh=6K0C69v8aY51x+51DR4S1y5FfPh76F89vxnIkCM64Fc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QLApTl6giG+knMf3TYhvBLGIumKKkrGbj2obvWOLDhE7JMwKzlG29wrJcVzOs0cfAmp7gKkBte3qpGixeTwcwPg60Png4Sk+1pN9EZ2/qFyPDxMeUUURedEZyn3QbaVoegOaIzfXxrtriy422l3BJk2REoedewBFhF1B3un5tRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t+50Fwdf; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t+50Fwdf"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso792842276.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Feb 2024 01:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709199885; x=1709804685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtGe/ds1ZRlsDzPhDzq5vY2M1N8N9oZVvQoi1ym4DQk=;
        b=t+50FwdfE+URjGigg3CltFoEYEGxSFwhYFI4KJHK1sRFAdBN/QbCAVBZtWWe/rwlfq
         buI4lWvF/G7e+8Snre4sjNj9wzKVn0AkqWlBw5UTR8IpVeaZ2CK5CLSwE1oSYI/jIYq2
         IxxN9pR3s/Y+1Y+HkKuIjUbz/FVlxsSp7Sh8wIa9jiyxqqubgv9H0r5c0B0sI6r3qH2h
         UdPzI6NoWLsnBfJFvMiOqbdeG1a3UVkOy/opGP6JcuUqie9KJioRYSii/axy8/8mVqgt
         XTMpZvIAil3vJuCYEM7BIsPNqrDtelAh/5yyCN0GzazpLijL7WjbPyLr7EkBbbYB8Abh
         tJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199885; x=1709804685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtGe/ds1ZRlsDzPhDzq5vY2M1N8N9oZVvQoi1ym4DQk=;
        b=GRPycKYh003/plssFB8wNVBFTFcFpgaI4oE0qLrlKfVuDV4a+YKgeMOk/4M0I5Nluj
         neyaiW6S1N7ZRh6V1LNKmUZAj74sgtLBjwqwgUkDQHDgplWbyhOeaVmY37ytYCm+IW2u
         ShvFy1E12Eh9l4vakzaJ4sIsG8Pbre1e0SdRgBiOPuQkeqL+bBJS6uhF6P5vf5Gdb1tB
         h+C2LPuYdJtbFtTnLHgpeB+RvI6xpKVZE+FIMPxelWvugDYf4Y8i6egoyecgW4MDgp9B
         HADQdACbvyXiXpalHb91wJqdeR7erMsYyB153GOY6ha5GQK478JGFLvzSAxhvXoJzcQk
         bjKA==
X-Forwarded-Encrypted: i=1; AJvYcCUXnM69YpOx7fbaoepkY0LyFtIPoym6MOwHacGBQgt3J0ft4SpbTEswuB9ORbpw0+lST3bOsMqpCjZVrNx+PVy5UnT5wMbRVmD5
X-Gm-Message-State: AOJu0YyMs6ChCb4dTolpiQZO9dTHkvZ3iWxsmUGXi0hQjHZ8gBcKJEd2
	8AI0dPgce/Q/2IcmJmv9ecGr1B6S0zgNDZtbawIxIdu6BfgAMKIGNj+uIiOgom3vP2crEp6Eob1
	oavUF1sXTd04peRLcvh0R/s4pj8Um2Y/tyeNF7Q==
X-Google-Smtp-Source: AGHT+IGbChf405oU9sCbujzjSA/cHfa3590PjMRDmzrZOTzMB7BN3TjSi37+bplsHq5uUkE5RbjhcMUip8MDonqNbgI=
X-Received: by 2002:a5b:751:0:b0:dcf:3f11:633a with SMTP id
 s17-20020a5b0751000000b00dcf3f11633amr1588471ybq.35.1709199884731; Thu, 29
 Feb 2024 01:44:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com>
In-Reply-To: <20240228-mbly-gpio-v2-0-3ba757474006@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 10:44:33 +0100
Message-ID: <CACRpkdbK2Sa_4qp3VE0ivHP8W6F-QDkuxV-XnZYviAkO5ZBMsg@mail.gmail.com>
Subject: Re: [PATCH v2 00/30] Rework Nomadik GPIO to add Mobileye EyeQ5 support
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:28=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@boot=
lin.com> wrote:

> This patch series reworks the Nomadik GPIO driver to bring it up to date
> to current kernel standards. We then add Mobileye EyeQ5 support that
> uses the same IP block but with limited functionality. We also add
> features required by our newly supported platform:
>
>  - Dynamic GPIO ID allocation;
>  - Make clock optional;
>  - Shared IRQ (usecase: EyeQ5 has two banks using the same IRQ);
>  - Handle variadic GPIO counts (usecase: EyeQ5 has <32 GPIOs per bank);
>  - Grab optional reset at probe (usecase: EyeQ5 has a shared GPIO reset).
>
> This GPIO platform driver was previously declared & registered inside
> drivers/pinctrl/nomadik/pinctrl-nomadik.c, side-by-side with the
> pinctrl driver. Both are tightly integrated, mostly for muxing reasons.
> Now that gpio-nomadik is used for another platform, we loosen the
> relationship. The behavior should not change on already supported
> hardware but I do not have Nomadik hardware to test for that.

I have queued the relevant patches to an immutable branch in the
pinctrl tree for testing and I can also pick up some ACKs if they arrive.

When I'm confident in the branch, I will send an optional pull request
to Bartosz for it!

Yours,
Linus Walleij
