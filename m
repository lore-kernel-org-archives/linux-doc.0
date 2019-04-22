Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 60F5F7D918
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Apr 2019 13:36:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727407AbfDVNgZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Apr 2019 09:36:25 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:36910 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727405AbfDVN2O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Apr 2019 09:28:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=orEtAI6vGyej4+O9Qj+mqsD/CFXvix+MnODnsyCr4/A=; b=VyosR7IKoxCzcnBdSThycFb1rk
        7lD1ZMsyCs4lyUi2VRVlD5Uol+Lt51wb38K6/fpMLg0sSwQ5Qpw52BYF6fcSb9kw5RDnu+6y/JcHJ
        ARLk5nxnJl6wTtf7ui5c2/Ujob3IruL+TgYIr/nIzM+ciVYYI09V2iN0hso149tlpDdq3YJHx2S52
        XUaKgDXuGWZfQ2w9kFNFp5z7uSQIAjOonR24JiIHxWuq2Pxs0Ss6N0w4YAdgfpsWW/cudfJ3A71K1
        G0JTHHS2SEdo542xX70Ftxi2ociFUTOvAFc4PdG/N9olcL/R/ut5fBCY+eCMBulk6ns6MDGJYRYHS
        n7vn0rDw==;
Received: from 179.176.125.229.dynamic.adsl.gvt.net.br ([179.176.125.229] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hIYzV-0005I4-SU; Mon, 22 Apr 2019 13:28:13 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hIYzT-0005mR-CW; Mon, 22 Apr 2019 10:28:11 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 37/79] docs: xilinx: convert eemi.txt to eemi.rst
Date:   Mon, 22 Apr 2019 10:27:26 -0300
Message-Id: <545615a48ce02c10e23aca6d41c14fee1396a6e2.1555938376.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1555938375.git.mchehab+samsung@kernel.org>
References: <cover.1555938375.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is a very trivial conversion: adjust the title markup
and add a few literal block markups to produce a better
visual when parsed and avoid warnings.

As newer documents related to xilinx could be added in the future,
create a new index file for it.

At its new index.rst, let's add a :orphan: while this is not linked to
the main index.rst file, in order to avoid build warnings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/xilinx/{eemi.txt => eemi.rst} |  8 ++++----
 Documentation/xilinx/index.rst              | 17 +++++++++++++++++
 2 files changed, 21 insertions(+), 4 deletions(-)
 rename Documentation/xilinx/{eemi.txt => eemi.rst} (92%)
 create mode 100644 Documentation/xilinx/index.rst

diff --git a/Documentation/xilinx/eemi.txt b/Documentation/xilinx/eemi.rst
similarity index 92%
rename from Documentation/xilinx/eemi.txt
rename to Documentation/xilinx/eemi.rst
index 0ab686c173be..8ca82c782ba6 100644
--- a/Documentation/xilinx/eemi.txt
+++ b/Documentation/xilinx/eemi.rst
@@ -1,6 +1,6 @@
----------------------------------------------------------------------
+====================================
 Xilinx Zynq MPSoC EEMI Documentation
----------------------------------------------------------------------
+====================================
 
 Xilinx Zynq MPSoC Firmware Interface
 -------------------------------------
@@ -21,7 +21,7 @@ The zynqmp-firmware driver maintain all EEMI APIs in zynqmp_eemi_ops
 structure. Any driver who want to communicate with PMC using EEMI APIs
 can call zynqmp_pm_get_eemi_ops().
 
-Example of EEMI ops:
+Example of EEMI ops::
 
 	/* zynqmp-firmware driver maintain all EEMI APIs */
 	struct zynqmp_eemi_ops {
@@ -34,7 +34,7 @@ Example of EEMI ops:
 		.query_data = zynqmp_pm_query_data,
 	};
 
-Example of EEMI ops usage:
+Example of EEMI ops usage::
 
 	static const struct zynqmp_eemi_ops *eemi_ops;
 	u32 ret_payload[PAYLOAD_ARG_CNT];
diff --git a/Documentation/xilinx/index.rst b/Documentation/xilinx/index.rst
new file mode 100644
index 000000000000..01cc1a0714df
--- /dev/null
+++ b/Documentation/xilinx/index.rst
@@ -0,0 +1,17 @@
+:orphan:
+
+===========
+Xilinx FPGA
+===========
+
+.. toctree::
+    :maxdepth: 1
+
+    eemi
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
-- 
2.20.1

