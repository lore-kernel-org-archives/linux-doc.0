Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DAAEC77B6C
	for <linux-doc@archiver.kernel.org>; Thu,  6 Apr 2023 20:32:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239610AbjDFUco (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Apr 2023 16:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239613AbjDFUcT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Apr 2023 16:32:19 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D87AB767
        for <linux-doc@vger.kernel.org>; Thu,  6 Apr 2023 13:31:52 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id n21so4220893ejz.4
        for <linux-doc@vger.kernel.org>; Thu, 06 Apr 2023 13:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680813111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PC4lsh3OxdQxSxIIAq1gG+FVtJTQj9E469Ai9wRQe3A=;
        b=DultCbt08k4QHYdtlCx7M1tEdumHHofsamq5Hh/HzlyFQ1sewtCc/+yrgSqzqTWped
         uA801AmwNoNKbMZLVYIEfwAX6D1b5I0UxdQta5JnE9Rrv/2ASnttqf0wfwhdRvm7onzq
         RNLyVJCwgzEOVJkVIPEH0eQsTIdelpDN0HlwIx0KMM/eO+CCY5xXoY1UodPv4x6EoUwh
         iXAiogAx6+2Syuf4miP2LcwPK1s+PuR+mpv67N13skQcGU6JxcbF+UoU13lFQ4IvYL8v
         uLkFwq+3E/RR7TctaH1m58L5sN0SMQsDwNXFaWyiX8RTLweiduKzQ1odqq5TaC2X+VwR
         EIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680813111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PC4lsh3OxdQxSxIIAq1gG+FVtJTQj9E469Ai9wRQe3A=;
        b=hdr3fJaju3cigjOlUHlGBtU4RbJqvXbJgcKQHU1JWCKLEYVWojPmpTAb1uEfLVPi89
         oigyVSHAJAAVhpPL37BcKGyQQkx+00Rvh2SfWD2fv2IUzwBkxJ2heYKWGT1TA4DS8eGJ
         FfkBMYBO9S3g5WdT89VleYfeHxDGEk0YsJNnge0J/MsZzxL+pD8CiBs1U9HqzItDyecN
         V8Ou6/7g/t0fwDD+lYCKGbAgYwHAjON/XIg9pdE+MfxlqMcrCCY0Waqm5Ruv1CN5A7bG
         Ntg6vdwkX+KJ4iRXRS7QZoSSn1FGA62nT6Pc4MPvUQw//vhL8puR14tRZ92l5qxq3C2u
         xbdg==
X-Gm-Message-State: AAQBX9cLAxrOSLSehE0wUZa2XgFSv5IpuA2a05xIDKeugiYkmcsmKCWV
        D2H+kTsJBuP1o7N45t7WmAh6Tg==
X-Google-Smtp-Source: AKy350YMxjova8/YXMJ5F804pP+X4GEe65xnAEjpNIs0nkj6iA21YkajeiMM/3rZdDwHPAmzQUlJsA==
X-Received: by 2002:a17:906:f6ca:b0:92f:7c42:8631 with SMTP id jo10-20020a170906f6ca00b0092f7c428631mr187736ejb.16.1680813111545;
        Thu, 06 Apr 2023 13:31:51 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 13:31:51 -0700 (PDT)
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
Subject: [PATCH 16/68] hwmon: ftsteutates: constify pointers to hwmon_channel_info
Date:   Thu,  6 Apr 2023 22:30:11 +0200
Message-Id: <20230406203103.3011503-17-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/ftsteutates.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ftsteutates.c b/drivers/hwmon/ftsteutates.c
index 25afd9167a34..f5a4d91a7e90 100644
--- a/drivers/hwmon/ftsteutates.c
+++ b/drivers/hwmon/ftsteutates.c
@@ -520,7 +520,7 @@ static const struct hwmon_ops fts_ops = {
 	.write = fts_write,
 };
 
-static const struct hwmon_channel_info *fts_info[] = {
+static const struct hwmon_channel_info * const fts_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_ALARM | HWMON_T_FAULT,
-- 
2.34.1

