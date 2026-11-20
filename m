Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795204969;
	b=f9fZnPD9EkrtQXRAkLsig2H4Y+P3LUvCuGgVm52kvtznlt/LktOpYEoLw5XB4LcnqxAQ
	 4MZfOW2R9G9ckhewnZsoxpaeq66D2HZwXnnlUBWuwsQVQPEehFDFoY4L/awZr7IEJr17j
	 dyGvrD915ZmELWvEBW6+4vHMbU50/aCqaM+H5d7K0oHcvmZ7q2WYk3WML9tKEvnk2lLdN
	 LM2kcztQ2TubPc0CO/P+cKJXzfz1NODFFDd6Dq8wCVkQAe5OH1D5oiN7qNxU2tTN/Zc8R
	 wheMZxkdU2w45qHAnqmKFXsgt7lNQ9nwOtw2ej5pR+npzZ4bBSybpoVLTOE+wXtw3YA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4V7U58O8sKkT2FqZynxSVbl9uHZQNKqD+q26N4wEsfM=;
	b=hImK/gpOTTxkZ5V6f3xkGVg4fYkobrt5cVQFN0h3LifVSz82bZMrDLgp3KZfKkKg7HsJ
	 qIeGsatHCZnbz6lpQN8pcYFbwRw9xIeVIJsDAL92j+so/OExEE+BbL5IQQOJXkSGqhNxD
	 cfUD/lC1/R4Ee6ZqKaZwzkROukquMvnWatu4S8cyGxpVOpd1TQGjGKz8NrCgPgGGrQB5V
	 22aovmZB1X6DfWfWCCKCLDsjCUswc7qLeKAcoTGaorc606xat5POhHy5n1ys4d4d7PejK
	 kTBgDsHbRO2ewyyjJGS8guxOLPUmKywDZB3w5rf4ljDf8U9GjX5Sx2aK01lCqPIgLzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WaMYcHhB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360E1606A6DE
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 20:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 360E1606A6DE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WaMYcHhB
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b4e18369c8so8278087b3.2
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 12:02:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795204964; cv=none;
        d=google.com; s=arc-20260327;
        b=kSVgbG0P/aI+ahDoH8mUljTndP/5Bzsnkr6vRKhry7wE901kwfaV4sCeAvFwuWlAGz
         y7QjxJhaLp7/dCclACM6XYYdwXCs5UXKDT2jdnwFOh35OYrmAwpTdYMveJPoACyF2oeB
         ZTfVufQg7x9F5hf/zT9a2Kjy28e90+Nv3yTfuBcEocCxOlEMGPpJegA5S1/U0vRTgcLR
         L/jpTkJW+omzQ4iMqZ72EKlarknsHKKNyp6iGyowhCPNr6pf5tMfE8WyC2mB2690swYM
         oLsmnXut4PsNNWZJGC3dSublMXDoGPj17BS7nG/gAZdlO36hIv7CWAW3SkPLgz7SxXD4
         yexw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4V7U58O8sKkT2FqZynxSVbl9uHZQNKqD+q26N4wEsfM=;
        fh=hR71fWHbG2I8a4vUCFkp1OCajp9+GJbHwfweehSqSN4=;
        b=cCB5SN+urt4bgwiD/hSts8U0KPigo1a+LfLwhu/8ZeMThWh/T5dFK5uA1vuACmVxlB
         gGcDzfYxcMSFo4wycAp5YfyT6g0QfCPY4Uu45pHtIE+B2A995G7CZrg6VNTNlzp6nhP6
         2YQ3fdi4v01Jv79srm/yfSDhIDX0x5FGblqQiizccPQn+dM/vBByR4N9bnqdI8xFRBmN
         uIoXoa2cWOeRPEzAkd3MJCU4B9Yovja2F4D2/m4hdcwnUwkgdArKabdE5Y+O642yjRt1
         2JLrgCXB20l/ramI3ScArZYsAjGPJwiMFGK8u1l5oVDPE/smUEnKVKxEbv1dEUGcPf3t
         Df1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795204964; x=1795809764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4V7U58O8sKkT2FqZynxSVbl9uHZQNKqD+q26N4wEsfM=;
        b=WaMYcHhBNZ+35v+6wpg2naLtL6eDcZGWsH/op1cQD4c03wrQ8D9MdgfrpovhVdIVdA
         2vQEBszX+L485tw/WsOjNI6nY9CG5gIGG0K7OjZRK2gMC/7bEIPYyrqsu7ZYpm9MYQC0
         3I6OnJRjbJW1M/wIfBUqPj0fZpDXE7cn+bncY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204964; x=1795809764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4V7U58O8sKkT2FqZynxSVbl9uHZQNKqD+q26N4wEsfM=;
        b=n2SoD1PlMD5McnfP47JAYuZmrYEOPyAvDyKOhCUAo3pH9GkJC/ruVgjJyrhQkKU/y/
         UUwi/ZkDuiTc36Arcbmk7REMHWRc+jskQ/PeVj+ye62/GjmR7oQLpkXg1gO40KRugKI6
         K2j4bKUidzBMzAZ1fHUgRMUaHEd7Sv4KnKZHnGjutn+XHUmCJU7jgp1haP0w3I5zXxC6
         HfhXlJdB3/cOBnIIog7xD65C5JE9OnnBCquXw9oTy/kW1ep58hbNz1Lk318YulYTfZvp
         M2nYQAgXbKdRJIrQJnl+dL8A1E+2zQwp+tTm+3A8lM0kvo8o3wp+mJD3ThhNrgkSH+xT
         5t3A==
X-Forwarded-Encrypted: i=1; AL+hErEudgSJq0rZuG19QA2hd9aPwpc+BRXT0IGTNsjVXKZLhbbhwPMEcdPIsbSWRLw4YDsPkJ+8Z6Wf0uI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KIbEikbkyV5ftRo6NOFSlts0uFjHrY/+zP47xUyy4ST6AP/DQ
	5wtEQoZSma+/3eaZyjMA+xTmr/Ea9quwozskFNyIpoYdSng+X8LqoP+ohf6S8Mx5SiOAquFJRYQ
	XcK0LrxYV3YwyDlv6qTf6IH6ROxKuZh7mimVgbgt6
X-Gm-Gg: AZFdTZe+ruwDArZB1RrcT56sKQwCz1uq9j+6cH8badi9h2Zdub2rHvwpRzXHvAlCTlP
	+Yvcf3zE0o9iM+naRcaugN1RpGtQ6XH/UrNmQBY/GAiS/LvArhSzRUqms6ZCg6cJ11tDueY9DSU
	GuFM8gQgG0nW6HbRaP45otenF+IIVblmxgU9tCJ2+c311FEAMSXkiHHNdlNDpa8CY6/PUgeP1Tf
	CynVWC9htOmEU9iat4+jakGXfINHQxs9QBOxOv+kutThq9+1EcgbupJcNN5fcajlddXXRZTFqFq
	mskX3THIztCCA8P3twTV6MOM0ou3WDFrRaXJ9ra5oGX6FhYVBGyjghHaWwz5eSzdgmeIt+cFTLr
	gHydos4b7vM3n7cXBKZ1065aTJmRMIp4bSO5t33izBAu7ayCstWiFd0j3j5VRTrvFeNhv
X-Received: by 2002:a05:690e:4008:b0:67d:e36c:6bc8 with SMTP id
 956f58d0204a3-67df44c1825mr1431647d50.146.1795204963908; Fri, 20 Nov 2026
 12:02:43 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-send-upstream-v7-0-abad13174b43@chromium.org>
 <20261024-send-upstream-v7-8-abad13174b43@chromium.org> <20261027-silicon-unvented-a0c8dc394e87@spud>
In-Reply-To: <20261027-silicon-unvented-a0c8dc394e87@spud>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Fri, 20 Nov 2026 12:02:32 -0800
X-Gm-Features: Aa3M54pc-1DTIKZ-A-hc9wj9AlprRrg4PvxeOwd0_HsaV1fm3yOGyT9vmhS6ZyM
Message-ID: <CAEe3GZF+P2hHHAQO_eWq=yv83HYw9ebEdkO_RZ4zPkQ6e_bAeQ@mail.gmail.com>
Subject: Re: [PATCH v7 08/11] dt-bindings: input: Document hid-over-spi DT schema
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

On Tue, Oct 27, 2026 at 11:17=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Sat, Oct 24, 2026 at 12:51:42AM +0000, Jingyuan Liang wrote:
> > From: Dmitry Antipov <dmanti@microsoft.com>
> >
> > Documentation describes the required and optional properties for
> > implementing Device Tree for a Microsoft G6 Touch Digitizer that
> > supports HID over SPI Protocol 1.0 specification.
> >
> > Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
> > Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
> > Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
>
> Personally I prefer how this is done now, but definitely worth those who
> approved the previous iteration taking a look at this because it has
> changed significantly and no longer contains any of the properties that
> cover the timings etc anymore.
>
> Worth noting that this changed since the previous version after I
> pointed out that the second hid-over-spi device did not make use of them
> at all and needed specific handling in the driver.
>
> > ---
> >  .../devicetree/bindings/input/hid-over-spi.yaml    | 75 ++++++++++++++=
++++++++
> >  1 file changed, 75 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/hid-over-spi.yaml =
b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
>
> Typically this would need to match a compatible, but I think this is okay
> provided other hid-over-spi devices actually get added here - the series
> adding the second hid-over-spi device didn't do so but should be able to
> I think?
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> Thanks,
> Conor.
>

Hi Conor,

Thanks for the review and suggestion. The intent is for this to be the
common binding for HID over SPI devices, and I hope more devices
get added here over time.

Thanks,
Jingyuan

> > new file mode 100644
> > index 000000000000..bed0746f004c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
> > @@ -0,0 +1,75 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/hid-over-spi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: HID over SPI Devices
> > +
> > +maintainers:
> > +  - Benjamin Tissoires <bentiss@kernel.org>
> > +  - Jiri Kosina <jikos@kernel.org>
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
> > +allOf:
> > +  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - microsoft,g6-touch-digitizer
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
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - reset-gpios
> > +  - vdd-supply
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
> > +        compatible =3D "microsoft,g6-touch-digitizer";
> > +        reg =3D <0x0>;
> > +        interrupts-extended =3D <&gpio 42 IRQ_TYPE_EDGE_FALLING>;
> > +        reset-gpios =3D <&gpio 27 GPIO_ACTIVE_LOW>;
> > +        vdd-supply =3D <&pm8350c_l3>;
> > +        pinctrl-names =3D "default";
> > +        pinctrl-0 =3D <&ts_d6_int_bias>;
> > +      };
> > +    };
> >
> > --
> > 2.56.0.257.gf7497c7d27-goog
> >
