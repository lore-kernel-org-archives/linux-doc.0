Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2840160790
	for <linux-doc@vger.kernel.org>; Mon, 27 May 2024 14:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716821707; cv=none; b=ovPec+q/Jk9PLY4NBeH2jxv9XS+2Lg9gD/RQ7TEIujugCe79rLhpniCi+aYrUYpeH4q7hwkCJWY8p/gL5EkE3npe/REHMZ9EnAH90M2A+ATSLRVZKA06eVjNIJDBfUFgNR2UG2tLO8f7tcG/IM8tNcr8AM8EgwWMwJNcNsgpA1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716821707; c=relaxed/simple;
	bh=5TD6+fP9zGBVCkWnjvWQY4Ucu0QI2ucP5yTRATx+ATE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zn2Kedne2RoyqY5ULQI4jtTydlGmVODLbloKe4fDjy6qyOPo0bjpsD/r/TSgo38jDEZ0lbSCRc5ZDMKp/4jCAQAOGFLBkff2sp79AAdEJIkgfri6L9x8MfKNYobHm6Z4xBKjjmlZFgVNOVExyXXyIlkwuA/5FDGJ9yj8ht2v+oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FzN2KyoQ; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FzN2KyoQ"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e95a60454fso34533521fa.1
        for <linux-doc@vger.kernel.org>; Mon, 27 May 2024 07:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716821704; x=1717426504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TD6+fP9zGBVCkWnjvWQY4Ucu0QI2ucP5yTRATx+ATE=;
        b=FzN2KyoQRXGJ5PiqXT8HuzkptLZdyml+tDdNuAwiBFtsZJXifQR1IaF+h2pDadjYgj
         HA98Q25DbUir1P8Em96kIycOto1xILQeTE3R1RgjwABHQ8RlI0qEU2q2XPTfky8u8blx
         q1yoijWX42uapWS/sybfs7AzOSM6ve+HCAywljseJbFSOgNtNljerpatjDxYXkRPxz10
         T6/WLRRpysk/DKjktBXzFaiDxidKp/hatQkXupKH63AmNBm9RsmomL0L4YF3/QoGQN/O
         xPgTCo4YEhReoMb9EF5secNWEoNxOnVb2gs6G1tbi4l6YJxAreGuBfPavlKFk2K+QYOZ
         72lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716821704; x=1717426504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TD6+fP9zGBVCkWnjvWQY4Ucu0QI2ucP5yTRATx+ATE=;
        b=PCdETWcOOYuZAHGhqtBG0DkKdHqiKCcoLXYcRL2wox5hOw6WZc3+5ieVkG/P4DuR7m
         Rlg0YGzCLfrprDPPheA76ysfB1ZUU9DGR05luXsAZklYgrLLC0t/xzdDmQz/sGPFpmHs
         9ReeGXYzrIluJYlXnaNxTCDRTEEjE0SYdTc4MyDZAArX8dQlbhJbU97uxbCHje5OBDJB
         5OOXN3wQF0QJhjACy0zhTgG1jGGbI2ndvJaREAe81x6Nq+T80VlK0Pwa0tO7DyazAIVL
         eeRQxpKyp63oxJgEitcYWH/3zmDn0PMB4KyYfLW/ph/eVNadsFG++4vuf44WJPxc4e6T
         eHMg==
X-Forwarded-Encrypted: i=1; AJvYcCUMnaiWGVIqYJ0OjVlk4+pRCQRFmnGriblyS7QnefIA4eJ0lXGP8g2o9Cbb2TWmg8aNXNLyMRiMpWUfg7KC4orZHjjL/Y8GFDEA
X-Gm-Message-State: AOJu0YxK8ZzgVj9kpJfPtvIjLqKq5B7rrsgxLZPc5qH3BnAIE4R0tQTG
	6V3cb7MigBzeJfaZ2HKPNA3FuYn/f+jYUUkquXah8lINwSgf6B790elMgG8pNupODRJtsn8FunJ
	18ajO1EoISCn03nRwsIDmOk6vufnvFsMeQBYzSg==
X-Google-Smtp-Source: AGHT+IEWEP0lfG2yK4OCOQAmDalN2VIZFxrErH+r4nSQ8/qZSUVrTMLkXMTAMXvfbr6eAaU2P2kpvtmtsnGulk2HYyo=
X-Received: by 2002:a2e:a0cb:0:b0:2e9:4c17:9c8e with SMTP id
 38308e7fff4ca-2e95b2d04a2mr63410011fa.44.1716821703725; Mon, 27 May 2024
 07:55:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240514041223.800811-1-foxhoundsk.tw@gmail.com>
In-Reply-To: <20240514041223.800811-1-foxhoundsk.tw@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 16:54:52 +0200
Message-ID: <CAMRc=MeuHpu4_QbgW-6Kc-TGzhcBim7Eb-TZhPax6G2SZHR5iw@mail.gmail.com>
Subject: Re: [PATCH] docs: gpio: prefer pread(2) for interrupt reading
To: Huichun Feng <foxhoundsk.tw@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 6:12=E2=80=AFAM Huichun Feng <foxhoundsk.tw@gmail.c=
om> wrote:
>
> In legacy sysfs GPIO, when using poll(2) on the sysfs GPIO value for
> state change awaiting, a subsequent read(2) is required for consuming
> the event, which the doc recommends the use of lseek(2) or
> close-and-reopen to reset the file offset afterwards.
>
> The recommendations however, require at least 2 syscalls to consume
> the event. Gladly, use of pread(2) require only 1 syscall for the
> consumption. Let's advertise this usage by prioritizing its placement.
>
> Signed-off-by: Huichun Feng <foxhoundsk.tw@gmail.com>
> ---

This doesn't apply on top of gpio/for-next, please rebase and resend.

Bart
