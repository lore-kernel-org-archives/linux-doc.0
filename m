Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26744C3DA66
	for <linux-doc@archiver.kernel.org>; Fri, 25 Aug 2023 09:18:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjHYJRp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Aug 2023 05:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238453AbjHYJRQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Aug 2023 05:17:16 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 324101FE6
        for <linux-doc@vger.kernel.org>; Fri, 25 Aug 2023 02:17:13 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="441018739"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="441018739"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 02:16:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="984046033"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="984046033"
Received: from comms.fi.intel.com ([10.237.72.66])
  by fmsmga006.fm.intel.com with ESMTP; 25 Aug 2023 02:16:27 -0700
From:   Andrei Emeltchenko <Andrei.Emeltchenko.news@gmail.com>
To:     linux-doc@vger.kernel.org, trivial@kernel.org
Subject: [PATCH] Documentation: serial-console: Fix literal block marker
Date:   Fri, 25 Aug 2023 12:16:26 +0300
Message-Id: <20230825091626.354352-1-Andrei.Emeltchenko.news@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Andrei Emeltchenko <andrei.emeltchenko@intel.com>

Make rendered text readable by fixing literal block marker, changing
":" to "::".

Signed-off-by: Andrei Emeltchenko <andrei.emeltchenko@intel.com>
---
 Documentation/admin-guide/serial-console.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/serial-console.rst b/Documentation/admin-guide/serial-console.rst
index 8c8b94e54e26..a3dfc2c66e01 100644
--- a/Documentation/admin-guide/serial-console.rst
+++ b/Documentation/admin-guide/serial-console.rst
@@ -59,7 +59,7 @@ times. In this case, there are the following two rules:
    the hardware is not available.
 
 The result might be surprising. For example, the following two command
-lines have the same result:
+lines have the same result::
 
 	console=ttyS1,9600 console=tty0 console=tty1
 	console=tty0 console=ttyS1,9600 console=tty1
-- 
2.39.2

