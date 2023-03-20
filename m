Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FB5C7618A
	for <linux-doc@archiver.kernel.org>; Mon, 20 Mar 2023 16:40:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232127AbjCTQkU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Mar 2023 12:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbjCTQjv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Mar 2023 12:39:51 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3483440E5
        for <linux-doc@vger.kernel.org>; Mon, 20 Mar 2023 09:35:08 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id az3-20020a05600c600300b003ed2920d585so9557685wmb.2
        for <linux-doc@vger.kernel.org>; Mon, 20 Mar 2023 09:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679330106;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gWxn3l14RXLabu7eJJmB4eERcGGiKycFSTENeGZGJGU=;
        b=3gApqsN+aCSqX8uSfjeEedbiRwDvoKklvCoIUy/s4e7N53FPbT9T3wUT7NlsyC6DZR
         qDKuSL6u8RzE75MFeQ+/SUgKvjuKSPG3icP+egXYgmmNB7N6AgIXbUQGxSLAtTBq4Es4
         CPnoDEIG2FglBWN1eAXbF9f38+YiepxVpOH2z75bg9tQURSy/3tXCsqvTmwZpDhpc1Nv
         KGPAyz3iGzcnhPZMzbiXRYzpzCihoFdMIwGO9OndgQiIvM9sLDiOXyba9uPOfsOAflFs
         lHd8rEWvy52IqmX+x9OUK51xqmRtkdc8kP1WCroYdfLSKgOHXCso1KmDKI9Z5arri+8E
         3apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679330106;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gWxn3l14RXLabu7eJJmB4eERcGGiKycFSTENeGZGJGU=;
        b=NS9MsHasA9r2xHmaYoTWvDfDPFvQdRMG4G1PJDbiTUicxn393Y5StcraxPDmFUHZBk
         RoPk5PPgU/+Q9hHMx3cFsMHMZGiyiyG0PH5e6aThtpt+prVzGSt2Y/t1PLQTpbCzY0TB
         nF24fS4VSlz8Y+Y3U6F79fIMkYf+TW+3C8bVWsD5NmSYLKt+2kDG49vJSopzVdVLWp7H
         0nGaX1N4S7GAcP5JWA40OfjCuvg+2VmCbUYbeWQ/AB6ulYWU1L5wG3JpNDeUcL88UiRH
         k4zWgjQ4/ZvAqrfNVhyDTxkXL3RNEyLI4LYhavcafFt5GVlU9ngkb/GaN3L1llJjjE8j
         xKZA==
X-Gm-Message-State: AO0yUKVh86cK4nL6tXlg0oHZjv2Th4H1wCusabIPbSwoKOUvMtAY+YvD
        tK95YNsEnnnHeZ/fr+M+2qGDoA==
X-Google-Smtp-Source: AK7set8GooS3gQhj5FZBxaNBFZaG2KzUVWPRMkoPvYo1ebuUko7PW1z97XjgURXrfeTYQ5Gc/4grEw==
X-Received: by 2002:a7b:c3ce:0:b0:3eb:37ce:4c3e with SMTP id t14-20020a7bc3ce000000b003eb37ce4c3emr136754wmj.16.1679330106515;
        Mon, 20 Mar 2023 09:35:06 -0700 (PDT)
Received: from [192.168.1.70] (151.31.102.84.rev.sfr.net. [84.102.31.151])
        by smtp.gmail.com with ESMTPSA id n5-20020a05600c4f8500b003b47b80cec3sm17092150wmq.42.2023.03.20.09.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 09:35:06 -0700 (PDT)
Message-ID: <04914464-2bc2-9d86-e9e2-8a716b929f28@baylibre.com>
Date:   Mon, 20 Mar 2023 17:35:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: Add TI TPS6594 PMIC
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     lee@kernel.org, krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net,
        arnd@arndb.de, gregkh@linuxfoundation.org,
        derek.kiernan@xilinx.com, dragan.cvetic@xilinx.com,
        eric.auger@redhat.com, jgg@ziepe.ca, razor@blackwall.org,
        stephen@networkplumber.org, davem@davemloft.net,
        christian.koenig@amd.com, contact@emersion.fr,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, sterzik@ti.com, u-kumar1@ti.com,
        eblanc@baylibre.com, jneanne@baylibre.com
References: <20230315110736.35506-1-jpanis@baylibre.com>
 <20230315110736.35506-2-jpanis@baylibre.com>
 <20230320155354.GB1733616-robh@kernel.org>
From:   Julien Panis <jpanis@baylibre.com>
In-Reply-To: <20230320155354.GB1733616-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 3/20/23 16:53, Rob Herring wrote:
> On Wed, Mar 15, 2023 at 12:07:33PM +0100, Julien Panis wrote:
>> TPS6594 is a Power Management IC which provides regulators and others
>> features like GPIOs, RTC, watchdog, ESMs (Error Signal Monitor), and
>> PFSM (Pre-configurable Finite State Machine) managing the state of the
>> device.
>> TPS6594 is the super-set device while TPS6593 and LP8764X are derivatives.
> As mentioned, the binding needs to be complete. It's missing GPIO at
> least. RTC and watchdog may or may not need binding changes.

Thank you for your feedback.

About GPIO, do you speak about 'gpio-controller'
and/or '#gpio-cells' properties ?
For RTC (and for watchdog, once the driver will be
implemented), our driver do not require any node
to work. What could make an explicit instantiation
necessary in DT ?

>
>> Signed-off-by: Julien Panis <jpanis@baylibre.com>
>> ---
>>   .../devicetree/bindings/mfd/ti,tps6594.yaml   | 191 ++++++++++++++++++
>>   1 file changed, 191 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
>> new file mode 100644
>> index 000000000000..18f47cd6a2f9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
>> @@ -0,0 +1,191 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mfd/ti,tps6594.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: TI TPS6594 Power Management Integrated Circuit
>> +
>> +maintainers:
>> +  - Julien Panis <jpanis@baylibre.com>
>> +
>> +description: |
> Don't need '|'.
>
>> +  TPS6594 is a Power Management IC which provides regulators and others
>> +  features like GPIOs, RTC, watchdog, ESMs (Error Signal Monitor), and
>> +  PFSM (Pre-configurable Finite State Machine) managing the state of the device.
>> +  TPS6594 is the super-set device while TPS6593 and LP8764X are derivatives.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ti,lp8764x
>> +      - ti,tps6593
>> +      - ti,tps6594
>> +
>> +  reg:
>> +    description: I2C slave address or SPI chip select number.
>> +    maxItems: 1
>> +
>> +  ti,spmi-controller:
>> +    type: boolean
>> +    description: |
>> +      Identify the primary PMIC on SPMI bus.
> Perhaps the property name should include 'primary' and 'pmic'.
> Otherwise, it looks like it is just marked as 'a SPMI controller'.

Including 'primary' and 'pmic' will be more understandable indeed.
I will change that in v3.

>
>
>> +      A multi-PMIC synchronization scheme is implemented in the PMIC device
>> +      to synchronize the power state changes with other PMIC devices. This is
>> +      accomplished through a SPMI bus: the primary PMIC is the controller
>> +      device on the SPMI bus, and the secondary PMICs are the target devices
>> +      on the SPMI bus.
> Is this a TI specific feature?

I don't think so. I will double-check that.
If not, shall I remove the 'ti,' prefix ?

>
>> +
>> +  system-power-controller: true
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  ti,multi-phase-id:
>> +    description: |
>> +      Describes buck multi-phase configuration, if any. For instance, XY id means
>> +      that outputs of buck converters X and Y are combined in multi-phase mode.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [12, 34, 123, 1234]
> coupled regulator stuff doesn't work here?

Coupled regulator stuff works here.
Is it also necessary to specify some 'allOf' logic here to ensure
that mutual exclusions described below (for regulators) will be
applied ?

>
>> +
>> +  regulators:
>> +    type: object
>> +    description: List of regulators provided by this controller.
>> +
>> +    patternProperties:
>> +      "^buck([1-5]|12|34|123|1234)$":
>> +        type: object
>> +        $ref: /schemas/regulator/regulator.yaml#
>> +
>> +        unevaluatedProperties: false
>> +
>> +      "^ldo[1-4]$":
>> +        type: object
>> +        $ref: /schemas/regulator/regulator.yaml#
>> +
>> +        unevaluatedProperties: false
>> +
>> +    allOf:
>> +      - if:
>> +          required:
>> +            - buck12
>> +        then:
>> +          properties:
>> +            buck123: false
>> +            buck1234: false
>> +      - if:
>> +          required:
>> +            - buck123
>> +        then:
>> +          properties:
>> +            buck34: false
>> +      - if:
>> +          required:
>> +            - buck1234
>> +        then:
>> +          properties:
>> +            buck34: false
>> +
>> +    additionalProperties: false
>> +
>> +patternProperties:
>> +  "^buck([1-5]|12|34|123|1234)-supply$":
>> +    description: Input supply phandle for each buck.
>> +
>> +  "^ldo[1-4]-supply$":
>> +    description: Input supply phandle for each ldo.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        tps6593: pmic@48 {
>> +            compatible = "ti,tps6593";
>> +            reg = <0x48>;
>> +            ti,spmi-controller;
>> +            system-power-controller;
>> +
>> +            pinctrl-names = "default";
>> +            pinctrl-0 = <&pmic_irq_pins_default>;
>> +            interrupt-parent = <&mcu_gpio0>;
>> +            interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
>> +
>> +            ti,multi-phase-id = <123>;
>> +
>> +            buck123-supply = <&vcc_3v3_sys>;
>> +            buck4-supply = <&vcc_3v3_sys>;
>> +            buck5-supply = <&vcc_3v3_sys>;
>> +            ldo1-supply = <&vcc_3v3_sys>;
>> +            ldo2-supply = <&vcc_3v3_sys>;
>> +            ldo3-supply = <&buck5>;
>> +            ldo4-supply = <&vcc_3v3_sys>;
>> +
>> +            regulators {
>> +                buck123: buck123 {
>> +                    regulator-name = "vcc_core";
>> +                    regulator-min-microvolt = <750000>;
>> +                    regulator-max-microvolt = <850000>;
>> +                    regulator-boot-on;
>> +                    regulator-always-on;
>> +                };
>> +
>> +                buck4: buck4 {
>> +                    regulator-name = "vcc_1v1";
>> +                    regulator-min-microvolt = <1100000>;
>> +                    regulator-max-microvolt = <1100000>;
>> +                    regulator-boot-on;
>> +                    regulator-always-on;
>> +                };
>> +
>> +                buck5: buck5 {
>> +                    regulator-name = "vcc_1v8_sys";
>> +                    regulator-min-microvolt = <1800000>;
>> +                    regulator-max-microvolt = <1800000>;
>> +                    regulator-boot-on;
>> +                    regulator-always-on;
>> +                };
>> +
>> +                ldo1: ldo1 {
>> +                    regulator-name = "vddshv5_sdio";
>> +                    regulator-min-microvolt = <3300000>;
>> +                    regulator-max-microvolt = <3300000>;
>> +                    regulator-boot-on;
>> +                    regulator-always-on;
>> +                };
>> +
>> +                ldo2: ldo2 {
>> +                    regulator-name = "vpp_1v8";
>> +                    regulator-min-microvolt = <1800000>;
>> +                    regulator-max-microvolt = <1800000>;
>> +                    regulator-boot-on;
>> +                    regulator-always-on;
>> +                };
>> +
>> +                ldo3: ldo3 {
>> +                    regulator-name = "vcc_0v85";
>> +                    regulator-min-microvolt = <850000>;
>> +                    regulator-max-microvolt = <850000>;
>> +                    regulator-boot-on;
>> +                    regulator-always-on;
>> +                };
>> +
>> +                ldo4: ldo4 {
>> +                    regulator-name = "vdda_1v8";
>> +                    regulator-min-microvolt = <1800000>;
>> +                    regulator-max-microvolt = <1800000>;
>> +                    regulator-boot-on;
>> +                    regulator-always-on;
>> +                };
>> +            };
>> +        };
>> +    };
>> -- 
>> 2.37.3
>>

