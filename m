Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616193EE1E6
	for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 12:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948807; cv=pass; b=ENJi9G9Sh7J2J6RSCtGm9/WSoZu/EusnUmX8uoIx90z1zEgiTV5j2viw6d/tLACr/MxgvIeBLY6Id1VbefFcrX/5bgFrk2a57YlChXAQwGVoqZMSijOgUCNYzzfGYb+fTHRfkKoX3R3UEoL1UQ2IGlqz/RKELjNAd7/iqt254zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948807; c=relaxed/simple;
	bh=F2lKZ/qSN6SIkBL+rAQMZomA6ldD6Jeu1f52cfpnYWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EqzNgN+oE88kgkL4eqti+2d7TXg/eyGk2xvUzKpF2G7zAK1QkdwZnN1ieHt7VinAQTxgjkzQpRKlvAn3I61ItwMav3DkUgDC30Ig/9vkbJdRKnOthZXfv6Cp81kGRcccUbnc+mDVOV0VLF9AwSahUYpR9MbhQXjRvTCfpQMdz6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ASlwJzSH; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ASlwJzSH"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8f97c626aaso119697566b.2
        for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 05:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776948804; cv=none;
        d=google.com; s=arc-20240605;
        b=ku8nUV1xgIjedBTYWmgUfNSCsmxkNR1JnaD2QqyTBbmv+5dOjo2JpUakb5G8Ja3A2M
         +CjAHUN7Ezv6Ez6/JRwxjmSbMseYtlF84O8pLe9/k9nrzdvfQ/TYBPiRN7R5Hkkdr0Tb
         WVofoCkjiz/AaDoLphK06NzCvE2PgYWlH+dwISF75jJnXrkzj7lxlHZpMAgnquQoEg/1
         2XACnvWzID5gCkga1pNRN2PtSqhl89iwpC7Xs09FiRRy2YYfQXU+b8IIxCuhKQCxg+zQ
         xslu15dR4zY/HKhIprJa7FMpvNRFOv3CrBQaDr9bst6IE1lY5AhRmKGzWAH7qGEkqoX3
         Q3xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PlOMd/0NtPo9HHMlpt/ZRLGSP9SrMcpTUqdlgaR2uVc=;
        fh=6FY6eoiIFpI057m9CHA5YPMMIiguDSqwVdHE/XxVQuE=;
        b=Bj3ST0TJ9bb7v1jYR+V9vplNcewCIFR98XTULAfoGHCqSO7SXxCtKh33dIwofm5/b9
         tO0qCfx+pl4RwWel0Drmw+MMWInY4b3iKJWFuNgpuww9MqtuNCnnqwmJd7O+bwZjtnPn
         iFYue/RguMN9rOMctNaSMGKYhtjF4h2TVUlTht8+cMXfVKgFaRWvi9X2ojdYGD49NPY7
         UJHs8AyUXI4Lw9rGW/vTJZiJLSk0D3jSjtBLbnXoIfevu+if3trvdB0XOXlldRLbGSw+
         /pHyYJo5lF2sV9HVNraiDcE3Wx8HNBQ2Thb2wwDyo6NaTwGdHu/y5GWZhJ/8Bqp6kYB+
         ktzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776948804; x=1777553604; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PlOMd/0NtPo9HHMlpt/ZRLGSP9SrMcpTUqdlgaR2uVc=;
        b=ASlwJzSHC/dQrb0JYRidEzn1VtTETAsTnh0iRtLd5k5wb9woApgz46P06CcHDf5Ez+
         LlO2V5NOvzbQQU9l/rI+J+Uhzu+YVcrLL7sXK6XkrCYxHBwik8lxghOGKWiIcxYumIhj
         Ham25yjBX3AM/yWsUwy80m+8LmXBITSsLHNo78d4ProoFFuCcpOmLjNPVrgjnoxqkRkT
         stx5pNZNofbYStKGhey2MCvb/djxYOXkDaB387SvBv/o4W+2N9xy77zb1qb9O3AdPd7a
         jnqbs9WELZxQOcdzHtnUcmJ9T0opZRDg3a+fX0e6jVspkPHbU8Z1Zz6OMfYzJbEQxRVR
         k4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948804; x=1777553604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlOMd/0NtPo9HHMlpt/ZRLGSP9SrMcpTUqdlgaR2uVc=;
        b=NqHlx5iI0fmo44uP6FiOT504DCrAonqAglAdwYp9DbOWQfBQ38jpJUV619hmkyTCTr
         Douht8dH6vBuKNRxYiEkkw+dEv8sAi37hLdjfpSjuFQGoeDcwjzzwHMODrzocD7W1gDO
         uEWwESmvXwRvHmsSZgUDbN/y19WE6bocMMxZlXfvWk39hwYAxoVW0nwmg6V1CUs6D1fl
         hm5k7X3sZL+0yz+0N7pkpMJmxUiP2Amh1NYl4oQnUpACjM6FM/3JXoJp5rbq4vJ+aPe3
         h7uM5I4uBoatCawSwWAFi6LsSaBNIIyCsD20aHtntO3TafS+ZW69pGqQnCkaaHmvHp3a
         D0Yw==
X-Forwarded-Encrypted: i=1; AFNElJ+p/9gjQVt7CXp/qbzkqCoLrarQrkU6mw2uI6X1ZFg4B/B5ue/miVXfhRAVrjCmKsmlNQsv9JEywFY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPLQ+u0h8xqYwNma8Qe10+25F+3QqKFjkjnIk7by6SY4f1CDt+
	jJNze+Z3j1EiDuUwkTOgcRAfIcnUVUUnwHw3zkIluMT6/2fVs8tkEGBM2WNHX+PelVri0Tg4oZV
	oeLVIgQEz57iCQkPCDYl/qbg75YmD77jcpL2t5KZGAg==
X-Gm-Gg: AeBDies6C7LManVChSswumuiozyQpI79kdDvJnAnTM2f8YSQznz8c/TqAM9zvm34wuh
	VOfAqlo72nWdDi3c8DQQ/+4WXh2nqGpYuxgcMokDQqIdRfcdGzG3ujDzA0mSHQB7r8eDcTt8sy1
	FO4/1YPncvcMdtGLz1ZsxFk5hBYCvqy0cOk8fe95upyyBoeNsifWI/RwBgE2KD7EDu8kuNYp8+y
	xchWJ2cFqVFQfJI+kZHkP8FNWrWwRWWVHZMHo6DaYHnIBSgh/5O2MHqeNuSUNPsavaNY6hNOVp5
	6rxHHfD+9ZQQDC9nFhbknIr4nBmYBnWV83UexUpclen+VJNfrCq7
X-Received: by 2002:a17:907:72c5:b0:ba5:bef2:2aa9 with SMTP id
 a640c23a62f3a-ba5bef2333fmr1133294666b.35.1776948803573; Thu, 23 Apr 2026
 05:53:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422212849.1240591-1-shenwei.wang@nxp.com>
In-Reply-To: <20260422212849.1240591-1-shenwei.wang@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 23 Apr 2026 06:53:12 -0600
X-Gm-Features: AQROBzBDIr-bn4DX0ExOJm0nVY72516bKXS1r-ubIMnAcS6p_qKbuXjU_FLZ6Pw
Message-ID: <CANLsYkypRaFTTP7MLLLR+=AB5JnRTA4i130qvWzB1qoAuM9FWQ@mail.gmail.com>
Subject: Re: [PATCH v13 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
To: Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"

Once again Andrew Lunn was left out.

On Wed, 22 Apr 2026 at 15:29, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
> Support the remote devices on the remote processor via the RPMSG bus on
> i.MX platform.
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
> Shenwei Wang (4):
>   docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   gpio: rpmsg: add generic rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
>
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  55 ++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    |  53 ++
>  Documentation/driver-api/gpio/gpio-rpmsg.rst  | 266 ++++++++
>  Documentation/driver-api/gpio/index.rst       |   1 +
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  25 +
>  drivers/gpio/Kconfig                          |  17 +
>  drivers/gpio/Makefile                         |   1 +
>  drivers/gpio/gpio-rpmsg.c                     | 573 ++++++++++++++++++
>  8 files changed, 991 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
>  create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
>  create mode 100644 drivers/gpio/gpio-rpmsg.c
>
> --
> 2.43.0
>
