Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 816547D043
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Jun 2018 19:12:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935955AbeFRTMb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Jun 2018 15:12:31 -0400
Received: from mga17.intel.com ([192.55.52.151]:36676 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935893AbeFRTMb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 18 Jun 2018 15:12:31 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jun 2018 12:12:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,240,1526367600"; 
   d="scan'208";a="49951348"
Received: from bee.sh.intel.com (HELO bee) ([10.239.97.14])
  by orsmga007.jf.intel.com with ESMTP; 18 Jun 2018 12:12:27 -0700
Received: from kbuild by bee with local (Exim 4.84_2)
        (envelope-from <lkp@intel.com>)
        id 1fUzZj-000O5x-7j; Tue, 19 Jun 2018 03:12:27 +0800
Date:   Tue, 19 Jun 2018 03:12:07 +0800
From:   kbuild test robot <fengguang.wu@intel.com>
To:     Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc:     kbuild-all@01.org, bhelgaas@google.com, lorenzo.pieralisi@arm.com,
        Joao.Pinto@synopsys.com, jingoohan1@gmail.com, kishon@ti.com,
        adouglas@cadence.com, jesper.nilsson@axis.com,
        linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Subject: [RFC PATCH] PCI: dwc: dw_pcie_ep_find_capability() can be static
Message-ID: <20180618191207.GA111117@ivb43>
References: <5beae521c5ee475b1c0e04f5eec07d0120b0fa2b.1529329262.git.gustavo.pimentel@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5beae521c5ee475b1c0e04f5eec07d0120b0fa2b.1529329262.git.gustavo.pimentel@synopsys.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: lkp@intel.com
X-SA-Exim-Scanned: No (on bee); SAEximRunCond expanded to false
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Fixes: 43f8cf4686e0 ("PCI: dwc: Add MSI-X callbacks handler")
Signed-off-by: kbuild test robot <fengguang.wu@intel.com>
---
 pcie-designware-ep.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index beee64e..ffc2065 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -59,7 +59,7 @@ static u8 __dw_pcie_ep_find_next_cap(struct dw_pcie *pci, u8 cap_ptr,
 	return __dw_pcie_ep_find_next_cap(pci, next_cap_ptr, cap);
 }
 
-u8 dw_pcie_ep_find_capability(struct dw_pcie *pci, u8 cap)
+static u8 dw_pcie_ep_find_capability(struct dw_pcie *pci, u8 cap)
 {
 	u8 next_cap_ptr;
 	u16 reg;
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
