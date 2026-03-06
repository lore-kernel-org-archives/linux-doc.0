Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7A536D4FA
	for <linux-doc@vger.kernel.org>; Fri,  6 Mar 2026 07:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772780514; cv=none; b=BoF6WFS9z5TitlvzQOJHmTqKkqCsEyC0PEQSaM26kVnU+j3RKagzl7TXVr5jbz3AEgwr6jgoL4WnygWfesi5/oX3JDDi+c4whfZtb0qtLUgtQ1mqOj93SDCH+C6y+fdvanCD/2unK2Op8twz3hyQ2RTLGYqlucXRyu1PN1HMXEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772780514; c=relaxed/simple;
	bh=U5ovtFZGT6J0/COcDYCmDClaijQmWD3Zbr+hgB175wI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mfxcszviyKtUMtN+wEPT1b7azAbxz1swbw4nUhv3lRlquDLNe7hFSeJDYuizDIlC1a+Bz0Hq8xSGTwsKBnDUvTKXhpGyL9FXyq/4XoLpDgcx16y6VrXOG/98QSR38dh7sALvAfFBujhEq1CYWxbdDyXgGfMD2eKvjnP52Qwax6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E4T4ajbW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E4T4ajbW"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so4712801f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 23:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772780510; x=1773385310; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g/Izo1I7P2lYa0tqmXpdAdhxEzYAi9jVGmrjmB9VLPo=;
        b=E4T4ajbWUTWlFMArKhQ6V7XMrb5b2K4Skb3GX6ke3CeDTdq3BOs5CkdvPyOwoUoCYi
         gFltKAZML+LKYgacr9grDe7rklDT2EkfpUgMCfs2m68QlzKJSERfTsdq9vVBnGNQNxnD
         Edxm8qvuUpq43O4yKhsLmzu6OwNIW58mIDXibMJAkBb/im6Kf38EimmUo9oCFtBYdx/r
         ELc/gJQUSG0VB5ONcK2psBkqf1zZuTvi9Si01FLfj4E8da1be8XGIKjINLzoDEdSmbtO
         GeS17bHx32jn/ZFqkIbn8zAua8xJIDoC3YtWageqBL1JbvyKxon49CnwpRq+I3ZwRLvZ
         93vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772780510; x=1773385310;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g/Izo1I7P2lYa0tqmXpdAdhxEzYAi9jVGmrjmB9VLPo=;
        b=iq5dqomfgQO570xiXbvstMonZ90Ri7MyZAsiyFgULNosvzlsfYQnUsggQifr7ceVPx
         HLEJrS+7xIDATmymv7masD/GSTO7TsJvszoPpXFJ0vQVYii7+iVAR+iOX70CSKPFAaeX
         LmEnIJtburlHiMbt6r/M+GjRUBrFrgsD9pNzHYTejraHl1d2eNvTpHw13rB1HUudHgnV
         2Xi4LpJe4anG3jlTYVggrhnMOQ9KEfP0FPW9OsJFxWN4TyzlPObfyx4fSIsB57KM4TbL
         ZOshqEjg7fuMWXyitqH/BcYIT1mTOQKXXtQpCGL0lSrKo5q+TlBjICrt8QbpW2rnfu6y
         yd+g==
X-Forwarded-Encrypted: i=1; AJvYcCVMiynbGWW5EIXFSyGesrTAWECRFIiqH6gtFWThcAH+qTer8KnBu1x227L0N7AD6MGVTfvJl5L8vPg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgp8Ru7zYxmUbYK2b7J5nN6ulou5KAKVtOWgVz/k6ADjuAWZcX
	Lux+ivdfx+o0+6Eh2km87J+2jyWSWUFS3ItStZ3Om9E6t2g15Q9WE5Xl0blPS2+wljE=
X-Gm-Gg: ATEYQzwn618H6tvmV6jVqoC/TqB4z5PGqgeeR8972bq/AWIBYmdn7N/aZ1xiYgIO12o
	rtDIhhrJ9AFSjyDcIL7Vm57PG/NYBDgFiKaXMQsC5egSLrQrTqlUfo/mKdMuWTGiUrD3pVgVcgw
	0vvDE1aOLvStNQPvgidWP4T3bTCMcxRjuq+uF9yWvZdfomT9yVUXlg9l0dH7U+maqzgHGZR/qDl
	v+gfdVnNFnMeXguz8i27YpjyryWZqcW6VosN5EmFsfeOtuZvPZRl9huDd7E/4tM3C8/L7Dt803K
	f/x2weiClUsLFixk2vx/kNetwrrykgTMNv84yWrgQ2u23Q0VoIhe/YdxA+90tvyvrPn4WqqMvWS
	AdFq5s0sgo7WcauvFYv8SgbX04gePLJwp8ncUUrgvvGVgiJdMeA06BB4exG3qyiYiiVwbAbMVo9
	1hRF19BbfNLa+D/W2DbfhIZbr6bHsV
X-Received: by 2002:a05:6000:2c03:b0:439:bd70:610f with SMTP id ffacd0b85a97d-439da890077mr1657657f8f.44.1772780509950;
        Thu, 05 Mar 2026 23:01:49 -0800 (PST)
Received: from draszik.lan ([212.129.78.78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2ba06sm1713784f8f.24.2026.03.05.23.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:01:49 -0800 (PST)
Message-ID: <198f569078f4a6e3b4e8ad080a94cd336c1e39bf.camel@linaro.org>
Subject: Re: [PATCH v3 07/13] mfd: sec: set DMA coherent mask
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>, Lee Jones
 <lee@kernel.org>,  Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo
 Choi	 <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jonathan Corbet	 <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Nam Tran	 <trannamatk@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-doc@vger.kernel.org
Date: Fri, 06 Mar 2026 07:03:10 +0000
In-Reply-To: <20260225-s2mu005-pmic-v3-7-b4afee947603@disroot.org>
References: <20260225-s2mu005-pmic-v3-0-b4afee947603@disroot.org>
	 <20260225-s2mu005-pmic-v3-7-b4afee947603@disroot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build4 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-02-25 at 00:45 +0530, Kaustabh Chakraborty wrote:
> Kernel logs are filled with "DMA mask not set" messages for every
> sub-device. The device does not use DMA for communication, so these
> messages are useless. Disable the coherent DMA mask for the PMIC device,
> which is also propagated to sub-devices.
>=20
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> =C2=A0drivers/mfd/sec-i2c.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
> index d8609886fcc80..9fa1449a4f6eb 100644
> --- a/drivers/mfd/sec-i2c.c
> +++ b/drivers/mfd/sec-i2c.c
> @@ -177,6 +177,9 @@ static int sec_pmic_i2c_probe(struct i2c_client *clie=
nt)
> =C2=A0		return dev_err_probe(&client->dev, PTR_ERR(regmap_pmic),
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "regmap init failed\n");
> =C2=A0
> +	client->dev.coherent_dma_mask =3D 0;
> +	client->dev.dma_mask =3D &client->dev.coherent_dma_mask;
> +

This should probably move into sec-common.c as it should apply to all
transports.

Cheers,
A.

