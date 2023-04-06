Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1F9C7618D
	for <linux-doc@archiver.kernel.org>; Thu,  6 Apr 2023 20:34:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240050AbjDFUeH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Apr 2023 16:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239554AbjDFUdg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Apr 2023 16:33:36 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1E1BAD0C
        for <linux-doc@vger.kernel.org>; Thu,  6 Apr 2023 13:32:22 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id qb20so4219405ejc.6
        for <linux-doc@vger.kernel.org>; Thu, 06 Apr 2023 13:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680813142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQG7cqdEyfvgPiaN3cNryt/86XntNmRJN2oVu5IHW7Y=;
        b=XJ44jdrRUc4kmM1br66U6rAOf/+J2P4kKVwI+KigpUoEt84wEJ7+ahpdDZh0lXfDsg
         Zo+YSwYFZeTAdqXM5z1SKrt0YWzUgauAPRPkAmwG8zZwUXR9Kz//biE2tQLr20a2eybt
         goJiW94Kcuan6+Eq33KmOod8cL+wq7JoiGfBxsWVSlGlD42arsqJI9o+hNMNGa4gwtDR
         sOBCJvALAiEB2jUn/42KnmlOtZmEHbtffkvFpHS4faMyw+tvioNqFy8kJbFtI6AFZOS1
         cnUaWGdtiR38mhNGPVZymKjgNosdn20ThR3rBSsau736cXbtjAFQRoNixz0/0nC7YO/8
         yNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680813142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQG7cqdEyfvgPiaN3cNryt/86XntNmRJN2oVu5IHW7Y=;
        b=w2qtLPA4x4n93bRxLIZUGQXrYuMwOYqlkHFOu1LnFXpxsuY03v6ygxLvkOPbEXzEnj
         m5vFW4eGIueWiPbc1pmA4eX8f6tD2evpeQ5nqM6lTWL+3yL5EuuawfC5Y34CvmkzT1aT
         L7aJDDjRWEkXp+T+ubCNVBHtMCHK+h6slCAqfY4apWc9vBekw50CnIr7t1E5+dOtBILF
         AK4No/KMPbMLaTS6NVK+S+DNQ7un82NEpB6au9d4+QU0rJT+bG98D41fUMf5D19eGBW5
         OKOYiJ43O3gaRCoaA2XfXIVo0hz1nvYUzk34QfmSIx75ZeZy/Q9Gl8W4KBTPovakn/BO
         ts/Q==
X-Gm-Message-State: AAQBX9fu1ZEKFRFeSsm0M1NJt+UzjyEwOLC2rskqN7MQD69rX7tYESs5
        ANmxiHaG9E4b5fsH8LhQCgSUnQ==
X-Google-Smtp-Source: AKy350Y+6+5n4zHzDsmLkCFWD6JwwfjRxF0GIrJC3syTwj2hmXC7+JMPJgNcDMorii71vq2OJNJ7Zw==
X-Received: by 2002:a17:906:39c8:b0:93c:847d:a456 with SMTP id i8-20020a17090639c800b0093c847da456mr167306eje.22.1680813142562;
        Thu, 06 Apr 2023 13:32:22 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 13:32:22 -0700 (PDT)
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
Subject: [PATCH 29/68] hwmon: lm95245: constify pointers to hwmon_channel_info
Date:   Thu,  6 Apr 2023 22:30:24 +0200
Message-Id: <20230406203103.3011503-30-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/lm95245.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm95245.c b/drivers/hwmon/lm95245.c
index c433f0af2d31..4236d1e0544d 100644
--- a/drivers/hwmon/lm95245.c
+++ b/drivers/hwmon/lm95245.c
@@ -523,7 +523,7 @@ static const struct regmap_config lm95245_regmap_config = {
 	.use_single_write = true,
 };
 
-static const struct hwmon_channel_info *lm95245_info[] = {
+static const struct hwmon_channel_info * const lm95245_info[] = {
 	HWMON_CHANNEL_INFO(chip,
 			   HWMON_C_UPDATE_INTERVAL),
 	HWMON_CHANNEL_INFO(temp,
-- 
2.34.1

