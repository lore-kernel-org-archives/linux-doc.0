Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D53497D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 23 Jul 2019 16:57:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390942AbfGWQ5y (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 23 Jul 2019 12:57:54 -0400
Received: from mga06.intel.com ([134.134.136.31]:33832 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390907AbfGWQ5y (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 23 Jul 2019 12:57:54 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 09:57:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; 
   d="scan'208";a="344798112"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 23 Jul 2019 09:57:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1ACFA81; Tue, 23 Jul 2019 19:57:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu,
        codalist@coda.cs.cmu.edu, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] coda: Fix typo in the struct CodaCred documentation
Date:   Tue, 23 Jul 2019 19:57:50 +0300
Message-Id: <20190723165750.66229-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Documentation mistakenly refers to a different type while explaining
the contents of the struct CodaCred.

Fix the typo in the struct CodaCred description in the documentation.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/filesystems/coda.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/coda.txt b/Documentation/filesystems/coda.txt
index 545262c167c3..1711ad48e38a 100644
--- a/Documentation/filesystems/coda.txt
+++ b/Documentation/filesystems/coda.txt
@@ -421,14 +421,14 @@ kernel support.
 
 
   The CodaCred structure defines a variety of user and group ids as
-  they are set for the calling process. The vuid_t and guid_t are 32 bit
+  they are set for the calling process. The vuid_t and vgid_t are 32 bit
   unsigned integers.  It also defines group membership in an array.  On
   Unix the CodaCred has proven sufficient to implement good security
   semantics for Coda but the structure may have to undergo modification
   for the Windows environment when these mature.
 
   struct CodaCred {
-      vuid_t cr_uid, cr_euid, cr_suid, cr_fsuid; /* Real, effective, set, fs uid*/
+      vuid_t cr_uid, cr_euid, cr_suid, cr_fsuid; /* Real, effective, set, fs uid */
       vgid_t cr_gid, cr_egid, cr_sgid, cr_fsgid; /* same for groups */
       vgid_t cr_groups[NGROUPS];        /* Group membership for caller */
   };
-- 
2.20.1

