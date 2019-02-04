Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7BF9D7D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Feb 2019 20:19:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbfBDUTe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Feb 2019 15:19:34 -0500
Received: from mail-it1-f196.google.com ([209.85.166.196]:54150 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727944AbfBDUTd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Feb 2019 15:19:33 -0500
Received: by mail-it1-f196.google.com with SMTP id g85so2962056ita.3
        for <linux-doc@vger.kernel.org>; Mon, 04 Feb 2019 12:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sweptlaser-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=XDhprpW25ibYQtXn/diyTm923UlnRp+IEFM44smCoIQ=;
        b=re3rzPlLyL0O9k2gcpHK7yxBTUrO9Aa1v67GpOgvI5DJoVXXYE50ShdSMq+TmReMPr
         FU0EAVpBeEnq7WAmhSKuVYG6EvlvFtWqbLpBxixHuotxTXaWFKJMBEWySFGfTFucxFlG
         66Us6Ix0PVZqg8dC7KdutrRHnBy8OSTdBplci4S7hBuGhX+cFzhfPP3Jmc8TPsybvFIo
         sfNS5G/KxPrC+qoI2iYaXgrveq1JEFtKJAYTYzmeijPPMEBvn3q/1e/BF3Wx9lYeL4OW
         v2Zqe8DKPn4ShWOj41eQp+6bsEaMFpQyAvVr0GhgNm6meobvxRJnBnbhAnlFbgN/0LEQ
         85BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=XDhprpW25ibYQtXn/diyTm923UlnRp+IEFM44smCoIQ=;
        b=Vq+piyI5GllD07uEYJxldu0sFhaIWMiPVpPcTZckVXFqOA4W4nHWzCVvwPV6hErkt1
         Qge+KHExaNeSITBLd7c/qwNKYshUT508p/KHVBHO8jROlyvPPcfvZ01J5SC7jFD7qezq
         0ZGn8taXLBqminDZJx5Cwst44Ir4dJOw0y/bJMxwoa01yB06EPLfofOw4lxGq9WhU6xp
         TsXXalte76dpR53mBxjbSWm6dREuF8jxgJKkZ5M+LVp5VaWELc1UO+iEcVusuIlk5Ms2
         o8yzmcwjqamRPvAKRVOJVjV7CxXA6J8UGxeoH27CJCvz3HlWN23CFLGyC2T0S06GYqvI
         LpDQ==
X-Gm-Message-State: AHQUAubhOikZE8BTyDIiPGZgGwPGlfuYsGiCfNLcrePjWC7B3hJoMw4e
        OSIvfIoAMW1//gTbYoopHts+6w==
X-Google-Smtp-Source: AHgI3IbedeEYn+jG2jNNEn1fatbi8B0QrS5thMK38+OMLobx55GzhYweBcEM5kSWdzgC1NzO9mMEpw==
X-Received: by 2002:a5e:8f07:: with SMTP id c7mr871510iok.242.1549311572609;
        Mon, 04 Feb 2019 12:19:32 -0800 (PST)
Received: from yngvi.hq.sweptlaser.com ([63.147.146.226])
        by smtp.googlemail.com with ESMTPSA id x79sm470003ita.34.2019.02.04.12.19.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Feb 2019 12:19:32 -0800 (PST)
From:   Jeremy Gebben <jgebben@sweptlaser.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] hwmon: (lm85) add support for LM96000 high frequencies
Date:   Mon,  4 Feb 2019 13:19:06 -0700
Message-Id: <20190204201906.8859-5-jgebben@sweptlaser.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190204201906.8859-1-jgebben@sweptlaser.com>
References: <20190204201906.8859-1-jgebben@sweptlaser.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The LM96000 expands the freqency field from 3 to 4 bits, to
add more frequencies in the 22.5 to 30 kHz ranges.

Signed-off-by: Jeremy Gebben <jgebben@sweptlaser.com>
---
 Documentation/hwmon/lm85 | 3 +++
 drivers/hwmon/lm85.c     | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/Documentation/hwmon/lm85 b/Documentation/hwmon/lm85
index 4f531f4acc3f..2329c383efe4 100644
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
index b23cf8e4c54b..a95d48316f06 100644
--- a/drivers/hwmon/lm85.c
+++ b/drivers/hwmon/lm85.c
@@ -202,6 +202,11 @@ static const int lm85_freq_map[] = { /* 1 Hz */
 	10, 15, 23, 30, 38, 47, 61, 94
 };
 
+static const int lm96000_freq_map[] = { /* 1 Hz */
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
+	case lm96000:
+		data->freq_map = lm96000_freq_map;
+		data->freq_map_size = ARRAY_SIZE(lm96000_freq_map);
+		break;
 	default:
 		data->freq_map = lm85_freq_map;
 		data->freq_map_size = ARRAY_SIZE(lm85_freq_map);
-- 
2.17.1

