Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355DBC27C76
	for <linux-doc@archiver.kernel.org>; Fri, 20 Jan 2023 21:12:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjATVMW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Jan 2023 16:12:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbjATVMQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Jan 2023 16:12:16 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 990188B762;
        Fri, 20 Jan 2023 13:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674249134; x=1705785134;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k0FW4EkggWQRCfPtZeaDhmMpy1hVsTfGGXcTPn3H24A=;
  b=T4cZotDWX3+wRToajYLCQ56bJq9H/p7tz15tqGB2kzeZhOopA93NouAj
   X2M4zFMGJ4zLjE2HS0w9dw6ccp1Z7rXxqkPptj+8BvDMCaoJrr30EPnjq
   jIe3idxjlXpRHnbQ4B/vBJNFN1mLj0Uex/Z0vd5pGhN23OFIo6fzVuIVc
   juwYae8oJLPrVuOqsUuJVOEJz7TP8O2uYQf9vf6X2XcGX+TP6QzxXGaoK
   umCre1luC1ZevYgtBr7/IIxxcfX187R0JGXSB3j5JbH9vCLqkkE9Jpm8D
   fBX0DR6mem2j2vOTCYk+FjVZd7RVQsVNJ6Qbv9SPq8SOomwVwBBUKNN0S
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="324383378"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="324383378"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 13:12:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="653921176"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="653921176"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
  by orsmga007.jf.intel.com with ESMTP; 20 Jan 2023 13:12:12 -0800
From:   Tony Nguyen <anthony.l.nguyen@intel.com>
To:     davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        edumazet@google.com
Cc:     Michal Wilczynski <michal.wilczynski@intel.com>,
        netdev@vger.kernel.org, anthony.l.nguyen@intel.com, corbet@lwn.net,
        linux-doc@vger.kernel.org,
        Jesse Brandeburg <jesse.brandeburg@intel.com>
Subject: [PATCH net v3 2/2] ice: Fix broken link in ice NAPI doc
Date:   Fri, 20 Jan 2023 13:12:31 -0800
Message-Id: <20230120211231.431147-3-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120211231.431147-1-anthony.l.nguyen@intel.com>
References: <20230120211231.431147-1-anthony.l.nguyen@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Michal Wilczynski <michal.wilczynski@intel.com>

Current link for NAPI documentation in ice driver doesn't work - it
returns 404. Update the link to the working one.

Signed-off-by: Michal Wilczynski <michal.wilczynski@intel.com>
Acked-by: Jesse Brandeburg <jesse.brandeburg@intel.com>
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 Documentation/networking/device_drivers/ethernet/intel/ice.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/device_drivers/ethernet/intel/ice.rst b/Documentation/networking/device_drivers/ethernet/intel/ice.rst
index dc2e60ced927..b481b81f3be5 100644
--- a/Documentation/networking/device_drivers/ethernet/intel/ice.rst
+++ b/Documentation/networking/device_drivers/ethernet/intel/ice.rst
@@ -819,7 +819,7 @@ NAPI
 ----
 This driver supports NAPI (Rx polling mode).
 For more information on NAPI, see
-https://www.linuxfoundation.org/collaborate/workgroups/networking/napi
+https://wiki.linuxfoundation.org/networking/napi
 
 
 MACVLAN
-- 
2.38.1

