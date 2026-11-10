Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794308921;
	b=4mLf3WoNqCnG4+r4a6A3Vq6PUyMMK8yCgdmRJY9Z055QbtPqqCJjexuA9oATcYuMeUqq
	 d7RDnBmoZ0gtxFhsM1StGgFE+TJ125bfZOzsX6DAki4a3AL1AbyHtAtRIZw6jKU3fDwWg
	 hzEsqC1vpLoosznXXHPt5utxNy+8qmdPdb1R6jhYj7pX5YFg2Fgy2B3bjSutF3UT6awkV
	 so8M1PtMGQKnfyS4R5pmBIqVRyfMyZODv7UyiqKr0q3GlT8HCWmp0CBaAPAWCzkoeAXaJ
	 AR+3vzuqhwuVmygJKWUVMJnMYLGSfTpkdtiWapXSkoAPXkYw4T6ft0rF+OCOdm1zQqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YtphAnQY5mISnzOyw8GgJCX3M5AUjiNclyY0w4znsvE=;
	b=gJYDEAj+GNq5mBbHRDT0K4tRR3FTVe+BIlYlYVJoo+DwsCt36M6ipIyG51N3vdNR+KCm
	 8Z1ZhbQ+1dUmn8ITz4vGc/Hsfo0UFX7DL5ZegQt9yz7MXBvRySfodsp974qOgQ5R3IFNm
	 Fc/OM04xAwEdOxN+sB+roW/QaMWb5Ajs9/Rs7+4mNrtNuP9jYKo96ffcunF0bucnQWQ7b
	 3Or2M4y/7Gcu5D5qDY4+i+beNcpwPCXZWHIdIdUhOi0gKIUkJuv5YzJSMZtJmoYpdyyRT
	 obNTEk9zGGZlpI7POl76LXT/NISgqoTqRY+VIjBIKFOBtfA+XOPJ0dGtMbKW2ExQ0Tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=ATKIgBb3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5881F606A31C
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 11:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5881F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=ATKIgBb3
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b56bbf8330so2445866a12.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 03:08:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794308919; cv=none;
        d=google.com; s=arc-20260327;
        b=skH4xOj7oCA4sa1zFUER5ffYSYFVuyzU3b5avhjOzfuxvxio5m6l0V3W5pBVqVhVIa
         DWRDDsFE1n1Gsy3TlRmybcsogsmergoWtYGTl9wICaTiFTN5K+WtJWhubJ3RLB2lMk6+
         AddOyEEoIDV8VMnmUk5UjDtAW10pYaKdlNyqxqAHPJVDJa8Je3r9ZyVci/kIyCvQTcwa
         qwjTbxQIKawgZkVP6b0qpBBiMKDfTd4ZzeJuX7Jv+q5JgHBEOeRoFIWyy5WXYweBP4Px
         SWnQQ8Qwo9kHxSLVPxDoZpavUK7k2ZgWxD5aAe76ClEumUHma/8i611IDVzf0GUpd9m9
         r+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YtphAnQY5mISnzOyw8GgJCX3M5AUjiNclyY0w4znsvE=;
        fh=9+vfKgYqMn0pSHZGKC//ZmIjnspvEdDaqK0+zjZ42ik=;
        b=rkW7YYQP/6/EGGoQ4PpgMguOce0UqtIA8xgoorGwLPiqm4toDmSIMAOoQqJe7XB9JW
         ZwKG7WOHTUUkIzn+EXVOBqSlHj9DxXVsS5E8639DZjK/aS96PHJ375RLNv5jy8FY9A1q
         M+J/o1zTX5lNDxrfjCEe1mbdbUwgQpM1+BT1lF1yAJOIEb6igsoplDUyJbrSHRxMNiP+
         fa/YZ7IAW5EaffbPWhH+DEON7KCczE0yKo8NDKGzA2kMU9rTU6s7bEOGErt54MvN5IQ7
         XYrtTFiBrNaou15Duqe9yrJtieVIdC9opIWoaOQyaWsy//TJIn6EvOJ/hFKz86KbK031
         ukyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794308919; x=1794913719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YtphAnQY5mISnzOyw8GgJCX3M5AUjiNclyY0w4znsvE=;
        b=ATKIgBb3COVMm0Tw1w7BDFap2wFE6VMsRLY2235EcBgQAjfRBai5tHoO3eoczAZeoI
         xPdVkX39CeT5yr1cYxHCog+l7w5Hwu7wkCc0QnKOYyetnIk62HwOV/jznD9K3sSLeJt0
         Z/Kzjl9Z3GVZIBudJbyaTUK0lUVTxZaDxnmta2GG+H3zek8cExt0msDIAvnFHFSwods/
         ObTfA9iFJRdlGC7NNUI576c2U+/dUHaVlleic9c45qwALBXEvrhV/qXUTrS8jNDd3IrV
         X5mjz0zyizKVWEbVILgr5V56bXtHj5pSivuh4rxQ17Y54pUph1yxkZB/nGpMZO62SgLM
         tsig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308919; x=1794913719;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtphAnQY5mISnzOyw8GgJCX3M5AUjiNclyY0w4znsvE=;
        b=Wioaq3pFV6dgNcwD3BD6BDZUp1NAy2+wfovsFpZskeXUUAKabiXUt06B+L1VKECOZ4
         9e3NnQjFGfnhZWR3Yw9nreaX7sh9jyTs43RBwHwIrDFhqRiG5wtYdcKlQEBHKDRm6q9+
         hzmZezeqv+NuSSe+yW9dq8fTUbo3+M8CBW7YYkGEdJ1/yVhBidX7JslRD47Hbw08x5aC
         sUX4I3TiC0zDFmf1o9w5nP5Z2TLnIvoOyiCP390P36cQ0dtdAwjDskbxOWc5vB/VsIdd
         mbNJ+mowfKdadv6/eytK+a8Xe+ib2Nkn0/YBSN50AU0B3YnOxt9s2blE9aQO3Tl8TQlP
         IJIQ==
X-Forwarded-Encrypted: i=1; AL+hErFO8jVxLqEC34AAGigPU6z8JY6jpnUkVNcAPtlvvw2NtMqv1U2sfJ35+mhZFXOpqt2GjJ5N+0kOXTQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oz/aMFswY5YDJ0CwudogtQ2anFH3pYPl0wF9QYdiBxVEavp/9
	MSxoi5wslZNZ0OX6F6hyEVeyvlvTmwx/J+5wg6BSlVWc8sSo2JBkh6w6TBjAuVJPfG7BUjA8LIu
	izF4N4rMyI5jZJNiFksJBYJ/7IxkcpS/IvGWmH9W2UA==
X-Gm-Gg: AYBFou1rDdVvEuaIzYUB0/B2z10m645NMZ0hn5WYTyUV7sAqyvX+Mi17P/fPJZWLJN6
	JB1BGoW2kuIZi0NU7jecWW+A89VFTVg0F/upEE3i3V0fsUEGxTd919eROZkOh8JW7Vtdw46m8qv
	rkjxXxBWc983YonfcJSuT3yVu/6qHrd8MexW7Z1m0ooNsVjURQQTTqKYKVqEldGFdna9HjeokD+
	fHsgQb2ejIpk2Lp4YPirp+maI7NUNK7nU9/9gnwSWMXA2j7Dftagn1CtiFOvbQdy43uXcYIf6K5
	6DdLMY05FRwnCZz9EmJMf3yq01peYs6buWvk3gp3+O0+Jp3me6+cBV8NeAsPNyUlU+esWEar8qk
	i670OP+Umm6UHlEsbvYxrTr4Xh0oo+4ZRhtRXjFSgf7PNcE1Ug1CfCCoPF+MFDMx6ss3mmmTmZB
	Qva9v3ASTnbVmMZUmdPIelQ7onaqnmMop8reTi/fm7opwPeh/2E1jMTw==
X-Received: by 2002:a05:6402:1d54:b0:6b4:59d0:7294 with SMTP id
 4fb4d7f45d1cf-6b7564f6f76mr2116289a12.31.1794308918607; Tue, 10 Nov 2026
 03:08:38 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109133609.810876-1-robert.marko@sartura.hr> <20261109-mulch-mountain-118fd114a797@spud>
In-Reply-To: <20261109-mulch-mountain-118fd114a797@spud>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 10 Nov 2026 12:08:27 +0100
X-Gm-Features: AclHuK8rAj1SvZu7uW13wrFXg8Ofz7g_PIsRsWgsTldu6tOuG_htfxW5SgQtu6M
Message-ID: <CA+HBbNGUig8q_U075xXc62opOvK7wz0er1c6ROxGnKYKTrwWbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add Microchip LAN969x fan controller
To: Conor Dooley <conor@kernel.org>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, Steen.Hegelund@microchip.com, 
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 8:14=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
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
>
> So, I think that this device has been modelled incorrectly from the
> outset. "devcpu_gcb" should probably be a syscon/simplemfd, as least
> going off of what I see in
> https://microchip-ung.github.io/lan969x-automotive_reginfo/reginfo_LAN969=
x-Automotive.html?select=3Ddevcpu_gcb
> and the fact that we see silly offsets in the dts:
>                 reset: reset-controller@e201000c {
>                         reg =3D <0xe201000c 0x4>;
>                 };
>
>                 gpio: pinctrl@e20100d4 {
>                         reg =3D <0xe20100d4 0xd4>,
>                               <0xe2010370 0xa8>;
>                 };
>
>                 mdio0: mdio@e20101a8 {
>                         reg =3D <0xe20101a8 0x24>;
>                 };
>
>                 mdio1: mdio@e20101cc {
>                         reg =3D <0xe20101cc 0x24>;
>                 };
>
>                 sgpio: gpio@e2010230 {
>                         reg =3D <0xe2010230 0x118>;
>                 };
> That ship has sailed I think though, so I'm not going to ask you to
> rework this whole device.
>
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
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - '#pwm-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/pwm/pwm.h>
> > +
> > +    fanctrl: fan-controller@e2010348 {
> > +        compatible =3D "microchip,lan9691-fan";
> > +        reg =3D <0xe2010348 0xc>;
>
> btw, how do I translate the addresses you have here to those in
> https://microchip-ung.github.io/lan969x-automotive_reginfo/reginfo_LAN969=
x-Automotive.html?select=3Ddevcpu_gcb,fan_ctrl
> ? Or are you looking at a register map in a different form?

Hi Conor,
Microchip has cml-utils, which allows exporting the registers and
masks automatically, its part of the public SDK.

Or you can get the address from the register map you linked, its just
posted as word addresses, so multiply by 4.
So for DEVCPU_GCB:FAN_CTRL
- default offset: 0x38800000
- DEVCPU_GCB target offset: 0x4000
- FAN_CTRL base =3D 0xd2

And you get:
(0x38800000 + 0x4000 + 0xd2) =C3=97 4 =3D 0xe2010348

Or you can just task your LLM agent to do the math since its quite annoying=
.

Regards,
Robert

>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable
>
> Cheers,
> Conor.
>
> > +        clocks =3D <&sys_clk>;
> > +        #pwm-cells =3D <2>;
> > +
> > +        fan {
> > +            pwms =3D <&fanctrl 40000 PWM_POLARITY_INVERTED>;
> > +            cooling-levels =3D <0 128 192 255>;
> > +            #cooling-cells =3D <2>;
> > +        };
> > +    };
> > --
> > 2.56.0
> >



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
