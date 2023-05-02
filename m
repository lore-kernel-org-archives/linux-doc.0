Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D33FDC77B73
	for <linux-doc@archiver.kernel.org>; Tue,  2 May 2023 10:05:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233471AbjEBKFU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 May 2023 06:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233001AbjEBKFT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 May 2023 06:05:19 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 398B64EC8
        for <linux-doc@vger.kernel.org>; Tue,  2 May 2023 03:05:16 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:f07a:92a2:297:162b])
        by xavier.telenet-ops.be with bizsmtp
        id rm5C2900X5FQxRj01m5CsF; Tue, 02 May 2023 12:05:13 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1ptmse-000ykg-9i;
        Tue, 02 May 2023 12:05:12 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1ptmsi-00AtFX-7Q;
        Tue, 02 May 2023 12:05:12 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     John Stultz <jstultz@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] Documentation: timers: hrtimers: Make hybrid union historical
Date:   Tue,  2 May 2023 12:05:10 +0200
Message-Id: <59250a3d1c2c827b5c1833169a6e652ca6a784e6.1683021785.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Non-scalar time was removed from the ktime hybrid union in v3.17, and
the union itself followed suit in v4.10.

Make it clear that ktime_t is always a 64bit scalar type, to avoid
confusing the casual reader.

While at it, fix a spelling mistake.

Fixes: 24e4a8c3e8868874 ("ktime: Kill non-scalar ktime_t implementation for 2038")
Fixes: 2456e855354415bf ("ktime: Get rid of the union")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Randy did several fruitless attempts to fix the typo before.
---
 Documentation/timers/hrtimers.rst | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/Documentation/timers/hrtimers.rst b/Documentation/timers/hrtimers.rst
index 7ac448908d1ffd97..f88ff8bae89c8acf 100644
--- a/Documentation/timers/hrtimers.rst
+++ b/Documentation/timers/hrtimers.rst
@@ -123,17 +123,12 @@ equivalent to timer_delete() and timer_delete_sync()] - so there's no direct
 potential for code sharing either.
 
 Basic data types: every time value, absolute or relative, is in a
-special nanosecond-resolution type: ktime_t. The kernel-internal
-representation of ktime_t values and operations is implemented via
-macros and inline functions, and can be switched between a "hybrid
-union" type and a plain "scalar" 64bit nanoseconds representation (at
-compile time). The hybrid union type optimizes time conversions on 32bit
-CPUs. This build-time-selectable ktime_t storage format was implemented
-to avoid the performance impact of 64-bit multiplications and divisions
-on 32bit CPUs. Such operations are frequently necessary to convert
-between the storage formats provided by kernel and userspace interfaces
-and the internal time format. (See include/linux/ktime.h for further
-details.)
+special nanosecond-resolution 64bit type: ktime_t.
+(Originally, the kernel-internal representation of ktime_t values and
+operations was implemented via macros and inline functions, and could be
+switched between a "hybrid union" type and a plain "scalar" 64bit
+nanoseconds representation (at compile time). This was abandoned in the
+context of the Y2038 work.)
 
 hrtimers - rounding of timer values
 -----------------------------------
@@ -148,7 +143,7 @@ a given clock has - be it low-res, high-res, or artificially-low-res.
 hrtimers - testing and verification
 -----------------------------------
 
-We used the high-resolution clock subsystem ontop of hrtimers to verify
+We used the high-resolution clock subsystem on top of hrtimers to verify
 the hrtimer implementation details in praxis, and we also ran the posix
 timer tests in order to ensure specification compliance. We also ran
 tests on low-resolution clocks.
-- 
2.34.1

