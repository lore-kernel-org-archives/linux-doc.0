Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5359D7DE78
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 May 2018 08:24:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934085AbeEIIYI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 May 2018 04:24:08 -0400
Received: from mga02.intel.com ([134.134.136.20]:45755 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933811AbeEIIYF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 9 May 2018 04:24:05 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 May 2018 01:24:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,381,1520924400"; 
   d="scan'208";a="47858160"
Received: from yhuang-gentoo.sh.intel.com ([10.239.193.148])
  by FMSMGA003.fm.intel.com with ESMTP; 09 May 2018 01:24:01 -0700
From:   "Huang, Ying" <ying.huang@intel.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Huang Ying <ying.huang@intel.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>
Subject: [PATCH -mm] mm, THP, doc: Add document for thp_swpout/thp_swpout_fallback
Date:   Wed,  9 May 2018 16:23:41 +0800
Message-Id: <20180509082341.13953-1-ying.huang@intel.com>
X-Mailer: git-send-email 2.16.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Huang Ying <ying.huang@intel.com>

Add document for newly added thp_swpout, thp_swpout_fallback fields in
/proc/vmstat.

Signed-off-by: "Huang, Ying" <ying.huang@intel.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrea Arcangeli <aarcange@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
---
 Documentation/vm/transhuge.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/vm/transhuge.rst b/Documentation/vm/transhuge.rst
index 569d182cc973..2c6867fca6ff 100644
--- a/Documentation/vm/transhuge.rst
+++ b/Documentation/vm/transhuge.rst
@@ -355,6 +355,15 @@ thp_zero_page_alloc_failed
 	is incremented if kernel fails to allocate
 	huge zero page and falls back to using small pages.
 
+thp_swpout
+	is incremented every time a huge page is swapout in one
+	piece without splitting.
+
+thp_swpout_fallback
+	is incremented if a huge page has to be split before swapout.
+	Usually because failed to allocate some continuous swap space
+	for the huge page.
+
 As the system ages, allocating huge pages may be expensive as the
 system uses memory compaction to copy data around memory to free a
 huge page for use. There are some counters in ``/proc/vmstat`` to help
-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
