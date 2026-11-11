Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794399729;
	b=vAxWHqb86gbvDLwRZk3kWxcZMJtcG4BwRWUuoH4G0ACMtpEkw/qbC+fbwWW/DP/3G7XB
	 CZ9dOtrDyezsH2eaxYATbKBEL5wr118MfbsOA1vuMVDxEYqhu0XkutqRiQ8rEHHHe2Fh3
	 z66kBasV0rOR5xiEoKOkXfP7+xgbjQewvdG+QeezNn/hUuebN2QSzo7vIhkvCQ2CYYfLJ
	 bunKRk+QoBLV5xBA4Y0mA3Rw3R+iIa5OSpiDtuA4uBw6TKkb3Ab8Fn+JwKhdzdDn4A8zD
	 gJkdNg9ChVU5lRc+RmBc3ol0nLFp2qcumxWWP5iLY8ajw82zYj2pgDyN0l9WrlFmtJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399729;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=C3KBR3H9YyzSWZ/htLdN6t0rcyGsbU2SY2TDwqu/9VM=;
	b=CJH7PJDbYu+MfycuKTxqGUpskvQVFgzWZG4pSf1j850pWOnmv/q4CX/+hbYcv1W6fS+p
	 UYDKLG540AcHqfuE36WUyX7cQyngwGONsWpKBTCB+SPNKICGVlNr0Oi2PBC5+eEpMkrQ/
	 F7epjd7kHFjFgznkujLqxabpc9n4YXXhHE7QmVCwM0WmlPUpoI0M81jMvQALMNEFGt5W1
	 N+ycRtal1QfIB9tU0h0T12CwNwMwvILD8W3z+9iev9sB29LttV311p9ZBx9Eao54hsPRG
	 zJLsX7m7Kckthz3wKzg+oyWdXLr83BsIlkbUrVA4422roZ9Akt9ma4+jTXQ8VPsk4wQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=v2fr2S1D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F3F606A324
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 12:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54F3F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=v2fr2S1D
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so4895828a12.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 04:22:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794399727; cv=none;
        d=google.com; s=arc-20260327;
        b=ODO9iwdslxzQ07xA7P7fVX9naGyakm0iK6YSxYgKIQFbEJ7VOo+qurzj7149KOGeoi
         7MvGdhf7FUkDU6aMSxfu34Gb7tu0gECioaOyZnzijr3cJ4416JYtXNtT3zsE3WqUGaE6
         6tBJSQqw1muTdWRjOGhLj0LOSRAm6gqxW0WtOb9YECsIjbNbwiDxuTPQnBnhkT7hrHC0
         L3yEeJXbzxizTKJpd+PNmeGwZqJl6Ggj5MI4OEmcyXvG/73/4GXJJqUeCgqU6/OwuDcJ
         nCZETZe1BrxRdvIjQC7u08kFzYGa9TqFYbIwnqVPJi2lKPhbAQbN82GsLbfhLWxMl+5T
         RUwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C3KBR3H9YyzSWZ/htLdN6t0rcyGsbU2SY2TDwqu/9VM=;
        fh=V38fu3DqSY3G7f/mpbks0Xd/1DWFomLrFgieEaPi7YQ=;
        b=Om95i4ecBKtE//kC7ZQQt5WDAqcZrhbTcfC8WATQP9QvadBhptIh2oDnoymEtpflM3
         Q7XrHRnCN29gelG60QssSK/XhSB6XVs+huUZB7ch/hSuuyjUf/ffVg0WjkcrT3+Jhzp2
         G9Dhejw98FyD4S5HGjwL5spUQ3+9bQbYMNTVrxF63bWf8YIjTwlzqk2BlgmarGvYOCui
         kvOOps2lah2Irq9wTPKZecAg+x6oC9li84dEmXZvHx31SFyGI1UQmSk3uoBOA6PUXuYu
         OIvCfe9OgkT+q8xz6vLPRDztqv/mWSMFzJl2fwjZzjtjX/XwVO7/sN1osD57bsvaTzlC
         zOGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794399727; x=1795004527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C3KBR3H9YyzSWZ/htLdN6t0rcyGsbU2SY2TDwqu/9VM=;
        b=v2fr2S1DGDPqqGLXJM0kfi9ZIPOyU1UGWmpu0npSnLbA5WBR6hpH/rG4VU2hltU8zS
         za8CRsV2O3JrFsFAay/QLnZET+MOOqogxpuwOCnkNqfpmQ1OOjk6EHCFNLyYmjNRHzxx
         TjP2pgMjGCIpG4tTyOZQcbXI4Nnc6nxvSqEiTiO9cRC3v2Jnu9cqa92QLc3o61kNV3VX
         WVc98vaFKG2XP3+d7F6GrPJEPBz/iC8AXu7cLYI90LbSCgcfRB2tVGGcX908son6zGil
         OfTYJPETnoL6UbrB/bGrDwnZFdamGY1XML70HVqyz/T9w0IzqnV3VYZ+yUaWUciFuudI
         n1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399727; x=1795004527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C3KBR3H9YyzSWZ/htLdN6t0rcyGsbU2SY2TDwqu/9VM=;
        b=nwYKnF8WiKynlTahsbPU3Y/DuRmJKJWqXu5kXqo6PEC827KXL4Sa7zvRNPYiEp0iiM
         Hy4pBHC+IxG46+MrqtsPkbJpZ+pEjhoPuTLlvOUIaN9/xi+sJXyvoN6em/mWsrDrL/7Z
         0zFUnTx5a518fk8nGau/hkUGpQm1qTp7Cy4OC9+wcNiHJ1DjCnAs0Ig9A2GI71yjlQjX
         j07sAiSH4XNYOR6plQwpfOt3LAoHtrKY4cBtKSW7kpQrhQ7Oy57dNO/mSamJ8S603Gt0
         2cuSF6Mr95XGCdoL18SKhLuj74F4kJHG62YgW/rkNpjEH4hNGmYVJaDk/bs+9rTGQBQ3
         aF0w==
X-Forwarded-Encrypted: i=1; AL+hErH4VRmG5ZFJz/d9w+mup6TNAxxRAxzHKQapD+gGK9JGqisWwnd/N7QL4FDTyk4uFsWgUx27r/HUpxA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KS+4BxnYRGKx96v7HwKTdvdKLZzLTkB7+abTckGCp2zhTxvei
	zR5FugASNXItqq5A1ilI4oUxvZI9HTzySb00XB/Bc/E5vtMvk5Cb4Vf9rx9Dgj5l8syH9w7k2Mh
	RR1DEBu4LAVKi15/3a/4lmf+kRoZ5kUDsALtBZwzoQJfS4T5RxhSphOdYaw==
X-Gm-Gg: AYBFou1ysnxgKlSO+Pvlueo/cUQ11/pNxRxww8DhVhgo6X+TMeo9ea0U5diu+6w0YA6
	+5GfpUStIBhNY+NPPl8n9VNWDxSEiH58EkxD9McVAWZ6MdtUYu5as+NRiUR9kJKBYJ6k1/7dO9A
	DS0+7oKh9kHyhg2pYNE7jPWgEslDLp/FXZi3VBG/ayKq0F+jEBosmLSGvCSfo06eDRcYlQjvFKZ
	0n2GCdMHID6dQP6dssuaqX5Zm1s3hJFjPsCw+XO248hN57t8fIXYtaJEiRhvvVHldCPL9SkpoUx
	SM1cFAdMktz8zlu3FyGfbpYp6+Uvkl8bTVES4w5oQ+dHUliWHjR2OEuklmBmdmkt/u9jzD5ytqm
	nMHbVLGys1dOXT7QI6NKuxwUh4akfacfVUSMMezVQ7TEUdHdcJmgzKZc3b5ddt/eUWR9putZ9QM
	yNYsJcaygYKrfz0xdmCIuVP4YJtfrvq3Q4cLcYfB/C23lZOuGk/TF8Ug==
X-Received: by 2002:a05:6402:2b92:b0:6b6:eefc:ae78 with SMTP id
 4fb4d7f45d1cf-6b777341867mr1845043a12.2.1794399727628; Wed, 11 Nov 2026
 04:22:07 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109133609.810876-1-robert.marko@sartura.hr> <20261110145414.GA3828324-robh@kernel.org>
In-Reply-To: <20261110145414.GA3828324-robh@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 11 Nov 2026 13:21:56 +0100
X-Gm-Features: AclHuK-NDRpRb_jYg5FQQ5B5fgUCjjm_CP_VsQUIeOlFZDuAlC2eNYg1mYw5Bfg
Message-ID: <CA+HBbNFE7ud3omp1e8A9w=PYMM+JPW-y94MiM68K2sz4HitU7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add Microchip LAN969x fan controller
To: Rob Herring <robh@kernel.org>
Cc: linux@roeck-us.net, krzk+dt@kernel.org, conor+dt@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com, 
	UNGLinuxDriver@microchip.com, nicolas.ferre@microchip.com, 
	claudiu.beznea@tuxon.dev, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 3:54=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Mon, Nov 09, 2026 at 02:35:05PM +0100, Robert Marko wrote:
> > The LAN969x fan controller has a PWM output and tachometer input in a
> > register block separate from the Sparx5-compatible temperature sensor.
> > Describe it with its own compatible and binding.
> >
> > The optional fan child specifies PWM period and polarity, tachometer
> > pulses per revolution, and thermal cooling levels.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> > Changes in v2:
> > - Describe the fan controller in a separate binding and compatible.
> > - Keep the existing temperature-sensor binding unchanged.
> >
> >  .../bindings/hwmon/microchip,lan9691-fan.yaml | 83 +++++++++++++++++++
> >  1 file changed, 83 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,l=
an9691-fan.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,lan9691-=
fan.yaml b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.ya=
ml
> > new file mode 100644
> > index 0000000000000..0b7d38a6d20ae
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yam=
l
> > @@ -0,0 +1,83 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/microchip,lan9691-fan.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Microchip LAN969x Fan Controller
> > +
> > +maintainers:
> > +  - Robert Marko <robert.marko@sartura.hr>
> > +
> > +description: |
>
> Don't need '|'

Hi Rob,

Got it, will drop in v3.

>
> > +  LAN969x fan controller with a PWM output and tachometer input. The f=
an
> > +  child's pwms property references this node to specify the PWM period=
 and
> > +  polarity.
> > +
> > +properties:
> > +  compatible:
> > +    const: microchip,lan9691-fan
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: System reference clock
> > +
> > +  '#pwm-cells':
> > +    const: 2
> > +    description: |
> > +      Number of cells in a PWM specifier.
> > +      - cell 0: PWM period in nanoseconds
> > +      - cell 1: PWM polarity: 0 or PWM_POLARITY_INVERTED
> > +
> > +  fan:
> > +    $ref: fan-common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      cooling-levels:
> > +        description:
> > +          PWM duty-cycle values corresponding to thermal cooling state=
s.
> > +        items:
> > +          maximum: 255
> > +
> > +      pulses-per-revolution:
> > +        minimum: 1
> > +        maximum: 4
>
> Drop. That's already the max in fan-common.yaml. minimum should be added
> there too as 0 would never make sense.

Ok, will add 1 as minimum in fan-common.yaml as a separate commit in v3.

>
> > +        default: 2
> > +
> > +    required:
> > +      - pwms
> > +
> > +    dependencies:
> > +      '#cooling-cells':
> > +        - cooling-levels
> > +      cooling-levels:
> > +        - '#cooling-cells'
>
> The dependencies should also go in fan-common.yaml. Perhaps
> cooling-levels without #cooling-cells might make sense sometimes?

I removed cooling-levels requiring #cooling-cells, as it can
technically work without it, its not ideal, but it works.

I am not sure if its feasible for fan-common.yaml though as we already
have schemas for EMC2305, and more importantly
DTS-es for freescale/imx95-tqma9596la-mba95xxca.dts and
rockchip/rk3568-radxa-cm3j-rpi-cm4.dts
that have #cooling-cells without cooling-levels.
EMC2305 driver even calculates cooling states without a levels table.

I would appreciate guidance on how to proceed with this.

Regards,
Robert

>
> Rob



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
