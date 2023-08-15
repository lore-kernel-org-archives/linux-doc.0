Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05280C001E0
	for <linux-doc@archiver.kernel.org>; Tue, 15 Aug 2023 21:07:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234108AbjHOVGd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Aug 2023 17:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240175AbjHOVGZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Aug 2023 17:06:25 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29EBF113
        for <linux-doc@vger.kernel.org>; Tue, 15 Aug 2023 14:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692133584; x=1723669584;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dQEyeVsD1VyowJeSwpFcwU5iXx1H+I5fj3IibNXt9dM=;
  b=hv+jZiTPyh8PjHeOoWGhhCTube20u2sUdOanzFQWzj0WyEHgJNYsL/5a
   gdq+PcFWa/1t3kiBXyqBz0bVsQuhgDAIvxHOszONBDg6sh4KjrlajpUj3
   vNZ8wI4czk6TmoM8zN9nxHkMTRC5y8Z2WEsBawPBHQdt8cmelo1AaOjZl
   WuGTDF36MxYkhLCVspSgQ32wmKeVMVyvo5ifuIKjRyPhnrOrNlpIvKp/k
   ffC/aJz6/DpPyJrOodnMHCOdmgdhBAUBu12rO1TzBvhRVzZtCJdmd0WQd
   0TF603wF+VgSMcxh/m9k2ryhBkcRPjho4mNsomqC/kB9mxM3rHct1nVbc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="376109591"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="376109591"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 14:06:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="803957001"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="803957001"
Received: from unknown (HELO fedora.jf.intel.com) ([10.166.80.24])
  by fmsmga004.fm.intel.com with ESMTP; 15 Aug 2023 14:06:22 -0700
From:   Pavan Kumar Linga <pavan.kumar.linga@intel.com>
To:     linux-doc@vger.kernel.org, corbet@lwn.net
Cc:     kuba@kernel.org, rdunlap@infradead.org, emil.s.tantilov@intel.com,
        joshua.a.hay@intel.com, sridhar.samudrala@intel.com,
        alan.brady@intel.com, madhu.chittim@intel.com,
        jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        willemb@google.com, decot@google.com,
        Pavan Kumar Linga <pavan.kumar.linga@intel.com>
Subject: [PATCH docs-next v3 0/2] Fix invalid kernel-doc warnings
Date:   Tue, 15 Aug 2023 14:04:15 -0700
Message-Id: <20230815210417.98749-1-pavan.kumar.linga@intel.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

kernel-doc reports invalid warnings on IDPF driver patch series [1]
that is submitted for review. This patch series fixes those warnings.

[1]: https://lore.kernel.org/netdev/20230808003416.3805142-1-anthony.l.nguyen@intel.com/
---
v2 -> v3:
 * Changed from net-next to docs-next based on Jonathan's comment:
   https://lore.kernel.org/netdev/87pm3pv47i.fsf@meer.lwn.net/
 * Added a 'Cc' tag in the commit message
 (patch 2):
 * Replaced ".*" with "[^;]*" in the regex

v1 -> v2:
 * Fix typos in the commit message

net-next:
v2 - https://lore.kernel.org/netdev/20230814170720.46229-1-pavan.kumar.linga@intel.com/
v1 - https://lore.kernel.org/netdev/20230812002549.36286-1-pavan.kumar.linga@intel.com/
---

Pavan Kumar Linga (2):
  scripts: kernel-doc: parse DEFINE_DMA_UNMAP_[ADDR|LEN]
  scripts: kernel-doc: fix macro handling in enums

 scripts/kernel-doc | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.38.1

