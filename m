Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B086C76196
	for <linux-doc@archiver.kernel.org>; Thu,  6 Apr 2023 07:56:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235440AbjDFH4d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Apr 2023 03:56:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235131AbjDFH4b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Apr 2023 03:56:31 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F4E61BA
        for <linux-doc@vger.kernel.org>; Thu,  6 Apr 2023 00:56:29 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id he13so2515360wmb.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Apr 2023 00:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680767787; x=1683359787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67/6bAcN5c2GUFRah8RhXGRCsZJE/Ek9N/Y5A37vLkc=;
        b=FZbQ7el/MKbOckDitqAgzTGLxdZKmvhLNxjW0FHgy+bamrwVqGpo+fkzHCbVs9nzzh
         EFlIXBBrhh7NYV8ncUBjVVtJB6AWOocJ8h3FUZSl1LqjR0BlmahicfIBPTMRoB6DiqwU
         jEm2OrKwEtmDnGWIAwtr+Tdd/V9rg3RvY1+GzHVFEClIVe/6b3VAzd+qJydQ0VyujrEO
         34WZa2ryjjzzLAVn5iDZoRimNCfkL+TXdow3/OnNOL2WKDVFfHG8UZSNSlYllilVh/Fw
         DFAy2hDwnbJsolULs/VlC7RmFc4VpZUE1gIwxuxrVsts0ousZmtQYc2xUWrYnLC40/HI
         B/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680767787; x=1683359787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67/6bAcN5c2GUFRah8RhXGRCsZJE/Ek9N/Y5A37vLkc=;
        b=GCs8M6Gtc3VpJaRcYqgQIAyLJ406KWmYILIy/4xBlSNR3GOXskFTDnNjdlOPTfBlmP
         xKsQKprN9Niu5PPer+62SkOJ10Ltjru64a1akS0ildJEVYdENAW947+KyoPI4bLdvPif
         7V92u0bDbKzi+bH4xn8ec1pJjF7iavXzmkLCzZd9N2D5TSxBAZaMj4QnU6GaSo++So2v
         +vsINz9syP+H66ig0L35+aJyE9OZNmimLbZH4BeUQJfNlw5qnncRA6YKRiqXH89AYuya
         n/BDt9Nf3ngcd8KlHSgY/LPGQwHv700n8ssIDDDAAegS/SiPDuOygpgwbXq/lJ7YkxjS
         He0A==
X-Gm-Message-State: AAQBX9cW7Y929EQgnLZXH1wIOomdDUKH/JWouNa0sHP3VwDyqsTVVuh9
        IFUt/aAOPgk4WnqXTo+Ne/l4CA==
X-Google-Smtp-Source: AKy350aL/bpVm+O46Vp/UsdMLn/2R4dd6uSY0hv08oBprnJH+fSj0cUWkyv6vJUhtYa+HArVUV3sOA==
X-Received: by 2002:a1c:7c12:0:b0:3ed:29e1:ed21 with SMTP id x18-20020a1c7c12000000b003ed29e1ed21mr6690647wmc.37.1680767787551;
        Thu, 06 Apr 2023 00:56:27 -0700 (PDT)
Received: from baylibre-ThinkPad-T14s-Gen-2i.. (151.31.102.84.rev.sfr.net. [84.102.31.151])
        by smtp.gmail.com with ESMTPSA id r15-20020a05600c458f00b003f03d483966sm4572651wmo.44.2023.04.06.00.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 00:56:27 -0700 (PDT)
From:   Julien Panis <jpanis@baylibre.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net, arnd@arndb.de,
        gregkh@linuxfoundation.org, derek.kiernan@xilinx.com,
        dragan.cvetic@xilinx.com
Cc:     yi.l.liu@intel.com, jgg@ziepe.ca, razor@blackwall.org,
        stephen@networkplumber.org, prabhakar.csengg@gmail.com,
        contact@emersion.fr, macro@orcam.me.uk, dsahern@kernel.org,
        alex.williamson@redhat.com, akrowiak@linux.ibm.com,
        mark.rutland@arm.com, ye.xingchen@zte.com.cn, ojeda@kernel.org,
        keescook@chromium.org, me@kloenk.de, mhiramat@kernel.org,
        milan@mdaverde.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        sterzik@ti.com, u-kumar1@ti.com, eblanc@baylibre.com,
        jneanne@baylibre.com
Subject: [PATCH v6 1/6] dt-bindings: mfd: Add TI TPS6594 PMIC
Date:   Thu,  6 Apr 2023 09:56:17 +0200
Message-Id: <20230406075622.8990-2-jpanis@baylibre.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230406075622.8990-1-jpanis@baylibre.com>
References: <20230406075622.8990-1-jpanis@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

TPS6594 is a Power Management IC which provides regulators and others
features like GPIOs, RTC, watchdog, ESMs (Error Signal Monitor), and
PFSM (Pre-configurable Finite State Machine) managing the state of the
device.
TPS6594 is the super-set device while TPS6593 and LP8764 are derivatives.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mfd/ti,tps6594.yaml   | 193 ++++++++++++++++++
 1 file changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps6594.yaml

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
new file mode 100644
index 000000000000..9d43376bebed
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
@@ -0,0 +1,193 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ti,tps6594.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI TPS6594 Power Management Integrated Circuit
+
+maintainers:
+  - Julien Panis <jpanis@baylibre.com>
+
+description:
+  TPS6594 is a Power Management IC which provides regulators and others
+  features like GPIOs, RTC, watchdog, ESMs (Error Signal Monitor), and
+  PFSM (Pre-configurable Finite State Machine) managing the state of the device.
+  TPS6594 is the super-set device while TPS6593 and LP8764 are derivatives.
+
+properties:
+  compatible:
+    enum:
+      - ti,lp8764-q1
+      - ti,tps6593-q1
+      - ti,tps6594-q1
+
+  reg:
+    description: I2C slave address or SPI chip select number.
+    maxItems: 1
+
+  ti,primary-pmic:
+    type: boolean
+    description: |
+      Identify the primary PMIC on SPMI bus.
+      A multi-PMIC synchronization scheme is implemented in the PMIC device
+      to synchronize the power state changes with other PMIC devices. This is
+      accomplished through a SPMI bus: the primary PMIC is the controller
+      device on the SPMI bus, and the secondary PMICs are the target devices
+      on the SPMI bus.
+
+  system-power-controller: true
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+    description: |
+      The first cell is the pin number, the second cell is used to specify flags.
+      See ../gpio/gpio.txt for more information.
+
+  interrupts:
+    maxItems: 1
+
+  regulators:
+    type: object
+    description: List of regulators provided by this controller.
+
+    patternProperties:
+      "^buck([1-5]|12|34|123|1234)$":
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+
+        unevaluatedProperties: false
+
+      "^ldo[1-4]$":
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+
+        unevaluatedProperties: false
+
+    allOf:
+      - if:
+          required:
+            - buck12
+        then:
+          properties:
+            buck123: false
+            buck1234: false
+      - if:
+          required:
+            - buck123
+        then:
+          properties:
+            buck34: false
+      - if:
+          required:
+            - buck1234
+        then:
+          properties:
+            buck34: false
+
+    additionalProperties: false
+
+patternProperties:
+  "^buck([1-5]|12|34|123|1234)-supply$":
+    description: Input supply phandle for each buck.
+
+  "^ldo[1-4]-supply$":
+    description: Input supply phandle for each ldo.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        tps6593: pmic@48 {
+            compatible = "ti,tps6593-q1";
+            reg = <0x48>;
+            ti,primary-pmic;
+            system-power-controller;
+
+            gpio-controller;
+            #gpio-cells = <2>;
+
+            pinctrl-names = "default";
+            pinctrl-0 = <&pmic_irq_pins_default>;
+            interrupt-parent = <&mcu_gpio0>;
+            interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+
+            buck123-supply = <&vcc_3v3_sys>;
+            buck4-supply = <&vcc_3v3_sys>;
+            buck5-supply = <&vcc_3v3_sys>;
+            ldo1-supply = <&vcc_3v3_sys>;
+            ldo2-supply = <&vcc_3v3_sys>;
+            ldo3-supply = <&buck5>;
+            ldo4-supply = <&vcc_3v3_sys>;
+
+            regulators {
+                buck123: buck123 {
+                    regulator-name = "vcc_core";
+                    regulator-min-microvolt = <750000>;
+                    regulator-max-microvolt = <850000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                };
+
+                buck4: buck4 {
+                    regulator-name = "vcc_1v1";
+                    regulator-min-microvolt = <1100000>;
+                    regulator-max-microvolt = <1100000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                };
+
+                buck5: buck5 {
+                    regulator-name = "vcc_1v8_sys";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                };
+
+                ldo1: ldo1 {
+                    regulator-name = "vddshv5_sdio";
+                    regulator-min-microvolt = <3300000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                };
+
+                ldo2: ldo2 {
+                    regulator-name = "vpp_1v8";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                };
+
+                ldo3: ldo3 {
+                    regulator-name = "vcc_0v85";
+                    regulator-min-microvolt = <850000>;
+                    regulator-max-microvolt = <850000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                };
+
+                ldo4: ldo4 {
+                    regulator-name = "vdda_1v8";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                };
+            };
+        };
+    };
-- 
2.37.3

