Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 538A9C7618D
	for <linux-doc@archiver.kernel.org>; Thu,  6 Apr 2023 20:33:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239801AbjDFUd5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Apr 2023 16:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239803AbjDFUdU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Apr 2023 16:33:20 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C519B449
        for <linux-doc@vger.kernel.org>; Thu,  6 Apr 2023 13:32:19 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id 11so4214953ejw.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Apr 2023 13:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680813137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGgSmDun0Ka3ENM2dsOo9c+VSxguejpVGHkMFXaCcqA=;
        b=MUiM7bglLZqVCKsBSwDDkMv7LvSjNxNCs/0PTUXNkcKvc9liGgPLm0ici6sWKV2qbd
         1WfkT8pkPiJWIF8+y11XHFB85qJsSg/9Za0u52IOA8PMRfIXrdhmruMPOGQeLxKfOnGY
         KbsWXZWnx65MO2+JBIbf0gLFPP/KC/pdmDTtOW7BdurQXCwUqfAbdE0AuL4G8EMH7kEI
         VuRR+7aK1iAecpo7/aw8apuAP8dPPCiGerws0AaqVAI+dYO6wYL/e+77HRWf65pNHD34
         6VBeP7MW/IyFucHwruF95DP0b2Y8kBXeT7SlQcetnLF/I/+rcMXPng5TAIsPziZiOmqc
         4uyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680813137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wGgSmDun0Ka3ENM2dsOo9c+VSxguejpVGHkMFXaCcqA=;
        b=pnsyOfjFxls+sfpKWWSIEfnPENbcrYYdJ0+0rzsx5vjG3/ZXIaeJIjq8N3bez9Oe8Y
         aaKWFkdw5eH3NgSa+QscDZ77CEsmuzInAARiYOE82o5Q8mN+oXfttBB7GQ1m1ZQirbqQ
         VhHymPuQDN/fWPc/LXzwIaDge42u+m8I9JtKvrRylCs7/dF1QptAE3cG1sit2734HVd8
         ldxqf3w0Qr/SNepJf5fFpmhpLyWxbg0FQabwrLv55pt/P+mf8N+kI1JD+zv5+txLC5yf
         2ocu7cKXhhMo5dRtdDMcauWsH8dD0saEKBXx6h9XH5+QlpkSx2CtivAAXrgyqqsj0Mg0
         Krbw==
X-Gm-Message-State: AAQBX9dt3y8tmzMtfhEyVaQVMQOKw9dI6jyGLZ4cckwkwsOGYm3Xxc7S
        T5bx+2U37rhGP2dnZsujaY7lsA==
X-Google-Smtp-Source: AKy350aFQhS8NkCHu6j449nJK60w/ICqdvNrbFT+w873VTYfdgfIjtPAcMmUwC80gKAmg9AXqnXKoA==
X-Received: by 2002:a17:907:6744:b0:930:d30a:6c20 with SMTP id qm4-20020a170907674400b00930d30a6c20mr154044ejc.17.1680813137576;
        Thu, 06 Apr 2023 13:32:17 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 13:32:17 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Oded Gabbay <ogabbay@kernel.org>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Aleksa Savic <savicaleksa83@gmail.com>,
        Jack Doan <me@jackdoan.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
        Marius Zachmann <mail@mariuszachmann.de>,
        Wilken Gottwalt <wilken.gottwalt@posteo.net>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Jean-Marie Verdun <verdun@hpe.com>,
        Nick Hawkins <nick.hawkins@hpe.com>,
        Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        Rudolf Marek <r.marek@assembler.cz>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Jonas Malaco <jonas@protocubo.io>,
        Aleksandr Mezin <mezin.alexander@gmail.com>,
        Derek John Clark <derekjohn.clark@gmail.com>,
        =?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= 
        <samsagax@gmail.com>, Iwona Winiarska <iwona.winiarska@intel.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Michael Walle <michael@walle.cc>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Agathe Porte <agathe.porte@nokia.com>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        patches@opensource.cirrus.com, openbmc@lists.ozlabs.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 27/68] hwmon: lm83: constify pointers to hwmon_channel_info
Date:   Thu,  6 Apr 2023 22:30:22 +0200
Message-Id: <20230406203103.3011503-28-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230406203103.3011503-1-krzysztof.kozlowski@linaro.org>
References: <20230406203103.3011503-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Statically allocated array of pointed to hwmon_channel_info can be made
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwmon/lm83.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm83.c b/drivers/hwmon/lm83.c
index 616449f2cc50..bcaf31ec176e 100644
--- a/drivers/hwmon/lm83.c
+++ b/drivers/hwmon/lm83.c
@@ -337,7 +337,7 @@ static umode_t lm83_is_visible(const void *_data, enum hwmon_sensor_types type,
 	return 0;
 }
 
-static const struct hwmon_channel_info *lm83_info[] = {
+static const struct hwmon_channel_info * const lm83_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_ALARMS),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
-- 
2.34.1

