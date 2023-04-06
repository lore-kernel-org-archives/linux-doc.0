Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE8AC7618D
	for <linux-doc@archiver.kernel.org>; Thu,  6 Apr 2023 20:34:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240061AbjDFUeO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Apr 2023 16:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239778AbjDFUdj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Apr 2023 16:33:39 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A469CB74A
        for <linux-doc@vger.kernel.org>; Thu,  6 Apr 2023 13:32:25 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id l17so4228974ejp.8
        for <linux-doc@vger.kernel.org>; Thu, 06 Apr 2023 13:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680813145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDyUmonauZ8nm6n5G/LkXb2fBKeLEqNmyMFXN+56R/0=;
        b=YMS5yzUgMpMduF8w1083GJyyM6G6mP2dHeTaOtQucecobZTroK8AAqIAmDn6/gJfrG
         ixVUYsEiSU+LJT4zWFOe7Ptebv771vH7Vay68cGCplldTOwBeRcj1S0c47TJagJd9Ab0
         B0VIJAcrQ1aVhxBoW5MBMLiegaF47uXPlYUF0SJ6QCNdhhkinlV8OPOngm5VKzqrURVS
         50xVbFPq8CtFxAmoA7S3p7KME50ER3N2prf22Ax4x/dy9mtv9rg/XqrNnj4kjT7Dqwx/
         dxV/zlM/71fKfQn5h7ZzgAVkNSeuHav8BPytem0sIENRe/dSezZUULJjjpodkHqvG/Ex
         l2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680813145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eDyUmonauZ8nm6n5G/LkXb2fBKeLEqNmyMFXN+56R/0=;
        b=X9GcBpzbky2rDV/2sGXcBWmyiHLME4lbjL+b7iDGj29A8L/WAe2KbNmGr1PpuxNOI7
         V57y/OBzAiNbAn2jjTlqo9TlBWCEj8kVY56V8m5XWSCSfKSPYX62zLCbK7y38GjbmEY6
         3nHhYNYZizeSmadUCHwU1fiIuNyhFuOT3LRV79AQ90uEo6Xd8z1XuvDruhXj1HMwq3xs
         yoZmya7gzG+WKmm877sMpV9cI9ga5wB6QdgmNE/W0GzOsXFZfV6H+EzEGKkxRr7QJ/cb
         qxxTKdSvsP3zILnPwUtQhSnMNNBVRuK/2Sbc09/nLICNLDzaLk2FBjSG+OkvAUOsB7Rn
         /qIA==
X-Gm-Message-State: AAQBX9foQ9VCbfgiHQJ/ncp/Ibxi3fhRKGm8cRdqio99UZbISCUzwzog
        1IMyIGqfmbjjFlknvZLR3n19sg==
X-Google-Smtp-Source: AKy350ZF8nPTGR4RDE9lm1XOWYeECS7YDWeUJSraSmbL162uZx4DgwowpRCXrEnbKVyGKSKX+TbtLw==
X-Received: by 2002:a17:906:80c9:b0:931:2306:f363 with SMTP id a9-20020a17090680c900b009312306f363mr150222ejx.21.1680813145115;
        Thu, 06 Apr 2023 13:32:25 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 13:32:24 -0700 (PDT)
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
Subject: [PATCH 30/68] hwmon: lochnagar: constify pointers to hwmon_channel_info
Date:   Thu,  6 Apr 2023 22:30:25 +0200
Message-Id: <20230406203103.3011503-31-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/lochnagar-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lochnagar-hwmon.c b/drivers/hwmon/lochnagar-hwmon.c
index 8b19adf2eeb0..9948e2f7208d 100644
--- a/drivers/hwmon/lochnagar-hwmon.c
+++ b/drivers/hwmon/lochnagar-hwmon.c
@@ -321,7 +321,7 @@ static const struct hwmon_ops lochnagar_ops = {
 	.write = lochnagar_write,
 };
 
-static const struct hwmon_channel_info *lochnagar_info[] = {
+static const struct hwmon_channel_info * const lochnagar_info[] = {
 	HWMON_CHANNEL_INFO(temp,  HWMON_T_INPUT),
 	HWMON_CHANNEL_INFO(in,    HWMON_I_INPUT | HWMON_I_LABEL,
 				  HWMON_I_INPUT | HWMON_I_LABEL,
-- 
2.34.1

