Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8178C48BDF
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 22:16:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 995BF6128C
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 22:16:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhFOWS1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Jun 2021 18:18:27 -0400
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81]:33911 "EHLO
        fgw20-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229760AbhFOWS1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Jun 2021 18:18:27 -0400
X-Greylist: delayed 964 seconds by postgrey-1.27 at vger.kernel.org; Tue, 15 Jun 2021 18:18:27 EDT
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw20.mail.saunalahti.fi (Halon) with ESMTP
        id 116f2cca-ce25-11eb-ba24-005056bd6ce9;
        Wed, 16 Jun 2021 01:00:17 +0300 (EEST)
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v1 1/1] kstrtox: Fix documentation references
Date:   Wed, 16 Jun 2021 01:00:03 +0300
Message-Id: <20210615220003.377901-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

After moving declarations of kstrto*() to a separate header, update the doc.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 Documentation/core-api/kernel-api.rst | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
index 741aa37dc181..2a7444e3a4c2 100644
--- a/Documentation/core-api/kernel-api.rst
+++ b/Documentation/core-api/kernel-api.rst
@@ -24,11 +24,8 @@ String Conversions
 .. kernel-doc:: lib/vsprintf.c
    :export:
 
-.. kernel-doc:: include/linux/kernel.h
-   :functions: kstrtol
-
-.. kernel-doc:: include/linux/kernel.h
-   :functions: kstrtoul
+.. kernel-doc:: include/linux/kstrtox.h
+   :functions: kstrtol kstrtoul
 
 .. kernel-doc:: lib/kstrtox.c
    :export:
-- 
2.32.0

