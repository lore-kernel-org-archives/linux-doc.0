Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC73EB64DD
	for <linux-doc@archiver.kernel.org>; Tue,  4 Jul 2023 00:19:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjGDAT5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Jul 2023 20:19:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbjGDAT4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Jul 2023 20:19:56 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B13E3B2;
        Mon,  3 Jul 2023 17:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=GZ2o4xCGeoGC59blIkDg8t7pr1dFfxoXJHHg/nPdT/4=; b=kY2jcs///rQumVDs589v/pWbzp
        NUTjmNmDsUEqR6JsTpe5/r8r0l7NmNWWgSM6QG7Y4ZYZbgMqAC4CnrEhp5jgs72NWgpHEMQtglYQN
        KRsrDevH48DNm701IewRN0m19ZX/2oeJPHu07Kb3eYeLgRLqC6cqF5Lwkl4tEeuqqf7hjqIBQ53bA
        8P4d6HqM/zyJbTw0oQ76iCFvS7Y0AO5cO8pTNKSajH5UbHKKzmEmRusnOo293gFsT1Ts6CiRQqo8D
        gaHef0Xl0EbZn5OhyoqjY9yHOJV+phKVWmpky3Bg9k2NxYuSOZL9yw+pmyF79yDxE/7Iavbn9pM61
        sYqWpJnw==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qGTlr-00BjFU-1h;
        Tue, 04 Jul 2023 00:19:55 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH] docs: panic: cleanups for panic params
Date:   Mon,  3 Jul 2023 17:19:54 -0700
Message-ID: <20230704001954.20518-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Move 'panic_print' to its correct place in alphabetical order.
Add parameter format for 'pause_on_oops'.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/admin-guide/kernel-parameters.txt |   30 +++++++-------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff -- a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4037,20 +4037,6 @@
 			timeout < 0: reboot immediately
 			Format: <timeout>
 
-	panic_print=	Bitmask for printing system info when panic happens.
-			User can chose combination of the following bits:
-			bit 0: print all tasks info
-			bit 1: print system memory info
-			bit 2: print timer info
-			bit 3: print locks info if CONFIG_LOCKDEP is on
-			bit 4: print ftrace buffer
-			bit 5: print all printk messages in buffer
-			bit 6: print all CPUs backtrace (if available in the arch)
-			*Be aware* that this option may print a _lot_ of lines,
-			so there are risks of losing older messages in the log.
-			Use this option carefully, maybe worth to setup a
-			bigger log buffer with "log_buf_len" along with this.
-
 	panic_on_taint=	Bitmask for conditionally calling panic() in add_taint()
 			Format: <hex>[,nousertaint]
 			Hexadecimal bitmask representing the set of TAINT flags
@@ -4067,6 +4053,20 @@
 	panic_on_warn	panic() instead of WARN().  Useful to cause kdump
 			on a WARN().
 
+	panic_print=	Bitmask for printing system info when panic happens.
+			User can chose combination of the following bits:
+			bit 0: print all tasks info
+			bit 1: print system memory info
+			bit 2: print timer info
+			bit 3: print locks info if CONFIG_LOCKDEP is on
+			bit 4: print ftrace buffer
+			bit 5: print all printk messages in buffer
+			bit 6: print all CPUs backtrace (if available in the arch)
+			*Be aware* that this option may print a _lot_ of lines,
+			so there are risks of losing older messages in the log.
+			Use this option carefully, maybe worth to setup a
+			bigger log buffer with "log_buf_len" along with this.
+
 	parkbd.port=	[HW] Parallel port number the keyboard adapter is
 			connected to, default is 0.
 			Format: <parport#>
@@ -4186,7 +4186,7 @@
 			mode 0, bit 1 is for mode 1, and so on.  Mode 0 only
 			allowed by default.
 
-	pause_on_oops=
+	pause_on_oops=<int>
 			Halt all CPUs after the first oops has been printed for
 			the specified number of seconds.  This is to be used if
 			your oopses keep scrolling off the screen.
