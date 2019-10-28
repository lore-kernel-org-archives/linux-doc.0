Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 633847D90D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 Oct 2019 02:42:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729416AbfJ1CmZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 27 Oct 2019 22:42:25 -0400
Received: from 59-120-53-16.HINET-IP.hinet.net ([59.120.53.16]:59684 "EHLO
        ATCSQR.andestech.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728898AbfJ1CmY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 27 Oct 2019 22:42:24 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
        by ATCSQR.andestech.com with ESMTP id x9S2O9tf087229;
        Mon, 28 Oct 2019 10:24:09 +0800 (GMT-8)
        (envelope-from nickhu@andestech.com)
Received: from atcsqa06.andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Mon, 28 Oct 2019
 10:41:38 +0800
From:   Nick Hu <nickhu@andestech.com>
To:     <aryabinin@virtuozzo.com>, <glider@google.com>,
        <dvyukov@google.com>, <corbet@lwn.net>, <paul.walmsley@sifive.com>,
        <palmer@sifive.com>, <aou@eecs.berkeley.edu>, <tglx@linutronix.de>,
        <gregkh@linuxfoundation.org>, <alankao@andestech.com>,
        <Anup.Patel@wdc.com>, <atish.patra@wdc.com>,
        <kasan-dev@googlegroups.com>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-mm@kvack.org>, <green.hu@gmail.com>
CC:     Nick Hu <nickhu@andestech.com>
Subject: [PATCH v4 1/3] kasan: No KASAN's memmove check if archs don't have it.
Date:   Mon, 28 Oct 2019 10:40:59 +0800
Message-ID: <20191028024101.26655-2-nickhu@andestech.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20191028024101.26655-1-nickhu@andestech.com>
References: <20191028024101.26655-1-nickhu@andestech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x9S2O9tf087229
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If archs don't have memmove then the C implementation from lib/string.c is used,
and then it's instrumented by compiler. So there is no need to add KASAN's
memmove to manual checks.

Signed-off-by: Nick Hu <nickhu@andestech.com>
---
 mm/kasan/common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 6814d6d6a023..897f9520bab3 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -107,6 +107,7 @@ void *memset(void *addr, int c, size_t len)
 	return __memset(addr, c, len);
 }
 
+#ifdef __HAVE_ARCH_MEMMOVE
 #undef memmove
 void *memmove(void *dest, const void *src, size_t len)
 {
@@ -115,6 +116,7 @@ void *memmove(void *dest, const void *src, size_t len)
 
 	return __memmove(dest, src, len);
 }
+#endif
 
 #undef memcpy
 void *memcpy(void *dest, const void *src, size_t len)
-- 
2.17.0

