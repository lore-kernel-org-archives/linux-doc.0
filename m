Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1E1097DE78
	for <lwn-linux-doc@archive.lwn.net>; Sat, 14 Apr 2018 01:27:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751148AbeDNB1w (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Apr 2018 21:27:52 -0400
Received: from mail-io0-f195.google.com ([209.85.223.195]:35532 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750904AbeDNB1w (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Apr 2018 21:27:52 -0400
Received: by mail-io0-f195.google.com with SMTP id k8so1389221ioc.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Apr 2018 18:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=p2PUFve0oOL7KgCCdZRdgKa5HT8NrtFKD3d/iHunxEE=;
        b=LdLpSdqb/FRtGFUVH36sY8w6RVKNadNnfXEx8nD7EnsVu9+ZiGRxH69nrhyRYj0vPx
         +aJ1jqrCc5Hnuy5wrOQS1sC0XJjXp3gK1J6mXdpkeIiwvTLZa3drFsWRm8VrcBXClAls
         qF4QsUB9RTNaFZn4FQpWNrvpEunR0FChRajJJEq49jFvhJnuyPOhyEyMFPgsT876Wxqv
         QBCe3gykh2sqDFBo/OLlMIe81stA2Obsl7DCeQrjFA+ioH4PN+OXYLsY0ZE1+tMHGqgB
         5AQIQmuRS0XDFKYSXz5W/u/HAPipr4gQkQvZs7sXGQ1DXVLR26m9NMWK+l+KPuhKjMmH
         4qCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=p2PUFve0oOL7KgCCdZRdgKa5HT8NrtFKD3d/iHunxEE=;
        b=fktm1BXQ8wQXUAPVh/97yM/+lP8dlKn6aCWycAlNUeNVjGM5KiNdhDG08lv10H82jJ
         Vs6Dm0+xt282jpbhyQhZzKvEStJag4MYwv/VMiCf8a4xFfavRvzK3VtFcyUWc79gU2EA
         0EI0DT0DL+tL7Ft4lki2tMNGcuLzQ1zZM2BkUELpvc0Z7SW1W/hDSX5FpP++RzZCTmp+
         3D0jGw3fFuvYb/xaNBF5YDMVjvaaqPUgbGeNukqT1g66Ok+AiJySyZ7LpPeMt3UnBb2s
         su3cstHp13ntPSkExdnwZTyLpi0MfL2MBlbWqx1OkikKd4TYc8PN1xOJuXQGtdo80qPH
         kvzw==
X-Gm-Message-State: ALQs6tCVYudTcF7udaEU1iFvouowpuXfC5Kw5XGmT6O63JhasbqFnTNK
        38ONuB4k3ehpI5p85sAtV59uPQ==
X-Google-Smtp-Source: AIpwx486GKbU8lb7EKsIc/H0NVwIBMm5b/rBnDmdPswm4LBZ2d32BsK7Dc5ZGRRukSuxZxh25mGXAw==
X-Received: by 10.107.20.146 with SMTP id 140mr16252843iou.103.1523669271582;
        Fri, 13 Apr 2018 18:27:51 -0700 (PDT)
Received: from midway.home (static-50-53-52-16.bvtn.or.frontiernet.net. [50.53.52.16])
        by smtp.gmail.com with ESMTPSA id g16-v6sm271257ita.0.2018.04.13.18.27.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 13 Apr 2018 18:27:50 -0700 (PDT)
From:   Randy Dunlap <rd.dunlab@gmail.com>
To:     linux1394-devel@lists.sourceforge.net
Cc:     Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v3 5/5] FireWire: add driver-api Introduction section
Date:   Fri, 13 Apr 2018 18:27:22 -0700
Message-Id: <20180414012722.17420-6-rd.dunlab@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20180414012722.17420-1-rd.dunlab@gmail.com>
References: <20180414012722.17420-1-rd.dunlab@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Replace the Introduction section's TBD with some useful overview text.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
To: linux1394-devel@lists.sourceforge.net
Cc: Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/driver-api/firewire.rst |   18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

--- linux-next-20180413.orig/Documentation/driver-api/firewire.rst
+++ linux-next-20180413/Documentation/driver-api/firewire.rst
@@ -5,17 +5,33 @@ Firewire (IEEE 1394) driver Interface Gu
 Introduction and Overview
 =========================
 
-TBD
+The Linux FireWire subsystem adds some interfaces into the Linux system
+to use/maintain any resource on the IEEE 1394 bus.
+
+The main purpose of these interfaces is to access address space on each node
+on the IEEE 1394 bus by ISO/IEC 13213 (IEEE 1212) procedure, and to control
+isochronous resources on the bus by IEEE 1394 procedure.
+
+Two types of interfaces are added, according to consumers of the interface. A
+set of userspace interfaces is available via `firewire character devices`. A set
+of kernel interfaces is available via exported symbols in the `firewire-core`
+module.
 
 Firewire char device data structures
 ====================================
 
+.. include:: /ABI/stable/firewire-cdev
+    :literal:
+
 .. kernel-doc:: include/uapi/linux/firewire-cdev.h
     :internal:
 
 Firewire device probing and sysfs interfaces
 ============================================
 
+.. include:: /ABI/stable/sysfs-bus-firewire
+    :literal:
+
 .. kernel-doc:: drivers/firewire/core-device.c
     :export:
 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
