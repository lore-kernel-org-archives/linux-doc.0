Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7775A7D082
	for <lwn-linux-doc@archive.lwn.net>; Mon,  1 Oct 2018 11:01:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbeJARiX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 1 Oct 2018 13:38:23 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:47034 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728999AbeJARiX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 1 Oct 2018 13:38:23 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DB9018A;
        Mon,  1 Oct 2018 04:01:09 -0700 (PDT)
Received: from e119886-lin.cambridge.arm.com (unknown [10.37.6.11])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E728F3F5B3;
        Mon,  1 Oct 2018 04:01:07 -0700 (PDT)
From:   Andrew Murray <andrew.murray@arm.com>
To:     Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <trivial@kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: lockstat: Fix trivial typo
Date:   Mon,  1 Oct 2018 12:01:03 +0100
Message-Id: <1538391663-54524-1-git-send-email-andrew.murray@arm.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix incorrect line number in example output

Signed-off-by: Andrew Murray <andrew.murray@arm.com>
---
 Documentation/locking/lockstat.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/locking/lockstat.txt b/Documentation/locking/lockstat.txt
index 5786ad2..fdbeb0c 100644
--- a/Documentation/locking/lockstat.txt
+++ b/Documentation/locking/lockstat.txt
@@ -91,7 +91,7 @@ Look at the current lock statistics:
 07                         &mm->mmap_sem-R:            37            100           1.31      299502.61      325629.52        3256.30         212344       34316685           0.10        7744.91    95016910.20           2.77
 08                         ---------------
 09                           &mm->mmap_sem              1          [<ffffffff811502a7>] khugepaged_scan_mm_slot+0x57/0x280
-19                           &mm->mmap_sem             96          [<ffffffff815351c4>] __do_page_fault+0x1d4/0x510
+10                           &mm->mmap_sem             96          [<ffffffff815351c4>] __do_page_fault+0x1d4/0x510
 11                           &mm->mmap_sem             34          [<ffffffff81113d77>] vm_mmap_pgoff+0x87/0xd0
 12                           &mm->mmap_sem             17          [<ffffffff81127e71>] vm_munmap+0x41/0x80
 13                         ---------------
-- 
2.7.4

