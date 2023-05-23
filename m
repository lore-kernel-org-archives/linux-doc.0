Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1ACC7EE2D
	for <linux-doc@archiver.kernel.org>; Tue, 23 May 2023 17:44:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbjEWRo2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 May 2023 13:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238258AbjEWRoY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 May 2023 13:44:24 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07FB2C2;
        Tue, 23 May 2023 10:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684863861; x=1716399861;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EIWHnGh/Lmf8E5p9piqDF0iCi4vTIb0v2ykkJNtEIZI=;
  b=B4UOziyjy00j2zKE8AtZICDTTAP7FIOqxA/KlVhhk07x+Ae/ZqehfvYD
   JrXByA3gpLg/KfqPzeVbraShmCfinheHIWD88Tu8ftPRR4BC326kunvvK
   eZt3V/3IALAxeaYQ8iHQYf4fDSiEY02Y9yzsJ/cDc+miGCUKTJkZp7rQh
   0rLOHQ9oQobFxVYN8tqiEKU/27mOM83m01mhxBptHABGg+u1nU7FyTirR
   nQNVXUysxyHBivDd1aINbYFj4VpHsvLPnksnPdVfBDcUu8DzahjuU/Dui
   2aL5KSrHMcNU8B3kNkGT0MLEJ2Ok7yqeVNEdFEO1Qgy9SAgPFgKygsB7M
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="419023282"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; 
   d="scan'208";a="419023282"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 10:44:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="816223451"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; 
   d="scan'208";a="816223451"
Received: from anguy11-upstream.jf.intel.com ([10.166.9.133])
  by fmsmga002.fm.intel.com with ESMTP; 23 May 2023 10:44:05 -0700
From:   Tony Nguyen <anthony.l.nguyen@intel.com>
To:     davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        edumazet@google.com, netdev@vger.kernel.org
Cc:     Michal Wilczynski <michal.wilczynski@intel.com>,
        anthony.l.nguyen@intel.com, lukasz.czapnik@intel.com,
        przemyslaw.kitszel@intel.com, jiri@resnulli.us,
        linux-doc@vger.kernel.org,
        Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com>
Subject: [PATCH net-next 5/5] ice: Document txbalancing parameter
Date:   Tue, 23 May 2023 10:40:08 -0700
Message-Id: <20230523174008.3585300-6-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230523174008.3585300-1-anthony.l.nguyen@intel.com>
References: <20230523174008.3585300-1-anthony.l.nguyen@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Michal Wilczynski <michal.wilczynski@intel.com>

New driver specific parameter 'txbalancing' was introduced.
Describe parameter in the documentation.

Signed-off-by: Michal Wilczynski <michal.wilczynski@intel.com>
Tested-by: Pucha Himasekhar Reddy <himasekharx.reddy.pucha@intel.com> (A Contingent worker at Intel)
Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 Documentation/networking/devlink/ice.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/networking/devlink/ice.rst b/Documentation/networking/devlink/ice.rst
index 2f60e34ab926..298df8ec1930 100644
--- a/Documentation/networking/devlink/ice.rst
+++ b/Documentation/networking/devlink/ice.rst
@@ -22,6 +22,23 @@ Parameters
      - runtime
      - mutually exclusive with ``enable_roce``
 
+.. list-table:: Driver-specific parameters implemented
+   :widths: 5 5 5 85
+
+   * - Name
+     - Type
+     - Mode
+     - Description
+   * - ``txbalancing``
+     - Boolean
+     - permanent
+     - This parameter gives user flexibility to choose the 5-layer
+       transmit scheduler topology, which helps to smooth out the transmit
+       performance. The default topology is 9-layer. Each layer represents
+       a physical junction in the network. Decreased number of layers
+       improves performance, but at the same time number of network junctions
+       is reduced, which might not be desirable depending on the use case.
+
 Info versions
 =============
 
-- 
2.38.1

