Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84905C433F5
	for <linux-doc@archiver.kernel.org>; Sun,  3 Apr 2022 08:18:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235720AbiDCIUt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 3 Apr 2022 04:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234591AbiDCIUt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 3 Apr 2022 04:20:49 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 269D813CD8
        for <linux-doc@vger.kernel.org>; Sun,  3 Apr 2022 01:18:54 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id p23so69902edi.8
        for <linux-doc@vger.kernel.org>; Sun, 03 Apr 2022 01:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aVdE1T1dEZD7+sLQEHxxXp/voC607490GFsl2AtLabg=;
        b=hyXhY6k329Nl/PViwduqVY57b9feTjjD+LB2X6SmITUPdg26R5F9OdUbcGDlH6ftqy
         0pOO5mwt1BL9v55eXjX1YvuZGgi3HtoDXTA/+k9ZDE8GubQUSnxddd+v/YED5cvTASnS
         cCa2BvPbrBx/jJuvjkggTRv6eySm2+YR/rmb+T22SkK5+//wBL5ZxNUsNvK51PulX6GF
         /3HxZFdJ2c18i8MBtbBIysjN1J4x+3BUNibV/RNEU/JHAWvnZ8lQGI1mX4/Sss11vXEt
         XalF65KxXJ6V6dHZFWLxdGxaNv+vvabrvHUjpU3JabDANDBmAke0WE2TwOU00FhEgO27
         sSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aVdE1T1dEZD7+sLQEHxxXp/voC607490GFsl2AtLabg=;
        b=NQ28NJBH7/ji5OouiIe+w4//Vz4M2uD3IGwU5HkMGv0rNz1XUmLtb+XPyljJOTcqnU
         ULeFPy94Agig2SMHVdFbR7/IIyCaWCRHG77Ssfzcn6frpSEQCIeLS0WbSe24zmk+Q63u
         sklunL9Pw5cWIa7bvv5S3J20WEUMmstwL70RjEjQtJP4VRUvyJpS4wugs9sFKBAVgXdJ
         8nDM8b71+OaUcIhS3wYJsh+m44isdInqKe55UJO4bkLbMwutEhrzF4bPOgBreyKj0OT7
         ooEwu1GyI+TUEloQxFf6hBFC88JLigGFfp+98zzTml4oQNyWwdolaICqXSc3AYxwQPah
         MH1g==
X-Gm-Message-State: AOAM533Ihvsj2U9CP7jogUhhkxCqelfCJ7QWGvjFHxXuvNIxlaFlWNBP
        PyqumcyVWeUmNX3Yz+BUp9noGg==
X-Google-Smtp-Source: ABdhPJye6QN3inePdO3Kw+NS6rWVXTH8+gMeNFVDOkRAHbmCusD5nXKKJxrIPn+K1wNZ41qBAb/Vdg==
X-Received: by 2002:a05:6402:42c6:b0:419:276a:dded with SMTP id i6-20020a05640242c600b00419276addedmr28242895edc.2.1648973932759;
        Sun, 03 Apr 2022 01:18:52 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id h7-20020a1709066d8700b006d4b4d137fbsm2989105ejt.50.2022.04.03.01.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 01:18:52 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] docs: dt: writing-bindings: describe typical cases
Date:   Sun,  3 Apr 2022 10:18:48 +0200
Message-Id: <20220403081849.8051-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a chapter for caveats or typical mistakes.  Source: Rob Herring's
(Devicetree bindings maintainer) comments on LKML.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/writing-bindings.rst  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/writing-bindings.rst b/Documentation/devicetree/bindings/writing-bindings.rst
index 18d9e0689d49..5465eced2af1 100644
--- a/Documentation/devicetree/bindings/writing-bindings.rst
+++ b/Documentation/devicetree/bindings/writing-bindings.rst
@@ -58,6 +58,31 @@ Properties
 - DO define properties in terms of constraints. How many entries? What are
   possible values? What is the order?
 
+Typical cases and caveats
+=========================
+
+- Phandle entries, like clocks/dmas/interrupts/resets, should always be
+  explicitly ordered. Include the {clock,dma,interrupt,reset}-names if there is
+  more than one phandle. When used, both of these fields need the same
+  constraints (e.g.  list of items).
+
+- For names used in {clock,dma,interrupt,reset}-names, do not add any suffix,
+  e.g.: "tx" instead of "txirq" (for interrupt).
+
+- Properties without schema types (e.g. without standard suffix or not defined
+  by schema) need the type, even if this is an enum.
+
+- If schema includes other schema (e.g. /schemas/i2c/i2c-controller.yaml) use
+  "unevaluatedProperties:false". In other cases, usually use
+  "additionalProperties:false".
+
+- For sub-blocks/components of bigger device (e.g. SoC blocks) use rather
+  device-based compatible (e.g. SoC-based compatible), instead of custom
+  versioning of that component.
+  For example use "vendor,soc1234-i2c" instead of "vendor,i2c-v2".
+
+- "syscon" is not a generic property. Use vendor and type, e.g.
+  "vendor,power-manager-syscon".
 
 Board/SoC .dts Files
 ====================
-- 
2.32.0

