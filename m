Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F930C1B0D9
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 10:14:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 593AF23609
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 10:14:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728199AbgLJKKn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Dec 2020 05:10:43 -0500
Received: from smtp.h3c.com ([60.191.123.50]:32274 "EHLO h3cspam02-ex.h3c.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726313AbgLJKKc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 10 Dec 2020 05:10:32 -0500
X-Greylist: delayed 1811 seconds by postgrey-1.27 at vger.kernel.org; Thu, 10 Dec 2020 05:10:21 EST
Received: from h3cspam02-ex.h3c.com (localhost [127.0.0.2] (may be forged))
        by h3cspam02-ex.h3c.com with ESMTP id 0BA8WQD7033519;
        Thu, 10 Dec 2020 16:32:26 +0800 (GMT-8)
        (envelope-from xi.fengfei@h3c.com)
Received: from DAG2EX05-BASE.srv.huawei-3com.com ([10.8.0.68])
        by h3cspam02-ex.h3c.com with ESMTP id 0BA8W0Mm032694;
        Thu, 10 Dec 2020 16:32:00 +0800 (GMT-8)
        (envelope-from xi.fengfei@h3c.com)
Received: from localhost.localdomain (10.99.212.201) by
 DAG2EX05-BASE.srv.huawei-3com.com (10.8.0.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 10 Dec 2020 16:32:03 +0800
From:   Fengfei Xi <xi.fengfei@h3c.com>
To:     <corbet@lwn.net>
CC:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Fengfei Xi <xi.fengfei@h3c.com>
Subject: [PATCH] docs: admin-guide: Fix default value of max_map_count in sysctl/vm.rst
Date:   Thu, 10 Dec 2020 16:21:34 +0800
Message-ID: <20201210082134.36957-1-xi.fengfei@h3c.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.99.212.201]
X-ClientProxiedBy: BJSMTP01-EX.srv.huawei-3com.com (10.63.20.132) To
 DAG2EX05-BASE.srv.huawei-3com.com (10.8.0.68)
X-DNSRBL: 
X-MAIL: h3cspam02-ex.h3c.com 0BA8W0Mm032694
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since the default value of sysctl_max_map_count is defined as
DEFAULT_MAX_MAP_COUNT from mm/util.c

    int sysctl_max_map_count __read_mostly = DEFAULT_MAX_MAP_COUNT;

DEFAULT_MAX_MAP_COUNT is defined as 65530 (65535-5) in include/linux/mm.h

    #define MAPCOUNT_ELF_CORE_MARGIN        (5)
    #define DEFAULT_MAX_MAP_COUNT   (USHRT_MAX - MAPCOUNT_ELF_CORE_MARGIN)

Signed-off-by: Fengfei Xi <xi.fengfei@h3c.com>
---
 Documentation/admin-guide/sysctl/vm.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index f455fa00c..834c3fc74 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -428,7 +428,7 @@ While most applications need less than a thousand maps, certain
 programs, particularly malloc debuggers, may consume lots of them,
 e.g., up to one or two maps per allocation.
 
-The default value is 65536.
+The default value is 65530.
 
 
 memory_failure_early_kill:
-- 
2.17.1

