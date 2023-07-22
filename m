Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90372C001DE
	for <linux-doc@archiver.kernel.org>; Sat, 22 Jul 2023 17:46:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjGVRqV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 22 Jul 2023 13:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjGVRqT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Jul 2023 13:46:19 -0400
X-Greylist: delayed 1232 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 22 Jul 2023 10:46:16 PDT
Received: from rs227.mailgun.us (rs227.mailgun.us [209.61.151.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A67826B5
        for <linux-doc@vger.kernel.org>; Sat, 22 Jul 2023 10:46:16 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt;
 s=mx; t=1690047975; x=1690055175; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Subject: Cc: To: To: From: From: Sender: Sender;
 bh=2ZM8uvTNkSlbDWoHgS2NyrOFq+N/5mog0L1a0g4U21Y=;
 b=C0t9MmKxdY1HrqDEkRqBsbD+FMFZkmgZBT6szcVPUma6OzMtyLmUPEmudDDQmgNoo49lTeMz+hLaJfNbbV1i5hxJplMuo78WvGrg8QSJtePNIRbFJUiSycMBCkkJzOD8Mi4Cm3XJiIGo7HxYizpjGFQ7qFXQnrsesHRbhTzQ+kN4bo1Xpc1gDUwrZykdQVx/ITxAkC6+oI0uTztwSeiGnBeTIXemfFOqHf8jxJwAibiNBH2hmWwtrfjFApbOsTDnVFinwbrYDx2GthJLQAChA/nRF/a+tFS3uP/sjy8MY3V/abv8GGvUzrtFCWXQOwII4hvLPwfleNvuFUPNC01ejA==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sid: WyIxNjU3YyIsImxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmciLCI5M2Q1YWIiXQ==
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by 1b2ddc83fb9c with SMTP id
 64bc11178dca71a24a2eda75 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 22 Jul 2023 17:25:43 GMT
Sender: james@equiv.tech
From:   James Seo <james@equiv.tech>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     James Seo <james@equiv.tech>, linux-hwmon@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] hwmon: hp-wmi-sensors: Minor fixes
Date:   Sat, 22 Jul 2023 10:25:11 -0700
Message-Id: <20230722172513.9324-1-james@equiv.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Make driver init slightly more efficient and the appearance of
generated documentation more consistent.

James Seo (2):
  hwmon: hp-wmi-sensors: Get WMI instance count from WMI driver core
  docs: hwmon: hp-wmi-sensors: Change document title

 Documentation/hwmon/hp-wmi-sensors.rst |  6 +++---
 drivers/hwmon/hp-wmi-sensors.c         | 20 +++-----------------
 2 files changed, 6 insertions(+), 20 deletions(-)


base-commit: c4be22597a36e3487474aee9b4177cc8cf780124
-- 
2.39.2

