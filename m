Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3A167C63
	for <linux-doc@vger.kernel.org>; Tue, 20 Feb 2024 11:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708429335; cv=none; b=PWLdXSOw29NNl0xLxwZ0zrTrlByIO/o4HDPEMazQe0Sv7foN7H+B/kzqIqe9wkv+rBN2qgclxwLNqi34S6VuNoTmHOlygPRk2H4hivvwQMB3Ypj8T6vQiFrzjGN4ql9vD2xwERIQMUYYGfoOvuulqmCHnpRsln66iVMymXkt5ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708429335; c=relaxed/simple;
	bh=ouR2+vSQw/fSXVao+thlbu3IjNZ33JoflBcFWY3O8Jk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fptmu0qH8/hqeBXBwKwYM5sMpNlve969YXsI8YYiqDtBy/Yk5DEYYbqLZMFUyfXFmZc5WxnaYW5bOpp7Esb/AJeNO00vo97yQO0l1XIT91h58cmhbeVnZmQE+q066d2tggkiJMfbNNvEVrcSS5BVMaM67CL/BspiYWM7tvwKG+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zqE1ULDu; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zqE1ULDu"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4cea831ed57so263091e0c.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Feb 2024 03:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708429333; x=1709034133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AsA1IuJ1QgZr3RxDT4dHm54eEdxgfhuTT8X+jj/Chbk=;
        b=zqE1ULDuEYEjsylSbBQU4zhm/yArJK978TWf3jKkxUIiwW5XiToMdRgkqF5hQseidX
         X3CR8GsFEQ0TGEjFOcy8zD+YZiCuWlMueyKy+fSwE+bewsc1p3J6GFl3HbOgxtaOP873
         gXZqAp31rH8PhkH3STA+0P4iXoV4VTXjxzYmC+K02khLFBWjxqqIJX9rL7hYB7ly4TE9
         hrdFwL016oeDPcfNTSr162fURpO7aevF6oQCcLhfGy6K308RegpC1lEDxoVLdCnKbjUc
         C4HJnNTTFouXjmOBbp13A7XO4aTETwMbgGooBruF+9+TNDE3AfLLcroXBSEUHuPntSiL
         rIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708429333; x=1709034133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AsA1IuJ1QgZr3RxDT4dHm54eEdxgfhuTT8X+jj/Chbk=;
        b=L0yc5YY5NMx3nNTK1SS6kuep7GAKkdDgI2S7XgL1GUuDcUeEypESyDpBBA5NaFypRk
         AFM79mbF4QJMHY60UOUkzvJGRCApWxeKw/9FUjDAbXAP83VsHxXKiCrVM9gnyJEsvWEN
         0cnCWFhbbujiB4Um7LtswK/M0DTkK48aio91aNJfDxFbGSP8Asj3w5DsWs+4+qrK84ZG
         padfTKXVexnCZk36el14cON7njfPZ4Xqvd82oG+nizBA+W4eLq9HOOKA0DB4rG+qBK2I
         WqQL/YEBpmEAedCU7HVB8Tse3E5ZDoH7deTMcmegUcacVuGVE7Oqur4la7F55EfdQBEM
         3jRA==
X-Forwarded-Encrypted: i=1; AJvYcCX6f8nKYD97ObN15NAtBnw3hk1VTdF1N0NR/QEO0iz0ZvqaASnPyLDb0G/kCAttj0F13Gvkq6ddcF+Ol7ebJmevblQvUShp07Ot
X-Gm-Message-State: AOJu0YwoXcUs1NpL4xP82gJAZH4gD9RkI47uLKME9RU6d+Tcqi/c0Epa
	Wcv5XXF3lgZuFeddZ1w115wfXJH+wwTxuz5am5k4GcYDvsXQ75RqUj9P+v7l1NPA/hU+6A3LGY6
	vWLj11B0L31650wj0g3V0XeLd6XzR8rZxJh0unNlwsZe2YwFv
X-Google-Smtp-Source: AGHT+IHcllRQy0QvMPlfXyC0j4mq7HZDSa6oNk423QQzmnQONpsBgUoG4iBcidN29kecafPXzp6gdVs8vJxKCKzoCyQ=
X-Received: by 2002:a1f:4b07:0:b0:4c0:2182:3cdc with SMTP id
 y7-20020a1f4b07000000b004c021823cdcmr11701946vka.1.1708429333138; Tue, 20 Feb
 2024 03:42:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213160522.37940-1-lincoln.wallace@canonical.com>
In-Reply-To: <20240213160522.37940-1-lincoln.wallace@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 20 Feb 2024 12:42:02 +0100
Message-ID: <CAMRc=MdoUuOLTYHu99+c_AVhnDZ5LkKHkYJ0D681fcJV_aW2Ng@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: Add a note on the deprecated GPIO
 Testing Driver
To: lincoln.wallace@canonical.com
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, corbet@lwn.net, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 5:05=E2=80=AFPM <lincoln.wallace@canonical.com> wro=
te:
>
> From: Lincoln Wallace <lincoln.wallace@canonical.com>
>
> A deprecation note was added on gpio-mockup Kconfig since v6.7,
> update the documentation to inform users.
>
> Signed-off-by: Lincoln Wallace <lincoln.wallace@canonical.com>
> ---
>  Documentation/admin-guide/gpio/gpio-mockup.rst | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/admin-guide/gpio/gpio-mockup.rst b/Documentati=
on/admin-guide/gpio/gpio-mockup.rst
> index 493071da1738..a6424de925da 100644
> --- a/Documentation/admin-guide/gpio/gpio-mockup.rst
> +++ b/Documentation/admin-guide/gpio/gpio-mockup.rst
> @@ -3,6 +3,11 @@
>  GPIO Testing Driver
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> +.. note::
> +    Since kernel version 6.7, this method is being deprecated. Prefer us=
ing
> +    Documentation/admin-guide/gpio/gpio-sim.rst instead for kernel versi=
ons
> +    newer than 5.17, which is when gpio-sim was added.
> +
>  The GPIO Testing Driver (gpio-mockup) provides a way to create simulated=
 GPIO
>  chips for testing purposes. The lines exposed by these chips can be acce=
ssed
>  using the standard GPIO character device interface as well as manipulate=
d
> --
> 2.40.1
>

We already have a note on that, thanks.

Bart
