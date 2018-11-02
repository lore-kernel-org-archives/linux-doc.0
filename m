Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 433D17D8D4
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Nov 2018 04:46:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727980AbeKBNwb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Nov 2018 09:52:31 -0400
Received: from out1.zte.com.cn ([202.103.147.172]:37332 "EHLO mxct.zte.com.cn"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727338AbeKBNwb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 2 Nov 2018 09:52:31 -0400
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
        by Forcepoint Email with ESMTPS id 953A183FF797F5583B1D;
        Fri,  2 Nov 2018 12:45:59 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
        by mse01.zte.com.cn with ESMTP id wA24jrKc095702;
        Fri, 2 Nov 2018 12:45:53 +0800 (GMT-8)
        (envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
          by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
          with ESMTP id 2018110212462969-8146633 ;
          Fri, 2 Nov 2018 12:46:29 +0800 
From:   Peng Hao <peng.hao2@zte.com.cn>
To:     robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, andy@infradead.org,
        dvhart@infradead.org
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        hutao@cn.fujitsu.com, linux-doc@vger.kernel.org,
        Peng Hao <peng.hao2@zte.com.cn>
Subject: [PATCH V6 6/8]  misc/pvpanic: remove unnecessary header file
Date:   Fri, 2 Nov 2018 20:56:15 +0800
Message-Id: <1541163378-54047-6-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1541163378-54047-1-git-send-email-peng.hao2@zte.com.cn>
References: <1541163378-54047-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release 8.5.3FP6|November
 21, 2013) at 2018-11-02 12:46:29,
        Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2018-11-02 12:45:37,
        Serialize complete at 2018-11-02 12:45:37
X-MAIL: mse01.zte.com.cn wA24jrKc095702
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Remove unnecessary header file init.h.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 drivers/misc/pvpanic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
index 5378d5f..9c9d9f8 100644
--- a/drivers/misc/pvpanic.c
+++ b/drivers/misc/pvpanic.c
@@ -22,7 +22,6 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
-#include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-- 
1.8.3.1

