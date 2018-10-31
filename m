Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 808F17D089
	for <lwn-linux-doc@archive.lwn.net>; Wed, 31 Oct 2018 14:27:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729632AbeJaXZZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 31 Oct 2018 19:25:25 -0400
Received: from [199.201.65.133] ([199.201.65.133]:47084 "EHLO
        alivneh-pro.localdomain" rhost-flags-FAIL-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729492AbeJaXZZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Oct 2018 19:25:25 -0400
X-Greylist: delayed 571 seconds by postgrey-1.27 at vger.kernel.org; Wed, 31 Oct 2018 19:25:25 EDT
Received: by alivneh-pro.localdomain (Postfix, from userid 1782071156)
        id 7D434215633691; Wed, 31 Oct 2018 10:17:41 -0400 (EDT)
From:   Amir Livneh <alivneh@fb.com>
To:     corbet@lwn.net
Cc:     rostedt@goodmis.org, mingo@redhat.com, linux-doc@vger.kernel.org,
        Amir Livneh <alivneh@fb.com>
Subject: [PATCH] doc: tracing: Fix a number of typos
Date:   Wed, 31 Oct 2018 10:16:11 -0400
Message-Id: <20181031141611.75480-1-alivneh@fb.com>
X-Mailer: git-send-email 2.13.5
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Trivial fixes to spelling mistakes in ftrace.rst

Signed-off-by: Amir Livneh <alivneh@fb.com>
---
 Documentation/trace/ftrace.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
index 7ea16a0ceffc..80fde12e6564 100644
--- a/Documentation/trace/ftrace.rst
+++ b/Documentation/trace/ftrace.rst
@@ -24,13 +24,13 @@ It can be used for debugging or analyzing latencies and
 performance issues that take place outside of user-space.
 
 Although ftrace is typically considered the function tracer, it
-is really a frame work of several assorted tracing utilities.
+is really a framework of several assorted tracing utilities.
 There's latency tracing to examine what occurs between interrupts
 disabled and enabled, as well as for preemption and from a time
 a task is woken to the task is actually scheduled in.
 
 One of the most common uses of ftrace is the event tracing.
-Through out the kernel is hundreds of static event points that
+Throughout the kernel is hundreds of static event points that
 can be enabled via the tracefs file system to see what is
 going on in certain parts of the kernel.
 
@@ -462,7 +462,7 @@ of ftrace. Here is a list of some of the key files:
 
 	mono_raw:
 		This is the raw monotonic clock (CLOCK_MONOTONIC_RAW)
-		which is montonic but is not subject to any rate adjustments
+		which is monotonic but is not subject to any rate adjustments
 		and ticks at the same rate as the hardware clocksource.
 
 	boot:
@@ -914,8 +914,8 @@ The above is mostly meaningful for kernel developers.
 	current trace and the next trace.
 
 	  - '$' - greater than 1 second
-	  - '@' - greater than 100 milisecond
-	  - '*' - greater than 10 milisecond
+	  - '@' - greater than 100 millisecond
+	  - '*' - greater than 10 millisecond
 	  - '#' - greater than 1000 microsecond
 	  - '!' - greater than 100 microsecond
 	  - '+' - greater than 10 microsecond
@@ -2541,7 +2541,7 @@ At compile time every C file object is run through the
 recordmcount program (located in the scripts directory). This
 program will parse the ELF headers in the C object to find all
 the locations in the .text section that call mcount. Starting
-with gcc verson 4.6, the -mfentry has been added for x86, which
+with gcc version 4.6, the -mfentry has been added for x86, which
 calls "__fentry__" instead of "mcount". Which is called before
 the creation of the stack frame.
 
@@ -2978,7 +2978,7 @@ The following commands are supported:
   When the function is hit, it will dump the contents of the ftrace
   ring buffer to the console. This is useful if you need to debug
   something, and want to dump the trace when a certain function
-  is hit. Perhaps its a function that is called before a tripple
+  is hit. Perhaps it's a function that is called before a tripple
   fault happens and does not allow you to get a regular dump.
 
 - cpudump:
-- 
2.13.5

