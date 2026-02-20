Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B902E541E
	for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 20:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771618893; cv=pass; b=IODi2n5LT3gnF0ykFjE/Wh6v93k26BKelr7hylh/Q+rcR2cVpL4KQ5f5ZdSkGx8gqydM/jTvoiTb/PMl1mgYxq/pLjtY5tZC0uaqdje47iAaQoATohu3j33PDnXGjuI7hyV84nWNOZZkxhaTf54hFIq3m0cVrWh061ehB+/jGGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771618893; c=relaxed/simple;
	bh=/MQjPz3AFp9hJYRg6RaO7nd5l2K1vMZNwkI3RJIJr/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c2HzdZPji3ygt+GVaA5UPQJDZn+fs2H1QJjUQlWxrfg9UbVMa/LPZgQBCxN47c9a8dknz4QGO+ag+88YtPzup/yj0JVP6JTfTAFykphDGn6IS23TS+Vbnjf8jKu8+Ss2Chbqf4B/VFyS/jKQkDWPKEREjbB635ar/sRydAhuhSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xr7d4Qoj; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xr7d4Qoj"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-65c5a778923so3645550a12.2
        for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 12:21:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771618891; cv=none;
        d=google.com; s=arc-20240605;
        b=go2lr4kdWhb4Bn73im7L9YCsEiefFiLz1t5qsmg+Fztb/qUrGOpwJ2is+2O6eBOPMg
         SqsZUQyFBwUGg+QzT2Rgt/sRJVIjy3QybibXAcyS3y3XM3c3Xi7ELNkP7PQn+D13eYPa
         E2ZDZYk3oJgb+1SdtTHFnP3XTKv67gwmaRld3lRys/gTBXg/HRYMt2PFXEcAxOwOKo9+
         MV5PpF8OwMJspE4hTcHnwebAzqngHUW2GoysSRXPQnkLcqu9DUKLL4U0EBYxDZyA8qSd
         vaMWSDAhZ59pEBxWs9l7BwmdwNSHpE4pamRk0UxgU0lNn1Ib8MnYs3ooe52Jpkvggl7I
         RhRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CWagENeZ05MKy23i76GqV0Kg7bzJ28L44P2dnAeTMoc=;
        fh=MYSgrhhje5eQQN7KvsZM9vXqwYCRkbBtk8YWANUXj+g=;
        b=AlX6QawGb0i26nL/tEF+ARGjgPGtZ0rkNQeYO7Ssab1b68ZxD0Zru0jfaWSHFA68I9
         q76VSdeNlUUMGvIJllOF4D8zJcRlLRUd3UM0NoSlYO8uAtERwCk+QjmmvDHdUaM3lC5E
         fXlWeTqu0Z1p672/8XrkCimOoKXaedgH2H1xoOStdQ+LKpvgFaY5vNIseUO1CyFlcozh
         nkgD4S9BfElEiCsbEKvg074a2JDmFQMMsOiRcMRlwgy0t/whplxgPRNOeKwKiu/WYA2t
         pMNousOJqoidQBkrPm4Ym8Wz+xvFSbbSJtXUG4sLcx+3/AWsqUeiaJmJMLkIuWdW36Wv
         ycCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771618891; x=1772223691; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWagENeZ05MKy23i76GqV0Kg7bzJ28L44P2dnAeTMoc=;
        b=xr7d4QojHNK9zrZ4MdKJDM+AOXyfokLc1h1vWUBN4t7a2bELnxrwhtSV/I2cLP5bpE
         suKa13NWnDXp+yh/+ONEY1Y3rWxnViFCF0591/RaiS44zOL9E3TQEs16A29oEdifuHr8
         Gzjs8RPM8dimS4NrQ6agpqQvyBseoev18AeXXnnZC00SnZJYnjSoTo2Ue5dT/U5tTRUU
         hsWfCGdSyGWLFYmcfdI/F+m5R7RZo36s1S7cto11L8G4CQzpC1WKPStx4Jn/P83ZOTgM
         U2RrsDITF+ZktPG5JB9xKYtrN98GDujYTnrGjjI6881VnFwiAS5DtBPI7DEI0EhE3aD1
         /Q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771618891; x=1772223691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CWagENeZ05MKy23i76GqV0Kg7bzJ28L44P2dnAeTMoc=;
        b=jtkCOlRMAlMkhd+aIAOU+umuzsaasLDLsOCcGjiNb18jozTiDecf1pOEQVQHQ1AHAJ
         3FKJzunKAk5kgeLhXASszFxAjosEQT1RG717ohpCwtXVieKtRDMdZnrVrNWr0FGleDZN
         CsuQxDfHqjny3nST8nqrrkh4j4bZy9lOd0TY64D94kTm7PliCEJX7i30B4bi2dBJ0HCJ
         tlR01KYAZSfVdh3ECxH077RiqvT9slJO4so1NmlSznu/fTrdTkkHomjytDR11UbD0f6a
         rht5wuTeKNUnMuLeeT8hZe0dwaUsE2g3lJTuxfLcRh4Mkw0af3dSgIl8jCYmDZpMExEE
         cjFA==
X-Forwarded-Encrypted: i=1; AJvYcCUpqdovzEw7ddWPFKQrR594HSWGPsHWPB+zAmYKmZIH2JWnnOR/4eGkTOV7GlMD4t69Qz0RveXKD68=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCiNt61BD5I42h1B3dg+V4nMK97xmYRgnlX16+hWrQ3EnDjUnI
	YjmndI7QGQI2oRGFCuJWk7uKn4SwqWPE6/HG678+G6vjRjdGfXz4cODC7S4eaHEnnsoo5lzisl+
	Ho5EPRlhDW6x80RwGHhMJkTLlhACVAGKXzNcGo1fp+g==
X-Gm-Gg: AZuq6aIp4f05qD0BjjtbrPuqO6YQ6aT7bH9MW9QXvgg7PPw1FElKetdWwUc11J7+BPz
	zUDmYnR7Ta2yUI0VnZ5KSc2eJZTDPrmqwiwaEW0kGENhmuQOt2URRLIgbvfxEYSsCe67I1eEJXK
	qX1v1DoRqpPzJtnWiaZC7f42vmuSHJ7GawJgNcokEaORet2Wgc0g4iKHgcr4XAE8nFBNUiiRTgs
	6wxxbcF9NnZxGsI8D4whdf3fCzDqs3+DlImJLVes2YhbXRJhCVEVHGlyGj949H71xRaus/elI5e
	i8emY94tlC2Ks7IxeCc8BpYH6OgUEEsXSh7ftyQ8Dg==
X-Received: by 2002:a05:6402:3547:b0:64b:83cb:d943 with SMTP id
 4fb4d7f45d1cf-65ea4ebf346mr552702a12.6.1771618890856; Fri, 20 Feb 2026
 12:21:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212213656.662437-1-shenwei.wang@nxp.com> <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com> <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
 <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com> <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch> <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 20 Feb 2026 13:21:19 -0700
X-Gm-Features: AaiRm50Kkz1w5MRtvgIyG-wO2YfHNIXg4Tb2fsX628-LWgxPRUtWFjuasLWIuqk
Message-ID: <CANLsYkx0Wubx0FiV8ypEnHcstXc2shfEc+87Jn_p=RDe8ib1xg@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Feb 2026 at 11:57, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Andrew Lunn <andrew@lunn.ch>
> > Sent: Friday, February 20, 2026 11:45 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; Linus Walleij
> > <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Co=
rbet
> > <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Anderss=
on
> > <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; F=
rank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel T=
eam
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO d=
river
> > > If there are concerns about specific design elements within the
> > > driver, I=E2=80=99m happy to address those, but redesigning the hardw=
are/firmware
> > interface is not something this series can solve.
> >
> > Then i think you are limited to using the out of tree driver.
> >
>
> Thanks for the feedback.
>
> To clarify: is Linux moving toward supporting only fully open hardware pl=
atforms? I=E2=80=99m
> not aware of any rule that prevents a company from upstreaming a driver t=
hat implements
> support for an existing hardware/firmware interface.
>
> Given that, I=E2=80=99d like to hear from the GPIO subsystem maintainers =
=E2=80=94 @Linus Walleij and
> @Bartosz Golaszewski =E2=80=94 on whether a driver that works with the cu=
rrent hardware/firmware
> design could still be acceptable for upstream inclusion. My understanding=
 is that upstream
> generally supports existing, real-world hardware as long as the driver me=
ets subsystem standards.
>

The HW can't be changed but firmware can.  It is not realistic to
think upstream can accommodate all the quirks happening in downstream
trees - this approach simply doesn't scale.

As if I wasn't clear enough already (along with many others), the
current implementation will not be merged upstream for reasons that
have been amply discussed.  You either comply with the comments we
provided or use the existing out of tree driver.

> Regards,
> Shenwei
>
> > Sorry.
> >
> >         Andrew
