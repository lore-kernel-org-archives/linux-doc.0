Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3241DE88B
	for <linux-doc@vger.kernel.org>; Fri, 28 Feb 2025 22:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740782336; cv=none; b=Hp4gfcuFCZLFtQgt2L0QbQsZjuK782pEyv6mmL9XujqP/u7+XN0yz00UEDRoQh+Xg2kAu/5W4JZ2IOZccsw/UhpBhV4cmMnq3ttsLv3julLVCXXEihY7aXGDEdxLnE+NkqpH9ms9FIFe2KeBo6unVNhdd51kYIR5zpwIoZOZa80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740782336; c=relaxed/simple;
	bh=OinG4oFMJYhN2xIT5Za/iKY0tkNoEgtL1o8V6/QHk+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZTdppjpK59JJoO/bPhvMXreNwT/vO+NX4HFZBCqrr+nH7a1ziYGq7GRf0Tg1pSH82H8Ki67s7PBVeWR1LYdtDNsVaixmDXQeWCjaTcswWf2NP3LhyO2hJXMbA619e412zntdMiomwqnxj+n+8WAp/wOx//Etc+LZMt+K4u311eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kQlLOZH+; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kQlLOZH+"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7275bc6638bso593180a34.2
        for <linux-doc@vger.kernel.org>; Fri, 28 Feb 2025 14:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740782334; x=1741387134; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E+fYjTnDelyv2wmiBt70nsk1L4cOdcyvqKIdaQXfSpE=;
        b=kQlLOZH+VLYos7eF2JQ2MUR2nB9xlpqpcN1JPEf1n+JxLmnm7/bsAElguFC1lEG0Jx
         SuEA3/q9BtbMJnqJaxBkl8ZjZXpRr1+NLR86bG5f7+DcXD3aFzFssZ0TIfKO/fm7vIr8
         5EtuWnTW7eeDYuDJu28XjWB08sz/Gk6+JAKMULOyXBxb0Mtc4lUv/n4icczHciGF4d5b
         cKP/U1PfwJYYrwbwteRRRmLLkpoQ/fBW0o9dyTujqU2t7Py9juqnJMh+h0j66Dk16TNw
         povdWYJByPeTGvWnwuUxvuYpB6PZO7zX7lhee8jz5LEtnExBQM3Fiwygf3NmyY+xBX32
         ZwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740782334; x=1741387134;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E+fYjTnDelyv2wmiBt70nsk1L4cOdcyvqKIdaQXfSpE=;
        b=nO7dShokx23z0w9CZXpjaykI0dGSXrieOwnC/6BSTyq8HBuEbK9QFoGDfJ5kqz4c96
         Cnl8sgm3SjlToNQSoXqSnBIG4vbUWlIkH3wrkbplqE7PSc90uomFNT853mzfZV6TZ9SV
         dj3Sa4m8/rxushEheUs7vkRk/KFNi65lYp8knyx6RsCpV94xRyCi8anh98X1uyx/zQLj
         9oHIL3rOBT3mu6glRcgYQOUDHMoBODcPzF0/gFwhr7aCxawnC6zMRwigAAHCGypRZrUh
         428wim2cQhxBhANvJmFgV3aU8Yy7u0l9W8vp5EJLx6CBhmasOcyLqxrtlqgBvcQPtJws
         OMdA==
X-Forwarded-Encrypted: i=1; AJvYcCVSwgkwajbwAM3tFwQ63xo8W1UaWwl9WY/+cmU18IBXYWnKsIFKkgIThWct1/YKvfLe/nJEEAfDbtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF1f2WNaUspLHQywORdMxWvZIsG6qQPGczoJwL3f5GYVCoKQAl
	abE1j67Btf/+tMvUCMRoyvXXEIJcbkDwdSfezLpgSdNfGMa05YHJMQ4KIOcmrzA=
X-Gm-Gg: ASbGncvtZfRkxVUPgEtYE42TXL9TYYw1ExL27FWiYgDE/+QaP549TgxUIjlkmP8PK+E
	pQfEPIf1+IRu91cSd0DSKMbnFgF+e6wxWlYuc5or1LYN40SQXmYlov1pu1q1QKqLYY/geMsK1Lr
	3WfhwBJKejXe0Us2ugjyR86tdQFHHc+LhhqTzt6PPXjRQS2bB7DXWm3ZHdi/7ngyNpfqpfgHf5v
	xwTPyxUXdN2R2bvxLwhvIueBWKSfppF68SQOBQOnXpgYf2L3fVbSH60tcLLGfW2LSegpYGgso3v
	np2QEOYWWTmM3MBJLdxLZr5UmdgVcxU0VBGeI4YFCQfoEPAlW2/jQ1oi0oof0pxmtfqHv2T7Jco
	U1UYQ/g==
X-Google-Smtp-Source: AGHT+IHbvfCuPkEVbuAzfOLEf30m1LTbxhXs0FiEuN9bvvhhqT4lDEN6K7BISal6NU3hSK59m2FbIg==
X-Received: by 2002:a05:6830:6684:b0:727:421e:43db with SMTP id 46e09a7af769-728b8261559mr3476276a34.6.1740782334001;
        Fri, 28 Feb 2025 14:38:54 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-728afd0047csm825497a34.22.2025.02.28.14.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 14:38:53 -0800 (PST)
Message-ID: <7b2a8d71-9d83-4d40-903b-ba7ef1c686f3@baylibre.com>
Date: Fri, 28 Feb 2025 16:38:51 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 6/7] dt-bindings: motion: Add adi,tmc5240 bindings
To: David Jander <david@protonic.nl>, linux-kernel@vger.kernel.org
Cc: linux-iio@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, Nuno Sa <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>
References: <20250227162823.3585810-1-david@protonic.nl>
 <20250227162823.3585810-7-david@protonic.nl>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250227162823.3585810-7-david@protonic.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/27/25 10:28 AM, David Jander wrote:
> Add device-tree bindings for Analog Devices TMC5240 stepper controllers.
> 
> Signed-off-by: David Jander <david@protonic.nl>
> ---
>  .../bindings/motion/adi,tmc5240.yaml          | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/motion/adi,tmc5240.yaml
> 
> diff --git a/Documentation/devicetree/bindings/motion/adi,tmc5240.yaml b/Documentation/devicetree/bindings/motion/adi,tmc5240.yaml
> new file mode 100644
> index 000000000000..3364f9dfccb1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/motion/adi,tmc5240.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/motion/adi,tmc5240.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices TMC5240 Stepper Motor controller
> +
> +maintainers:
> +  - David Jander <david@protonic>
> +
> +description: |
> +   Stepper motor controller with motion engine and SPI interface.

Please include a link to the datasheet.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,tmc5240
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1

I assume that this is the overvoltage output (OV pin). Would be nice to have
a description here saying that. There are also NAO and DIAG0/1 output pins, so
it's a bit ambiguous otherwise.

> +
> +  enable-supply:
> +    description: Optional external enable supply to control SLEEPn pin. Can
> +      be shared between several controllers.
> +

This doesn't look like a supply, but krzk already discussed that. But there
should be actual power supplies: vs-supply, vdd1v8-supply, vcc-io-supply. And
a reference voltage supply: iref-supply

And if there are any pins would make sense to connect to a gpio, we can add
those even if the driver doesn't use it currently.

> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +  - $ref: /schemas/motion/common.yaml#

If we need to know about what is connected to the output of a motor controller
I would expect it to be done with child node for each output. That way each
output can be unique, if needed. Basically, similar to iio/adc.yaml is used to
provide common properties for channel@ child nodes on iio devices.

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        motor@0 {

motor-controller@ or actuator-controller@

The chip is the controller/driver, it is not a motor.

> +            compatible = "adi,tmc5240";
> +            reg = <0>;
> +            interrupts-extended = <&gpiok 7 0>;
> +            clocks = <&clock_tmc5240>;
> +            enable-supply = <&stpsleepn>;
> +            spi-max-frequency = <1000000>;
> +        };
> +    };
> +

