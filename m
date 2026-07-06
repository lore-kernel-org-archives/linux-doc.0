Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0A6430CD6
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 15:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353481; cv=pass; b=Y9r5sWkmm7CI/xmrUuf8Zc4YlGuFcETI0Fk0aWClKJfXSrYjooCS0vKCzbrg5AbBorvmvi6qHyorJWv+8jyWOIgVRSH4y2zmc+BwlhP8d8G80TmOarwm6954jXyR4WoZ7VeejdX+iOsJf1jIsnKhMuCA8I+waTNMt7WEg/QEjvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353481; c=relaxed/simple;
	bh=gCs9HokUb+6ZMGzRlYcfJL9jBr5oqoU0ENUXdBhbWys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UoxfwRCADJwTwsSx9D8VPEir9A3ZzjUjQozN9JHZdEMyYVXM4W+9deCEoXXOSnMjg+RlSFpLtmQs2Iq/H0pPJFcluGNM4idDMe19VNqKems4o3FqzvteHfU+dctXz5X8+xZWtXij2LDsjTqtvjEtSpM8uUt5IqUnVAEay9Ol1u4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z+/eLfFN; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z+/eLfFN"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-691c5776f95so5975877a12.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 08:57:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783353478; cv=none;
        d=google.com; s=arc-20260327;
        b=sS1/BHxE08+EAJ5WTWNDXYu1OP9EdI+xlx8gMM7547YJiww1V13a6YEeZinj4vDPc1
         QTXsp0jjv3hi6e0osronhOf+Jo5TGgL0Dhi9VcoMODDk2aL8k5ahg6nr2YQQ9ID2NxCX
         m0FrQHAXCDMMDEI6xM+48W7khs0HRbmk2l0Tc1CYclXUUqMLDxpN/CaIHu6HLglvPBJc
         tshZuTJ4d3riAb0AE7fs1IL8LCuhFFBsP+n3ukh/cV275LCI0UhPEDrNSJfXEN8aHot6
         6N4D2BoUvge+eC3WfydA+T8NqLOJc+CrrIM3yZ0u6D/ylkzm409UiDhMcXYy5apFjvYP
         ae2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lGxnHQcUvM+Wk9iuDAhV9iKJOnzCJXCRMoquKntthQc=;
        fh=c4zUaHifJ2Mj256K4Mn0iqi+vFU9tOMAY7xd7NFRSIM=;
        b=Eko/z6H9sfx03CqaVNHbFR2VeCov+G568WwlNiZZZecOho7GOWCQfTK+4hwv1ybtA4
         RYC/KaVi/3hG2ryhTaEnNYPpR8FRD2rFRBD5qZ5HqM8a+jArWQLYOa1nyQ1Yz1QGFVpd
         rgmWy2y5hVCHH1Hriu2ZbqeAGhSEwb7nW9JU6hSALtagAYcdsCGwzLX3zksNQCZO8KtZ
         ubNIX4vvb1xt+7Lkr3H9toqAe/U1KMqiGEoRM4jVVuG3hjWcCwzoDS2XV27ZC/QIyB/O
         OMD0PcJ9UgR3vKmP0jZOGjVpEsLRGR4+kxL+3canVX7s/YKb0IjjxqFMhJ2t3AxwdCvf
         /4/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783353478; x=1783958278; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGxnHQcUvM+Wk9iuDAhV9iKJOnzCJXCRMoquKntthQc=;
        b=Z+/eLfFN6xCQ/JXzVDa72FWOBSmvZ2SHuV4SdsDbvXjEyKc7QtkRbACuGnlZmMG1kS
         21xIPFkDIo19WZWh4MCGa4sk2CXpayXD+H7uysfPymrkR11lVhaYQsy9vLo9bLKb8A6Y
         J7RgKGvrNJf78fC8qhM7hy4ya+8hxs5TsxX7lhtYNglg6SzH2zpVinycyfn84YPIu6H5
         s0TrKrmW0KzxtTjJuha8xi0nxCtR5aqldd/QyCQfIfdFotfXtR3TKSAdS6pRs9vAXOZm
         d8f1EjuuZdwgNaLvS6tH4uHhS9ttCCosKo2FD8YrHuH4jO28GtDw3mVpSPdp8lR97Dso
         z2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353478; x=1783958278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lGxnHQcUvM+Wk9iuDAhV9iKJOnzCJXCRMoquKntthQc=;
        b=SIDFGCb50piB5vir+fOw1R+gckobCRSoK+IQv9kBZadJuFx6CJk4tdhr5tb9emvLii
         ivUTR7v0cIoKDsn18T8biCEfi9xiwjYmhSUiTssFlcmvHqULNhrZ8nt35Lmo0c4uLQVj
         VIgCN2d4m3ZFO6+trUQ86dvcUcRFw/Eh66rp6yxYkmZASegGSLNQKr2KChrEVHovur74
         /W0H5SJs2wkjgUbXWmYN0HBwvjJU0ShyGR3f4Zp2bD1eZChY5faKGfGMjPRNWsWH5+6G
         ISvM1Mwg8LxVftmTsSexXTiokpnKTwtd/qTt+Z92zC2BFLxMHV1YC9EG1lT6nSXN7iDP
         WMUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrLWCPL00oV3yxYV+W+LJHG02dELmYSI62WunPUribd3CvcHuuu0HinQJDwVPiq3jYXafwAfd8ExTw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmvf1lStF6aJMo8+eHESkATgjT5WVVNT08QJJnv26QX8DKtkv1
	YuBw4v3rt3aGR2h4w1O0Cz7B0GPRT/H2c2GFer7msZ4wnxtx+HWIg3CXw1YmB9s9I0yrHX36GFG
	aV1s5gWpmo7bITNFewlPqXk4fTqayYZpyLGwUjqq3fQ==
X-Gm-Gg: AfdE7ckwTL0tN6fUL3rizBZAFvyrDvWHiaYrhozQHBO0EkBzqIYkMpIzvWxWfQBZQMX
	5sICKt6It5KBVVv5FOovjHV+bqTkNgFrb/spCwxvvXBMU89kBTSWFia+awYIKNkhDkSG5W5sh00
	cALw4+HasLn9H6lfpNcpj8OnLzHVJT14e60C3NVOR1qFnVjeIGndjTnjzteyBJi+D39VQrkg5hr
	69Vj11+5EVGhKnJwPxAmYb06zvpF6GTg/tY7DFE3AmFCXrrpBdtZnBhLKGSfIBOK5GlzkVTb1uX
	yIpEZzhplOGxoWohgZCnJtlwAKR5
X-Received: by 2002:a17:906:3ce:b0:c12:992b:16d4 with SMTP id
 a640c23a62f3a-c15a68cf56fmr47982566b.41.1783353478105; Mon, 06 Jul 2026
 08:57:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625155432.815185-1-shenwei.wang@oss.nxp.com> <PAXPR04MB91855056638F0028BCC5F9EF89F12@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB91855056638F0028BCC5F9EF89F12@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 6 Jul 2026 09:57:47 -0600
X-Gm-Features: AVVi8CfCK8RZVsOnom89zz62dC_eh8WB0dnPwnnTYPsAfwJakdAft3ffWaiSkNg
Message-ID: <CANLsYkxmf=QfNUe=BLrrP7kBtZKq2Z1BkQDLnzmcQsW-kYzTPQ@mail.gmail.com>
Subject: Re: [PATCH v14 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: "Shenwei Wang (OSS)" <shenwei.wang@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, "b-padhi@ti.com" <b-padhi@ti.com>, 
	Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 6 Jul 2026 at 09:40, Shenwei Wang (OSS)
<shenwei.wang@oss.nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Shenwei Wang (OSS)
> > Sent: Thursday, June 25, 2026 10:55 AM
> > To: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel=
.org>;
> > Jonathan Corbet <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysz=
tof
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjo=
rn
> > Andersson <andersson@kernel.org>; Mathieu Poirier
> > <mathieu.poirier@linaro.org>; Frank Li <frank.li@nxp.com>; Sascha Hauer
> > <s.hauer@pengutronix.de>
> > Cc: Shuah Khan <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org;=
 linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel T=
eam
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Shenwei
> > Wang <shenwei.wang@nxp.com>; Peng Fan <peng.fan@nxp.com>;
> > devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org;
> > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; dl-linux-imx=
 <linux-
> > imx@nxp.com>; Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; b-
> > padhi@ti.com; Andrew Lunn <andrew@lunn.ch>
> > Subject: [PATCH v14 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
> >
> > From: Shenwei Wang <shenwei.wang@nxp.com>
> >
> > Support the remote devices on the remote processor via the RPMSG bus on=
 i.MX
> > platform.
> >
> > Changes in v14:
> >  - Update gpio-rpmsg.rst per Mathieu=E2=80=99s feedback.
>
> Hi Mathieu,
>
> Could you please let me know if you have any further comments on this ver=
sion?

I intend to review your patches but other people's work is ahead of yours.

>
> Thanks,
> Shenwei
>
> >  - Align the rpmsg-gpio driver with the revised gpio-rpmsg.rst.
> >  - Modify rpmsg-core to enable prefix-based matching of RPMSG device ID=
s.
> >
> > Changes in v13:
> >  - drop the support for legacy NXP firmware.
> >  - remove the fixed_up hooks from the rpmsg gpio driver.
> >  - code cleanup.
> >
>
