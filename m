Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F25A8C48BDF
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 03:01:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5826613AE
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 03:01:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbhFKDDT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Jun 2021 23:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbhFKDDS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Jun 2021 23:03:18 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32D18C0617AD
        for <linux-doc@vger.kernel.org>; Thu, 10 Jun 2021 20:01:10 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id x73so3259179pfc.8
        for <linux-doc@vger.kernel.org>; Thu, 10 Jun 2021 20:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LuRF2Uw9JRiSKgOzW2yj1WCtNFvC9o9Zyt1kUPtqaWw=;
        b=iMWNZh95tFSTj7vPD/6b9sNi1SmcKzwRhyhXEoYtOMTS29/w5ZNyQc8ene2611FF2S
         LWQrSsjisSj4Y2UuZHBjwk/ZG/3gNcTy2oxrp8FEjBojeLkVC0SO6mqPh4+jqt6n/avj
         I1014QXtW+ManZhUolvwqUCYDfLpVJJPN7085II8oYZnBF07OhAn5GC/J2uUimxV6/ZL
         Q3MXN8rJkTvS6MCYbOzeQQRkhW5GyF7oJ18q9nktbB3gdJ0pg615VAsO0KskuiOnFWv7
         Rq3utWxL7SKPpDY7Z9VggsaKYB8FoSsEzYbrYKc/0k/3nEuneedrtLkHqpNVsjFRgOJd
         nr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LuRF2Uw9JRiSKgOzW2yj1WCtNFvC9o9Zyt1kUPtqaWw=;
        b=VPR0pkpGhNrkQq6yAJfzuwbNwB429DpSDeLBlhoaTXcubjDg92WtUo0b74l0CUcyjN
         5BjVBfOB1NgcfaafpMsubPW4lUdQ0SddCFvIk12cLaZ/K4/cWZi6+jM8KgxSfVE2VP+F
         i0paDZfwBRSaqCLN+ZuU/QUM0VhYaxCmJAX0SsA9XoLCvmqeDEoW9rKXZtRuSVPjw3Jl
         jgKLt3lMJNPmkhxBY60fP9ku+Fov805ObpyBSNUGAHh51hFs4RgE8p8+JTYhxTVFvWY3
         9Bo5ZJzc0SR0clfvp1PX02rTsPVNvHesxySruU+GL01d05xGPZ49ChVIzV39cN+zrG21
         HIWw==
X-Gm-Message-State: AOAM533Zs8WMlePd3wbFCXfQ8bIAL0SCGrnBSzRP8eVbD7rdzI7vgZWT
        3RCGdvytZnssUn9+kHdI/JfXkbA4svE=
X-Google-Smtp-Source: ABdhPJwD4i0KMCj52TYZNVtX7PVkeoMAMah5aIzjQYidt201NBoBfyTbDzqz0Y8fkFmfn4r/BJSQPQ==
X-Received: by 2002:aa7:84c7:0:b029:2e9:2d18:54a5 with SMTP id x7-20020aa784c70000b02902e92d1854a5mr5974306pfn.44.1623380469453;
        Thu, 10 Jun 2021 20:01:09 -0700 (PDT)
Received: from kir-rhat.redhat.com (c-76-104-243-248.hsd1.wa.comcast.net. [76.104.243.248])
        by smtp.gmail.com with ESMTPSA id ev11sm8856748pjb.36.2021.06.10.20.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 20:01:09 -0700 (PDT)
From:   Kir Kolyshkin <kolyshkin@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Kir Kolyshkin <kolyshkin@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] docs/devicetree: fix a cross-ref
Date:   Thu, 10 Jun 2021 20:00:43 -0700
Message-Id: <20210611030044.1982911-3-kolyshkin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210611030044.1982911-1-kolyshkin@gmail.com>
References: <20210611030044.1982911-1-kolyshkin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Commit 56b01acc1c79 renames the file being referred to.
Fix the references accordingly.

Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Kir Kolyshkin <kolyshkin@gmail.com>
---
 Documentation/devicetree/bindings/leds/leds-bcm6328.txt | 3 ++-
 Documentation/devicetree/bindings/leds/leds-bcm6358.txt | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-bcm6328.txt b/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
index ccebce597f37..c9e4077734f9 100644
--- a/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
+++ b/Documentation/devicetree/bindings/leds/leds-bcm6328.txt
@@ -4,7 +4,8 @@ This controller is present on BCM6318, BCM6328, BCM6362 and BCM63268.
 In these SoCs it's possible to control LEDs both as GPIOs or by hardware.
 However, on some devices there are Serial LEDs (LEDs connected to a 74x164
 controller), which can either be controlled by software (exporting the 74x164
-as spi-gpio. See Documentation/devicetree/bindings/gpio/gpio-74x164.txt), or
+as spi-gpio; see
+Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml), or
 by hardware using this driver.
 Some of these Serial LEDs are hardware controlled (e.g. ethernet LEDs) and
 exporting the 74x164 as spi-gpio prevents those LEDs to be hardware
diff --git a/Documentation/devicetree/bindings/leds/leds-bcm6358.txt b/Documentation/devicetree/bindings/leds/leds-bcm6358.txt
index da5708e7b43b..183258ceb8bc 100644
--- a/Documentation/devicetree/bindings/leds/leds-bcm6358.txt
+++ b/Documentation/devicetree/bindings/leds/leds-bcm6358.txt
@@ -2,8 +2,8 @@ LEDs connected to Broadcom BCM6358 controller
 
 This controller is present on BCM6358 and BCM6368.
 In these SoCs there are Serial LEDs (LEDs connected to a 74x164 controller),
-which can either be controlled by software (exporting the 74x164 as spi-gpio.
-See Documentation/devicetree/bindings/gpio/gpio-74x164.txt), or
+which can either be controlled by software (exporting the 74x164 as spi-gpio;
+see Documentation/devicetree/bindings/gpio/fairchild,74hc595.yaml), or
 by hardware using this driver.
 
 Required properties:
-- 
2.31.1

