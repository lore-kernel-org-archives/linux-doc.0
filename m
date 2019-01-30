Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3775F7D099
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 Jan 2019 16:15:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731839AbfA3QPF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 Jan 2019 11:15:05 -0500
Received: from mail-it1-f195.google.com ([209.85.166.195]:39838 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731612AbfA3QPD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Jan 2019 11:15:03 -0500
Received: by mail-it1-f195.google.com with SMTP id a6so132293itl.4
        for <linux-doc@vger.kernel.org>; Wed, 30 Jan 2019 08:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sweptlaser-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=IxHZdTZ6J0dpqWIVklavMlPQmX6oRc8uMd+DCSk6CDk=;
        b=vTZ2B3C0M+IYtIE+1ZByVSr8uvDds1bkorJ/izZWC9z03JVXu7LuwmOcAq7fYn/9A9
         dECDOKcTnhGbsU4+R66PctMZE6QSBEmZEOg0tMLmI50ViTKwGfaQOHzUii0lg7reCGEP
         Ji1zrX01M+XLtHTl7ovxPap/JJkvfqbY8mOgO0d97h7JkFh0eWcuNVR02Gh+kLOIj2er
         IsQnSZ00aiLf1Om6b1YoTJjus6zBQf3WRxsTO6Lb+XZVQgOqnYynfdrsokOVdaTtGNs0
         fEBnVOZfZ+G77ScaOwoMNr7p+d+XwjCMTfaz/HtVI1qaZIr4m64KrLfsHYdrvb3wQlkZ
         StNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=IxHZdTZ6J0dpqWIVklavMlPQmX6oRc8uMd+DCSk6CDk=;
        b=P/2ZumJGdcGs7a9BCEjVVpctfaNkFlJuRH2wwPhO577RlTAciB+GnuZsZ2mdvByJ3w
         DK6heT3tA+Y2P2ugxVZFnzXe2hEIQ1ZI1adqUgf5Mv/7ZKIF1aMZOXJuup7S/+82TxuT
         bs2U3S/i5GcgvSviSEGi8Yg4NiwBgb/OD+Xbi6HsTse9A5ob+i5PIShUUwrNlErdiX6A
         NaTof34f85HIqnCq/MA5o3xEBd6yAKX84qb0yXauynW2moAeyNab3kIfCk8nuhwVLUGe
         A3k2luihzbpGX2sHatLxfi2GTVxWQe44lBh/I5f9yGXDp3xaV4A87s9d+Pb84IKL+j8y
         8oKQ==
X-Gm-Message-State: AJcUukd8dAYUJs6hkAyNYBKv55+bz6GjAqRptVS1IBKNSkNVzkg96SS6
        py0/DPuWTZLaCTLzYWD3e6eN9w==
X-Google-Smtp-Source: ALg8bN6hyhlWNG+Bom6AsDIWg3dMrA988+TESAa8wqmvOcTJKaKcwDSR2/4FsfXMcE+mFTIDdDWPKg==
X-Received: by 2002:a24:710:: with SMTP id f16mr14079927itf.121.1548864902945;
        Wed, 30 Jan 2019 08:15:02 -0800 (PST)
Received: from yngvi.hq.sweptlaser.com ([63.147.146.226])
        by smtp.googlemail.com with ESMTPSA id 15sm838678iog.59.2019.01.30.08.15.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Jan 2019 08:15:02 -0800 (PST)
From:   Jeremy Gebben <jgebben@sweptlaser.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH resend 3/3] hwmon: (lm85) add support for LM96000 high frequencies
Date:   Wed, 30 Jan 2019 09:14:47 -0700
Message-Id: <20190130161447.19946-3-jgebben@sweptlaser.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190130161447.19946-1-jgebben@sweptlaser.com>
References: <20190129212920.27921-1-jgebben@sweptlaser.com>
 <20190130161447.19946-1-jgebben@sweptlaser.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This chip expands the freqency field from 3 to 4 bits, to
add more frequencies in the 22.5 to 30 kHz ranges.

Signed-off-by: Jeremy Gebben <jgebben@sweptlaser.com>
---
 Documentation/hwmon/lm85 | 3 +++
 drivers/hwmon/lm85.c     | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/Documentation/hwmon/lm85 b/Documentation/hwmon/lm85
index 9f3a945d1b80..264874f09196 100644
--- a/Documentation/hwmon/lm85
+++ b/Documentation/hwmon/lm85
@@ -140,6 +140,9 @@ of voltage and temperature channels.
 SMSC EMC6D103S is similar to EMC6D103, but does not support pwm#_auto_pwm_minctl
 and temp#_auto_temp_off.
 
+The LM96000 supports additional high frequency PWM modes (22.5 kHz, 24 kHz,
+25.7 kHz, 27.7 kHz and 30 kHz), which can be configured on a per-PWM basis.
+
 Hardware Configurations
 -----------------------
 
diff --git a/drivers/hwmon/lm85.c b/drivers/hwmon/lm85.c
index 48f59667a88c..37bfa7d105a2 100644
--- a/drivers/hwmon/lm85.c
+++ b/drivers/hwmon/lm85.c
@@ -202,6 +202,11 @@ static const int lm85_freq_map[] = { /* 1 Hz */
 	10, 15, 23, 30, 38, 47, 61, 94
 };
 
+static const int lm85_high_freq_map[] = { /* 1 Hz */
+	10, 15, 23, 30, 38, 47, 61, 94,
+	22500, 24000, 25700, 25700, 27700, 27700, 30000, 30000
+};
+
 static const int adm1027_freq_map[] = { /* 1 Hz */
 	11, 15, 22, 29, 35, 44, 59, 88
 };
@@ -1574,6 +1579,10 @@ static int lm85_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		data->freq_map = adm1027_freq_map;
 		data->freq_map_mask = ARRAY_SIZE(adm1027_freq_map) - 1;
 		break;
+	case lm85:
+		data->freq_map = lm85_high_freq_map;
+		data->freq_map_mask = ARRAY_SIZE(lm85_high_freq_map) - 1;
+		break;
 	default:
 		data->freq_map = lm85_freq_map;
 		data->freq_map_mask = ARRAY_SIZE(lm85_freq_map) - 1;
-- 
2.17.1

