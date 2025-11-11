Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDADA34EEFD
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 10:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762857352; cv=none; b=UioJUOoiWaz57azdALyf35ZmaZG8hqbKkqH/pLIwJ7voUsf8sd/o6RSpVc3jE0YW0DhYdN+MGBDTGDTextXqZnaEZQfvrdQxOn8LjYBICI4hVRjoIlpodz75my4nsf9jhprLD6qtMH7qDlxqn5lPOGwPEO2E3kiCIJ3djcPX45Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762857352; c=relaxed/simple;
	bh=b5cTARWnCH0O+wzlNreNZEZCG3YtR/z+aB364cLgDRc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OOcEOI70nvOykIZ0xuf15XXA3u4I/hOlqN8SGpvIeBp0nbA2zdOHCQP3EdbC03cxPSKO/tgy0i9rIV5mi5/KIn/l1/dxXcdS3PJsrkL5VSHy5oecQFjZIpikG6RlTG2Jg5klCvq5OgnsGcmOm/ME05wWsgrQDvxb/5yIk4vejB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A5K3Vj1c; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A5K3Vj1c"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37a48fc48deso37599031fa.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 02:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762857349; x=1763462149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5cTARWnCH0O+wzlNreNZEZCG3YtR/z+aB364cLgDRc=;
        b=A5K3Vj1cV3ibGiIR+o5kYeDkP1LkFeJkJQ2AYzJ7Ueyiwmtcr2ywQVaykLSnAeMCgj
         EPqy2hQoLPARSunxPZsKJUddW/N/u34Y+LUskmmXxR/pr+8BN/MVMBB79PzKlZGgIsBF
         qAz20kgVN/CARA1DsNTJQzLAv6Mj1oepbEhxcK03bRTInIYMy05xLTiHsuTOCFSm5So2
         0xwf6tCRutJ8t289wOT9kF/akxV3GfJcPvtvY3qJUoEA0TgFNE0ZcM8Vhqfy3zaXX+pN
         eF8Lk9aHYKL9aXRObdVCeBBNDJEwVilstRk2D7oSVt8Oyd0PSIj750vIt30jb6UL/gKZ
         ClWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762857349; x=1763462149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b5cTARWnCH0O+wzlNreNZEZCG3YtR/z+aB364cLgDRc=;
        b=FvF11VVFqm88y7yyWCthFS/sSSRDNudBZ63xO5OhkQDBnL6ayVhjbfqoJoiXcLJRwH
         9KXNiI9sta5vI6IHiJtUwpom0WcmJXqG/FVIMhmtN8CO294e1VPXDJ2b7KUillEMah5x
         eCG9/u86GdMMyMtDQ+q8OLcE2Sw/XiYA2QBJq+BtCuL0FEcYr4Pri11S64eB6LGWB4jF
         c46d3RJ7hkxfK8z9nApf4PTrxQgcK2HwOZMuDp00AgOOUe5AeG55GG+8uyhqO5rOS57d
         26xeOfbCTgCdsCtF4n2z2LT7xaa3mytxLhri8hXbuH5pfpinaEHTuqw9Yaagrpxw/H9O
         L5ew==
X-Forwarded-Encrypted: i=1; AJvYcCWk+wHASYwpvj9sfg4NZzq/ZcmWI5fF6LtoM08vB/QnL4Ry+XnpEcBzr43Mo4Obcc97Q2F5U6CY6wg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGQQI3Gl2Njnov5QwET2NJHDTjFzi79jnxmBgmotCRWtZWuCcs
	sJgdig8R1lnmiIpMrEFB+PwXhvmsQxvLfpsLGY6yyzmd6jpAZbhJscNsEX2UkRHzwZXAznlT0T0
	WPfH0lbkhQ6Noq+mjBQ9o9UpgMfa7OuLzH+dN5c4LVw==
X-Gm-Gg: ASbGnctBg1wo5uJCHYBonSi4n15mad3qsUbdS0OKcIBNmu98iUYPbxfMSaogVLDIjRH
	ebRR5cgxIzq6HEZNqn5gq+BmuWZIZpC16Ivvfo6Lsf1yzMPNguofpAkyf6CC3zl+g0vXP9aaSgx
	/iqYpSzPQO/7uP4R57FIJuXpU+pQaKRJeciXx7MDhZB7I5UaH+q3rM4fpTM3iByakW0zt26hnMv
	9jboptXiyELJB9debuCgU2izaw5ApNBR2mMvU5d7YWwVcBTTJJ3kh6sy4SSZVCT8OoEnh4=
X-Google-Smtp-Source: AGHT+IHiG+EjsNieo0IH9vKGvPYVnnnJhmFUXHoDPqz54BHP96ylxBdjlT/JInKjKxLz/khK4ncylVpRxXU4D16MeYo=
X-Received: by 2002:a2e:95d2:0:b0:37a:2f0b:ef24 with SMTP id
 38308e7fff4ca-37a7b1995e0mr22288641fa.16.1762857349004; Tue, 11 Nov 2025
 02:35:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104203315.85706-1-shenwei.wang@nxp.com> <20251104203315.85706-4-shenwei.wang@nxp.com>
In-Reply-To: <20251104203315.85706-4-shenwei.wang@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 11:35:37 +0100
X-Gm-Features: AWmQ_bnM-SUasW3cn2Gm4EW3aePYZpGnjIZZVnW89VcDCfJSgNXVTHUcuXdKqUo
Message-ID: <CACRpkdZR2C=+ssYOKnF=hyOqTakGjVxzp5_qz=3-uYRpzaZgNQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] docs: staging: gpio-rpmsg: gpio over rpmsg bus
To: Shenwei Wang <shenwei.wang@nxp.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shenwei,

thanks for your patch!

Also, a big thanks for working on improving the standardization of rpmsg
so we can get some order here. This is very important work.

On Tue, Nov 4, 2025 at 9:34=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com> =
wrote:

> +- **Major**: Major version number.
> +
> +- **Minor**: Minor version number.

I'm not contesting these if they come from similar fields in other rpmsg
devices.

What I'm thinking is that the driver will eventually have to quirk around
bugs in the responding rpmsg CPU, and there will be bugs. This can end
up with this situation:

major,minor =3D (1,2) NXP implementation, no bug
major,minor =3D (1,2) Sharp implementation, no bug
major,minor =3D (1,2) Sony implementation, ooops this has a bug

What is the driver going to do here to work around that bug?

The scheme kind of suppose that all vendors use the same codebase
and they don't.

I would rather have:

**Vendor**: Vendor ID number (such as the PCI or USB ID)

**Version**: Vendor-specific version number (such as SW release)

This will make it possible to identify buggy firmware and apply
quirks.

My apologies if the rpmsg community has already thought about
this.

Bjorns input would be appreciated!

Yours,
Linus Walleij
