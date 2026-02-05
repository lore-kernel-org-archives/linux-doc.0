Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797661F5858
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 21:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770325829; cv=none; b=pGmiyyRx+g2oZfp9twbKsHl01/NjscRHQF1iqEClHXWPnmMRIarRUheaQf9YAVnjAeGNNw0NaBLQmSwdr6ZRZLBEuDFdDr4QQLgLo6ILKyRx0IXpjvd/1kR4sF8/SofB3kvGB5wBlz9cM/Nsh1BF6wcoOPtWOaHkcyAOZz0zDE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770325829; c=relaxed/simple;
	bh=eXwQ9SgcUhDKN59vyhZtqEkgpqtPjys6BZik72szYvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNVSj9RWXOTgAjIfTbsiLI3LZp3e0/APH8Gt8XimlBb8PTQxG8o7ao0Rqk2HB4mt7k09YDv9+YgPFUSo/vxWmLsZefTro6z2fd2+UfqlvFe0NJfCyxszJeNVTrag2J3i/3Qbqj9G0kvIvcO50Hy6jwhKCuhahjLZhvToC6WMpWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRfpPxhu; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRfpPxhu"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5033387c80aso33901731cf.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 13:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770325828; x=1770930628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiWXSjYD8iWQZkhbOZvxGQgWjvd+mTWIbvYj/f3atxo=;
        b=aRfpPxhuxbFJedIriojLMi7zCUqGe9glugXR7ZPTl/zXrh/KHiUKLT8GWgLvUCSGPA
         W2cB+UT7KumQCVk3fU3wzI6fbsxO+wTwHoRk8VyRyQ81AdhWhvjqSlQdhIGbvRnjNTr/
         +shp2qCuSMkbngmCoCErJsG35XJhv+LnLDvbzBR8v8Tr80KKxGcfOEDuP18J5wO1L/lg
         dKZxybbf56GCF8PsXCAKQGG03SmJCY1zmWIMHnmjVmKeDLsQ1Zmj33WElNzHuvQp5hBw
         FsXYyUmtZ++6aBxcOEG1324rKI9Fy3xs2BGPirxFzj6dpRSBQi+1TIzECbR9oj9hoZ1d
         Fotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325828; x=1770930628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iiWXSjYD8iWQZkhbOZvxGQgWjvd+mTWIbvYj/f3atxo=;
        b=Xn03F2IHnuL+gvtMMwetfcbhdlBlyBi2xAo0faqwmXV0EWue42/4IKKgzpxqUu/66T
         KeZuqMtbfnEc6Eeg27gOp+L4rIvlyI9hMNBe/+zdSZyaq5IoVrrACJ4k2MomO/sQQvO5
         PDC9bRpyku5RxVn1Tm/JTGDGs64EA5szsXbN6ECVL5BV2co9+oHgWWJPRxI1jDH6zlyi
         qxA/djMxH3+WlMshiLGKm5zVfZ2qDgsDN8Jb1y5FFuzE5jSimhORs2L09hIAIFt7x0C2
         RbhTq97jVKuoL9PN/kEeawHuIlcT4yVFNpNmB6rwI6+MG6HtbgqqrApH0aNjmG6R7n5F
         wQug==
X-Forwarded-Encrypted: i=1; AJvYcCX1R4vgOLWV8pVey3XBmjnW1S/H/eGXbxp5MTbr24OhPQuFYbSaL0PiW7kAN5wgjUk6s9WeppkHSho=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0697kk0A/1UpngASAt/o9hWBewmPgeFOXZVNknQ0r/1OiQCdf
	fjM58cEN6pEO/yhk1s7Txa7zJ8zUCOEicJRpco7oo+4MC5l0TLxbyd8R0FevJg==
X-Gm-Gg: AZuq6aLCtqKeuMEocx3fny5oVE6E6J19h+KYFpvtx8rzA7dBcOgs6WRg4+gZTZleByS
	AhuBieLV5mL8WPdbJLOJCjaI4gJfdbItTsb1XRYbkPaN0mLWKp+7tZRwrYp0m2+8748IHdSoU/f
	b+vGQU9pUZfmG+7M20Lo1tkz8vJEzGRJUElvOntNKRn55Spfw2RqEmknEn4HBbYcv2ZPc86GY2Q
	109SOo0Gv7J8CT22ZCsklYENbpA6bB+s5r71MdCoT97tJdtmCj3YTQnRtDpPDSIkg6PhoUf9wAu
	tz0PeTrJnj2SWHaVNdo1z2WUHLTY/cEB1Do8YH5P0swXrbw0LdcTLTFr0+12xI1iFTOfMy6xAzN
	IoxPCi90W1NnJXI0jt2bMr2GfSZyFhVqRCJUT0VaUTahOqrYRwBslvDMwW6H1ZTn6iVum4CtcgG
	3zj8mIvHVMBSsD/4d2vwwEAVR5
X-Received: by 2002:a05:693c:3111:b0:2b7:a6fa:3f87 with SMTP id 5a478bee46e88-2b855d341cfmr131450eec.19.1770319108298;
        Thu, 05 Feb 2026 11:18:28 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c88cb4sm165396eec.30.2026.02.05.11.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 11:18:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 5 Feb 2026 11:18:25 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Marius Cristea <marius.cristea@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: temperature: add support for
 EMC1812
Message-ID: <a83b48a4-76ba-48df-9aba-adb018949914@roeck-us.net>
References: <20260205-hw_mon-emc1812-v5-0-232835aefe8f@microchip.com>
 <20260205-hw_mon-emc1812-v5-1-232835aefe8f@microchip.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-hw_mon-emc1812-v5-1-232835aefe8f@microchip.com>

On Thu, Feb 05, 2026 at 09:09:03AM +0200, Marius Cristea wrote:
> This is the devicetree schema for Microchip EMC1812/13/14/15/33
> Multichannel Low-Voltage Remote Diode Sensor Family.
> 
> EMC1812 has one external remote temperature monitoring channel.
> EMC1813 has two external remote temperature monitoring channels.
> EMC1814 has three external remote temperature monitoring channels and
> channels 2 and 3 supports anti parallel diode.
> EMC1815 has four external remote temperature monitoring channels and
> channels 1/2  and 3/4 supports anti parallel diode.
> EMC1833 has two external remote temperature monitoring channels and
> channels 1 and 2 supports anti parallel diode.
> 
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/hwmon/microchip,emc1812.yaml          | 182 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 +
>  2 files changed, 188 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..759e004eafdfc0772e110fe484767eb66a623294
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml
> @@ -0,0 +1,182 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/microchip,emc1812.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip EMC1812/13/14/15/33 multichannel temperature sensor
> +
> +maintainers:
> +  - Marius Cristea <marius.cristea@microchip.com>
> +
> +description: |
> +  The Microchip EMC1812/13/14/15/33 is a high-accuracy 2-wire multichannel
> +  low-voltage remote diode temperature monitor.
> +
> +  The datasheet can be found here:
> +    https://ww1.microchip.com/downloads/aemDocuments/documents/MSLD/ProductDocuments/DataSheets/EMC1812-3-4-5-33-Data-Sheet-DS20005751.pdf
> +
> +  EMC1812 has one external remote temperature monitoring channel
> +  EMC1813 has two external remote temperature monitoring channels
> +  EMC1814 has three external remote temperature monitoring channels and
> +    channels 2 and 3 supports anti parallel diode
> +  EMC1815 has four external remote temperature monitoring channels and
> +    channels 1/2  and 3/4 supports anti parallel diode
> +  EMC1833 has two external remote temperature monitoring channels and
> +    channels 1 and 2 supports anti parallel diode
> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,emc1812
> +      - microchip,emc1813
> +      - microchip,emc1814
> +      - microchip,emc1815
> +      - microchip,emc1833
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: alert-therm2 asserts when the ALERT limit is exceeded.
> +      - description: therm-addr asserts when the THERM limit is exceeded.
> +    minItems: 1
> +
> +  interrupt-names:
> +    items:
> +      - enum: [alert-therm2, therm-addr]

AI feedback:

If interrupt names are being used to identify the interrupts, should
the interrupts property be less restrictive?

Currently, the items list in interrupts enforces a strict order:
the first interrupt must match the first description (alert-therm2),
and the second must match the second description (therm-addr).

However, the interrupt-names definition for the first item allows it
to be "therm-addr".

If the intention is to support providing only the second interrupt (therm-addr)
as the first item in the list, then the interrupts property definition
prevents that by enforcing the first item to be alert-therm2.

2nd feedback:

The interrupts property description lists two possible interrupts ("alert-therm2"
and "therm-addr"), but this definition restricts interrupt-names to a single
item.

Should this be updated to allow providing names for both interrupts if the
device is configured with both?

[ I don't know how this is supposed to work, so the feedback needs to be taken
  with two grains of salt. ]

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  microchip,parasitic-res-on-channel1-2:
> +    description:
> +      Indicates that the chip and the diodes/transistors are sufficiently
> +      far apart that a parasitic resistance is added to the wires, which can
> +      affect the measurements. Due to the anti-parallel diode connections,
> +      channels 1 and 2 are affected together.
> +    type: boolean
> +
> +  microchip,parasitic-res-on-channel3-4:
> +    description:
> +      Indicates that the chip and the diodes/transistors are sufficiently far
> +      apart that a parasitic resistance is added to the wires, which can affect
> +      the measurements. Due to the anti-parallel diode connections, channels
> +      3 and 4 are affected together.
> +    type: boolean
> +
> +  vdd-supply: true
> +
> +patternProperties:
> +  "^channel@[1-4]$":
> +    description:
> +      Represents the external temperature channels to which
> +      a remote diode is connected.
> +    type: object
> +
> +    properties:
> +      reg:
> +        items:
> +          minimum: 1
> +          maximum: 4

I (or, rather, AI review) asked this before:

Does this reg property need maxItems: 1?

Without it, the schema might allow reg properties with multiple items,
provided the first item is within the minimum/maximum range.

[ Presumably the _values_ should be 1..4, not the number of items ]

> +
> +      label:
> +        description: Unique name to identify which channel this is.
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - microchip,emc1812
> +              - microchip,emc1813
> +              - microchip,emc1833
> +    then:
> +      properties:
> +        microchip,parasitic-res-on-channel3-4: false
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - microchip,emc1812
> +    then:
> +      properties:
> +        channel@1:
> +          properties:
> +            reg:
> +              items:
> +                const: 1
> +      patternProperties:
> +        "^channel@[2-4]$": false
> +  - if:
> +      properties:
> +        compatible:
> +          pattern: "^microchip,emc18[13]3"
> +    then:
> +      patternProperties:
> +        "^channel@[12]$":
> +          properties:
> +            reg:
> +              items:
> +                maximum: 2
> +        "^channel@[34]$": false
> +  - if:
> +      properties:
> +        compatible:
> +          pattern: "^microchip,emc1814"
> +    then:
> +      patternProperties:
> +        "^channel@[1-3]$":
> +          properties:
> +            reg:
> +              items:
> +                maximum: 3
> +      properties:
> +        channel@4: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        temperature-sensor@4c {
> +            compatible = "microchip,emc1813";
> +            reg = <0x4c>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            microchip,parasitic-res-on-channel1-2;
> +
> +            vdd-supply = <&vdd>;
> +
> +            channel@1 {
> +                reg = <1>;
> +                label = "External CH1 Temperature";
> +            };
> +
> +            channel@2 {
> +                reg = <2>;
> +                label = "External CH2 Temperature";
> +            };
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6d7b697bfdba16e4f0ee5f4f0195b9d7da06dae5..85c236df781e47c78deeb7ef4d80bc94bba604c4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16646,6 +16646,12 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/interrupt-controller/microchip,sama7g5-eic.yaml
>  F:	drivers/irqchip/irq-mchp-eic.c
>  
> +MICROCHIP EMC1812 DRIVER
> +M:	Marius Cristea <marius.cristea@microchip.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/hwmon/microchip,emc1812.yaml
> +
>  MICROCHIP I2C DRIVER
>  M:	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
>  L:	linux-i2c@vger.kernel.org
> 
> -- 
> 2.51.0
> 
