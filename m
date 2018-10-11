Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BCA587D082
	for <lwn-linux-doc@archive.lwn.net>; Thu, 11 Oct 2018 08:42:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728357AbeJKQJJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 11 Oct 2018 12:09:09 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:54322 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbeJKQJJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Oct 2018 12:09:09 -0400
Received: from ramsan.of.borg ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id m8ir1y0053XaVaC018irZN; Thu, 11 Oct 2018 10:42:51 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.86_2)
        (envelope-from <geert@linux-m68k.org>)
        id 1gAWYV-0000OD-1P; Thu, 11 Oct 2018 10:42:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gAWYU-0001Bo-Vo; Thu, 11 Oct 2018 10:42:50 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Petr Mladek <pmladek@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Tobin C . Harding" <me@tobin.cc>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 3/3] lib/vsprintf: Hash printed address for netdev bits fallback
Date:   Thu, 11 Oct 2018 10:42:49 +0200
Message-Id: <20181011084249.4520-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181011084249.4520-1-geert+renesas@glider.be>
References: <20181011084249.4520-1-geert+renesas@glider.be>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The handler for "%pN" falls back to printing the raw pointer value when
using a different format than the (sole supported) special format
"%pNF", potentially leaking sensitive information regarding the kernel
layout in memory.

Avoid this leak by printing the hashed address instead.
Note that there are no in-tree users of the fallback.

Fixes: ad67b74d2469d9b8 ("printk: hash addresses printed with %p")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Petr Mladek <pmladek@suse.com>
---
v2:
  - Add Reviewed-by.
---
 lib/vsprintf.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 3ea2119b85ac2e4f..4c75d847c1453ca4 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1510,7 +1510,8 @@ char *restricted_pointer(char *buf, char *end, const void *ptr,
 }
 
 static noinline_for_stack
-char *netdev_bits(char *buf, char *end, const void *addr, const char *fmt)
+char *netdev_bits(char *buf, char *end, const void *addr,
+		  struct printf_spec spec,  const char *fmt)
 {
 	unsigned long long num;
 	int size;
@@ -1521,9 +1522,7 @@ char *netdev_bits(char *buf, char *end, const void *addr, const char *fmt)
 		size = sizeof(netdev_features_t);
 		break;
 	default:
-		num = (unsigned long)addr;
-		size = sizeof(unsigned long);
-		break;
+		return ptr_to_id(buf, end, addr, spec);
 	}
 
 	return special_hex_number(buf, end, num, size);
@@ -1949,7 +1948,7 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
 			break;
 		return restricted_pointer(buf, end, ptr, spec);
 	case 'N':
-		return netdev_bits(buf, end, ptr, fmt);
+		return netdev_bits(buf, end, ptr, spec, fmt);
 	case 'a':
 		return address_val(buf, end, ptr, fmt);
 	case 'd':
-- 
2.17.1

