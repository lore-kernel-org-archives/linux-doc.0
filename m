Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DAB907D918
	for <lwn-linux-doc@archive.lwn.net>; Wed, 16 Oct 2019 16:40:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388925AbfJPQkY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 16 Oct 2019 12:40:24 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:36900 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388542AbfJPQkY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Oct 2019 12:40:24 -0400
Received: by mail-qt1-f202.google.com with SMTP id s14so25567146qtn.4
        for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2019 09:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:cc;
        bh=KmHAeCmiFOkBGaykqemUU3bu3MBT3SFq3fZo9SBLQA0=;
        b=tx1xZc+0ttcNVyH6dgx0gO8wsgU0mihhPb+RiRKk+HcpECEXVmWlY8ozvaLkS0c50k
         Ywlq/bCBFMCPCSHKDA3Z6Y64vl8kk+svg+xx2YbIoTMUOOCat0suCVcNT5sXBIm8XwaF
         HMHDlRDKFfqAY/4KYZorMk9ujRtgRT51qri49NfKncCMyk0qoZwZHw2lG6ixBpFh4229
         ntO0JrbnM9BZLlJo2W0Mt3yzCkWcTJDcF7JBRyG6IVOVOQN+CieokpQikeA+vCV4mDfI
         THn6AsxJVslMxe+YSBK42QP4GY37vFyKPhH7U5rfE41zqzo70nu9aOd1M7KBi0DPcsR/
         Arkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:cc;
        bh=KmHAeCmiFOkBGaykqemUU3bu3MBT3SFq3fZo9SBLQA0=;
        b=RcKWjbGYbW2mseFBRLpkbEXcjArJWYQddWL3Tsrl9IGyZFhJuKeS0wTZySh2VlCTG8
         Nu4mPjsejGZ7UZTfhRibFbRg3wHpdVAEKlHW1+LxTo5HSQBMs0G8L35SEnRVcc3xP3Kq
         mYxrEygITBsHB5+aa1XL3sdy9qv8IXrGwe+DcYo2y0j4mEc2q4HDrfsljGJOTTBM4y9L
         yGLTXkfEZQHTzzosIpcD5hTH6/Wde0fA5NX818a/wd+bFTEqExd7SQGYZm1NaMEIwmi/
         gQPH5z/d5wN5UDXt03l+HWUUkVekdTa+lWFgqjqIm3vv01HM8o4WiFzTYSQoUxi+XGwz
         LUoA==
X-Gm-Message-State: APjAAAUoR0QxXhbrNq4pBcI7zS+QUoEU1vmGOtZl2RwvkKJaK3vak1p+
        575S0Ze+zlHKgvO9ByNLO8YI6uY=
X-Google-Smtp-Source: APXvYqwGTx11wWIRQ2TebiUDv/eQwz/FhNoBpywwJ2gXee0Ud1aGImugAy/hl95BaQVi8snymnd9ldk=
X-Received: by 2002:ad4:4448:: with SMTP id l8mr20707050qvt.102.1571244023109;
 Wed, 16 Oct 2019 09:40:23 -0700 (PDT)
Date:   Wed, 16 Oct 2019 09:40:07 -0700
Message-Id: <20191016164014.146868-1-wvw@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
Subject: [PATCH] thermal: update header and documentation
From:   Wei Wang <wvw@google.com>
Cc:     wei.vince.wang@gmail.com, Wei Wang <wvw@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The commit commit f991de53a8ab ("thermal: make device_register's type
argument const") changed APIs, but only when CONFIG_THERMAL enabled case.

This patch is partial from https://lkml.org/lkml/2019/5/14/631 which
tries to address the same concern,

Signed-off-by: Wei Wang <wvw@google.com>
---
 Documentation/driver-api/thermal/sysfs-api.rst | 4 ++--
 include/linux/thermal.h                        | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/driver-api/thermal/sysfs-api.rst b/Documentation/driver-api/thermal/sysfs-api.rst
index fab2c9b36d08..0ef337417922 100644
--- a/Documentation/driver-api/thermal/sysfs-api.rst
+++ b/Documentation/driver-api/thermal/sysfs-api.rst
@@ -39,7 +39,7 @@ temperature) and throttle appropriate devices.
     ::
 
 	struct thermal_zone_device
-	*thermal_zone_device_register(char *type,
+	*thermal_zone_device_register(const char *type,
 				      int trips, int mask, void *devdata,
 				      struct thermal_zone_device_ops *ops,
 				      const struct thermal_zone_params *tzp,
@@ -221,7 +221,7 @@ temperature) and throttle appropriate devices.
     ::
 
 	struct thermal_cooling_device
-	*thermal_cooling_device_register(char *name,
+	*thermal_cooling_device_register(const char *name,
 			void *devdata, struct thermal_cooling_device_ops *)
 
     This interface function adds a new thermal cooling device (fan/processor/...)
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index e45659c75920..ee235a29294e 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -501,12 +501,12 @@ static inline void thermal_zone_device_update(struct thermal_zone_device *tz,
 static inline void thermal_zone_set_trips(struct thermal_zone_device *tz)
 { }
 static inline struct thermal_cooling_device *
-thermal_cooling_device_register(char *type, void *devdata,
+thermal_cooling_device_register(const char *type, void *devdata,
 	const struct thermal_cooling_device_ops *ops)
 { return ERR_PTR(-ENODEV); }
 static inline struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np,
-	char *type, void *devdata, const struct thermal_cooling_device_ops *ops)
+thermal_of_cooling_device_register(struct device_node *np, const char *type,
+	void *devdata, const struct thermal_cooling_device_ops *ops)
 { return ERR_PTR(-ENODEV); }
 static inline struct thermal_cooling_device *
 devm_thermal_of_cooling_device_register(struct device *dev,
-- 
2.23.0.700.g56cf767bdb-goog

