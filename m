Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 188F17D082
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Oct 2018 21:31:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729491AbeJWFv6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 23 Oct 2018 01:51:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59598 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728580AbeJWFv6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 23 Oct 2018 01:51:58 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 71FA4308ED5F;
        Mon, 22 Oct 2018 21:31:42 +0000 (UTC)
Received: from llong.com (dhcp-17-8.bos.redhat.com [10.18.17.8])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B408B5D9CC;
        Mon, 22 Oct 2018 21:31:39 +0000 (UTC)
From:   Waiman Long <longman@redhat.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        x86@kernel.org, Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>, Vlastimil Babka <vbabka@suse.cz>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH] Documentation/proc.txt: Add 2 missing fields for /proc/<pid>/status
Date:   Mon, 22 Oct 2018 17:31:30 -0400
Message-Id: <1540243890-27970-1-git-send-email-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Mon, 22 Oct 2018 21:31:42 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It was found that two of the fields in the /proc/<pid>/status file were
missing - CapAmb & Speculation_Store_Bypass. They are now added to the
proc.txt documentation file.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 Documentation/filesystems/proc.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/proc.txt b/Documentation/filesystems/proc.txt
index 22b4b00..36a9e62 100644
--- a/Documentation/filesystems/proc.txt
+++ b/Documentation/filesystems/proc.txt
@@ -214,7 +214,7 @@ asynchronous manner and the value may not be very precise. To see a precise
 snapshot of a moment, you can see /proc/<pid>/smaps file and scan page table.
 It's slow but very precise.
 
-Table 1-2: Contents of the status files (as of 4.8)
+Table 1-2: Contents of the status files (as of 4.18)
 ..............................................................................
  Field                       Content
  Name                        filename of the executable
@@ -267,8 +267,10 @@ Table 1-2: Contents of the status files (as of 4.8)
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

