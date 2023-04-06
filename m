Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E3F5C76196
	for <linux-doc@archiver.kernel.org>; Thu,  6 Apr 2023 20:34:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239902AbjDFUeT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Apr 2023 16:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239470AbjDFUdy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Apr 2023 16:33:54 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08132C162
        for <linux-doc@vger.kernel.org>; Thu,  6 Apr 2023 13:32:30 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id g18so4216328ejj.5
        for <linux-doc@vger.kernel.org>; Thu, 06 Apr 2023 13:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680813148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VO8RtXIHFkMLE4x+ayYSzlFGwtzjPkL5W8IJ6F0GzS8=;
        b=apdHVJ8hSomWaRwNZFrCjodO6msIJ9UHad9g6Lo+PsFhBQMiPOTr2DFzkGODMoxibn
         dpFAGVlikYfS3JUQ4Bj1RzUJgaJflrGMwCYp8yuRld3y/1Qt2+pGw11b8kJtMiIjeYq1
         luj7//ijoJiyi1gw57kdB5YqFbm+uNlRiT8JedTrwsfM/Rrmq2gL3dqTviaYDqr9fnnp
         1W44Dn/BiLYDuFNOJvsxyaDhZqUc6tbP9oTr2agQlLTXqG3TmDftmogdaOfBo2XEPhTM
         rR60MZMcZSk4E8VLgEH/oaBzhF//FHfDNCXLuUsuUuitVyW0kXoHHcQLe9yMWrNgSsEL
         A6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680813148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VO8RtXIHFkMLE4x+ayYSzlFGwtzjPkL5W8IJ6F0GzS8=;
        b=CZL+Xdd71bv7z18wQ1ti2QpWXZE6Bua9Xdm6ea9tILebfuyDojXbVlBzvf8EDhLg4X
         UX2LKiVbm0rvPiPdIFmrOLpGhVUhv23a0sxu7tokEfPq4TQHdOkwOwuE6mBFwn1gzh3P
         GXhkhj0ZsjNEvnJ3VhAX0C7fMNhhBSeQidoTZ42vGDOlSlfmMQPohNe0w9+NxcTPNah5
         qiX6O4FTscT6ak6umWKfPWR7stUNEUR/B2Or+21tvJavbF/froNNWly6y7/2T8htZKmE
         L86OF0PIf03DdKinYFLyilaLPPyyrNHQlNQ8drV1s5M0LWH8a0yKsqkTxuSUV+tsfhdP
         WmVg==
X-Gm-Message-State: AAQBX9fB5vVBnkM5LT0gnKNtt+ZjsVGBpHNikCmGSRr7sjPKmBmFmc8T
        owilrL+LQCfn0iYMQtRUnjvWFw==
X-Google-Smtp-Source: AKy350YVXbd7mbMYmNs+P106hie3P3mdVmAith2NcpgquwP46kH15TOkGrlublH5uA0343kN/kALwQ==
X-Received: by 2002:a17:906:55b:b0:93f:9b4a:12f3 with SMTP id k27-20020a170906055b00b0093f9b4a12f3mr222010eja.10.1680813148417;
        Thu, 06 Apr 2023 13:32:28 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id s4-20020a1709067b8400b0092bea699124sm1210330ejo.106.2023.04.06.13.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 13:32:27 -0700 (PDT)
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
Subject: [PATCH 31/68] hwmon: ltc2947: constify pointers to hwmon_channel_info
Date:   Thu,  6 Apr 2023 22:30:26 +0200
Message-Id: <20230406203103.3011503-32-krzysztof.kozlowski@linaro.org>
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
 drivers/hwmon/ltc2947-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ltc2947-core.c b/drivers/hwmon/ltc2947-core.c
index 2dbbbac9de09..d2ff6e700770 100644
--- a/drivers/hwmon/ltc2947-core.c
+++ b/drivers/hwmon/ltc2947-core.c
@@ -901,7 +901,7 @@ static umode_t ltc2947_is_visible(const void *data,
 	}
 }
 
-static const struct hwmon_channel_info *ltc2947_info[] = {
+static const struct hwmon_channel_info * const ltc2947_info[] = {
 	HWMON_CHANNEL_INFO(in,
 			   HWMON_I_INPUT | HWMON_I_LOWEST | HWMON_I_HIGHEST |
 			   HWMON_I_MAX | HWMON_I_MIN | HWMON_I_RESET_HISTORY |
-- 
2.34.1

