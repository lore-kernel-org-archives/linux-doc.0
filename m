Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIMWL_WL_HIGH
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A75777DE79
	for <lwn-linux-doc@archive.lwn.net>; Tue,  4 Sep 2018 21:23:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727511AbeIEBto (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 4 Sep 2018 21:49:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:56154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726507AbeIEBtn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 4 Sep 2018 21:49:43 -0400
Received: from localhost.localdomain (unknown [136.62.81.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 587962086C;
        Tue,  4 Sep 2018 21:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1536096167;
        bh=dJ9kZICIcJRgCtPKa2k6p0yMCq1iY7snJPr0mbEJR9I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HJOd1ps2J/Jb8UzidBgTVeQZwoC04trA7an5Roi+JWmWSqr85iHoJXAuUjgF3GmjY
         sujukD5DJTGnNa8/3tdAvUdeKkIIRd2pw/6v+lj+uPOg//73d2TDT+fywjVTemsVSC
         xQCTJ2ry00TR9Y7nikVUcL8987u6QHRrUX5qIl+U=
From:   Alan Tull <atull@kernel.org>
To:     Moritz Fischer <mdf@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
        linux-fpga@vger.kernel.org, linux-doc@vger.kernel.org,
        Alan Tull <atull@kernel.org>
Subject: [PATCH v2 7/8] docs: fpga: document fpga manager flags
Date:   Tue,  4 Sep 2018 16:22:36 -0500
Message-Id: <20180904212237.3078-8-atull@kernel.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180904212237.3078-1-atull@kernel.org>
References: <20180904212237.3078-1-atull@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add flags #defines to kerneldoc documentation in a
useful place.

Signed-off-by: Alan Tull <atull@kernel.org>
---
v2: add description for FPGA_MGR_ENCRYPTED_BITSTREAM
---
 Documentation/driver-api/fpga/fpga-mgr.rst |  5 +++++
 include/linux/fpga/fpga-mgr.h              | 20 ++++++++++++++------
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/fpga/fpga-mgr.rst b/Documentation/driver-api/fpga/fpga-mgr.rst
index 431556d..db8885e 100644
--- a/Documentation/driver-api/fpga/fpga-mgr.rst
+++ b/Documentation/driver-api/fpga/fpga-mgr.rst
@@ -183,6 +183,11 @@ API for implementing a new FPGA Manager driver
 API for programming an FPGA
 ---------------------------
 
+FPGA Manager flags
+
+.. kernel-doc:: include/linux/fpga/fpga-mgr.h
+   :doc: FPGA Manager flags
+
 .. kernel-doc:: include/linux/fpga/fpga-mgr.h
    :functions: fpga_image_info
 
diff --git a/include/linux/fpga/fpga-mgr.h b/include/linux/fpga/fpga-mgr.h
index 1ca02ce..e8ca62b 100644
--- a/include/linux/fpga/fpga-mgr.h
+++ b/include/linux/fpga/fpga-mgr.h
@@ -53,12 +53,20 @@ enum fpga_mgr_states {
 	FPGA_MGR_STATE_OPERATING,
 };
 
-/*
- * FPGA Manager flags
- * FPGA_MGR_PARTIAL_RECONFIG: do partial reconfiguration if supported
- * FPGA_MGR_EXTERNAL_CONFIG: FPGA has been configured prior to Linux booting
- * FPGA_MGR_BITSTREAM_LSB_FIRST: SPI bitstream bit order is LSB first
- * FPGA_MGR_COMPRESSED_BITSTREAM: FPGA bitstream is compressed
+/**
+ * DOC: FPGA Manager flags
+ *
+ * Flags used in the &fpga_image_info->flags field
+ *
+ * %FPGA_MGR_PARTIAL_RECONFIG: do partial reconfiguration if supported
+ *
+ * %FPGA_MGR_EXTERNAL_CONFIG: FPGA has been configured prior to Linux booting
+ *
+ * %FPGA_MGR_ENCRYPTED_BITSTREAM: indicates bitstream is encrypted
+ *
+ * %FPGA_MGR_BITSTREAM_LSB_FIRST: SPI bitstream bit order is LSB first
+ *
+ * %FPGA_MGR_COMPRESSED_BITSTREAM: FPGA bitstream is compressed
  */
 #define FPGA_MGR_PARTIAL_RECONFIG	BIT(0)
 #define FPGA_MGR_EXTERNAL_CONFIG	BIT(1)
-- 
2.7.4

