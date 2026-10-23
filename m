Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792790984;
	b=oZjWcHWXFxd75j8vrMNgywLzXoXxmePBvWdwpDZV18DPnu2WiRHFaZP0SEAxoybo7vb9
	 z2KyTpIaB8R7beM5CVn2sKn0wAef4I1/pXYPWUho8mSU6Jj8/MKr7aJ+Ue/S94UfxDBfm
	 GHWU/atRqDQvg69ogBEcyICNcKlwx4tV+Y/OwrvS8wwmbcZqbdXXuAKqTPjwn48FD5PRU
	 03QEzFOMrTZB67mGcb5zv8A1N6aejD57UBnKljpfqPT3xav7wZSot/LAsBxQ5ENObzmvQ
	 wIIr/FfZ27ei7IbfWsUEQzRdUdx4oygnJnk2L6m/kvtQy7mnujJS1kYgVEGqwFhREUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tUl6eNqYTZcDOJocOSUOl6ratLkDYu9rB2KUNaQCwrg=;
	b=sQAXPbAqgJ6PEGMWRmqCj555ah1n0Z7riNsGKhJiPY9kAaBvyxdZbuQ8lfHD8XClLJbe
	 yw4TJCrP/lamFP4RXh1fiOHTCKn2gVpeHnxLRr2H15U2K8ARSpqRHHrapXrbnmLqbh0TA
	 yGrWdLZZQTb0fqU6Pg6prxhcps8MAlfR4G/yWbrCUtZzZjBfmDdLrqSWK+gZvl3p/UTTl
	 s6wwRauNjQ7QifwfXaCqyjtSyMUsU5KJDfl2AZtVE3d0FicYFT4YhC57tB6zz/DX6DYq2
	 XG3nnnvn39zpzupXNsfsRx3tAeKEtpCf5g0YOZMVn3wkbwse6nKQbsYeNK+ToYbW0nA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bfcjC1d1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BC4606A31A
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 21:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3BC4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=bfcjC1d1
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8871ada1a26so9950827b3.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 14:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792790983; cv=none;
        d=google.com; s=arc-20260327;
        b=OX1QyvpakrDlRCdbUm/MrqPKJGp8rLdYBIfCnUsNHMvF5edeaj4MVl0bnJni5KiOsO
         oJUwlp7W52QO3vxqWsyGTq3KZPJHg+JM+YJmOGhsBDrTsvIKKlmAdiGJWbL+wiJV8eV2
         rn/42zuG2mqGawaNg/qKDfJGUkB5lzuDrNP6sKpqR73HSDcdhYc126qCoe08x0P99xjk
         5Z+LN7x3xvFaA7Ucj+HXY+roQF6rPSMoPqveie9ts0iWPt70Z1bOUM2I4cLewNbkss6A
         3TtZfRk/nCsdWP0nsbKSd9PO+ZPIZkxkRPzAwvfwZ+ZmiWnmrVDogQ908hH5PXn8co/Z
         rWxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tUl6eNqYTZcDOJocOSUOl6ratLkDYu9rB2KUNaQCwrg=;
        fh=Vaz8Rj0LXTL9HVAMccIwDfUgiF4XjlS0kB6sbtWPj1M=;
        b=bnaAcEtqpw6PU4VlVBi1hwsbxTmQlVgVfNM4VlYZCT7yx+MY2Z6uOiOeJ+iZWo/3Rx
         awDHfok+HdIv0ce5g/IyDabnZGzDQQXY34Uv9DjZkqyiw4p76VlogkslDU7f/4pLXvCN
         3PPCFZyyLJoQp7BxcyLiD26MpCbqK7EiCcsV1IZCkXwYNR09uitNK002UN6QmX7nJg0d
         +apq5R9VjealNvfIqbBW5k81qlJ6XMFgAD/FK08ryvw2qAh88lQkvLF7w3J4rXj85HlX
         B1GkQLXRI1tajE3UunQuCQl2dPYmplKTiUa19JPqm8TvhrRGRmZrIx8YxD/GvWLHi4T1
         IgOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792790983; x=1793395783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tUl6eNqYTZcDOJocOSUOl6ratLkDYu9rB2KUNaQCwrg=;
        b=bfcjC1d1vWOT1pE9X7gNabyHtF99QX5dSLBV1xVK5YhE+PCKgQcMtacFiknvczljas
         pSbRQQ9f00apAwLTNHlvUICLRGZIUiHLO8ZQWR+ht4d+xEi4Ee1BfJDsQU16ahnkS88G
         uC4l5/cmHNgM95Gpkf2IrZNxEA2vsG73DTUts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790983; x=1793395783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tUl6eNqYTZcDOJocOSUOl6ratLkDYu9rB2KUNaQCwrg=;
        b=pGzAM2OMiFEswzYWVZCpOBFKtR9A5KeigT2R8RGY2Ea3FIXAgYOS5lB5DZPH81kQK7
         JBLvEBnRAQ0+m3b9pVsDiG1urC09htnO5LWhxr0rtvpCROZwrOtWrazivPB2rZBKxk8V
         hqcinfmG6KEQkttzy00wEfFaQDIPw6KLsFGa17+OxQMiJV6jnzxDjr6GCOaukE8fmn6a
         B2zPy63wNtwVd4GByEVRr6DuFAo7IsjVQwLNbJJcFjtJHu7WpybY2Xy/+lxX6L4ZtBnm
         UTIVc4VUvD/QCKB6mm7P87SsJ2BDwOAXhvXccpFWpqHHb7m6W1F/4YGmJeal3bG46Afi
         hG2w==
X-Forwarded-Encrypted: i=1; AKwUvBzItgnYmCC9wEdnFhV1jfySEMrRthkPxLDg+skZgFrkHx+KCsim/p/LAc/9PUCaXzzyOxrbn0j7Bl4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKDI0rxG9gYb56o4KpWuaBacM61384HyRSh/kdqX3OBUx+oU50
	1XBZb6DqgBCS+SbDeOGDQWMgMeTSdkF4I8zmcUOQabuRSbtqTXhdhWIR6vuOx5qmTr6pe5n/PPp
	YkDFfjqONh3pKANxPZRGfXB1zu+3Yeid1UtYvcZh7
X-Gm-Gg: AYBFou2wn7cm5aXGkyJkONZsy/wlJkjKQVCZyK8v+TT3ZvdyutINv1z0/lcanyHc+Pm
	7grbedmqAcpmOPGOI4J9TkcKHHdzp1vaWuEr/nqFbgmG1pwK0b1TnzbB18zXFZHn7tpaZrF6gla
	DRK/BJtmXoix2a+BQEr7WXOUs61dYjtGIt13H3jGK3HqJO9pATX3uEVjX9cns7GXn1ynyV54/11
	WWu4qiXP01h8/o4Vuv3FOix9ilOAZ7bcH2NoPfJmalf3WkGtdVTvop9GaevSinsFLA5oYvoWmwI
	wxuDU9Y7JKKloaRNsxBhSL5lFFTGVb1Hox3sIpN2r3Y/eqwRH0OZaZENZSMmyb1xTHwD2+lbktr
	ElqNFicalu5aq3ZC1BlKo3zjEEQt4GB4TH+RXL3GdGlGh/5epn8LrBNKC9oNCQZezOA==
X-Received: by 2002:a05:690c:6113:b0:8b0:9e11:b636 with SMTP id
 00721157ae682-8b166c28a62mr2850907b3.62.1792790982824; Fri, 23 Oct 2026
 14:29:42 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-send-upstream-v6-0-cb9ba4b3d6fa@chromium.org>
 <20261019-send-upstream-v6-8-cb9ba4b3d6fa@chromium.org> <20261020-breach-aim-4a497c0089e6@spud>
In-Reply-To: <20261020-breach-aim-4a497c0089e6@spud>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Fri, 23 Oct 2026 14:29:31 -0700
X-Gm-Features: AclHuK_rDtmewSuhFWuooVP3bMSAuGCimyDmFSMqJ4WysgkfaBZ_lCNbaUs0JsA
Message-ID: <CAEe3GZHKKXTMGKTNKK2VxWJucCdTM1cTEQ1MWeN+CYzdkYb8xA@mail.gmail.com>
Subject: Re: [PATCH v6 08/11] dt-bindings: input: Document hid-over-spi DT schema
To: Conor Dooley <conor@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, hbarnor@chromium.org, tfiga@chromium.org, 
	fqwqf@fqwqf.xyz, daleyo@gmail.com, Dmitry Antipov <dmanti@microsoft.com>, 
	Jarrett Schultz <jaschultz@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 10:57=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Mon, Oct 19, 2026 at 07:01:20PM +0000, Jingyuan Liang wrote:
> > Documentation describes the required and optional properties for
> > implementing Device Tree for a Microsoft G6 Touch Digitizer that
> > supports HID over SPI Protocol 1.0 specification.
> >
> > The properties are common to HID over SPI.
> >
> > Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
> > Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
> > Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
>
> Signoff chain is not right, since the nominal patch author is the last
> signoff.

Thanks! Will fix this in v7.

>
> > ---
> >  .../devicetree/bindings/input/hid-over-spi.yaml    | 130 +++++++++++++=
++++++++
> >  1 file changed, 130 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/hid-over-spi.yaml =
b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
> > new file mode 100644
> > index 000000000000..2a5fa0868a09
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
> > @@ -0,0 +1,130 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/hid-over-spi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: HID over SPI Devices
> > +
> > +maintainers:
> > +  - Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > +  - Jiri Kosina <jkosina@suse.cz>
> > +  - Jingyuan Liang <jingyliang@chromium.org>
> > +
> > +description: |+
> > +  HID over SPI provides support for various Human Interface Devices ov=
er the
> > +  SPI bus. These devices can be for example touchpads, keyboards, touc=
h screens
> > +  or sensors.
> > +
> > +  The specification has been written by Microsoft and is currently ava=
ilable
> > +  here: https://www.microsoft.com/en-us/download/details.aspx?id=3D103=
325
> > +
> > +  The HID over SPI specification does not define fixed values for the
> > +  read/write opcodes and the input/output report addresses. The host
> > +  retrieves them from platform firmware (ACPI _DSM), and they differ
> > +  between devices. These properties provide the same values on Device
> > +  Tree systems, so devices that fully comply with the specification wo=
rk
> > +  with the "hid-over-spi" fallback compatible.
> > +
> > +allOf:
> > +  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - microsoft,g6-touch-digitizer
> > +      - const: hid-over-spi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description:
> > +      GPIO specifier for the device's reset line. The HID over SPI
> > +      specification requires a dedicated, host-driven, active-low rese=
t
> > +      line. The line must be flagged with GPIO_ACTIVE_LOW.
> > +
> > +  vdd-supply:
> > +    description:
> > +      Regulator for the VDD supply voltage.
> > +
> > +  input-report-header-address:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 0xffffff
> > +    description:
> > +      A value to be included in the Read Approval packet, listing an a=
ddress of
> > +      the input report header to be put on the SPI bus. This address h=
as 24
> > +      bits.
> > +
> > +  input-report-body-address:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 0xffffff
> > +    description:
> > +      A value to be included in the Read Approval packet, listing an a=
ddress of
> > +      the input report body to be put on the SPI bus. This address has=
 24 bits.
> > +
> > +  output-report-address:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 0xffffff
> > +    description:
> > +      A value to be included in the Output Report sent by the host, li=
sting an
> > +      address where the output report on the SPI bus is to be written =
to. This
> > +      address has 24 bits.
> > +
> > +  read-opcode:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    description:
> > +      Value to be used in Read Approval packets. 1 byte.
> > +
> > +  write-opcode:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    description:
> > +      Value to be used in Output Report packets. 1 byte.
>
> I still dunno why any of these properties exist, especially when there's
> a patch in my queue for another microsoft touch device on top of
> this series that does not use any of them.
>
> The commit message really needs to explain why these exist and why
> compatibles cannot be used to determine these things - as is done for
> the microsoft,romulus13-touchpad. If the very next device that appears
> seems to require a specific compatible and cannot use these properties
> to get across what's needed to the kernel it calls into question why
> the binding is designed like this.
>
> pw-bot: changes-requested
>
> Thanks,
> Conor.

Will drop these properties in v7.

Rob, since the binding changes, I'll drop your Reviewed-by from v7.

>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - reset-gpios
> > +  - vdd-supply
> > +  - input-report-header-address
> > +  - input-report-body-address
> > +  - output-report-address
> > +  - read-opcode
> > +  - write-opcode
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    spi {
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +
> > +      hid@0 {
> > +        compatible =3D "microsoft,g6-touch-digitizer", "hid-over-spi";
> > +        reg =3D <0x0>;
> > +        interrupts-extended =3D <&gpio 42 IRQ_TYPE_EDGE_FALLING>;
> > +        reset-gpios =3D <&gpio 27 GPIO_ACTIVE_LOW>;
> > +        vdd-supply =3D <&pm8350c_l3>;
> > +        pinctrl-names =3D "default";
> > +        pinctrl-0 =3D <&ts_d6_int_bias>;
> > +        input-report-header-address =3D <0x1000>;
> > +        input-report-body-address =3D <0x1004>;
> > +        output-report-address =3D <0x2000>;
> > +        read-opcode =3D /bits/ 8 <0x0b>;
> > +        write-opcode =3D /bits/ 8 <0x02>;
> > +      };
> > +    };
> >
> > --
> > 2.56.0.212.g129ede20d9-goog
> >
