Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 69EE77D082
	for <lwn-linux-doc@archive.lwn.net>; Tue, 23 Oct 2018 21:26:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbeJXFvI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 24 Oct 2018 01:51:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56440 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725948AbeJXFvI (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 24 Oct 2018 01:51:08 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id BEFDB3082139;
        Tue, 23 Oct 2018 21:25:58 +0000 (UTC)
Received: from llong.com (dhcp-17-8.bos.redhat.com [10.18.17.8])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 112AE5D9CC;
        Tue, 23 Oct 2018 21:25:55 +0000 (UTC)
From:   Waiman Long <longman@redhat.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        x86@kernel.org, Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>, Vlastimil Babka <vbabka@suse.cz>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH v2] Documentation/proc.txt: Add 2 missing fields for /proc/<pid>/status
Date:   Tue, 23 Oct 2018 17:25:51 -0400
Message-Id: <1540329951-22431-1-git-send-email-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Tue, 23 Oct 2018 21:25:58 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It was found that two of the fields in the /proc/<pid>/status file were
missing - CapAmb & Speculation_Store_Bypass. They are now added to the
proc.txt documentation file.

v2: Update the example as well.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 Documentation/filesystems/proc.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/proc.txt b/Documentation/filesystems/proc.txt
index 22b4b00..baccfee 100644
--- a/Documentation/filesystems/proc.txt
+++ b/Documentation/filesystems/proc.txt
@@ -193,8 +193,10 @@ read the file /proc/PID/status:
   CapPrm: 0000000000000000
   CapEff: 0000000000000000
   CapBnd: ffffffffffffffff
+  CapAmb: 0000000000000000
   NoNewPrivs:     0
   Seccomp:        0
+  Speculation_Store_Bypass:       thread vulnerable
   voluntary_ctxt_switches:        0
   nonvoluntary_ctxt_switches:     1
 
@@ -214,7 +216,7 @@ asynchronous manner and the value may not be very precise. To see a precise
 snapshot of a moment, you can see /proc/<pid>/smaps file and scan page table.
 It's slow but very precise.
 
-Table 1-2: Contents of the status files (as of 4.8)
+Table 1-2: Contents of the status files (as of 4.19)
 ..............................................................................
  Field                       Content
  Name                        filename of the executable
@@ -267,8 +269,10 @@ Table 1-2: Contents of the status files (as of 4.8)
  CapPrm                      bitmap of permitted capabilities
  CapEff                      bitmap of effective capabilities
  CapBnd                      bitmap of capabilities bounding set
+ CapAmb                      bitmap of ambient capabilities
  NoNewPrivs                  no_new_privs, like prctl(PR_GET_NO_NEW_PRIV, ...)
  Seccomp                     seccomp mode, like prctl(PR_GET_SECCOMP, ...)
+ Speculation_Store_Bypass    speculative store bypass mitigation status
  Cpus_allowed                mask of CPUs on which this process may run
  Cpus_allowed_list           Same as previous, but in "list format"
  Mems_allowed                mask of memory nodes allowed to this process
-- 
1.8.3.1

