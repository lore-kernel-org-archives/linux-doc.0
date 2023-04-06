Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A43C77B6E
	for <linux-doc@archiver.kernel.org>; Thu,  6 Apr 2023 20:33:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239780AbjDFUdl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Apr 2023 16:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239872AbjDFUdO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Apr 2023 16:33:14 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD25AF37
        for <linux-doc@vger.kernel.org>; Thu,  6 Apr 2023 13:32:14 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id jw24so4219222ejc.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Apr 2023 13:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680813132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNp3WYqV/V7CDaByQ6e7/ceMuMWEtGPx0KFJs+NcOj0=;
        b=PlCNPADLLxrpEitZeVrRHlscQjOgnnSh+Mk2MmQ3ulAO6OMkjKdPOAjyiWgYk44Beu
         FCKCoWAMDe3ZZFwFA908RF8ktFCR85AuvLlLSjgzvPnKP6QdSAoG+lH+8IrhYme8Luk4
         9bpGbIMWzDVcjlVDgpiS6kxSU9QmqJuSYTihuiGzxPar8hU38iLg+XukWhebKaodFG3E
         knO9iHkp/j19RNRUysp0RKX7hKPEUehgY7cQ/xxVl0HEcsvp1aSkKfWZeUw3vWfi5Kjt
         W5uiFYcH/mThvS651XTGFlH+ffw+/0WHtYDheiSR6PxHt/KyvOWEn16TBp6vziXxBa3S
         IlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680813132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNp3WYqV/V7CDaByQ6e7/ceMuMWEtGPx0KFJs+NcOj0=;
        b=RagS9B9zK1+KNSgXUMR4FtnTX96OjesYj+LpJGy+jnT0PQQ3NGBAQmHI2H49dBmj7i
         4d8Spc9614Z+uoo0tUn/0ZALtKaDVAAhb5IV2n3HWwmYM/ldzNvF4xBUgTaUIrweZ3JI
         7ybkG/fW4ClwIxdXxsgrpR2KuNtr39u3bgZ1dfuFoVInWSmOoA14UTJ/sKW/NPl8mKQy
         kRavoa48btasm1gv4hxoHwg6ut4J0FqstvKpmtRs8E2o8/HVjbdtTca32K+X0nWbL5f0
         O+LMQaX+iUV29wneS+v0uvXrPemrYAHFLYYZ15lSYexQ5+Ik3+NwY6WmuBNALaQZFJdV
         ve8A==
X-Gm-Message-State: AAQBX9ejIFyqkmMyOKsmBw1dhDZX7TRiSt5l6/XbVJ9yAvzTQhMB3GvW
        8oQU/HGUBD4GMP8Q6nrmTyHLzw==
X-Google-Smtp-Source: AKy350ayegwpK76aPtDbCZC1X7+3Vf06lspI7rDhnT552IpPl+QIeLGxsAkDYKvDVzwY2yrD4EJFwA==
X-Received: by 2002:a17:906:1412:b0:939:e928:5323 with SMTP id p18-20020a170906141200b00939e9285323mr97046ejc.54.1680813132640;
        Thu, 06 Apr 2023 13:32:12 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 13:32:12 -0700 (PDT)
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
Subject: [PATCH 25/68] hwmon: lan966x: constify pointers to hwmon_channel_info
Date:   Thu,  6 Apr 2023 22:30:20 +0200
Message-Id: <20230406203103.3011503-26-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/lan966x-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lan966x-hwmon.c b/drivers/hwmon/lan966x-hwmon.c
index f41df053ac31..f8658359a098 100644
--- a/drivers/hwmon/lan966x-hwmon.c
+++ b/drivers/hwmon/lan966x-hwmon.c
@@ -260,7 +260,7 @@ static umode_t lan966x_hwmon_is_visible(const void *data,
 	return mode;
 }
 
-static const struct hwmon_channel_info *lan966x_hwmon_info[] = {
+static const struct hwmon_channel_info * const lan966x_hwmon_info[] = {
 	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
 	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
-- 
2.34.1

