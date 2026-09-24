Received: from mail-ed2-f40.google.com (mail-ed2-f40.google.com [74.125.228.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D393CAA50
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 14:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261693; cv=pass; b=Igb21+ePdk3ERI0uumMrwSAs7X1fVwfqadcVHS8eO8WJ1IiaQJc1OpARGGPQ1t9VxEPFTx7cPkZa7yraLzpkaeEDNPt4eZpqFq/ccmQSXmKdJnCf8lT4uN9R2JwKAQWW1QMxeNdSlg++fv+KB0rRN7GoY79KZwSXlfUGJNCZ0Ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261693; c=relaxed/simple;
	bh=Dw9t/OY5XtdoJNFnVnV3phV1v1Dmx6nMPDcxT0P4VfY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e7NDVRRVu1mutXyJVzWohQGmFRzbpBzysqs78WCzz/4+rxG337gxzm1HTjpBvN5wCte5bsx1JQQrTzB6AOH4TWehgzHSe/3OewN0aF27dJmgQsgTq5U45DHjT/lEwzTotS64IQDZGEUGKQMmrRrp7fx/Q7d5MtYgEDcXCzQsYIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UTGu+8gO; arc=pass smtp.client-ip=74.125.228.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UTGu+8gO"
Received: by mail-ed2-f40.google.com with SMTP id 4fb4d7f45d1cf-6a60590a85cso4390203a12.0
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 07:54:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790261680; cv=none;
        d=google.com; s=arc-20260327;
        b=U62za/Y9EXofZ9LZzfkRziR3Ffn3jDbnKcFX/DFEA+XXmu2QVglDVVyPeJ+vbC9HKc
         8t331mydZZjAXWN2ELqmkfjch0Gd8pXu4Lb9n4DBy1X28H8Kmg4qmgzQU13g0eQeR2+o
         j+4nBncb3c1sl7LjN2POg97HIOagHCmaqfYPirdEQ3GmZLmdHQAGkLo3Gn0tznoozUAx
         XAIgD7ewa9EFEJw9GwT5KdB8FMPHJJIT2jGU9smPNzCvpHNfbqq1ZUlNcZ60s42/X09X
         W959B+o34H77/sBWzrCM+A373PUJYPHetXgV8Uw0Tt2K0ZG64BYwTDDBgJf8fPKbosAg
         TBrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gpepiLaKvJaVY8RmVxqTL0FNnxS6fuyx1rW3HppHOAw=;
        fh=n/2a261la+uPrbmc4c7r4z2eJtIUM354T8haRAYE++8=;
        b=Kyk77F2u5bnUhiQ74xUAnnwLPSw0599gabLikRxZbC645dfmCRE16RyjNHMtKVVbzZ
         Bx+Z3bYnnU2qs1uQTtPP1heaZHD/y/HJ0msiWKheyFWOCLkYp13yCPszQIgux9ldnRNT
         1H4XyDXG7/B5mu/+6wXugxTi2LjdL2td+aRS6D4e/hJ+C2g8AjZQUmqygajSoWZ3qBdX
         QXy36T/mKpw5iRlLzeqDI+ujFVFWbMJweJ4+eluMjuYvub85lNhAuLNCsx/DAQ5e2LUj
         1K+pQIbm5xqEN0OksyjGiOXG5IQak/lSYb3cXZ4178GjpS5hCXReuOjy5jFvZ7jj2C6r
         Wpkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790261680; x=1790866480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gpepiLaKvJaVY8RmVxqTL0FNnxS6fuyx1rW3HppHOAw=;
        b=UTGu+8gO7vQzw58/FIe+B3HSMqc2LWDldCqly92KrtnUttvTtJd7kVyUOVBiXroTO1
         85M0zwNiTfKNEfWlvw2gcYUMAN2l1HAkyVrXvIAd00QagHKikxlFOOL17/EMTNIoNIap
         +p9gSsFc166FIfBE+ymd4jdQqtBJEqfBjGhxcbwyc5x6KdWaBui61hZgroGXMeVaNeKP
         x0uw6PZGHD3kdl5qPaNVoITiK14q+U3pdtzqG7nW10DGXIMFDVsBG4cz9evCtSmUI71e
         oHBopkJY2wcY1DSuw2we2+5GLKonSkXhTkVt1VV+CdN7gtltoy6nN2iguGLg8JIVc/7+
         0Z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790261680; x=1790866480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gpepiLaKvJaVY8RmVxqTL0FNnxS6fuyx1rW3HppHOAw=;
        b=vAm1SmG9TXrYo72ZLR2ipE7EehtZbhXV02D5kkLrkoIDK3Z1IUzU85AaDCumCrUjp6
         LrADnw6sIsPE+LH/k1YOi/fNhHXgfWWCp8neBjc4d3GfJWh2VAIzzstsvB2FWnKkBcuL
         b3IfmP1pQRr9h6hH6rxA39zHvy2RqEe1BcoYobA5wcCuEGpytfqGsZo9jBF2bN9qaKrn
         TzoGa+Tsfi1PWls2tUmVfxd7ZcH3jlHzvr/abqAQFgpGWuQwVEiOQt0PBpLqI/CyCi8V
         ylmfwXGRAMgklhUhI635SOV1oYOQkr9hAgJezCj3sAJDwwAQMFE7iewYudx6tgtPSTud
         c4zg==
X-Forwarded-Encrypted: i=1; AKwUvBwWZE0FBp0vMGOd6OD3zxnAaOzG7k791hoM35xNu6JnrCNlQ3abLHy2Ofr2WDq93Yj+OKcSafiaSm8=@vger.kernel.org
X-Gm-Message-State: AFuF++nOn5fSnunlJ3DZHhTDyVmubHf+CoKZePG+u3TWj8tH9bAEenCy
	0sBK+slGF0ZowmFE6vX0Bv4mvT3RxrWt/3g++YweLU3H8L+DYmSut+aJuP4cHfbg48gev9SqXQB
	t13aS3GVveWRCoeTmPkP1r2S6UuTT5DHiCDnarB4n9Q==
X-Gm-Gg: AYBFou1kR0MqTtHxstJt0YcKWnV34m3qmvinvEJpTMFDH0+cabYDAlecEIfmk4ZA+K1
	AHOv4pnY4KaNvh9H5JALu7YQGJM/+xsMmT8iBmETAOeKwfa9FLkRKU4009SL8U+fv1BRplaYbTZ
	V8joFJhYjbwV03N7bqsrpU9MzgkhApfTUnWv2IxO4Rpuevuh58fyN7FgC90qe/UpFTFdWUcVzgy
	A9rlq+ZbvauPPcVUL9VUjdR0qquWyc5MBXBaDBr2m4qvCIJFmohoZqTZFHAanaNS1nQcE5c69dp
	XumuGpRu3mGASO7bsToLwWBvVF69t/TDhAONOhnU5d4wAP1e+5zJJaERlVn3VXYzfssbU1ys8pA
	MzNSYbiraJfvU3Rqa/F5hQ8+1
X-Received: by 2002:a05:6402:5110:b0:6aa:932:7b51 with SMTP id
 4fb4d7f45d1cf-6aac90c8a6amr2540369a12.28.1790261680223; Thu, 24 Sep 2026
 07:54:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
In-Reply-To: <20260923184255.299034-1-shenwei.wang@oss.nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 24 Sep 2026 08:54:29 -0600
X-Gm-Features: AclHuK8a_-TqJQY1w6hSbt62KYLX7bNKh0_jYOMr-qlDR34nbomWXG0un97vMAU
Message-ID: <CANLsYkwCE07uV1fa_R3ztmErd7pSDh5_OG=-W8N5bsuhqnJ34w@mail.gmail.com>
Subject: Re: [PATCH v16 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
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

On Wed, 23 Sept 2026 at 12:43, Shenwei Wang <shenwei.wang@oss.nxp.com> wrot=
e:
>
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
>
> Changes in v16:
>   - Removed linux/mod_devicetable.h and an extra comma per Uwe's feedback=
.
>   - Added the "packed" attribute to struct rpmsg_gpio_response and set
>     "can_sleep =3D true", per Sashiko's review comments.
>   - Removed the channel node from the rpmsg node in dts layout.
>

I will not review any new patchset on this topic until an agreement is
reached on the DT bindings.  Rob and Krzysztof haven't replied to my
previous email, which leads me to believe they have questions or
comments from earlier versions that haven't been addressed.  I suggest
looking into that instead of spinning off new versions.


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
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  46 ++
>  Documentation/driver-api/gpio/gpio-rpmsg.rst  | 242 ++++++++
>  Documentation/driver-api/gpio/index.rst       |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  23 +
>  drivers/gpio/Kconfig                          |  17 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-rpmsg.c                     | 585 ++++++++++++++++++
>  drivers/rpmsg/rpmsg_core.c                    |   4 +-
>  9 files changed, 973 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yam=
l
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-rpmsg.c
>
> --
> 2.43.0
>
