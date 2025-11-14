Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C1D30215D
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 13:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763126064; cv=none; b=raSJz8UEW2qAc+/lBeMS2topirzpJ/PXGBk5REgRF7wxrwppiMesRhSe93RBfpBaAWkFRKLMhH4mYrieYprX8eKZ25TLlyplUImJnJwviRd/rwAs8X1zvxt/acf93wGlfa+g6VOc9vqoc8emrTWkQ0wum4A0cJC2gTQoC6lgAsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763126064; c=relaxed/simple;
	bh=MkZ3kMIKj667Q6zlkFms+OxbDU158ERDyf3gzaKEAeo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S4WESh0Y4frN1n9n/69uqBPTjxJuXKgD0Ao6khNyuI3wo8U+mUqAVI9Izth5QEMHrohnbd9Epg5+mqbPr5ETImho2E9voqeL09Af9s2PzXZx636a0Aj8jTAoaKBJ/41QpVJtg8tosGHkTWZtdp1RS3f65IKhCAN82Ufa47JihSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TE3O3wtx; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TE3O3wtx"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so1282847f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 05:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763126060; x=1763730860; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iU0sX+BIcc5PHiUInIFp7NW8ySzf+LdobKT956HEe2s=;
        b=TE3O3wtxbtU988e/qgrUb8LBnjD9XIJlLYfOlnbpdfAMbp7tAn8xaDSqahTwEz8LDd
         QT/r3JT3O6laClSRGB6DR8Q/I/DFmetFYbFtSrb7yVJwptnfeW55OTV6g/GSlo0Z6z1h
         THKdIXSaw8d5cn3Dy+Hv6EWBqG2XF7KPo/fF0jqNJcHbTZ9JLLGDpEgxOlns0eMW8Syr
         W9TGvEZP9hiviBfrC7zXWIG+WiYlqlzbSJJs0Rxm2XyRDr6xvYkgpLoGLtjKH4YCVnOs
         2vvSdPUPB3mm+Dtj7U4Rlbbf8/j279ciFMTVAStWf6pmkGq570JrhgRVbElUVOPF9BHZ
         rKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763126060; x=1763730860;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iU0sX+BIcc5PHiUInIFp7NW8ySzf+LdobKT956HEe2s=;
        b=CD4AgY2mwpKTrN9c6SX4l/nJ+WtRY9WQ/YCTJ3MtyKoMuQOtYWSuYMuaaeMgRhLJcF
         KKBPTlYJTnK5d+wA+oVO2kySNmrss/zqwMVJFqyhb3CvMEAr7pzfpXyrdEIo5nIxi8Ln
         iA77LiLyXhvXXivqTiGq5TFRJDpKFKGHPkSKVxmHEgIb44s+032wtqFHW3ohuooLenvQ
         6GPL9NPJrZVLT/dW2dVdfUjdxJR+SDRzenDRNdP1cu8AMFrYRLk4aoyT9B6CZyj8l1Ed
         DieqCp1xuYo325sVX2bwmyfT29Dh5cmnO0Yt1OL+NQSi0yg6SDzOZ+SJWYqoCobYZg8M
         rJ9g==
X-Forwarded-Encrypted: i=1; AJvYcCXKyXooMw9DulqBlFxSYfgUGt8OBhN/iWT9+wgKNObiTPLhA4qV3/nErJFmKN1GN/br2vt2bf11BNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzpX/TqftKdBeSujJT5/GSSj+3qJ2nvtIGHibXkxbu+G9cRtda
	9mnnQ2dEhoT2xfMaNnhQfzZY1aVH+kmU9Z2eisxCQv0mZpig02zdKi9xurGUyOOWb0E=
X-Gm-Gg: ASbGnctDDOKPf7CeaOIPreQj1szpUzmfxn9kXfaf7jMrWIL1D9ez5K2KCv5U1Me9j0/
	aqCwyIcHz84cI8wlt0li8G2aHKiST/cc7V6donEMQGshik7+blVfEip2xDMagKjr3mE0N4sK5x2
	xuIVUiimluBlatC9fz1KU0dzjeVmcoZv1Fqt/1EPp0lMMmfcJvQgxupEdaaygCX3StHxSfHL/4Y
	JlrN7W0gxvJnyU7ONPWd/PqAlT1lK0JgSlXWjWAKVAG1wTcFkurwJ27F//x4joF2BiG8docXF2k
	e7igIrCFrqRFAlCLTmsdBh3w4d7Pa0lKYcLW734cZJWrDtBmyRrgyAFU8DniMSg4WWHUEd5dVeq
	EJm8BD67luG+A3HxFdHUnxnZajR3JOROS6xWW7ZGGgwHiDpwXNCEASN9lY2Z+h2iTVdsVTq3iyn
	t5YeWSNhVFHPIyhMQp
X-Google-Smtp-Source: AGHT+IFlqbLqO9l0QT9dnRaBnBUSrcaFuapWFmH3KDcEb64+slQqRjevdDELlFMz7eG9w0S/wckC7Q==
X-Received: by 2002:a05:6000:290b:b0:42b:3592:1bb9 with SMTP id ffacd0b85a97d-42b595a4856mr2451223f8f.35.1763126060406;
        Fri, 14 Nov 2025 05:14:20 -0800 (PST)
Received: from draszik.lan ([212.129.74.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f2084dsm10190727f8f.42.2025.11.14.05.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:14:20 -0800 (PST)
Message-ID: <982158427bae79e15c92ad0198b398258e262ef6.camel@linaro.org>
Subject: Re: [PATCH 08/13] mfd: sec: store hardware revision in sec_pmic_dev
 and add S2MU005 support
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>, Lee Jones
 <lee@kernel.org>,  Pavel Machek <pavel@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo
 Choi	 <cw00.choi@samsung.com>, Sebastian Reichel <sre@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jonathan Corbet	 <corbet@lwn.net>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-doc@vger.kernel.org
Date: Fri, 14 Nov 2025 13:14:19 +0000
In-Reply-To: <20251114-s2mu005-pmic-v1-8-9e3184d3a0c9@disroot.org>
References: <20251114-s2mu005-pmic-v1-0-9e3184d3a0c9@disroot.org>
	 <20251114-s2mu005-pmic-v1-8-9e3184d3a0c9@disroot.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-11-14 at 00:35 +0530, Kaustabh Chakraborty wrote:
> The device revision matters in cases when in some PMICs, the correct
> register offsets very in different revisions. Instead of just debug
> printing the value, store it in the driver data struct.
>=20
> Unlike other devices, S2MU005 has its hardware revision ID in register
> offset 0x73. Allow handling different devices and add support for S2MU005=
.
>=20
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> =C2=A0drivers/mfd/sec-common.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 30 ++++++++++++++++++++++++------
> =C2=A0include/linux/mfd/samsung/core.h |=C2=A0 3 +++
> =C2=A02 files changed, 27 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
> index 4c5f4dc2905b..f51c53e7a164 100644
> --- a/drivers/mfd/sec-common.c
> +++ b/drivers/mfd/sec-common.c
> @@ -16,6 +16,7 @@
> =C2=A0#include <linux/mfd/samsung/irq.h>
> =C2=A0#include <linux/mfd/samsung/s2mps11.h>
> =C2=A0#include <linux/mfd/samsung/s2mps13.h>
> +#include <linux/mfd/samsung/s2mu005.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/of.h>
> =C2=A0#include <linux/pm.h>
> @@ -86,17 +87,34 @@ static const struct mfd_cell s2mu005_devs[] =3D {
> =C2=A0	MFD_CELL_OF("s2mu005-rgb", NULL, NULL, 0, 0, "samsung,s2mu005-rgb"=
),
> =C2=A0};
> =C2=A0
> -static void sec_pmic_dump_rev(struct sec_pmic_dev *sec_pmic)
> +static void sec_pmic_store_rev(struct sec_pmic_dev *sec_pmic)
> =C2=A0{
> -	unsigned int val;
> +	unsigned int reg, mask, shift;
> =C2=A0
> =C2=A0	/* For s2mpg1x, the revision is in a different regmap */
> =C2=A0	if (sec_pmic->device_type =3D=3D S2MPG10)
> =C2=A0		return;
> =C2=A0
> -	/* For each device type, the REG_ID is always the first register */
> -	if (!regmap_read(sec_pmic->regmap_pmic, S2MPS11_REG_ID, &val))
> -		dev_dbg(sec_pmic->dev, "Revision: 0x%x\n", val);
> +	switch (sec_pmic->device_type) {
> +	case S2MU005:
> +		reg =3D S2MU005_REG_ID;
> +		mask =3D S2MU005_ID_MASK;
> +		shift =3D S2MU005_ID_SHIFT;
> +		break;
> +	default:
> +		/* For other device types, the REG_ID is always the first register. */
> +		reg =3D S2MPS11_REG_ID;
> +		mask =3D ~0;
> +		shift =3D 0;
> +	}
> +
> +	if (!regmap_read(sec_pmic->regmap_pmic, reg, &sec_pmic->revision))
> +		return;

You should probably propagate the error up to the caller here.

Cheers,
Andre'

> +
> +	sec_pmic->revision &=3D mask;
> +	sec_pmic->revision >>=3D shift;
> +
> +	dev_dbg(sec_pmic->dev, "Revision: 0x%x\n", sec_pmic->revision);
> =C2=A0}
> =C2=A0
> =C2=A0static void sec_pmic_configure(struct sec_pmic_dev *sec_pmic)
> @@ -236,7 +254,7 @@ int sec_pmic_probe(struct device *dev, int device_typ=
e, unsigned int irq,
> =C2=A0		return ret;
> =C2=A0
> =C2=A0	sec_pmic_configure(sec_pmic);
> -	sec_pmic_dump_rev(sec_pmic);
> +	sec_pmic_store_rev(sec_pmic);
> =C2=A0
> =C2=A0	return ret;
> =C2=A0}
> diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung=
/core.h
> index fc07f7944dcd..ccd1bfa15b85 100644
> --- a/include/linux/mfd/samsung/core.h
> +++ b/include/linux/mfd/samsung/core.h
> @@ -63,6 +63,7 @@ enum sec_device_type {
> =C2=A0 * @irq_base:		Base IRQ number for device, required for IRQs
> =C2=A0 * @irq:		Generic IRQ number for device
> =C2=A0 * @irq_data:		Runtime data structure for IRQ controller
> + * @revision:		Revision number of the device
> =C2=A0 * @wakeup:		Whether or not this is a wakeup device
> =C2=A0 */
> =C2=A0struct sec_pmic_dev {
> @@ -74,6 +75,8 @@ struct sec_pmic_dev {
> =C2=A0	int device_type;
> =C2=A0	int irq;
> =C2=A0	struct regmap_irq_chip_data *irq_data[MAX_IRQ_CHIPS];
> +
> +	unsigned int revision;
> =C2=A0};
> =C2=A0
> =C2=A0struct sec_platform_data {
