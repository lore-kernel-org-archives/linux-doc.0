Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD8433EAFF
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 00:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773277140; cv=pass; b=rsKgZKYz04n0tF7E8cDbytS0UurbDKFbTcH6RL/tZqNab8biBn8utqBRa8msZYgHtY3t6TYJH5nS01N0ovzk5s6PMO225FkiVJni7f9fd5pKV9XH/OVbtLT0Gr01XKHgx4E29EdyKJxWDYAJK9P+Y1pASSl6BcK45/BsNI6GgeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773277140; c=relaxed/simple;
	bh=/U4y6zMTaicCXSRzWDrp1+5aO6aDI934v4bGAGFBGSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lFGbksQBxgFgQLrVjFbiGQ32pn58ngKifeM+DyzDmiIGOIbPM7Z9YtVZIlr9G8TYI53qv1Xw5Q/w6AWgaKRLrK6FYxuhVFX4lQsAYgvLmfmKotx/ec9pNyOb7EH1wHV+bTQ7Mvnqstep0rrKXnVXPHcX0IKIj2fCxenjooRTKyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XSmm664+; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XSmm664+"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64aedd812baso448245d50.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 17:58:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773277136; cv=none;
        d=google.com; s=arc-20240605;
        b=NCDRPuknQOv6yIpWK5jJGfodu3JFxSZUagpLKqwfZ20oamIrrmVeZn+u5NFPt2ANY3
         BJtEPIruYFKRFrKoNPT5oTsxFZkWt0/vAh5WhFA45e/4wtdQC1BQm9Ha5Y0UIOfCjVhP
         vv/pqN29qME1FLLOl/ii3MH80AVpVelhLnq5Yb+laYvPtaoRCvUsN4Heb89YxvsFrbKk
         tD9tw0fOlnV2ldlaLlRApYLFKIo8JekSMNlY/TkU57AdIw79ckDPOn+00IvTuv3b36yC
         7poTinP2fOa5UpU2CWdy/xqF06B9KAvMudr3ptOx8gu+uBgoH6Ulv+qBlBBXVZWTj3Id
         dR2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hm+lu25xFH5D13LzOfbqgKLYsmGame8eJlz+wGxK40k=;
        fh=0j9VVMF5qb1moQ9sqQorVCSVVRl8jZy7pZD0OZVrmss=;
        b=GnAsZQ3smPaIptjALFf35gUmZKQtjbck7RsXCe9J/HJvqg1fbJ8t1jJ/Z0VRwY34ng
         1WJdrjE1heEKBpX9z0qJvJhdMYkr+KXOyrPPVCMID3lhF1ZGTI/0TzYgjvrSJbxCot1o
         g7eFTqDw4Wpjn86A+Sd21vZJVov+MTRiZXUKaehzXWpDkJ+hLOxu1iy+yTsmvWTkVdjM
         MewKTp6CtXWDQoWwE8bdfB8g8g/mVR61G9x+Y3i36oDhCiuB2eb/jrTnJCr6HTUwyXZs
         O0EpqNEn+9iBfXCaP/A2GWQ7N8yRjvnsodELa+WISkt3hj/RQ5GY8w8UaqG+sjOXDqw6
         ldsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773277136; x=1773881936; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hm+lu25xFH5D13LzOfbqgKLYsmGame8eJlz+wGxK40k=;
        b=XSmm664+cpfOX++b/WASYI+HDr/mXw8VjWvr3goVQdJDMsHcwWVhGVp3VlY2/EOq/e
         cOCptFmrJaJRPR10fWmyzHERv4q0vwvKrRIGsdPPih2/sO+jNybIXpQmlNawq3p66aNm
         UoIlxrsSumXnUivwq7Cc9bLkwhBiOc7ktlyyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773277136; x=1773881936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hm+lu25xFH5D13LzOfbqgKLYsmGame8eJlz+wGxK40k=;
        b=JQLdReoTc700r7ZCFW/0OST2q5Gk75Qf00WfvhrSQGTxil7eizc5iiQFilwHzZ5Jkk
         pDa3OHATniZ6CSZyD9RZqKj1BzL7iFaFZLz4UPNdMBZ6uydDJnJw7rUUsVgTcGp04r3B
         004bWPh6sa2ytTqi9ZpjeMS+gaEPvVVIk9XtDVQX1/djGisbIUEK189Hmtu317Rm7MBC
         FmYBGikcwBxCg3EPp3+RAm4qvMroua+OZv/RUyvqnnI46gfRNysXsTmw9ANZ0j1c570R
         pPFls9TtSBrCGlERVbxF2BYUtIbHhTmapgt6VpfsMU6JF31xj9Ybqh23CaunANLjIuu0
         yRWA==
X-Forwarded-Encrypted: i=1; AJvYcCXPvJqQPbcGUMBkPJNX0piL6LQHUtdDIAH+MrKoDZTwntUCvsVscW3nSFfLXOEf6/cfsnhm6uOCIB4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1z6QJyoqIeDMJXSng/KXNFAewqcMMRhxSXb441r9q8kCFvtoX
	Ny9+SO1rZ1JSnUVYxgobz98vdXrv8fm6l8CMf4GhtJoGx4h5aqUO+4O7/pTKq5GBDN9ct6ejx7u
	Vqnnn6Bni5naa8HUJgvAEYekCJHuiHqWoeHV1fPXe
X-Gm-Gg: ATEYQzx9RuoO39/IMbOCRYED9jOGaAan0/iZg3s4QwiggTrwb0LaFwvmvadbWcgcwx0
	PWYntlhxQZqxPRo9wca12cphkxyQBQQRk85B0eQVw4e3Z7TsMzKft+5CJZZte21rw+P4zoTRDVi
	734wClRypMxnp/3G4J0XgozDldL8TiG4mh0uQ7wKuPN54gNbfDJbuQ5ne8E8ywXZJW+95FPFZa9
	YtetY091+ubrBt2fppeeWj2p9gnpGY36Sl6qKI8K59xH8qp0gDmSKT1IkA8LVC9IETDqYVFmvfk
	W1FedCk5zl1JWNNL+AONdGUvTUP6M7ngOnD7jz7M
X-Received: by 2002:a53:ee54:0:b0:644:60d9:8648 with SMTP id
 956f58d0204a3-64d6587b0dbmr3375090d50.87.1773277136581; Wed, 11 Mar 2026
 17:58:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303-send-upstream-v1-0-1515ba218f3d@chromium.org>
 <20260303-send-upstream-v1-9-1515ba218f3d@chromium.org> <CAL_JsqKN45FswZjo+27OzoHMeM7ec3hS7piF7SKNykmXNSmA0g@mail.gmail.com>
 <CAEe3GZHSqepvjjopLwrWX3_n4+RnCeVVQnAO=Swixgu2z3OpUw@mail.gmail.com>
In-Reply-To: <CAEe3GZHSqepvjjopLwrWX3_n4+RnCeVVQnAO=Swixgu2z3OpUw@mail.gmail.com>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Wed, 11 Mar 2026 17:58:45 -0700
X-Gm-Features: AaiRm52dLVPqyen2q9prIqB7vkYq8vC1PiQ2eD_fJkVgOSB27JkdvvaCBQOmlW4
Message-ID: <CAEe3GZE_79Lqtzv4ZRi6zWuV_DgkCREBDcZJjpR+X9OaGZCA2g@mail.gmail.com>
Subject: Fwd: [PATCH 09/12] dt-bindings: input: Document hid-over-spi DT schema
To: Rob Herring <robh@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	linux-spi@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Henry Barnor <hbarnor@chromium.org>, 
	Dmitry Antipov <dmanti@microsoft.com>, Jarrett Schultz <jaschultz@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(Resending to the list. Apologies, I accidentally dropped the CCs on
my initial reply!)

On Tue, Mar 3, 2026 at 5:53=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Mar 3, 2026 at 12:14=E2=80=AFAM Jingyuan Liang <jingyliang@chromi=
um.org> wrote:
> >
> > Documentation describes the required and optional properties for
> > implementing Device Tree for a Microsoft G6 Touch Digitizer that
> > supports HID over SPI Protocol 1.0 specification.
> >
> > The properties are common to HID over SPI.
> >
> > Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
> > Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
> > Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
> > ---
> >  .../devicetree/bindings/input/hid-over-spi.yaml    | 153 +++++++++++++=
++++++++
> >  1 file changed, 153 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/hid-over-spi.yaml =
b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
> > new file mode 100644
> > index 000000000000..b623629ed9d3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
> > @@ -0,0 +1,153 @@
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
> > +
> > +description: |+
> > +  HID over SPI provides support for various Human Interface Devices ov=
er the
> > +  SPI bus. These devices can be for example touchpads, keyboards, touc=
h screens
> > +  or sensors.
> > +
> > +  The specification has been written by Microsoft and is currently ava=
ilable here:
> > +  https://www.microsoft.com/en-us/download/details.aspx?id=3D103325
> > +
> > +  If this binding is used, the kernel module spi-hid will handle the c=
ommunication
> > +  with the device and the generic hid core layer will handle the proto=
col.
> > +
> > +allOf:
> > +  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - microsoft,g6-touch-digitizer
> > +          - const: hid-over-spi
> > +      - description: Just "hid-over-spi" alone is allowed, but not rec=
ommended.
> > +        const: hid-over-spi
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
> > +      GPIO specifier for the digitizer's reset pin (active low). The l=
ine must
> > +      be flagged with GPIO_ACTIVE_LOW.
> > +
> > +  vdd-supply:
> > +    description:
> > +      Regulator for the VDD supply voltage.
>
> Is this part of the spec? This won't scale for multiple devices with
> different power rails.

This is not part of the spec but is needed for power management. Is it okay=
 I
mark it as optional? Thank you.

>
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
> > +     A value to be included in the Read Approval packet, listing an ad=
dress of
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
> > +  post-power-on-delay-ms:
> > +    description:
> > +      Optional time in ms required by the device after enabling its re=
gulators
> > +      or powering it on, before it is ready for communication.
>
> Drop. This should be implied by the compatible.

Thank you, I will fix this in v2.

>
> > +
> > +  minimal-reset-delay-ms:
> > +    description:
> > +      Optional minimum amount of time in ms that device needs to be in=
 reset
> > +      state for the reset to take effect.
>
> Drop. This should be implied by the compatible.

I will fix this in v2.

>
> > +
> > +  read-opcode:
> > +  $ref: /schemas/types.yaml#/definitions/uint8
> > +    description:
> > +      Value to be used in Read Approval packets. 1 byte.
> > +
> > +  write-opcode:
> > +  $ref: /schemas/types.yaml#/definitions/uint8
> > +    description:
> > +      Value to be used in Write Approval packets. 1 byte.
>
> Why are these and the address properties above not defined by the
> spec? Do they vary for a specific device? If not, then they should be
> implied by the compatible.

These properties are not defined by the spec:

"The Input Report Address (header or body) and READ opcode are retrieved
from ACPI."

Same for the output report address and write opcode. I will drop these in v=
2.

>
> > +
> > +  hid-over-spi-flags:
> > +  $ref: /schemas/types.yaml#/definitions/uint16
> > +    description:
> > +      16 bits.
> > +      Bits 0-12 - Reserved (must be 0)
> > +      Bit 13 - SPI Write Mode. Possible values -
> > +        * 0b0- Writes are carried out in Single-SPI mode
> > +        * 0b1- Writes are carried out in the Multi-SPI mode specified =
by bits
> > +               14-15
> > +      Bits 14-15 - Multi-SPI Mode. Possible values -
> > +        * 0b00- Single SPI
> > +        * 0b01- Dual SPI
> > +        * 0b10- Quad SPI
>
> We already have SPI properties to define the bus width for read and write=
.

Will fix this in v2.

>
> > +
> > +required:
> > +  - compatible
> > +  - interrupts
> > +  - reset-gpios
> > +  - vdd-supply
> > +  - input-report-header-address
> > +  - input-report-body-address
> > +  - output-report-address
> > +  - read-opcode
> > +  - write-opcode
> > +  - hid-over-spi-flags
> > +
> > +additionalProperties: false
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
> > +        compatible =3D "hid-over-spi";
> > +        reg =3D <0x0>;
> > +        interrupts-extended =3D <&gpio 42 IRQ_TYPE_EDGE_FALLING>;
> > +        reset-gpios =3D <&gpio 27 GPIO_ACTIVE_LOW>;
> > +        vdd-supply =3D <&pm8350c_l3>;
> > +        pinctrl-names =3D "default";
> > +        pinctrl-0 =3D <&ts_d6_reset_assert &ts_d6_int_bias>;
> > +        input-report-header-address =3D <0x1000>;
> > +        input-report-body-address =3D <0x1004>;
> > +        output-report-address =3D <0x2000>;
> > +        read-opcode =3D <0x0b>;
> > +        write-opcode =3D <0x02>;
> > +        hid-over-spi-flags =3D <0x0000>;
> > +        post-power-on-delay-ms =3D <5>;
> > +        minimal-reset-delay-ms =3D <5>;
> > +      };
> > +    };
> > \ No newline at end of file
>
> Fix this.

Will fix this in v2.

>
> Rob
