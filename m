Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1B8EE49A5
	for <linux-doc@archiver.kernel.org>; Mon, 21 Aug 2023 19:41:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbjHUTlm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Aug 2023 15:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjHUTlm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Aug 2023 15:41:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B666F3;
        Mon, 21 Aug 2023 12:41:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 961216439B;
        Mon, 21 Aug 2023 19:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA82C433C8;
        Mon, 21 Aug 2023 19:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692646897;
        bh=9wdfuxQ3GjCqB0cx5+Y0EXTJolIErryu/svxKgUbDrE=;
        h=From:To:Cc:Subject:Date:From;
        b=Se/gCTxGEQnsoDyEikjUU4b53smMavyCIUlV5Qc97zRX2oij3HIPLZLvt3syy28nS
         dx8u0Zg+amcwuLgFDKOobbkWGPWAe4ewU27YERvr/md9uzNqGLXO5kOu4a1trpjN9f
         tnNYDKcmSfwb6Ou4IOHT93EleZFn9MUSXa0kXm5Lljj2KuC+KCJbac2b74xvBFEQz7
         qzl3ih7xCdPOtYDEp899ZxNgelHXOdKl0gTr0AONBgtUmGtPmWEwK/ooOxazSuvvqO
         Ozk4/0tNQ+b55jb8byB2iwdnVGwYamQRuCfIYXQWul3JxYdkwZGpZpO+beDRMsGZfl
         u7sz2hXCOr/gA==
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] dt-bindings: Fix typos
Date:   Mon, 21 Aug 2023 14:41:32 -0500
Message-Id: <20230821194132.366474-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bjorn Helgaas <bhelgaas@google.com>

Fix typos in Documentation/devicetree/bindings.  The changes are in
descriptions or comments where they shouldn't affect functionality.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
This is a follow-up to the patch at [1] for things that conflicted with
other changes in linux-next, plus a couple that I missed before.

Based on next-20230821: 47d9bb711707 ("Add linux-next specific files for
20230821")

[1] https://lore.kernel.org/r/20230814212822.193684-3-helgaas@kernel.org

 .../devicetree/bindings/leds/leds-group-multicolor.yaml       | 2 +-
 Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml   | 4 ++--
 Documentation/devicetree/bindings/phy/apm-xgene-phy.txt       | 2 +-
 .../devicetree/bindings/serial/nvidia,tegra20-hsuart.yaml     | 2 +-
 .../devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
index 8ed059a5a724..33f49632ad82 100644
--- a/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
@@ -19,7 +19,7 @@ properties:
 
   leds:
     description:
-      An aray of monochromatic leds
+      An array of monochromatic LEDs
     $ref: /schemas/types.yaml#/definitions/phandle-array
 
 required:
diff --git a/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml b/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml
index 26688e2302ea..e8108cde0f59 100644
--- a/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml
+++ b/Documentation/devicetree/bindings/net/motorcomm,yt8xxx.yaml
@@ -59,7 +59,7 @@ properties:
       be configured with hardware pull-up resistors to match the SOC voltage
       (usually 1.8V).
       The software can read the registers to obtain the LDO voltage and configure
-      the legal drive strength(curren).
+      the legal drive strength(current).
       =====================================================
       | voltage |        current Available (uA)           |
       |   1.8v  | 1200 2100 2700 2910 3110 3600 3970 4350 |
@@ -76,7 +76,7 @@ properties:
       be configured with hardware pull-up resistors to match the SOC voltage
       (usually 1.8V).
       The software can read the registers to obtain the LDO voltage and configure
-      the legal drive strength(curren).
+      the legal drive strength(current).
       =====================================================
       | voltage |        current Available (uA)           |
       |   1.8v  | 1200 2100 2700 2910 3110 3600 3970 4350 |
diff --git a/Documentation/devicetree/bindings/phy/apm-xgene-phy.txt b/Documentation/devicetree/bindings/phy/apm-xgene-phy.txt
index e1bb12711fbf..602cf952b92b 100644
--- a/Documentation/devicetree/bindings/phy/apm-xgene-phy.txt
+++ b/Documentation/devicetree/bindings/phy/apm-xgene-phy.txt
@@ -36,7 +36,7 @@ Optional properties:
 			  3-tuple setting for each (up to 3) supported link
 			  speed on the host. Range is 0 to 273000 in unit of
 			  uV. Default is 0.
-- apm,tx-pre-cursor2	: 2st pre-cursor emphasis taps control. Two set of
+- apm,tx-pre-cursor2	: 2nd pre-cursor emphasis taps control. Two set of
 			  3-tuple setting for each (up to 3) supported link
 			  speed on the host. Range is 0 to 127400 in unit uV.
 			  Default is 0x0.
diff --git a/Documentation/devicetree/bindings/serial/nvidia,tegra20-hsuart.yaml b/Documentation/devicetree/bindings/serial/nvidia,tegra20-hsuart.yaml
index 04d55fecf47c..dcf73b3fc591 100644
--- a/Documentation/devicetree/bindings/serial/nvidia,tegra20-hsuart.yaml
+++ b/Documentation/devicetree/bindings/serial/nvidia,tegra20-hsuart.yaml
@@ -78,7 +78,7 @@ properties:
       we use nvidia,adjust-baud-rates.
 
       As an example, consider there is deviation observed in TX for baud rates as listed below. 0
-      to 9600 has 1% deviation 9600 to 115200 2% deviation. This slight deviation is expcted and
+      to 9600 has 1% deviation 9600 to 115200 2% deviation. This slight deviation is expected and
       Tegra UART is expected to handle it. Due to the issue stated above, baud rate on Tegra UART
       should be set equal to or above deviation observed for avoiding frame errors. Property
       should be set like this:
diff --git a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
index 04a2ba1aa946..0b048c4305ba 100644
--- a/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
+++ b/Documentation/devicetree/bindings/thermal/nvidia,tegra124-soctherm.yaml
@@ -155,7 +155,7 @@ properties:
       SOCTHERM hardware will assert the thermal trigger signal to the Power
       Management IC, which can be configured to reset or shutdown the device.
       It is an array of pairs where each pair represents a tsensor ID followed
-      by a temperature in milli Celcius. In the absence of this property the
+      by a temperature in milli Celsius. In the absence of this property the
       critical trip point will be used for thermtrip temperature.
 
       Note:
-- 
2.34.1

