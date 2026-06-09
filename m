Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BBB3446B9
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016466; cv=none; b=Fiy94kpjLxG4cHZUtKcfxXsFE/2sBhw4YUE8pAkozuhQjVmxf27f2r9Lw/VDemTbTJV4hya/WsvDuUj/mBczpD+KFRb3Uf/jbLxy9mXuLQ/YfQKibqd11Lf0lSG55bSlm718x2bW6Ft4L9SbmM/XZAgPmDb467wVA64YpMz7BSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016466; c=relaxed/simple;
	bh=RHnwl20W8+5FJ29Ol8MYnlNwjRMZEERZhaV1mR9cyIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fokoCdcUAN3DWEGPYq4OsJxEZBTK8+vZ5lx9eiWvnaSDiJ9SQjjxZxSttcCIfDY3WvNQgUTNKUwjKpEhb/7ecbI/ZIoLGuzjE+cqf3kLaOuhO//V9o25AAfXP/paFzJBvxskOephtYDxuhhv+H39B5PUBM2jLS5iQleSmhI0kf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqTt3ZrH; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqTt3ZrH"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8423f869421so4242343b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781016465; x=1781621265; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ADHZyv2+9wHkZZb1LmyBnYl5z+jc15TcX4b8qMYvO0Q=;
        b=fqTt3ZrHJ8JFzOSY5n2Qxn/orcSgSn55KefM2i2yd5Qy60e8qUsnI9LyhKH80lr5od
         ZDUfEYM97+bv4VF1kceUPVmuJVsCLSpDCloKD5vAMmuF5AVJpzyAA0cYV7UfVyCcUSBB
         WijGgD8bgkjb7fUFWlWPpTdsdBA85lFwfoEbXqJMADd6UHaLi5pVgHHHg54J1Nsx5R9A
         yikGTa+1c3GkUuh9VSIJSxXbKFSnmicddBHLVJn72F4mEP4Uk2nBHVofn51Sdk3hszwq
         FUZmeg+ibaRfe+I4EHTXq+2QChXyy1HXc+GebCSpERJUmwX6GPcy+1h37KI1Qj4Qecpf
         gpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016465; x=1781621265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADHZyv2+9wHkZZb1LmyBnYl5z+jc15TcX4b8qMYvO0Q=;
        b=Lq+mobpnjIWxbmUUBjqEPQuJoa7KO4IrccBoOxl/qSSvlYWzcpstCzETfKHFSEJ3z2
         vgbsdVWg7x1xgnIYrlWYLwcvCvQ19wkeeFy3sVZjzXxmFKN2tA+X5Xsg+Py+VI5s9g2/
         zZztXcmU0hWTJizPQYRj8hEPmDjxozJ01OoTNNo40puluNBXwepMlXwnI9xtJ1kiE/So
         IbPm+haHAHv7lVbvbzlcLGkwtG2UPuwx6KZWk8WWuxW2Ai2kmxfmKHbriTn3nhcHqDzG
         alejoPJn9MHwyl4KxSP2/U/0Irj3N3C2lsVcOUgX6CUbMoQ3XE7RW5nazKB14bsW6Nom
         rdXw==
X-Forwarded-Encrypted: i=1; AFNElJ8awk78X61Xa4ZiTTrI55fets7uqm2LgVb/6TFBOX6Fl6/sUO+V7HOoeZpCWiKtN7jFYJ6qmt8UMno=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFDaY0+l+TFgw/eWhz2m8hoENjplGFWTE5VJQzFB2fDrObGuIc
	Ubn7ACleacv3gliE5MfPjvTuO2qWgTLesJuGGoFoviFbe82AcYluzXA7
X-Gm-Gg: Acq92OHjJbUKioqmyPieURQqiroMrUaYzueVKheFuMXsILnWwRJCDWebOwLgAE3Kxkl
	gkmH0mjY9zarzmo5deJkos6nGDoAlIw1Lt39Wgj8yiN1gJVO+j9wBoMYNncaIZVOYyDNb47X6v0
	3bnk7nPLEB5nmJFzQnhR3m19M/cLtWKK2XfD6mbAoavuM7obUWHKHLl2EoyiOiVdrFjqqlzfpi2
	Vv9bMgrGCAQ78AHdkSLywL50lS2KD4FZ6plZRvoWxS5ZEY9amzcoAMvQhUMkm9FS4OFpnzzyjSY
	lnlYlO+Z+GkB9ogbkn1vFBm/DkAaYX1C6sO8uenEsEgwQ5X48/QneAUd5lZidRj9Os0gn9+3Ik2
	VItl+X96dmaFwLIUq9R9tG08Zo5pqVkr4KNQmBB+g2hX4laskgDA/N1rP7U0VKNEO3LWgOsnSG7
	Jeo/tBVYSyGJ/DQRC97asHEcVwebYU62ssHMR7L1lRxn5+jZqKIm85jZrMiNyMm/sKTRVDgHOTT
	/Qf0Ek=
X-Received: by 2002:a05:6a00:3e05:b0:842:54e8:bdd with SMTP id d2e1a72fcca58-842b0fb4de6mr21207336b3a.40.1781016464749;
        Tue, 09 Jun 2026 07:47:44 -0700 (PDT)
Received: from ?IPV6:2a02:3037:27a:7db9:c4f0:a82b:c075:e2fb? ([2a02:3037:27a:7db9:c4f0:a82b:c075:e2fb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm26203734b3a.26.2026.06.09.07.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 07:47:44 -0700 (PDT)
Message-ID: <603473ac-30e6-45e5-8a3b-c9902715cc9e@gmail.com>
Date: Tue, 9 Jun 2026 16:47:23 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: dac: Add AD5529R
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>,
 Janani Sunil <janani.sunil@analog.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260519-ad5529r-driver-v3-0-267c0731aa68@analog.com>
 <20260519-ad5529r-driver-v3-1-267c0731aa68@analog.com>
 <25mh6grzh7zh3b4uytcqnusyv5zjuf6ia4if3ce3oqzqz56ehi@le72iqv7ye3d>
Content-Language: en-US
From: Janani Sunil <jan.sun97@gmail.com>
In-Reply-To: <25mh6grzh7zh3b4uytcqnusyv5zjuf6ia4if3ce3oqzqz56ehi@le72iqv7ye3d>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/26/26 15:11, Rodrigo Alencar wrote:
> On 26/05/19 05:42PM, Janani Sunil wrote:
>> Devicetree bindings for AD5529R 16 channel 12/16 bit high voltage,
>> buffered voltage output digital-to-analog converter (DAC) with an
>> integrated precision reference.
> ...
> Probably others may comment on that, but...
>
> This parent node may support device addressing for multi-device support through
> those ID pins. I suppose that each device may have its own power supplies or
> other resources like the toggle pins or reset and enable.
>
> That way I suppose that an example would look like...
>
>> +
>> +patternProperties:
>> +  "^channel@([0-9]|1[0-5])$":
>> +    type: object
>> +    description: Child nodes for individual channel configuration
>> +
>> +    properties:
>> +      reg:
>> +        description: Channel number.
>> +        minimum: 0
>> +        maximum: 15
>> +
>> +      adi,output-range-microvolt:
>> +        description: |
>> +          Output voltage range for this channel as [min, max] in microvolts.
>> +          If not specified, defaults to 0V to 5V range.
>> +        oneOf:
>> +          - items:
>> +              - const: 0
>> +              - enum: [5000000, 10000000, 20000000, 40000000]
>> +          - items:
>> +              - const: -5000000
>> +              - const: 5000000
>> +          - items:
>> +              - const: -10000000
>> +              - const: 10000000
>> +          - items:
>> +              - const: -15000000
>> +              - const: 15000000
>> +          - items:
>> +              - const: -20000000
>> +              - const: 20000000
>> +
>> +    required:
>> +      - reg
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - vdd-supply
>> +  - avdd-supply
>> +  - hvdd-supply
>> +
>> +dependencies:
>> +  spi-cpha: [ spi-cpol ]
>> +  spi-cpol: [ spi-cpha ]
>> +
>> +allOf:
>> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +
>> +    spi {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        dac@0 {
>> +            compatible = "adi,ad5529r-16";
>> +            reg = <0>;
>> +            spi-max-frequency = <25000000>;
>> +
>> +            vdd-supply = <&vdd_regulator>;
>> +            avdd-supply = <&avdd_regulator>;
>> +            hvdd-supply = <&hvdd_regulator>;
>> +            hvss-supply = <&hvss_regulator>;
>> +
>> +            reset-gpios = <&gpio0 87 GPIO_ACTIVE_LOW>;
>> +
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            channel@0 {
>> +                reg = <0>;
>> +                adi,output-range-microvolt = <0 5000000>;
>> +            };
>> +
>> +            channel@1 {
>> +                reg = <1>;
>> +                adi,output-range-microvolt = <(-10000000) 10000000>;
>> +            };
>> +
>> +            channel@2 {
>> +                reg = <2>;
>> +                adi,output-range-microvolt = <0 40000000>;
>> +            };
>> +        };
>> +    };
> ...
>
> 	spi {
> 		#address-cells = <1>;
> 		#size-cells = <0>;
>
> 		multi-dac@0 {
> 			compatible = "adi,ad5529r-16";
> 			reg = <0>;
> 			spi-max-frequency = <25000000>;
>
> 			#address-cells = <1>;
> 			#size-cells = <0>;
>
> 			dac@0 {
> 				reg = <0>;
> 				vdd-supply = <&vdd_regulator>;
> 				avdd-supply = <&avdd_regulator>;
> 				hvdd-supply = <&hvdd_regulator>;
> 				hvss-supply = <&hvss_regulator>;
>
> 				reset-gpios = <&gpio0 87 GPIO_ACTIVE_LOW>;
>
> 				#address-cells = <1>;
> 				#size-cells = <0>;
>
> 				channel@0 {
> 					reg = <0>;
> 					adi,output-range-microvolt = <0 5000000>;
> 				};
>
> 				channel@1 {
> 					reg = <1>;
> 					adi,output-range-microvolt = <(-10000000) 10000000>;
> 				};
>
> 				channel@2 {
> 					reg = <2>;
> 					adi,output-range-microvolt = <0 40000000>;
> 				};
> 			}
>
> 			dac@1 {
> 				reg = <1>;
> 				vdd-supply = <&vdd_regulator>;
> 				avdd-supply = <&avdd_regulator>;
> 				hvdd-supply = <&hvdd_regulator>;
> 				hvss-supply = <&hvss_regulator>;
>
> 				reset-gpios = <&gpio0 88 GPIO_ACTIVE_LOW>;
>
> 				#address-cells = <1>;
> 				#size-cells = <0>;
>
> 				channel@0 {
> 					reg = <0>;
> 					adi,output-range-microvolt = <0 5000000>;
> 				};
>
> 				channel@1 {
> 					reg = <1>;
> 					adi,output-range-microvolt = <(-10000000) 10000000>;
> 				};
> 			}
> 		};
> 	};
>
> then you might need something like:
>
> 	patternProperties:
> 		"^dac@[0-3]$":
>
> and put most of the things under this node pattern.
>
> So the main driver that you're putting together might need to handle up to four instances.
> Even if your current driver cannot handle this, the dt-bindings might need cover that.
>
> Need to double check if each dac node needs a separate compatible, so you would maybe populate
> a platform data to be shared with the child nodes, which would be a separate driver.
> (not sure if it would make sense to mix and match ad5529r-16 and ad5529r-12).

Hi Rodrigo,

Thank you for looking at this.

For now, I would prefer to keep the binding scoped to a single AD5529R device instance. The current
hardware/use case we have only needs one device node and the driver is written around that model as well.
While the device addressing pins could allow multi-device topology, we do not have an actual platform using
that configuration at the moment, so I would prefer not to introduce an extra parent/child binding structure
speculatively without a validating use case.

Best Regards,
Janani Sunil

