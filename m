Return-Path: <SRS0=QMax=AL=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B461EC433E0
	for <linux-doc@archiver.kernel.org>; Tue, 30 Jun 2020 06:40:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AF8C20759
	for <linux-doc@archiver.kernel.org>; Tue, 30 Jun 2020 06:40:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730150AbgF3GkQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 Jun 2020 02:40:16 -0400
Received: from mgwym04.jp.fujitsu.com ([211.128.242.43]:10635 "EHLO
        mgwym04.jp.fujitsu.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730089AbgF3GkQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Jun 2020 02:40:16 -0400
X-Greylist: delayed 668 seconds by postgrey-1.27 at vger.kernel.org; Tue, 30 Jun 2020 02:40:15 EDT
Received: from yt-mxoi1.gw.nic.fujitsu.com (unknown [192.168.229.67]) by mgwym04.jp.fujitsu.com with smtp
         id 06ee_000a_5fbdb3b3_b6ef_4004_af3f_dc1c647b6122;
        Tue, 30 Jun 2020 15:29:03 +0900
Received: from g01jpfmpwyt01.exch.g01.fujitsu.local (g01jpfmpwyt01.exch.g01.fujitsu.local [10.128.193.38])
        by yt-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D508AC0117
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2020 15:29:03 +0900 (JST)
Received: from G01JPEXCHYT13.g01.fujitsu.local (G01JPEXCHYT13.g01.fujitsu.local [10.128.194.52])
        by g01jpfmpwyt01.exch.g01.fujitsu.local (Postfix) with ESMTP id AF4856D66DE;
        Tue, 30 Jun 2020 15:29:02 +0900 (JST)
Received: from luna3.soft.fujitsu.com (10.124.196.199) by
 G01JPEXCHYT13.g01.fujitsu.local (10.128.194.52) with Microsoft SMTP Server id
 14.3.487.0; Tue, 30 Jun 2020 15:29:02 +0900
From:   Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
To:     <corbet@lwn.net>
CC:     <linux-doc@vger.kernel.org>, <misono.tomohiro@jp.fujitsu.com>
Subject: [PATCH] docs: vm/hwpoison: link/style/typo fixes
Date:   Tue, 30 Jun 2020 15:39:14 +0900
Message-ID: <20200630063914.969-1-misono.tomohiro@jp.fujitsu.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-GCONF: 00
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Just some link/style/typo fixes as follows:
 - fix location of admin-guide file
 - fix prctl arg number to match prctl man page
 - fix typos and add some words

Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
---
 Documentation/vm/hwpoison.rst | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/vm/hwpoison.rst b/Documentation/vm/hwpoison.rst
index a5c884293dac..f163bf49cfde 100644
--- a/Documentation/vm/hwpoison.rst
+++ b/Documentation/vm/hwpoison.rst
@@ -40,7 +40,7 @@ To quote the overview comment::
 	for the mapping from a vma to a process. Since this case is expected
 	to be rare we hope we can get away with this.
 
-The code consists of a the high level handler in mm/memory-failure.c,
+The code consists of a high level handler in mm/memory-failure.c,
 a new page poison bit and various checks in the VM to handle poisoned
 pages.
 
@@ -50,7 +50,7 @@ of applications. KVM support requires a recent qemu-kvm release.
 For the KVM use there was need for a new signal type so that
 KVM can inject the machine check into the guest with the proper
 address. This in theory allows other applications to handle
-memory failures too. The expection is that near all applications
+memory failures too. The expectation is that near all applications
 won't do that, but some very specialized ones might.
 
 Failure recovery modes
@@ -67,30 +67,31 @@ early kill
 	(can be controlled globally and per process)
 	Send SIGBUS to the application as soon as the error is detected
 	This allows applications who can process memory errors in a gentle
-	way (e.g. drop affected object)
+	way (e.g. drop affected object).
 	This is the mode used by KVM qemu.
 
 late kill
 	Send SIGBUS when the application runs into the corrupted page.
-	This is best for memory error unaware applications and default
+	This is best for memory error unaware applications and default.
 	Note some pages are always handled as late kill.
 
 User control
 ============
 
 vm.memory_failure_recovery
-	See sysctl.txt
+	Enable memory failure recovery instead of panic.
+	See admin-guide/sysctl/vm.rst
 
 vm.memory_failure_early_kill
-	Enable early kill mode globally
+	Enable early kill mode globally. See admin-guide/sysctl/vm.rst
 
-PR_MCE_KILL
+prctl PR_MCE_KILL
 	Set early/late kill mode/revert to system default
 
-	arg1: PR_MCE_KILL_CLEAR:
+	arg2: PR_MCE_KILL_CLEAR:
 		Revert to system default
-	arg1: PR_MCE_KILL_SET:
-		arg2 defines thread specific mode
+	arg2: PR_MCE_KILL_SET:
+		arg3 defines thread specific mode
 
 		PR_MCE_KILL_EARLY:
 			Early kill
@@ -104,7 +105,7 @@ PR_MCE_KILL
 	call prctl(PR_MCE_KILL_EARLY) on the designated thread. Otherwise,
 	the SIGBUS is sent to the main thread.
 
-PR_MCE_KILL_GET
+prctl PR_MCE_KILL_GET
 	return current mode
 
 Testing
-- 
2.21.3

