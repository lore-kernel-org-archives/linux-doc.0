Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 74E127DE59
	for <lwn-linux-doc@archive.lwn.net>; Wed, 15 Aug 2018 21:30:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbeHPAYN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 15 Aug 2018 20:24:13 -0400
Received: from mga14.intel.com ([192.55.52.115]:64245 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727500AbeHPAYN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 15 Aug 2018 20:24:13 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Aug 2018 14:30:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,244,1531810800"; 
   d="scan'208";a="65480874"
Received: from unknown (HELO localhost.lm.intel.com) ([10.232.117.195])
  by orsmga008.jf.intel.com with ESMTP; 15 Aug 2018 14:29:48 -0700
From:   Jon Derrick <jonathan.derrick@intel.com>
To:     <linux-pci@vger.kernel.org>
Cc:     <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Keith Busch <keith.busch@intel.com>,
        Sinan Kaya <okaya@kernel.org>,
        Oza Pawandeep <poza@codeaurora.org>,
        Dongdong Liu <liudongdong3@huawei.com>,
        Jon Derrick <jonathan.derrick@intel.com>
Subject: [PATCH 2/2] Documentation: Document pci=nodpc
Date:   Wed, 15 Aug 2018 15:26:40 -0600
Message-Id: <1534368400-2807-2-git-send-email-jonathan.derrick@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1534368400-2807-1-git-send-email-jonathan.derrick@intel.com>
References: <1534368400-2807-1-git-send-email-jonathan.derrick@intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document disabling downstream port containment through pci parameter

Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e372208..1a2fd78 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3041,6 +3041,9 @@
 		noaer		[PCIE] If the PCIEAER kernel config parameter is
 				enabled, this kernel boot option can be used to
 				disable the use of PCIE advanced error reporting.
+		nodpc		[PCIE] If the PCIE_DPC kernel config parameter is
+				enabled, this kernel boot option can be used to
+				disable the use of PCIE downstream port containment
 		nodomains	[PCI] Disable support for multiple PCI
 				root domains (aka PCI segments, in ACPI-speak).
 		nommconf	[X86] Disable use of MMCONFIG for PCI
-- 
1.8.3.1

