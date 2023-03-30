Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97A6C77B6E
	for <linux-doc@archiver.kernel.org>; Thu, 30 Mar 2023 08:20:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbjC3IUg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 30 Mar 2023 04:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbjC3IUU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Mar 2023 04:20:20 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9B9376B9
        for <linux-doc@vger.kernel.org>; Thu, 30 Mar 2023 01:20:12 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id v1so18179797wrv.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Mar 2023 01:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680164411; x=1682756411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kz8O0h7OgMF0sc+ePQvG9dGICikJ94bKFs6ad794+O4=;
        b=SIfPU8LkPm1D2UMludinin+ImXvyDgmatubsc5VNKSLmjzosne2bNfXGuJry9ntlZc
         c5Z+lRvFfwC5ziOE+hvJcQiaFeomsIwlJ1upkRoq9MNLaLu6nNdjgzfRgMyVNjgVnIkZ
         G6IDaIjlgg1L2HoSn0JVNqkM+FLCGqmbrgSSHnVDnVywTptjphwBp4fUdHE1ffrV6v5P
         xII5+FNL0C5novcISxxI1RSGaGIsmDMv7zVQFPsR87iGFCVKQyjuiZRsf/i+wDe9Neki
         HmPEzxLTFuKHawAJjUED9MqRAR9E5Ee3rBVW1JUiG73n/PXZrJ904H751I0D2SRwo0ti
         y2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680164411; x=1682756411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kz8O0h7OgMF0sc+ePQvG9dGICikJ94bKFs6ad794+O4=;
        b=jE9MJxOECwqkPC2O6EV9K45BBcyyGKxleyWQPtBMB1mlfIpQCL/NdTN8M1HAi3yyvt
         t44jDDsclv7xxuOPwFn6hIuIFmxKrp3oAFI4d/SQzFPqFNL1Vox5Dvrkumo2mT4dyIey
         j9hsx0QmztgXGrTd8Huo1OkEZvohXQYokW5uPKtOXNIjMsnNbgPhgSJ8HEnvfWSDX58u
         XcprQcZ9rjtVWq8YVMyVJ14i40XKC3OHaNGCTsbshaWC2KKy9jl9wbjR/tZgTG6qrsMc
         ZL4OG2zQ2GbIeI+R6CgQsp7FYzz+aVD0KzQnX/5nZs0OyCPN0xTjwkv9nVv7xIciml+3
         +EMA==
X-Gm-Message-State: AAQBX9cU+611We5ERG1IfQWj1cminNa9/N+cSiyxb23874j0siORdTR5
        mMbjYGPbrhQ/2hmqnd1jcDJIzA==
X-Google-Smtp-Source: AKy350bcRxN/D02IASqKX8ND/cVBONlyagpoyk6EVHXod/APuvc/5vG6Km3uZx0vxaVX9pXl5wxZ6Q==
X-Received: by 2002:a5d:4d03:0:b0:2da:f0b5:2595 with SMTP id z3-20020a5d4d03000000b002daf0b52595mr17411197wrt.0.1680164411361;
        Thu, 30 Mar 2023 01:20:11 -0700 (PDT)
Received: from baylibre-ThinkPad-T14s-Gen-2i.. (151.31.102.84.rev.sfr.net. [84.102.31.151])
        by smtp.gmail.com with ESMTPSA id e13-20020a5d4e8d000000b002ceacff44c7sm32286588wru.83.2023.03.30.01.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 01:20:11 -0700 (PDT)
From:   Julien Panis <jpanis@baylibre.com>
To:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net, arnd@arndb.de,
        gregkh@linuxfoundation.org, derek.kiernan@xilinx.com,
        dragan.cvetic@xilinx.com
Cc:     yi.l.liu@intel.com, jgg@ziepe.ca, razor@blackwall.org,
        stephen@networkplumber.org, prabhakar.csengg@gmail.com,
        contact@emersion.fr, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        sterzik@ti.com, u-kumar1@ti.com, eblanc@baylibre.com,
        jneanne@baylibre.com
Subject: [PATCH v5 1/4] dt-bindings: mfd: Add TI TPS6594 PMIC
Date:   Thu, 30 Mar 2023 10:20:03 +0200
Message-Id: <20230330082006.11216-2-jpanis@baylibre.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230330082006.11216-1-jpanis@baylibre.com>
References: <20230330082006.11216-1-jpanis@baylibre.com>
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

