Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A7342EED5
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 17:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785517894; cv=pass; b=KIioxH76xbAGJR4lxut+/tvJj/zMFZbeAOC+2elurQyPAeLglphivL//pNqSc+4/5za+iNGI4Bnsh/5vqYPsKXlln5iafP36ql779Jv+qpPj1yCp4QQ99WQLzgmzHOZjVQxuKtBr+j5trBdXPOiwB7Dqu5OWWCWZSnEShyyjauE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785517894; c=relaxed/simple;
	bh=Uhh8q41hmOlByjiX1nPXF362Jh+d49ZbfzvIl+Q5Sug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWybf2tCwfvfT7Dnt1nYnnS1W12FXvrbKb+q7jquhyfljGxt5Vx7mM2lVWQC+7/RcOxf8NRYXmb8Tqzkl6sQ2lD1jrKJxFgUWj6Pg3j4fb50wiMs0E4cEHSJhUuO27rOS1FYB/sdzwAlQemx3+TP8OEBLoZtScR04hHWRtNiH2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Exy5EQ16; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Exy5EQ16"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a07a051a81so2225594a12.0
        for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 10:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785517890; cv=none;
        d=google.com; s=arc-20260327;
        b=TF7zASMpvLKmCBEuHB1hDyznRysP8gkUWjXNk5JSpCzYPlgYPlgJbWtDD/pdvXc46U
         mBxJos0fTni1muX3/A04ZwXGk8T3jzM9vNR2isf8r4qOI7UJtmhKvw8gyE3v4EckJiRk
         0Dh8MfqeAvYiLZIfnf6oNm2/6KxiI3GrZkDKA/E89+mnkcWnK8kVlZKqzOK6MALyqiFi
         RPDxdUPM5O04Wpl70bsPGyU+lHxefiEz6Ar53E+KJHWC7l47N8+mrjUoFNIoWpwY1Z8D
         AMVDWvqtTs2yYAdeyR3n1cccArxv/2MdWjYHl2cu6vYviFNg1nPWcLfDbntmqP00v4e9
         Ygmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tfzdRxKMzAqp/+9ZSx+vlyqKp24vqwGUERSU+Y5G+a0=;
        fh=rPUPyANbgKJqZC037bicoUpowe883C2U00ErjTdy3e4=;
        b=SV8v0IhtETTOWj5/9bhXJtooaqbAKwo9hAh66MnJqAkfDFbQPmkg//Jzi1r29yAF2N
         hMMdK0XXOGAL8qvAtyGT9YenTxIgH4FMyLgt5RRiqNyB/DBIQXvJTXSpSlvVoPdOdfX0
         GEpSrfaEA68HxHZ2pD6/xypyOliV/TmhoPGse2DQXp0IW2l9iin3xoW+fRVDqDg5jMW8
         /8E9Mf5CwGyk8SYrYV7oPmE1Z/vDWjstcomkfTp2Q2PwF6M6T9XRWqTyMeSgT7tpFQ4o
         aaMOP12Z+i0p/B7mR8mNjcQYojEv59TA2HL/E1M++glusyqOdWhb4rCtFtf8Yhs2jqJE
         EhRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785517890; x=1786122690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tfzdRxKMzAqp/+9ZSx+vlyqKp24vqwGUERSU+Y5G+a0=;
        b=Exy5EQ162dvgPIB46DJfZCIj898OhNHYTDXIQagaTUngdPry8jW88hSxi6aVeP31S7
         YzgozmElj0AURbi6rlolpsPiLByD3Dd4Ii6jY6wqjM621Fqqa0b22PEBuASgo8mAw4De
         q9L3mNgaXd9xOA1YKaScbjzyuSCFbwu3UiiXTk2ghLdVxl1k256wj9vTvGHuymhzwrX5
         N1QWFADLLAUwVNfVysAJrQvM98upHj4eMDVgmRkgOseJP/GEExxCmGqFNrQL6nBDdWuh
         5q9mOh7bcYV0Wbl5Q5V2ykhADYOUtuUfmzcCHvOZ5sPgDDKDntg7uK7b27OmDy1F3uAo
         XHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785517890; x=1786122690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfzdRxKMzAqp/+9ZSx+vlyqKp24vqwGUERSU+Y5G+a0=;
        b=Y67clRcrW02Bw6Vs6KG9nOnkq8mH6so0syllUQdOOzqMHH1Bn8OmqjLPn1amHGeZ+/
         DEfqjTqVNltmUfFlhD0hdznsAEV4XGrMUBcnqV9k8+VDGm4XBG5OPpw93R41KWXkxfZT
         GAprl+H6AF7i0bFKWmmpO6/UgpGdNPcNqAPNRLxonKhcJLCHTKfYDElsSwZmSkv11bAf
         4QtIZ2OZaH85FXJrVg9uPY0hi5T73MM0zB/cJf4UKL6JQ/0BcBkPDAFz7uGnW2NMRaKJ
         lRgMjqR0IqsV/wWXPL+vfY7Y/IBXvVmMO+T/JcbTjbc1gaXv3NLg6U9n5/2LaW1aUKK3
         6ccA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2VZCMHpb4wsvqLcb668wqA0cfP7TjSGpFFJAXzLvTW7Havz8jYXCqlWgxgAtr2SSicvsEtjxlpAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAkq+mXDlBAXIFqsOM5v8MRzSU8dC0FfzINLEhuVXI96p5g5vt
	MxHCoyXfisNUWDUX8dxBFmIXrOtuP2gkQHhbbS2ehH+u5XryeAJwu6ovf2fr/zZv4SBA7aGCpNk
	LEsfrE1I8aspVMQqACw+T61OCmHA8UUXlZR4EZR/W7A==
X-Gm-Gg: AR+sD13ufnasMSi4UOCloeV1GUDFoRi3HYxWkxB5he5flA0vZT8yguld9T+UxV67KAx
	duJ7y/QXrybc7oafh7hNh5BWjPEwxZu17rUcAljJuc2dWgduK1SS6HvSio7amr0sr4oipTvSzsX
	N31DKPQ42jcSaZHFe2SsPO8MKOdyYk5x02aeBRpvONAVo0V9+7mBONB/Z9JD9BARw2kcFGFxOvI
	B7UQEbJFlDFaqxNDxxjIplsOu3lNJ2p4ydaPgmUVE4PXrEnthZTS2bwHhAUG72wsqyj11D0j6j9
	N+A140tBcLjG7/WNPBWFES6ZWSxLQTzWYTZUIrD6VCA/V5O8yGYT5rWmf6DXQcYa1KQ5ViVNVtW
	PaWJEwt3tWlpfoQ==
X-Received: by 2002:a05:6402:449a:b0:697:de29:c802 with SMTP id
 4fb4d7f45d1cf-6a0a7ccb364mr275774a12.18.1785517889487; Fri, 31 Jul 2026
 10:11:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
In-Reply-To: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 31 Jul 2026 11:11:17 -0600
X-Gm-Features: AUfX_mwyptmYyOf4p0ZyWTJXkdByXi3n4edVXueGHxTjG-w_nq_PAPMefUUmQKw
Message-ID: <CANLsYkyJ=qOz_7x8igcwkiHsJQWP8JizB4-q5QV5gv-s+e6eVA@mail.gmail.com>
Subject: Re: [PATCH v15 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: Shenwei Wang <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I won't be able to review this patchset until the week starting August 17th=
.

On Tue, 21 Jul 2026 at 14:48, Shenwei Wang <shenwei.wang@oss.nxp.com> wrote=
:
>
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
>
> Changes in v15:
>  - Update Kconfig description per AndrewD and Julian's feedback
>  - Enable the GPIO driver even without a DT node per AndrewD's feedback
>  - Update gpio-rpmsg.rst per Mathieu=E2=80=99s feedback
>  - Code cleanup according the new gpio-rpmsg.rst and sashiko-bot's review
>    feedback
>
> Changes in v14:
>  - Update gpio-rpmsg.rst per Mathieu=E2=80=99s feedback.
>  - Align the rpmsg-gpio driver with the revised gpio-rpmsg.rst.
>  - Modify rpmsg-core to enable prefix-based matching of RPMSG device IDs.
>
> Changes in v13:
>  - drop the support for legacy NXP firmware.
>  - remove the fixed_up hooks from the rpmsg gpio driver.
>  - code cleanup.
>
> Changes in v12:
>  - Fixed the "underline" warning reported by Randy.
>
> Changes in v11:
>  - Expand RPMSG for the first time per Shuah's review comment.
>
> Changes in v10:
>  - Update gpio-rpmsg.rst according to Daniel Baluta's review comments.
>  - Add a kernel CONFIG for fixed up handlers and only enable it on
>    i.MX products.
>  - Fixed bugs reported by kernel test robot.
>
> Changes in v9:
>  - Reuse the gpio-virtio design for command and IRQ type definitions.
>  - Remove msg_id, version, and vendor fields from the generic protocol.
>  - Add fixed-up handlers to support legacy firmware.
>
> Changes in v8:
>  - Add "depends on REMOTEPROC" in Kconfig to fix the build error reported
>    by the kernel test robot.
>  - Move the .rst patch before the .yaml patch.
>  - Handle the "ngpios" DT property based on Andrew's feedback.
>
> Changes in v7:
>  - Reworked the driver to use the rpmsg_driver framework instead of
>    platform_driver, based on feedback from Bjorn and Arnaud.
>  - Updated gpio-rpmsg.yaml and imx_rproc.yaml according to comments from
>    Rob and Arnaud.
>  - Further refinements to gpio-rpmsg.yaml per Arnaud's feedback.
>
> Changes in v6:
>  - make the driver more generic with the actions below:
>      rename the driver file to gpio-rpmsg.c
>      remove the imx related info in the function and variable names
>      rename the imx_rpmsg.h to rpdev_info.h
>      create a gpio-rpmsg.yaml and refer it in imx_rproc.yaml
>  - update the gpio-rpmsg.rst according to the feedback from Andrew and
>    move the source file to driver-api/gpio
>  - fix the bug reported by Zhongqiu Han
>  - remove the I2C related info
>
> Changes in v5:
>  - move the gpio-rpmsg.rst from admin-guide to staging directory after
>    discussion with Randy Dunlap.
>  - add include files with some code improvements per Bartosz's comments.
>
> Changes in v4:
>  - add a documentation to describe the transport protocol per Andrew's
>    comments.
>  - add a new handler to get the gpio direction.
>
> Changes in v3:
>  - fix various format issue and return value check per Peng 's review
>    comments.
>  - add the logic to also populate the subnodes which are not in the
>    device map per Arnaud's request. (in imx_rproc.c)
>  - update the yaml per Frank's review comments.
>
> Changes in v2:
>  - re-implemented the gpio driver per Linus Walleij's feedback by using
>    GPIOLIB_IRQCHIP helper library.
>  - fix various format issue per Mathieu/Peng 's review comments.
>  - update the yaml doc per Rob's feedback
>
> Shenwei Wang (5):
>   docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   rpmsg: core: match rpmsg device IDs by prefix
>   gpio: rpmsg: add generic rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
>
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  55 ++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  53 ++
>  Documentation/driver-api/gpio/gpio-rpmsg.rst  | 242 ++++++++
>  Documentation/driver-api/gpio/index.rst       |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  25 +
>  drivers/gpio/Kconfig                          |  17 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-rpmsg.c                     | 587 ++++++++++++++++++
>  drivers/rpmsg/rpmsg_core.c                    |   4 +-
>  9 files changed, 984 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yam=
l
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-rpmsg.c
>
> --
> 2.43.0
>
