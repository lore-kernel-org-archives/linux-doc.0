Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D75F67D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 Jan 2019 22:07:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729419AbfAaWHA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 Jan 2019 17:07:00 -0500
Received: from mail-it1-f193.google.com ([209.85.166.193]:53294 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729406AbfAaWHA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Jan 2019 17:07:00 -0500
Received: by mail-it1-f193.google.com with SMTP id g85so6242360ita.3
        for <linux-doc@vger.kernel.org>; Thu, 31 Jan 2019 14:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sweptlaser-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8HX/Q0Q0YXHh0N7JBuVTXEi1U08jlS7KA/W4WOsuBz4=;
        b=C76RMqBO1Txu+mRk8i6tKqG0L8zB5Zjvxmju4grLnJSQ+m9fAO70vD4mI1dXeWOizo
         pr84upoPGxiBneQVB+a4fy71jpQ8oWVNI2OLOBLQ5MKGGIffUzIQuCCSmmcN5mAl0vsv
         aPbnukagno1YZaFXV//x534U1r2/WEKT9/z2WTEs5nlwstY7DIve6pZ/s8tJj70sJgb1
         Z8PUTFgS1n5wCHPkYKKQlVfASZ6XTtwMEwOlFklOzXOnT67tE56amgWFWCx7T3OghYZC
         cgEIr4aJ58gK6ezyTOMR5vvNyGlTe1YJt/9vNobtwCa7syBFUdwz7pNoYrc+M8cwlkQE
         9WnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8HX/Q0Q0YXHh0N7JBuVTXEi1U08jlS7KA/W4WOsuBz4=;
        b=YsFDfLscdUPQzfxLYVr3P08kcAgXEtIcD2nyEbWnIaJmXxb7V61dXf9eAQR+58JbEj
         qyysKA11XywNrRmcmnQ2abH8Kg9KiB4F0c+SGvaqQAoAvVeL6KKTI0qPadiRxtfIK3I0
         3SjDS7XF/yh7zXqLsXGcs8X6bMC6xu9f7ucQPzKug3Vhu+PDO5JxCbPftGe0exPF426+
         FRYUYKwAkWCDkX2cUH2OBd14+VKXEEToZrSoIBNtcyd0uGIBAa7GbSeZlh80/8o/aUzD
         hGh6icAMICyqwG+s5BbZd82Yd+c50d1aLkVUD/FDityzNGTMIRMtXeZbSpOALGDDxO0L
         RjpQ==
X-Gm-Message-State: AJcUukdFdxEkTr0qHEvHyG93gnDo0iDHA0hTBGIsAaLfF6TIeP13Vh6y
        ihKLAUweUXqZFkcdzL0YLCus+w==
X-Google-Smtp-Source: ALg8bN5G0WKX5yWjV8tLuA1R+c0e38mQpMrT32D8ZJIVr4ab4sUsDeqgJe94bdqjaIepskQkx+C5YQ==
X-Received: by 2002:a24:f143:: with SMTP id q3mr20462381iti.42.1548972419045;
        Thu, 31 Jan 2019 14:06:59 -0800 (PST)
Received: from yngvi.hq.sweptlaser.com ([63.147.146.226])
        by smtp.googlemail.com with ESMTPSA id l186sm286439itl.22.2019.01.31.14.06.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Jan 2019 14:06:58 -0800 (PST)
From:   Jeremy Gebben <jgebben@sweptlaser.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] hwmon: (lm85) add support for LM96000 high frequencies
Date:   Thu, 31 Jan 2019 15:06:17 -0700
Message-Id: <20190131220617.15223-4-jgebben@sweptlaser.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190131220617.15223-1-jgebben@sweptlaser.com>
References: <20190131220617.15223-1-jgebben@sweptlaser.com>
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
index 9f3a945d1..264874f09 100644
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
index 4b15193d1..88f08f4bc 100644
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
 		data->freq_map_size = ARRAY_SIZE(adm1027_freq_map);
 		break;
+	case lm85:
+		data->freq_map = lm85_high_freq_map;
+		data->freq_map_size = ARRAY_SIZE(lm85_high_freq_map);
+		break;
 	default:
 		data->freq_map = lm85_freq_map;
 		data->freq_map_size = ARRAY_SIZE(lm85_freq_map);
-- 
2.17.1

