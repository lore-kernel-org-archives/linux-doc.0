Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D12887D2EF
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Jun 2019 16:51:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728693AbfFEQvR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Jun 2019 12:51:17 -0400
Received: from mga02.intel.com ([134.134.136.20]:24321 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728570AbfFEQvR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 5 Jun 2019 12:51:17 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Jun 2019 09:51:16 -0700
X-ExtLoop1: 1
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 05 Jun 2019 09:51:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 245EB2D4; Wed,  5 Jun 2019 19:51:13 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] docs/core-api: Add integer power functions to the list
Date:   Wed,  5 Jun 2019 19:51:13 +0300
Message-Id: <20190605165113.50972-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Some times integer power functions, such as int_sqrt(), are needed, but
there is nothing about them in the generated documentation.

Fill the gap by adding a reference to the corresponding exported functions.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/core-api/kernel-api.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/core-api/kernel-api.rst b/Documentation/core-api/kernel-api.rst
index 65ae2bf1f86d..824f24ccf401 100644
--- a/Documentation/core-api/kernel-api.rst
+++ b/Documentation/core-api/kernel-api.rst
@@ -141,6 +141,15 @@ Base 2 log and power Functions
 .. kernel-doc:: include/linux/log2.h
    :internal:
 
+Integer power Functions
+-----------------------
+
+.. kernel-doc:: lib/math/int_pow.c
+   :export:
+
+.. kernel-doc:: lib/math/int_sqrt.c
+   :export:
+
 Division Functions
 ------------------
 
-- 
2.20.1

