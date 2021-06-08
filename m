Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A172C47082
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 10:44:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C9AC61278
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 10:44:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbhFHKqU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Jun 2021 06:46:20 -0400
Received: from smtp.outgoing.loopia.se ([93.188.3.37]:37405 "EHLO
        smtp.outgoing.loopia.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231492AbhFHKqR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 06:46:17 -0400
Received: from s807.loopia.se (localhost [127.0.0.1])
        by s807.loopia.se (Postfix) with ESMTP id 2A4982E6EB68
        for <linux-doc@vger.kernel.org>; Tue,  8 Jun 2021 12:44:22 +0200 (CEST)
Received: from s899.loopia.se (unknown [172.22.191.6])
        by s807.loopia.se (Postfix) with ESMTP id 1A0482E2C449;
        Tue,  8 Jun 2021 12:44:22 +0200 (CEST)
Received: from s470.loopia.se (unknown [172.22.191.6])
        by s899.loopia.se (Postfix) with ESMTP id 1636E2C8B9ED;
        Tue,  8 Jun 2021 12:44:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
Received: from s934.loopia.se ([172.22.191.6])
        by s470.loopia.se (s470.loopia.se [172.22.190.10]) (amavisd-new, port 10024)
        with LMTP id 5vwM8qFWrKgj; Tue,  8 Jun 2021 12:44:21 +0200 (CEST)
X-Loopia-Auth: user
X-Loopia-User: carl@hgsystem.se
X-Loopia-Originating-IP: 155.4.133.180
Received: from localhost.localdomain (h-155-4-133-180.NA.cust.bahnhof.se [155.4.133.180])
        (Authenticated sender: carl@hgsystem.se)
        by s934.loopia.se (Postfix) with ESMTPSA id 6EF737CE9CC;
        Tue,  8 Jun 2021 12:44:21 +0200 (CEST)
From:   Erik Rosen <erik.rosen@metormote.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, Dlinux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Erik Rosen <erik.rosen@metormote.com>
Subject: [PATCH v5 1/5] hwmon: (pmbus/pim4328) Add new pmbus flag NO_WRITE_PROTECT
Date:   Tue,  8 Jun 2021 12:44:12 +0200
Message-Id: <20210608104416.6941-2-erik.rosen@metormote.com>
X-Mailer: git-send-email 2.11.0 (Apple Git-81)
In-Reply-To: <20210608104416.6941-1-erik.rosen@metormote.com>
References: <20210608104416.6941-1-erik.rosen@metormote.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some PMBus chips respond with invalid data when reading the WRITE_PROTECT
register. For such chips, this flag should be set so that the PMBus core
driver doesn't use the WRITE_PROTECT command to determine its behavior.

Signed-off-by: Erik Rosen <erik.rosen@metormote.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 8 +++++---
 include/linux/pmbus.h            | 9 +++++++++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index bbd745178147..0579521b6c0a 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2226,9 +2226,11 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	 * faults, and we should not try it. Also, in that case, writes into
 	 * limit registers need to be disabled.
 	 */
-	ret = i2c_smbus_read_byte_data(client, PMBUS_WRITE_PROTECT);
-	if (ret > 0 && (ret & PB_WP_ANY))
-		data->flags |= PMBUS_WRITE_PROTECTED | PMBUS_SKIP_STATUS_CHECK;
+	if (!(data->flags & PMBUS_NO_WRITE_PROTECT)) {
+		ret = i2c_smbus_read_byte_data(client, PMBUS_WRITE_PROTECT);
+		if (ret > 0 && (ret & PB_WP_ANY))
+			data->flags |= PMBUS_WRITE_PROTECTED | PMBUS_SKIP_STATUS_CHECK;
+	}
 
 	if (data->info->pages)
 		pmbus_clear_faults(client);
diff --git a/include/linux/pmbus.h b/include/linux/pmbus.h
index 12cbbf305969..86bacf57f8e9 100644
--- a/include/linux/pmbus.h
+++ b/include/linux/pmbus.h
@@ -43,6 +43,15 @@
  */
 #define PMBUS_NO_CAPABILITY			BIT(2)
 
+/*
+ * PMBUS_NO_WRITE_PROTECT
+ *
+ * Some PMBus chips respond with invalid data when reading the WRITE_PROTECT
+ * register. For such chips, this flag should be set so that the PMBus core
+ * driver doesn't use the WRITE_PROTECT command to determine its behavior.
+ */
+#define PMBUS_NO_WRITE_PROTECT			BIT(4)
+
 struct pmbus_platform_data {
 	u32 flags;		/* Device specific flags */
 
-- 
2.20.1

