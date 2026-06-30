Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E35E32D0D4
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 05:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782795787; cv=pass; b=sIs/kNiBnWiZsh8pZPuBcMxlj9fdJufcpqI3ZxzC7z21qPRR+woiH3b2pspOv+9idVM89lD/1U99FLivw2cLL9I+xpVPjaVZLXlXMc4eiQAPpAqkbODECWNEgJ83lfsegibCQrAATIOs0PlccQ4+g+E8yYhFD5qvYwdJKcVBJHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782795787; c=relaxed/simple;
	bh=26K430vXymRYfpzEosj02/cVImWPiZf8cypsFbNDMQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qpj/Vwi+vNCWBR8M9G0dOz/iD8YoeY3RH8hDj38ZC0GCnst4oPZ92ggO3qng5nmqruU9H5ZQB6BSwRngEr20dI00AuuNrESKJbsUZPwuh9MCVD8RRQEPi8amPQgcnE5nV17Yg70XryspyI6nFfVfZ81J9JHj5FZBXNOw5DEl1pw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qAexHRIH; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qAexHRIH"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30edbb0dc5fso1643967eec.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 22:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782795783; cv=none;
        d=google.com; s=arc-20260327;
        b=EwRM2L6gqtH1eoGi+NcNSsvCVWjuVJpncWeTeF///4epdwBEHne4kluVNK3RRikHAe
         6hgFmOzKFUjHGChfBLzkjtjGfeVgRMJ2rbq1nNly3kgRafO9+uJi+wdUaFZiswrzeEbi
         AXIQHvBOWWf3z1K7SI9Hx7jPfxfVwYQPXP4vqOuzB6fcsm6gUD1zU6S5dZ6vC5vAjpdT
         1//8YtWJR7iB83rJ5AFQJt0KHsM8OS2qwf+h0F25AVOmXHj2IIYkT7MM+DVSvI2u7UpV
         fimBlDt5osp+mpyhORSzGcRiD6HK9lKWkNlQTdLrLQBOKi4NwTDylQ/SuT5aO0xrPZlU
         ROhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ra4+EZwCsIZYaZYh4YnWOQ2c+mtq4i3SaPInPLLqG0E=;
        fh=Av8KwHQcbDaRUQIiuhxceEKXuHg3D3zT61k2MwWzT3o=;
        b=p6SB6MgWJPyRWKEEAOIy7h+SGtV4xu7Ct0cHL73cXGeYbWVpgpDupo6MP8ugNyHlrg
         NxVYaq47LUd66eJNBEP3fptIok73aHY2YOYLD3J0tZ1fiVldQ1NLplOTWb+dyH6sz5j0
         LOYkoWHnORVUh36/H6sXAi+CtCEv2usuf0osXcdbIkMecfoPvzIYlHTJdrQiGEwfhYZu
         5fTgfhOsH0imrm9UO//S4ogCuRE/yKothOeX/TLL9ORXj6t3jWlmJFZ5imspNik3ISqL
         wbYo+LfQCZP8Ia6E0zcUmMd3CNvtDwod9nJOqIrIeBxe3FG/13hC2aOKPcqC+PZNutKb
         LCTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782795783; x=1783400583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ra4+EZwCsIZYaZYh4YnWOQ2c+mtq4i3SaPInPLLqG0E=;
        b=qAexHRIHd5dXnB3U+++j+Lm9atKKfOdy40BJgELzY6V2eZpMvV7pa6bLZUcALe+18l
         cjOiqfXm0yWl2arz9YlA7cLHnVh5fYXPrFFUFE6/j3QKAQc566O52Xw+6xcoTGU3N80J
         siLhsuXLOhDTd+MTlpA1KEDtkPjJNrrBT2ItmSr1EBppU99x1EqphzhPMhZYPhxiFZ27
         TUULv++95yMjTFL3R7wh+Lwm1wIaRaddu2dHq5Jp87mwYmL3m14YO5mN9WCEUunOOhS+
         DtlEbC0f6AzSEAqSeDLJWnZ3gfnHUJORfX3ea0GsuIeHikv6bS35w7b6u2JrF8wuKXhc
         +aSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782795783; x=1783400583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ra4+EZwCsIZYaZYh4YnWOQ2c+mtq4i3SaPInPLLqG0E=;
        b=mejQ+gsrGew4aE6Qc7rmIY4uqTa1O5+CSXO8JH3WRZiFZpwkZMHvgYlvtKBz5QrK5R
         rkBzhwkz8WQqs1B3F2WG4WwTz/TycO51d75gF2+bunfaJLHKCi1yeuaArS1d3IIHQBTh
         nZTmbPFa1MXhOGWXoDn/N89c5Awt7xHYMuB9pkkdofO4Z02E+xpT8JHAJLNYeuLWc0hj
         woGY6Mi6yLykUCCsXBiChaySzhd2zqYexsb8XTJpHoCdt2vm+QFBF1N5vWxFIOdiR6DA
         obgIHXVdFQmiTG0J4vGwU2pb2qOdQMOiMQJO5SZzoJdTRyAMUtp0vnCi+Lzusyd3tO7t
         RR2Q==
X-Forwarded-Encrypted: i=1; AHgh+Roz9Q6WsL1IectQjAGbL7WULi6TAdNeAL8jEJ1ykYo2mUICxJjeaMDPxioAWwGTdPdtQ+9L3gkvaSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzIVdzdIvpXjnC6n4uYVOuQ4BhukSAGgcTqO0KkFPtM2d7GYVV
	zcSxXFR35uoBuYrY7XjE2uTT9gSXUBbJSXvsEeyYTvREBunoNV5fw0JB3+ZB8ncn6XoVdIRs+qu
	xh62fb0Rw/tCya7JME6PVwB6Ri6ibl4c=
X-Gm-Gg: AfdE7ckSJHpf5Vm1DQ6ovfDg5NSvjI5nPct68iuDSnxV4v3TMdCCupA37IfQSwA0BpM
	te6q8MG5qd3V1dHWalUEvXOe1sTdtaHRwzmDsiiaDnJzpfEU713hMe6QpJaV09NMM6TxYh9RrTq
	AIPTBPKOw+3FZWUveVkJgys7k4QS0x9t26WlmSe1mop+twmKedkPuWIXlAIEPEbCS1H22fgcnG/
	3An5lU7MW514eq+hybMpw41xSfGMo3dS0Fz55ks1DtmTLj1HLLJd4zUJNz2bofb3qNvhpeG1Lfj
	ZIxmHbg+khcaYU4IwaF91Liab7EyM0OJ9qk15567rfY+sE60DUIjL5yC947BS/aJNNFyFFM=
X-Received: by 2002:a05:7300:508:b0:30c:5ebf:63c9 with SMTP id
 5a478bee46e88-30ee12c2c20mr1759132eec.5.1782795783293; Mon, 29 Jun 2026
 22:03:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260628191337.937-1-kimjinseob88@gmail.com> <20260628191337.937-2-kimjinseob88@gmail.com>
 <20260629-gilled-henna-96bde265d7ed@spud>
In-Reply-To: <20260629-gilled-henna-96bde265d7ed@spud>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Tue, 30 Jun 2026 14:02:52 +0900
X-Gm-Features: AVVi8CfXUuhem7yefx-KLpyYAbEwG_H69geGautzK_Hqk2IAHIRaKOFDs0XRRSw
Message-ID: <CALMSewJ3+GFSww2qpa4Vq0yUhe=Z7mTiw+ZJYAiHeJ1vqXPr_w@mail.gmail.com>
Subject: Re: [PATCH RFC v6 1/5] dt-bindings: iio: add Open Sensor Fusion device
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I will remove that sentence in the next revision.

I will also drop the RFC tag for the next version unless there are specific
open questions that need to be called out.

Thanks

Jinseob

2026=EB=85=84 6=EC=9B=94 30=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 12:39, =
Conor Dooley <conor@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon, Jun 29, 2026 at 04:13:33AM +0900, Jinseob Kim wrote:
> > Add a binding for the generic Open Sensor Fusion host interface.
> >
> > Open Sensor Fusion devices report capabilities and samples over an OSF
> > protocol stream. Sensor channels are discovered at runtime from
> > capability reports instead of being described individually in Device
> > Tree.
> >
> > The protocol version is discovered at runtime from the OSF frame header=
.
> > OSF GREEN is a product identity, and OSF0 is a wire-format magic value,
> > so neither is used as the Linux compatible string.
> >
> > Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
> > ---
> >  .../bindings/iio/opensensorfusion,osf.yaml    | 54 +++++++++++++++++++
> >  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
> >  MAINTAINERS                                   |  6 +++
> >  3 files changed, 62 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/iio/opensensorfus=
ion,osf.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/iio/opensensorfusion,osf=
.yaml b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
> > new file mode 100644
> > index 000000000..8016d582f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
> > @@ -0,0 +1,54 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iio/opensensorfusion,osf.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Open Sensor Fusion Sensor Aggregation Hub
> > +
> > +maintainers:
> > +  - Jinseob Kim <kimjinseob88@gmail.com>
> > +
> > +description: |
> > +  This binding documents the generic Open Sensor Fusion host interface=
. Open
> > +  Sensor Fusion is a sensor aggregation hub. The hub exposes an OSF pr=
otocol
> > +  data stream over its host interface and reports capabilities and sam=
ples for
> > +  multiple sensor classes. The actual sensor channels are discovered a=
t runtime
> > +  from OSF capability reports instead of describing them in Device Tre=
e. The
> > +  protocol version is discovered at runtime.
> > +
> > +  Public project documentation is available at:
> > +
> > +    https://github.com/opensensorfusion
> > +
> > +  The compatible describes the generic Open Sensor Fusion host interfa=
ce.
>
> > It
> > +  is not an OSF GREEN board identity, and it does not encode the OSF0 =
wire
> > +  magic.
>
> I think this is evident from the previous text, and the first part is a
> bit confusing while the latter half is a bit confusing.
> Just remove this sentence I think.
>
> Binding looks fine to me, I'll provide a r-b when you submit a non-RFC
> version.
>
> pw-bot: not-applicable
>
> Thanks,
> Conor.
>
> > OSF0, protocol_major, and protocol_minor are wire-protocol details
> > +  exchanged in OSF frames.
> > +
> > +allOf:
> > +  - $ref: /schemas/serial/serial-peripheral-props.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: opensensorfusion,osf
> > +
> > +  vcc-supply:
> > +    description:
> > +      Regulator supplying power to the Open Sensor Fusion device.
> > +
> > +required:
> > +  - compatible
> > +  - vcc-supply
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    serial {
> > +        sensor {
> > +            compatible =3D "opensensorfusion,osf";
> > +            vcc-supply =3D <&vcc_sensor>;
> > +        };
> > +    };
> > +...
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/D=
ocumentation/devicetree/bindings/vendor-prefixes.yaml
> > index 28784d66a..88172d4a4 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -1237,6 +1237,8 @@ patternProperties:
> >      description: OpenPandora GmbH
> >    "^openrisc,.*":
> >      description: OpenRISC.io
> > +  "^opensensorfusion,.*":
> > +    description: Open Sensor Fusion
> >    "^openwrt,.*":
> >      description: OpenWrt
> >    "^option,.*":
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index c2c6d7927..e4df9d8dc 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -20011,6 +20011,12 @@ F:   Documentation/devicetree/
> >  F:   arch/*/boot/dts/
> >  F:   include/dt-bindings/
> >
> > +OPEN SENSOR FUSION
> > +M:   Jinseob Kim <kimjinseob88@gmail.com>
> > +S:   Maintained
> > +F:   Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
> > +K:   opensensorfusion
> > +
> >  OPENCOMPUTE PTP CLOCK DRIVER
> >  M:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
> >  L:   netdev@vger.kernel.org
> > --
> > 2.43.0
> >
